import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConfig {
  // iOS Simulator uses localhost
  static const String _iosSimulatorUrl = 'http://localhost:8080/api';
  
  // Android Emulator uses 10.0.2.2 to access host machine's localhost
  static const String _androidEmulatorUrl = 'http://10.0.2.2:8080/api';
  
  // For physical devices, use your machine's IP address
  static const String _physicalDeviceUrl = 'http://YOUR_MACHINE_IP:8080/api';
  
  // Production URL
  static const String _productionBaseUrl = 'https://your-production-url.com/api';
  
  /// Get the appropriate base URL based on platform and environment
  static String get baseUrl {
    if (kIsWeb) {
      // Web app can use localhost
      return 'http://localhost:8080/api';
    }
    
    // For mobile platforms
    if (Platform.isAndroid) {
      // Use 10.0.2.2 for Android emulator, or machine IP for physical device
      return _androidEmulatorUrl;
    } else if (Platform.isIOS) {
      // iOS simulator can use localhost
      return _iosSimulatorUrl;
    }
    
    // Default fallback
    return _iosSimulatorUrl;
  }
  
  /// Connection timeout duration
  static const Duration connectTimeout = Duration(seconds: 10);
  
  /// Receive timeout duration
  static const Duration receiveTimeout = Duration(seconds: 10);
  
  /// Send timeout duration
  static const Duration sendTimeout = Duration(seconds: 10);
  
  /// Whether to enable request/response logging
  static const bool enableLogging = true;
  
  /// Headers to include with every request
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}