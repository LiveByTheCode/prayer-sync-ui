import 'package:prayer_sync/models/prayer_request.dart' as models;
import 'package:prayer_sync/models/prayer_list.dart' as models;
import 'package:prayer_sync/database/app_database.dart';
import 'package:prayer_sync/database/converters.dart';

extension DatabaseRepository on AppDatabase {
  // Prayer Request methods
  Future<List<models.PrayerRequest>> getAllPrayerRequests() async {
    final results = await select(prayerRequests).get();
    return results.map((row) => row.toDomainModel()).toList();
  }

  Future<List<models.PrayerRequest>> getPrayerRequestsByList(String listId) async {
    final results = await (select(prayerRequests)
          ..where((tbl) => tbl.listId.equals(listId)))
        .get();
    return results.map((row) => row.toDomainModel()).toList();
  }

  Future<models.PrayerRequest?> getPrayerRequestById(String id) async {
    final result = await (select(prayerRequests)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return result?.toDomainModel();
  }

  Future<int> insertPrayerRequest(models.PrayerRequest request) {
    return into(prayerRequests).insert(request.toCompanion());
  }

  Future<bool> updatePrayerRequest(models.PrayerRequest request) {
    return update(prayerRequests).replace(request.toCompanion());
  }

  Future<int> deletePrayerRequest(String id) {
    return (delete(prayerRequests)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Prayer List methods
  Future<List<models.PrayerList>> getAllPrayerLists() async {
    final results = await select(prayerLists).get();
    return results.map((row) => row.toDomainModel()).toList();
  }

  Future<models.PrayerList?> getPrayerListById(String id) async {
    final result = await (select(prayerLists)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return result?.toDomainModel();
  }

  Future<int> insertPrayerList(models.PrayerList list) {
    return into(prayerLists).insert(list.toCompanion());
  }

  Future<bool> updatePrayerList(models.PrayerList list) {
    return update(prayerLists).replace(list.toCompanion());
  }

  Future<int> deletePrayerList(String id) {
    return (delete(prayerLists)..where((tbl) => tbl.id.equals(id))).go();
  }
}