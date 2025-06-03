import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/models/prayer_list.dart';

class MemoryDatabase {
  static final MemoryDatabase _instance = MemoryDatabase._internal();
  factory MemoryDatabase() => _instance;
  MemoryDatabase._internal();

  final List<PrayerRequest> _requests = [];
  final List<PrayerList> _lists = [];

  Future<List<PrayerRequest>> getAllPrayerRequests() async => List.from(_requests);
  
  Future<List<PrayerRequest>> getPrayerRequestsByList(String listId) async =>
      _requests.where((r) => r.listId == listId).toList();
  
  Future<PrayerRequest?> getPrayerRequestById(String id) async =>
      _requests.firstWhere((r) => r.id == id, orElse: () => null as PrayerRequest);
  
  Future<int> insertPrayerRequest(PrayerRequest request) async {
    _requests.add(request);
    return 1;
  }
  
  Future<bool> updatePrayerRequest(PrayerRequest request) async {
    final index = _requests.indexWhere((r) => r.id == request.id);
    if (index != -1) {
      _requests[index] = request;
      return true;
    }
    return false;
  }
  
  Future<int> deletePrayerRequest(String id) async {
    _requests.removeWhere((r) => r.id == id);
    return 1;
  }
  
  Future<List<PrayerList>> getAllPrayerLists() async => List.from(_lists);
  
  Future<PrayerList?> getPrayerListById(String id) async =>
      _lists.firstWhere((l) => l.id == id, orElse: () => null as PrayerList);
  
  Future<int> insertPrayerList(PrayerList list) async {
    _lists.add(list);
    return 1;
  }
  
  Future<bool> updatePrayerList(PrayerList list) async {
    final index = _lists.indexWhere((l) => l.id == list.id);
    if (index != -1) {
      _lists[index] = list;
      return true;
    }
    return false;
  }
  
  Future<int> deletePrayerList(String id) async {
    _lists.removeWhere((l) => l.id == id);
    return 1;
  }

  void close() {}
}