#!/bin/bash

echo "Running Prayer Sync UI in PRODUCTION mode..."
echo "API URL: https://api.prayersync.com/api"
echo ""

# Run with production environment
flutter run --dart-define=ENVIRONMENT=prod