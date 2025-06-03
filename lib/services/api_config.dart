import 'package:prayer_sync/config/environment.dart';

class ApiConfig {
  /// Get the base URL from environment configuration
  static String get baseUrl => EnvironmentConfig.apiBaseUrl;
  
  /// Connection timeout duration
  static Duration get connectTimeout => EnvironmentConfig.apiTimeout;
  
  /// Receive timeout duration
  static Duration get receiveTimeout => EnvironmentConfig.apiTimeout;
  
  /// Send timeout duration
  static Duration get sendTimeout => EnvironmentConfig.apiTimeout;
  
  /// Whether to enable request/response logging
  static bool get enableLogging => EnvironmentConfig.enableLogging;
  
  /// Headers to include with every request
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}