import 'package:flutter/foundation.dart';
import 'package:prayer_sync/database/app_database.dart';
import 'package:prayer_sync/database/database_repository.dart';
import 'package:prayer_sync/models/prayer_request.dart' as models;
import 'package:prayer_sync/models/prayer_list.dart' as models;
import 'package:prayer_sync/services/sync_service.dart';
import 'package:uuid/uuid.dart';

class PrayerProvider extends ChangeNotifier {
  late AppDatabase _database;
  List<models.PrayerRequest> _requests = [];
  List<models.PrayerList> _lists = [];
  bool _isLoading = false;
  final _uuid = const Uuid();

  List<models.PrayerRequest> get requests => _requests;
  List<models.PrayerList> get lists => _lists;
  bool get isLoading => _isLoading;

  void setDatabase(AppDatabase db) {
    _database = db;
    SyncService.instance.initialize(db);
    loadData();
  }

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _requests = await _database.getAllPrayerRequests();
      _lists = await _database.getAllPrayerLists();
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPrayerRequest(models.PrayerRequest request) async {
    try {
      final newRequest = request.copyWith(
        id: _uuid.v4(),
        dateAdded: DateTime.now(),
        lastModified: DateTime.now(),
      );
      
      await _database.insertPrayerRequest(newRequest);
      _requests.add(newRequest);
      
      if (newRequest.listId != null) {
        await _updateListRequestCount(newRequest.listId!);
      }
      
      notifyListeners();
      
      // Trigger sync after local change
      SyncService.instance.syncAfterLocalChange();
    } catch (e) {
      throw Exception('Failed to add prayer request: $e');
    }
  }

  Future<void> updatePrayerRequest(models.PrayerRequest request) async {
    try {
      final updatedRequest = request.copyWith(
        lastModified: DateTime.now(),
      );
      
      await _database.updatePrayerRequest(updatedRequest);
      
      final index = _requests.indexWhere((r) => r.id == request.id);
      if (index != -1) {
        _requests[index] = updatedRequest;
      }
      
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to update prayer request: $e');
    }
  }

  Future<void> deletePrayerRequest(String id) async {
    try {
      final request = _requests.firstWhere((r) => r.id == id);
      await _database.deletePrayerRequest(id);
      _requests.removeWhere((r) => r.id == id);
      
      if (request.listId != null) {
        await _updateListRequestCount(request.listId!);
      }
      
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete prayer request: $e');
    }
  }

  Future<void> incrementPrayerCount(String requestId) async {
    try {
      final request = _requests.firstWhere((r) => r.id == requestId);
      final updatedRequest = request.copyWith(
        prayerCount: request.prayerCount + 1,
        lastModified: DateTime.now(),
      );
      
      await _database.updatePrayerRequest(updatedRequest);
      
      final index = _requests.indexWhere((r) => r.id == requestId);
      if (index != -1) {
        _requests[index] = updatedRequest;
      }
      
      notifyListeners();
      
      // Trigger sync after local change
      debugPrint('🔄 PrayerProvider: Triggering sync after prayer count increment for request: $requestId');
      SyncService.instance.syncAfterLocalChange();
    } catch (e) {
      throw Exception('Failed to increment prayer count: $e');
    }
  }

  Future<void> markAsAnswered(String requestId, String howAnswered) async {
    try {
      final request = _requests.firstWhere((r) => r.id == requestId);
      final updatedRequest = request.copyWith(
        isAnswered: true,
        howAnswered: howAnswered,
        dateAnswered: DateTime.now(),
        status: models.RequestStatus.answered,
        lastModified: DateTime.now(),
      );
      
      await _database.updatePrayerRequest(updatedRequest);
      
      final index = _requests.indexWhere((r) => r.id == requestId);
      if (index != -1) {
        _requests[index] = updatedRequest;
      }
      
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to mark as answered: $e');
    }
  }

  Future<void> addPrayerList(models.PrayerList list) async {
    try {
      final newList = list.copyWith(
        id: _uuid.v4(),
        createdAt: DateTime.now(),
        lastModified: DateTime.now(),
      );
      
      await _database.insertPrayerList(newList);
      _lists.add(newList);
      notifyListeners();
      
      // Trigger sync after local change
      SyncService.instance.syncAfterLocalChange();
    } catch (e) {
      throw Exception('Failed to add prayer list: $e');
    }
  }

  Future<void> updatePrayerList(models.PrayerList list) async {
    try {
      final updatedList = list.copyWith(
        lastModified: DateTime.now(),
      );
      
      await _database.updatePrayerList(updatedList);
      
      final index = _lists.indexWhere((l) => l.id == list.id);
      if (index != -1) {
        _lists[index] = updatedList;
      }
      
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to update prayer list: $e');
    }
  }

  Future<void> deletePrayerList(String id) async {
    try {
      await _database.deletePrayerList(id);
      _lists.removeWhere((l) => l.id == id);
      
      for (var request in _requests.where((r) => r.listId == id)) {
        await deletePrayerRequest(request.id);
      }
      
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete prayer list: $e');
    }
  }

  Future<void> _updateListRequestCount(String listId) async {
    final count = _requests.where((r) => r.listId == listId).length;
    final list = _lists.firstWhere((l) => l.id == listId);
    final updatedList = list.copyWith(requestCount: count);
    await updatePrayerList(updatedList);
  }

  List<models.PrayerRequest> getRequestsByList(String? listId) {
    if (listId == null) {
      return _requests.where((r) => r.listId == null).toList();
    }
    return _requests.where((r) => r.listId == listId).toList();
  }

  List<models.PrayerRequest> getRequestsByStatus(models.RequestStatus status) {
    return _requests.where((r) => r.status == status).toList();
  }

  List<models.PrayerRequest> getRequestsByCategory(models.RequestCategory category) {
    return _requests.where((r) => r.category == category).toList();
  }

  List<models.PrayerRequest> searchRequests(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _requests.where((r) =>
        r.subject.toLowerCase().contains(lowercaseQuery) ||
        r.requestDetail.toLowerCase().contains(lowercaseQuery) ||
        r.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery))
    ).toList();
  }
}