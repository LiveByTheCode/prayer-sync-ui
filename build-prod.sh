#!/bin/bash

echo "Building Prayer Sync UI for PRODUCTION..."
echo "API URL: https://api.prayersync.com/api"
echo ""

# Build for different platforms with production environment
case "$1" in
  "ios")
    echo "Building for iOS..."
    flutter build ios --release --dart-define=ENVIRONMENT=prod
    ;;
  "android")
    echo "Building for Android..."
    flutter build apk --release --dart-define=ENVIRONMENT=prod
    ;;
  "web")
    echo "Building for Web..."
    flutter build web --release --dart-define=ENVIRONMENT=prod
    ;;
  *)
    echo "Usage: ./build-prod.sh [ios|android|web]"
    exit 1
    ;;
esac