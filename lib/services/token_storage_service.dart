import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageService {
  static const String _tokenKey = 'auth_token';
  static const String _tokenTypeKey = 'token_type';
  static const String _userIdKey = 'user_id';

  static TokenStorageService? _instance;
  static TokenStorageService get instance {
    _instance ??= TokenStorageService._internal();
    return _instance!;
  }

  TokenStorageService._internal();

  /// Save authentication token and related data
  Future<void> saveToken({
    required String token,
    required String tokenType,
    required String userId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_tokenTypeKey, tokenType);
    await prefs.setString(_userIdKey, userId);
  }

  /// Get the stored authentication token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Get the stored token type (usually 'Bearer')
  Future<String?> getTokenType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenTypeKey);
  }

  /// Get the stored user ID
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  /// Get the complete authorization header value
  Future<String?> getAuthorizationHeader() async {
    final token = await getToken();
    final tokenType = await getTokenType();
    
    if (token != null && tokenType != null) {
      return '$tokenType $token';
    }
    return null;
  }

  /// Check if user has a stored token
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Clear all stored authentication data
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_tokenTypeKey);
    await prefs.remove(_userIdKey);
  }

  /// Clear all stored data (complete logout)
  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}