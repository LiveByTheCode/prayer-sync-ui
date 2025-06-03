# Prayer Sync UI - Environment Configuration

This guide explains how to configure and run the Prayer Sync UI in different environments.

## Environment Configuration

The app supports two environments:
- **Development (dev)**: Connects to local/internal API server
- **Production (prod)**: Connects to production API server

### Current Configuration

- **Development API**: `http://192.168.3.135:8080/api`
- **Production API**: `https://api.prayersync.com/api` (update this when you have a production URL)

## Running the App

### Development Mode

```bash
# Using the script (recommended)
./run-dev.sh

# Or manually
flutter run --dart-define=ENVIRONMENT=dev
```

### Production Mode

```bash
# Using the script (recommended)
./run-prod.sh

# Or manually
flutter run --dart-define=ENVIRONMENT=prod
```

## Building the App

### Development Builds

```bash
# iOS
./build-dev.sh ios

# Android
./build-dev.sh android

# Web
./build-dev.sh web
```

### Production Builds

```bash
# iOS
./build-prod.sh ios

# Android
./build-prod.sh android

# Web
./build-prod.sh web
```

## VS Code Integration

If you're using VS Code, you can use the provided launch configurations:

1. Open the Run and Debug panel (Cmd+Shift+D on macOS)
2. Select one of the configurations:
   - **Prayer Sync (Dev)**: Run in development mode
   - **Prayer Sync (Prod)**: Run in production mode
   - **Prayer Sync (Dev - Profile)**: Profile mode for performance testing
   - **Prayer Sync (Dev - Release)**: Release mode testing

## Changing API URLs

To change the API URLs, edit the file `lib/config/environment.dart`:

```dart
class _DevConfig {
  static const String apiBaseUrl = 'http://192.168.3.135:8080/api';
}

class _ProdConfig {
  static const String apiBaseUrl = 'https://api.prayersync.com/api';
}
```

## Environment-Specific Features

The following features change based on environment:

1. **API Base URL**: Different URLs for dev/prod
2. **Logging**: Enabled in development, disabled in production
3. **API Timeout**: 30 seconds in dev, 10 seconds in prod

## Adding New Environment Variables

To add new environment-specific configurations:

1. Add the configuration to `EnvironmentConfig` in `lib/config/environment.dart`
2. Add the values to both `_DevConfig` and `_ProdConfig`
3. Use `EnvironmentConfig.yourNewVariable` anywhere in the app

Example:
```dart
static bool get enableCrashReporting {
  switch (environment) {
    case Environment.dev:
      return false;
    case Environment.prod:
      return true;
  }
}
```

## Troubleshooting

### API Connection Issues

1. Ensure the backend is running on the specified IP/port
2. Check that your device can reach the IP address
3. For physical devices, ensure they're on the same network
4. Check firewall settings on the backend server

### Environment Not Switching

1. Make sure to fully stop the app before switching environments
2. Run `flutter clean` if the environment seems stuck
3. Check that you're using the correct `--dart-define` parameter