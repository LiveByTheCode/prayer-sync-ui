import 'package:dio/dio.dart';
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
    ));

    // Add request interceptor to include auth token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authHeader = await TokenStorageService.instance.getAuthorizationHeader();
        if (authHeader != null) {
          options.headers['Authorization'] = authHeader;
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
      final request = SignupRequest(
        email: email,
        password: password,
        displayName: displayName,
      );

      final response = await _dio.post(
        '/auth/register',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponse.fromJson(response.data);
        
        // Store the token
        await TokenStorageService.instance.saveToken(
          token: authResponse.token,
          tokenType: authResponse.type,
          userId: authResponse.user.id,
        );

        return authResponse;
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

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(response.data);
        
        // Store the token
        await TokenStorageService.instance.saveToken(
          token: authResponse.token,
          tokenType: authResponse.type,
          userId: authResponse.user.id,
        );

        return authResponse;
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
        return User.fromJson(response.data);
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