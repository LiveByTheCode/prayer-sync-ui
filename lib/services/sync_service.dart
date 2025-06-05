import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:prayer_sync/database/app_database.dart';
import 'package:prayer_sync/database/database_repository.dart';
import 'package:prayer_sync/models/prayer_request.dart' as models;
import 'package:prayer_sync/models/prayer_list.dart' as models;
import 'package:prayer_sync/services/api_service.dart';
import 'package:prayer_sync/services/token_storage_service.dart';

class SyncService {
  static SyncService? _instance;
  static SyncService get instance {
    _instance ??= SyncService._internal();
    return _instance!;
  }

  SyncService._internal();

  final ApiService _apiService = ApiService.instance;
  AppDatabase? _database;
  
  DateTime? _lastSyncTime;
  bool _isSyncing = false;
  final _syncStatusController = StreamController<SyncStatus>.broadcast();
  final _dataChangedController = StreamController<void>.broadcast();
  
  Stream<SyncStatus> get syncStatus => _syncStatusController.stream;
  Stream<void> get dataChanged => _dataChangedController.stream;

  void initialize(AppDatabase database) {
    _database = database;
    _loadLastSyncTime();
  }

  Future<void> _loadLastSyncTime() async {
    // Load last sync time from storage or database
    // For now, we'll use a simple approach
    _lastSyncTime = DateTime.now().subtract(const Duration(days: 1));
  }

  Future<void> syncAfterLocalChange() async {
    debugPrint('🔄 SyncService.syncAfterLocalChange() called');
    
    if (_isSyncing) {
      debugPrint('❌ Sync already in progress, skipping');
      return;
    }

    // Check if user is authenticated
    final token = await TokenStorageService.instance.getToken();
    final userId = await TokenStorageService.instance.getUserId();
    debugPrint('🔑 Auth token check: ${token != null ? "Token found (length: ${token.length})" : "No token"}');
    debugPrint('👤 User ID check: ${userId != null ? "User ID: $userId" : "No user ID"}');
    
    if (token == null) {
      debugPrint('❌ No auth token, skipping sync');
      return;
    }
    
    // Skip sync for guest users (guest_user ID or no user ID in token storage)
    if (userId == null || userId == 'guest_user') {
      debugPrint('👻 Guest user detected, skipping sync');
      return;
    }

    try {
      debugPrint('🚀 Starting sync process...');
      _isSyncing = true;
      _syncStatusController.add(SyncStatus.syncing);
      
      await _performUploadSync();
      
      _syncStatusController.add(SyncStatus.synced);
      debugPrint('✅ Sync completed successfully');
    } catch (e) {
      debugPrint('❌ Sync failed: $e');
      debugPrint('Stack trace: ${StackTrace.current}');
      _syncStatusController.add(SyncStatus.error);
    } finally {
      _isSyncing = false;
      debugPrint('🏁 Sync process finished');
    }
  }

  Future<void> fullSync() async {
    if (_isSyncing) {
      debugPrint('Sync already in progress, skipping');
      return;
    }

    // Check if database is initialized
    if (!_isDatabaseInitialized()) {
      debugPrint('Database not initialized, skipping sync');
      return;
    }

    // Check if user is authenticated
    final token = await TokenStorageService.instance.getToken();
    final userId = await TokenStorageService.instance.getUserId();
    if (token == null) {
      debugPrint('No auth token, skipping sync');
      return;
    }
    
    // Skip sync for guest users
    if (userId == null || userId == 'guest_user') {
      debugPrint('Guest user detected, skipping sync');
      return;
    }

    try {
      _isSyncing = true;
      _syncStatusController.add(SyncStatus.syncing);
      
      await _performBidirectionalSync();
      
      _lastSyncTime = DateTime.now();
      _syncStatusController.add(SyncStatus.synced);
      debugPrint('Full sync completed successfully');
    } catch (e) {
      debugPrint('Full sync failed: $e');
      _syncStatusController.add(SyncStatus.error);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _performUploadSync() async {
    debugPrint('📤 Getting local changes...');
    
    // Get local changes that need to be synced
    final localPrayerRequests = await _getLocalPrayerRequests();
    final localPrayerLists = await _getLocalPrayerLists();

    debugPrint('📊 Found ${localPrayerRequests.length} prayer requests, ${localPrayerLists.length} prayer lists');

    if (localPrayerRequests.isEmpty && localPrayerLists.isEmpty) {
      debugPrint('❌ No local changes to sync');
      return;
    }

    // Convert to sync format for new upload endpoint
    final syncRequest = {
      'prayerRequests': localPrayerRequests.map((pr) => _prayerRequestToJson(pr)).toList(),
      'prayerLists': localPrayerLists.map((pl) => _prayerListToJson(pl)).toList(),
    };

    debugPrint('📦 Sync request prepared: ${syncRequest.keys}');
    debugPrint('🌐 Calling API upload endpoint...');

    try {
      // Call new upload endpoint
      final response = await _apiService.uploadSync(syncRequest);
      
      debugPrint('📡 API Response: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        debugPrint('✅ Upload sync successful');
        final responseData = response.data;
        if (responseData['message'] != null) {
          debugPrint('📝 Server message: ${responseData['message']}');
        }
        if (responseData['itemsProcessed'] != null) {
          debugPrint('📊 Items processed: ${responseData['itemsProcessed']}');
        }
      } else {
        debugPrint('❌ Upload sync failed with status: ${response.statusCode}');
        debugPrint('Response data: ${response.data}');
      }
    } catch (e) {
      debugPrint('💥 API call failed: $e');
      rethrow;
    }
  }

  Future<void> _performBidirectionalSync() async {
    debugPrint('🔄 Starting bidirectional sync...');
    
    // Step 1: Upload local changes
    await _performUploadSync();
    
    // Step 2: Download server changes
    await _performDownloadSync();
    
    debugPrint('✅ Bidirectional sync completed');
  }
  
  Future<void> _performDownloadSync() async {
    debugPrint('📥 Starting download sync...');
    
    // Use last sync time or a default time
    final lastSyncTime = _lastSyncTime ?? DateTime.now().subtract(const Duration(days: 30));
    
    try {
      // Call new download endpoint
      final response = await _apiService.downloadSync(lastSyncTime);
      
      debugPrint('📡 Download API Response: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final responseData = response.data;
        
        // Process updated items
        final updatedRequests = responseData['updatedRequests'] as List?;
        final updatedLists = responseData['updatedLists'] as List?;
        
        if (updatedRequests != null && updatedRequests.isNotEmpty) {
          debugPrint('📥 Processing ${updatedRequests.length} updated prayer requests from server');
          await _processServerPrayerRequests(updatedRequests);
        }
        
        if (updatedLists != null && updatedLists.isNotEmpty) {
          debugPrint('📥 Processing ${updatedLists.length} updated prayer lists from server');
          await _processServerPrayerLists(updatedLists);
        }
        
        // Process deleted items
        final deletedRequests = responseData['deletedRequests'] as List?;
        final deletedLists = responseData['deletedLists'] as List?;
        
        if (deletedRequests != null && deletedRequests.isNotEmpty) {
          debugPrint('🗑️ Processing ${deletedRequests.length} deleted prayer requests from server');
          await _processDeletedPrayerRequests(deletedRequests);
        }
        
        if (deletedLists != null && deletedLists.isNotEmpty) {
          debugPrint('🗑️ Processing ${deletedLists.length} deleted prayer lists from server');
          await _processDeletedPrayerLists(deletedLists);
        }
        
        // Update last sync time
        if (responseData['syncTime'] != null) {
          _lastSyncTime = DateTime.parse(responseData['syncTime']);
          debugPrint('📅 Updated last sync time to: $_lastSyncTime');
        }
        
        debugPrint('✅ Download sync successful');
        
        // Notify listeners that data has changed
        _dataChangedController.add(null);
      } else {
        debugPrint('❌ Download sync failed with status: ${response.statusCode}');
        debugPrint('Response data: ${response.data}');
        throw Exception('Download sync failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('💥 Download sync failed: $e');
      rethrow;
    }
  }

  Future<List<models.PrayerRequest>> _getLocalPrayerRequests() async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, returning empty requests list');
      return [];
    }
    try {
      // Get all local prayer requests that need syncing
      // For now, get all requests - in production you'd track which ones changed
      debugPrint('📊 SyncService: Getting local prayer requests from database...');
      final requests = await _database!.getAllPrayerRequests();
      debugPrint('📊 SyncService: Found ${requests.length} local prayer requests');
      return requests;
    } catch (e) {
      debugPrint('❌ SyncService: Error getting local prayer requests: $e');
      debugPrint('❌ Stack trace: ${StackTrace.current}');
      return [];
    }
  }

  Future<List<models.PrayerList>> _getLocalPrayerLists() async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, returning empty lists');
      return [];
    }
    try {
      // Get all local prayer lists that need syncing
      debugPrint('📊 SyncService: Getting local prayer lists from database...');
      final lists = await _database!.getAllPrayerLists();
      debugPrint('📊 SyncService: Found ${lists.length} local prayer lists');
      return lists;
    } catch (e) {
      debugPrint('❌ SyncService: Error getting local prayer lists: $e');
      debugPrint('❌ Stack trace: ${StackTrace.current}');
      return [];
    }
  }
  
  bool _isDatabaseInitialized() {
    return _database != null;
  }

  Map<String, dynamic> _prayerRequestToJson(models.PrayerRequest pr) {
    return {
      'id': pr.id,
      'title': pr.subject,
      'description': pr.requestDetail,
      'category': pr.category.toString().split('.').last.toUpperCase(),
      'priority': pr.priority.toString().split('.').last.toUpperCase(),
      'status': pr.status.toString().split('.').last.toUpperCase(),
      'privacyLevel': pr.privacyLevel.toString().split('.').last.toUpperCase(),
      'prayerCount': pr.prayerCount,
      'isAnonymous': false, // Not in current model
      'answeredAt': pr.dateAnswered?.toIso8601String(),
      'answeredDescription': pr.howAnswered,
      'createdAt': pr.dateAdded.toIso8601String(),
      'updatedAt': pr.lastModified?.toIso8601String() ?? pr.dateAdded.toIso8601String(),
      'creatorId': pr.requestorId,
      'prayerListId': pr.listId,
    };
  }

  Map<String, dynamic> _prayerListToJson(models.PrayerList pl) {
    return {
      'id': pl.id,
      'name': pl.name,
      'description': pl.description ?? '',
      'privacyLevel': pl.privacyLevel.toString().split('.').last.toUpperCase(),
      'isActive': true,
      'createdAt': pl.createdAt.toIso8601String(),
      'updatedAt': pl.lastModified?.toIso8601String() ?? pl.createdAt.toIso8601String(),
      'creatorId': pl.ownerId,
      'churchId': pl.churchId,
    };
  }

  Future<void> _processServerPrayerRequests(List<dynamic> serverRequests) async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, skipping server prayer requests processing');
      return;
    }
    for (final serverRequest in serverRequests) {
      try {
        // Convert server format to local format and upsert
        final prayerRequest = _serverRequestToLocal(serverRequest);
        await _database!.insertPrayerRequest(prayerRequest);
        debugPrint('✅ Updated local prayer request: ${prayerRequest.id}');
      } catch (e) {
        debugPrint('❌ Error processing server prayer request: $e');
      }
    }
  }
  
  Future<void> _processDeletedPrayerRequests(List<dynamic> deletedRequests) async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, skipping deleted prayer requests processing');
      return;
    }
    for (final deletedRequest in deletedRequests) {
      try {
        final requestId = deletedRequest['id'] as String;
        await _database!.deletePrayerRequest(requestId);
        debugPrint('🗑️ Deleted local prayer request: $requestId');
      } catch (e) {
        debugPrint('❌ Error deleting prayer request: $e');
      }
    }
  }

  Future<void> _processServerPrayerLists(List<dynamic> serverLists) async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, skipping server prayer lists processing');
      return;
    }
    for (final serverList in serverLists) {
      try {
        // Convert server format to local format and upsert
        final prayerList = _serverListToLocal(serverList);
        await _database!.insertPrayerList(prayerList);
        debugPrint('✅ Updated local prayer list: ${prayerList.id}');
      } catch (e) {
        debugPrint('❌ Error processing server prayer list: $e');
      }
    }
  }
  
  Future<void> _processDeletedPrayerLists(List<dynamic> deletedLists) async {
    if (!_isDatabaseInitialized()) {
      debugPrint('⚠️ SyncService: Database not initialized, skipping deleted prayer lists processing');
      return;
    }
    for (final deletedList in deletedLists) {
      try {
        final listId = deletedList['id'] as String;
        await _database!.deletePrayerList(listId);
        debugPrint('🗑️ Deleted local prayer list: $listId');
      } catch (e) {
        debugPrint('❌ Error deleting prayer list: $e');
      }
    }
  }

  models.PrayerRequest _serverRequestToLocal(Map<String, dynamic> json) {
    return models.PrayerRequest(
      id: json['id']?.toString() ?? '',
      listId: json['prayerListId']?.toString(),
      churchId: null, // Will be set based on list
      dateAdded: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      subject: json['title']?.toString() ?? '',
      requestDetail: json['description']?.toString() ?? '',
      isAnswered: _parseStatus(json['status']) == models.RequestStatus.answered,
      howAnswered: json['answeredDescription']?.toString(),
      dateAnswered: json['answeredAt'] != null ? DateTime.parse(json['answeredAt']) : null,
      category: _parseCategory(json['category']?.toString()),
      priority: _parsePriority(json['priority']?.toString()),
      scriptureReference: null,
      notes: [],
      requestorId: json['creatorId']?.toString() ?? '',
      requestorName: json['creatorName']?.toString() ?? 'Unknown',
      privacyLevel: _parsePrivacyLevel(json['privacyLevel']?.toString()),
      tags: [],
      status: _parseStatus(json['status']?.toString()),
      prayerCount: json['prayerCount'] ?? 0,
      reminderSettings: null,
      lastModified: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      syncId: json['id']?.toString() ?? '', // Use server ID as sync ID
    );
  }

  models.PrayerList _serverListToLocal(Map<String, dynamic> json) {
    return models.PrayerList(
      id: json['id']?.toString() ?? '',
      churchId: json['churchId']?.toString(),
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      ownerId: json['creatorId']?.toString() ?? '',
      ownerName: json['creatorName']?.toString() ?? 'Unknown',
      memberIds: [],
      privacyLevel: _parsePrivacyLevel(json['privacyLevel']?.toString()),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      lastModified: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      syncId: json['id']?.toString() ?? '', // Use server ID as sync ID
      requestCount: json['requestCount'] ?? 0,
    );
  }

  // Helper methods to parse enums
  models.RequestCategory _parseCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'health': return models.RequestCategory.health;
      case 'family': return models.RequestCategory.family;
      case 'work': return models.RequestCategory.work;
      case 'spiritualgrowth': return models.RequestCategory.spiritualGrowth;
      case 'relationships': return models.RequestCategory.relationships;
      case 'finances': return models.RequestCategory.finances;
      case 'ministry': return models.RequestCategory.ministry;
      case 'other': return models.RequestCategory.other;
      default: return models.RequestCategory.other;
    }
  }

  models.RequestPriority _parsePriority(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'low': return models.RequestPriority.low;
      case 'medium': return models.RequestPriority.medium;
      case 'high': return models.RequestPriority.high;
      default: return models.RequestPriority.medium;
    }
  }

  models.RequestStatus _parseStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'active': return models.RequestStatus.active;
      case 'answered': return models.RequestStatus.answered;
      case 'nolongerneeded': return models.RequestStatus.noLongerNeeded;
      case 'ongoing': return models.RequestStatus.ongoing;
      default: return models.RequestStatus.active;
    }
  }

  models.PrivacyLevel _parsePrivacyLevel(String? privacy) {
    switch (privacy?.toLowerCase()) {
      case 'public': return models.PrivacyLevel.public;
      case 'church': return models.PrivacyLevel.church;
      case 'private': return models.PrivacyLevel.private;
      default: return models.PrivacyLevel.private;
    }
  }

  void dispose() {
    _syncStatusController.close();
    _dataChangedController.close();
  }
}

enum SyncStatus {
  idle,
  syncing,
  synced,
  error,
}