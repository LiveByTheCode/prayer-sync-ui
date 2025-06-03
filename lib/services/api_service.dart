import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_sync/models/auth_response.dart';
import 'package:prayer_sync/models/user.dart';
import 'package:prayer_sync/services/api_config.dart';
import 'package:prayer_sync/services/token_storage_service.dart';

class ApiService {
  
  late final Dio _dio;
  static ApiService? _instance;
  
  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }


  ApiService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      headers: ApiConfig.defaultHeaders,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    ));

    // Add request interceptor to include auth token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authHeader = await TokenStorageService.instance.getAuthorizationHeader();
        debugPrint('🔐 API Request: ${options.path} - Auth header: ${authHeader != null ? "Present" : "Missing"}');
        if (authHeader != null) {
          options.headers['Authorization'] = authHeader;
          debugPrint('🔑 Added Authorization header: $authHeader');
        }
        handler.next(options);
      },
      onError: (error, handler) {
        // Handle unauthorized errors
        if (error.response?.statusCode == 401) {
          // Token might be expired, clear it
          TokenStorageService.instance.clearToken();
        }
        handler.next(error);
      },
    ));

    // Add logging interceptor if enabled
    if (ApiConfig.enableLogging) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ));
    }
  }

  /// Sign up a new user
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      // Split display name into first and last name
      final nameParts = displayName.trim().split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : displayName;
      final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
      
      final request = SignupRequest(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      debugPrint('Signup request: ${request.toJson()}');
      
      final response = await _dio.post(
        '/auth/register',
        data: request.toJson(),
      );

      debugPrint('Signup response status: ${response.statusCode}');
      debugPrint('Signup response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return await _parseAuthResponse(response.data);
      } else {
        throw ApiException(
          'Sign up failed',
          response.statusCode ?? 0,
          response.data?.toString(),
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error during sign up: $e', 0, null);
    }
  }

  /// Sign in an existing user
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequest(
        email: email,
        password: password,
      );

      final response = await _dio.post(
        '/auth/login',
        data: request.toJson(),
      );

      debugPrint('🔐 Login response status: ${response.statusCode}');
      debugPrint('🔐 Login response data type: ${response.data.runtimeType}');
      debugPrint('🔐 Login response data: ${response.data}');

      if (response.statusCode == 200) {
        return await _parseAuthResponse(response.data);
      } else {
        throw ApiException(
          'Sign in failed',
          response.statusCode ?? 0,
          response.data?.toString(),
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error during sign in: $e', 0, null);
    }
  }

  /// Get current user profile
  Future<User> getCurrentUser() async {
    try {
      final response = await _dio.get('/users/me');

      if (response.statusCode == 200) {
        // Handle different response data types
        Map<String, dynamic> jsonData;
        
        if (response.data is String) {
          jsonData = jsonDecode(response.data);
        } else if (response.data is Map) {
          jsonData = Map<String, dynamic>.from(response.data);
        } else {
          throw ApiException('Unexpected response type: ${response.data.runtimeType}', 0, null);
        }
        
        // Manually create User object
        return User(
          id: jsonData['id'].toString(),
          email: jsonData['email'] as String,
          displayName: jsonData['displayName'] ?? '${jsonData['firstName']} ${jsonData['lastName']}'.trim(),
          photoUrl: jsonData['profileImageUrl'],
          churchIds: jsonData['churchId'] != null ? [jsonData['churchId'].toString()] : [],
          createdAt: DateTime.parse(jsonData['createdAt'] as String),
          lastLogin: jsonData['updatedAt'] != null ? DateTime.parse(jsonData['updatedAt'] as String) : null,
          preferences: {},
          syncId: null,
        );
      } else {
        throw ApiException(
          'Failed to get user profile',
          response.statusCode ?? 0,
          response.data?.toString(),
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error getting user profile: $e', 0, null);
    }
  }

  /// Helper method to parse auth response
  Future<AuthResponse> _parseAuthResponse(dynamic data) async {
    debugPrint('🔐 _parseAuthResponse called with data type: ${data.runtimeType}');
    
    // Handle different response data types
    Map<String, dynamic> jsonData;
    
    if (data is String) {
      jsonData = jsonDecode(data);
    } else if (data is Map) {
      // Convert Map<dynamic, dynamic> to Map<String, dynamic>
      jsonData = Map<String, dynamic>.from(data);
    } else {
      throw ApiException('Unexpected response type: ${data.runtimeType}', 0, null);
    }
    
    debugPrint('🔐 Auth response JSON: $jsonData');
    
    // Extract token and user data
    final token = jsonData['token'] as String;
    final userJson = jsonData['user'] as Map<dynamic, dynamic>;
    
    // Convert user map to proper type
    final userMap = Map<String, dynamic>.from(userJson);
    
    // Create User object manually
    final user = User(
      id: userMap['id'].toString(),
      email: userMap['email'] as String,
      displayName: '${userMap['firstName']} ${userMap['lastName']}'.trim(),
      photoUrl: userMap['profileImageUrl'],
      churchIds: userMap['churchId'] != null ? [userMap['churchId'].toString()] : [],
      createdAt: DateTime.parse(userMap['createdAt'] as String),
      lastLogin: userMap['updatedAt'] != null ? DateTime.parse(userMap['updatedAt'] as String) : null,
      preferences: {},
      syncId: null,
    );
    
    // Save the token to storage
    debugPrint('🔑 Saving authentication token for user: ${user.email}');
    await TokenStorageService.instance.saveToken(
      token: token,
      tokenType: 'Bearer',
      userId: user.id,
    );
    
    return AuthResponse(token: token, type: 'Bearer', user: user);
  }

  /// Sign out user (clear local token)
  Future<void> signOut() async {
    try {
      // Optionally call backend logout endpoint
      await _dio.post('/auth/logout');
    } catch (e) {
      // Continue with local logout even if backend call fails
      print('Backend logout failed: $e');
    } finally {
      // Always clear local token
      await TokenStorageService.instance.clearToken();
    }
  }

  /// Validate current token
  Future<bool> validateToken() async {
    try {
      final response = await _dio.get('/users/me');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }


  /// Handle Dio errors and convert to ApiException
  ApiException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException('Connection timeout', 408, 'Request timed out');
      
      case DioExceptionType.connectionError:
        return ApiException(
          'Connection error', 
          0, 
          'Unable to connect to server. Please check your internet connection.'
        );
      
      case DioExceptionType.badResponse:
        final response = e.response;
        String message = 'Request failed';
        
        if (response?.data is Map<String, dynamic>) {
          final data = response!.data as Map<String, dynamic>;
          message = data['message'] ?? data['error'] ?? message;
        } else if (response?.data is String) {
          // Handle plain string responses
          message = response!.data as String;
        }
        
        return ApiException(
          message,
          response?.statusCode ?? 0,
          response?.data?.toString(),
        );
      
      case DioExceptionType.cancel:
        return ApiException('Request cancelled', 0, 'Request was cancelled');
      
      case DioExceptionType.unknown:
      default:
        return ApiException(
          'Network error',
          0,
          e.message ?? 'Unknown network error occurred',
        );
    }
  }
}

/// Custom exception class for API errors
class ApiException implements Exception {
  final String message;
  final int statusCode;
  final String? details;

  ApiException(this.message, this.statusCode, this.details);

  @override
  String toString() {
    return 'ApiException: $message (Status: $statusCode)${details != null ? ' - $details' : ''}';
  }

  /// Check if this is a validation error (400)
  bool get isValidationError => statusCode == 400;

  /// Check if this is an authentication error (401)
  bool get isAuthenticationError => statusCode == 401;

  /// Check if this is a forbidden error (403)
  bool get isForbiddenError => statusCode == 403;

  /// Check if this is a not found error (404)
  bool get isNotFoundError => statusCode == 404;

  /// Check if this is a server error (500+)
  bool get isServerError => statusCode >= 500;

  /// Check if this is a network error (0)
  bool get isNetworkError => statusCode == 0;
}

/// Sync API methods
extension SyncApiService on ApiService {
  Future<Response> uploadSync(Map<String, dynamic> syncRequest) async {
    try {
      return await _dio.post('/sync/upload', data: syncRequest);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> bidirectionalSync(Map<String, dynamic> syncRequest) async {
    try {
      return await _dio.post('/sync/bidirectional', data: syncRequest);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> getChangesSince(String timestamp) async {
    try {
      return await _dio.get('/sync/changes/$timestamp');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> getServerTime() async {
    try {
      return await _dio.get('/sync/server-time');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }
}

/// Custom transformer that ensures JSON is decoded to Map<String, dynamic>
class _CustomTransformer extends BackgroundTransformer {
  @override
  Future<Response<dynamic>> transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    final response = await super.transformResponse(options, responseBody);
    
    if (options.responseType == ResponseType.json) {
      // Convert Map<dynamic, dynamic> to Map<String, dynamic>
      if (response.data is Map && response.data is! Map<String, dynamic>) {
        response.data = _convertMap(response.data);
      }
    }
    
    return response;
  }
  
  dynamic _convertMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      final result = <String, dynamic>{};
      data.forEach((key, value) {
        result[key.toString()] = _convertMap(value);
      });
      return result;
    }
    if (data is List) {
      return data.map((item) => _convertMap(item)).toList();
    }
    return data;
  }
}