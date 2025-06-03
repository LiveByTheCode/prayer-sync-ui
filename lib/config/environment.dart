enum Environment {
  dev,
  prod,
}

class EnvironmentConfig {
  static const String _currentEnvironment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );

  static Environment get environment {
    switch (_currentEnvironment) {
      case 'prod':
        return Environment.prod;
      case 'dev':
      default:
        return Environment.dev;
    }
  }

  static bool get isDevelopment => environment == Environment.dev;
  static bool get isProduction => environment == Environment.prod;

  // API Configuration
  static String get apiBaseUrl {
    switch (environment) {
      case Environment.dev:
        return _DevConfig.apiBaseUrl;
      case Environment.prod:
        return _ProdConfig.apiBaseUrl;
    }
  }

  // Add more environment-specific configurations as needed
  static bool get enableLogging {
    switch (environment) {
      case Environment.dev:
        return true;
      case Environment.prod:
        return false;
    }
  }

  static Duration get apiTimeout {
    switch (environment) {
      case Environment.dev:
        return const Duration(seconds: 30);
      case Environment.prod:
        return const Duration(seconds: 10);
    }
  }
}

class _DevConfig {
  static const String apiBaseUrl = 'http://192.168.3.135:8080/api';
}

class _ProdConfig {
  static const String apiBaseUrl = 'https://api.prayersync.com/api';
}