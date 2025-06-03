import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_sync/database/app_database.dart';
import 'package:prayer_sync/providers/prayer_provider.dart';
import 'package:prayer_sync/providers/auth_provider.dart';
import 'package:prayer_sync/screens/home_screen.dart';
import 'package:prayer_sync/screens/login_screen.dart';
import 'package:prayer_sync/utils/theme.dart';
import 'package:prayer_sync/config/environment.dart';

void main() {
  // Print environment info during development
  if (EnvironmentConfig.isDevelopment) {
    debugPrint('Running in DEVELOPMENT mode');
    debugPrint('API URL: ${EnvironmentConfig.apiBaseUrl}');
  }
  
  runApp(const PrayerSyncApp());
}

class PrayerSyncApp extends StatelessWidget {
  const PrayerSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
          dispose: (_, db) => db.close(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider()..initialize(),
        ),
        ChangeNotifierProxyProvider<AppDatabase, PrayerProvider>(
          create: (_) => PrayerProvider(),
          update: (_, db, provider) => provider!..setDatabase(db),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          // Show loading screen while initializing
          if (!authProvider.isInitialized) {
            return MaterialApp(
              title: 'Prayer Sync',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              home: const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              debugShowCheckedModeBanner: false,
            );
          }

          return MaterialApp(
            title: 'Prayer Sync',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: authProvider.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}