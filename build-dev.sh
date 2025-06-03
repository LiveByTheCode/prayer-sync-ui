#!/bin/bash

echo "Building Prayer Sync UI for DEVELOPMENT..."
echo "API URL: http://192.168.3.135:8080/api"
echo ""

# Build for different platforms with development environment
case "$1" in
  "ios")
    echo "Building for iOS..."
    flutter build ios --dart-define=ENVIRONMENT=dev
    ;;
  "android")
    echo "Building for Android..."
    flutter build apk --dart-define=ENVIRONMENT=dev
    ;;
  "web")
    echo "Building for Web..."
    flutter build web --dart-define=ENVIRONMENT=dev
    ;;
  *)
    echo "Usage: ./build-dev.sh [ios|android|web]"
    exit 1
    ;;
esac