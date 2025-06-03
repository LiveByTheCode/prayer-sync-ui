# Prayer Sync UI

Flutter mobile application for Prayer Sync - a cross-device prayer management app.

## Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- iOS/Android development environment set up

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

The app supports multiple environments. See [ENVIRONMENT_SETUP.md](ENVIRONMENT_SETUP.md) for detailed configuration.

#### Quick Start - Development Mode

```bash
# Run on connected device/emulator
./run-dev.sh

# This connects to the API at http://192.168.3.135:8080/api
```

#### Quick Start - Production Mode

```bash
# Run with production configuration
./run-prod.sh
```

### Building for Release

```bash
# Build for iOS
./build-prod.sh ios

# Build for Android
./build-prod.sh android

# Build for Web
./build-prod.sh web
```

## Project Structure

- `lib/` - Main application code
  - `config/` - Environment and app configuration
  - `models/` - Data models
  - `providers/` - State management (Provider)
  - `screens/` - UI screens
  - `services/` - API and external services
  - `utils/` - Utilities and helpers
  - `widgets/` - Reusable widgets
- `test/` - Test files

## Features

- User authentication (login/register)
- Prayer request management
- Church community features
- Offline support with local database
- Cross-platform (iOS, Android, Web)

## Environment Configuration

The app uses environment-based configuration for different deployment scenarios. See [ENVIRONMENT_SETUP.md](ENVIRONMENT_SETUP.md) for details on:

- Switching between development and production
- Configuring API endpoints
- Building for different environments

## Development

### State Management

This app uses Provider for state management. Main providers:
- `AuthProvider` - Authentication state
- `PrayerProvider` - Prayer requests and lists

### Database

Uses Drift (formerly Moor) for local SQLite database with web support.

### API Integration

- RESTful API client using Dio
- Automatic token management
- Environment-based endpoint configuration