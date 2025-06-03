import 'package:flutter/foundation.dart';
import 'package:prayer_sync/models/user.dart';
import 'package:prayer_sync/services/api_service.dart';
import 'package:prayer_sync/services/token_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  bool _isInitialized = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> signInWithEmail(String email, String password) async {
    setLoading(true);
    try {
      final authResponse = await ApiService.instance.signIn(
        email: email,
        password: password,
      );
      
      _currentUser = authResponse.user;
      _isAuthenticated = true;
      notifyListeners();
    } on ApiException catch (e) {
      throw Exception('Failed to sign in: ${e.message}');
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp(String email, String password, String displayName) async {
    setLoading(true);
    try {
      final authResponse = await ApiService.instance.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );
      
      _currentUser = authResponse.user;
      _isAuthenticated = true;
      notifyListeners();
    } on ApiException catch (e) {
      throw Exception('Failed to sign up: ${e.message}');
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await ApiService.instance.signOut();
    } catch (e) {
      // Continue with local sign out even if API call fails
      debugPrint('API sign out failed: $e');
    } finally {
      _currentUser = null;
      _isAuthenticated = false;
      notifyListeners();
    }
  }

  void continueAsGuest() {
    _currentUser = User(
      id: 'guest_user',
      email: 'guest@prayersync.local',
      displayName: 'Guest User',
      createdAt: DateTime.now(),
    );
    _isAuthenticated = true;
    notifyListeners();
  }

  /// Initialize the auth provider and check for existing authentication
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    setLoading(true);
    try {
      final hasToken = await TokenStorageService.instance.hasToken();
      if (hasToken) {
        // Validate the existing token
        final isValid = await ApiService.instance.validateToken();
        if (isValid) {
          // Get current user profile
          try {
            _currentUser = await ApiService.instance.getCurrentUser();
            _isAuthenticated = true;
          } catch (e) {
            // If profile fetch fails, clear the token
            await TokenStorageService.instance.clearToken();
            debugPrint('Failed to get user profile: $e');
          }
        } else {
          // Token is invalid, clear it
          await TokenStorageService.instance.clearToken();
        }
      }
    } catch (e) {
      // If any error occurs during initialization, continue as unauthenticated
      debugPrint('Auth initialization error: $e');
      await TokenStorageService.instance.clearToken();
    } finally {
      _isInitialized = true;
      setLoading(false);
    }
  }

  /// Refresh the current user's data
  Future<void> refreshUser() async {
    if (!_isAuthenticated || _currentUser == null) return;
    
    try {
      _currentUser = await ApiService.instance.getCurrentUser();
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to refresh user data: $e');
      // If refresh fails due to auth issues, sign out
      if (e is ApiException && e.isAuthenticationError) {
        await signOut();
      }
    }
  }

  /// Check if the current session is still valid
  Future<bool> validateSession() async {
    if (!_isAuthenticated) return false;
    
    try {
      return await ApiService.instance.validateToken();
    } catch (e) {
      debugPrint('Session validation failed: $e');
      return false;
    }
  }
}