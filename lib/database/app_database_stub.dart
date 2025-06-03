import 'package:prayer_sync/models/prayer_request.dart';
import 'package:prayer_sync/models/prayer_list.dart';

// Stub implementation for web
class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  Future<List<PrayerRequest>> getAllPrayerRequests() async => [];
  Future<List<PrayerRequest>> getPrayerRequestsByList(String listId) async => [];
  Future<PrayerRequest?> getPrayerRequestById(String id) async => null;
  Future<int> insertPrayerRequest(PrayerRequest request) async => 0;
  Future<bool> updatePrayerRequest(PrayerRequest request) async => true;
  Future<int> deletePrayerRequest(String id) async => 0;
  
  Future<List<PrayerList>> getAllPrayerLists() async => [];
  Future<PrayerList?> getPrayerListById(String id) async => null;
  Future<int> insertPrayerList(PrayerList list) async => 0;
  Future<bool> updatePrayerList(PrayerList list) async => true;
  Future<int> deletePrayerList(String id) async => 0;

  void close() {}
}