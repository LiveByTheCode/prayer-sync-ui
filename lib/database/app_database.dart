import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:prayer_sync/database/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PrayerRequests, PrayerLists, Churches, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
  
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // For development purposes, we'll recreate all tables
        // In production, you'd want proper migration logic
        if (from == 1 && to == 2) {
          // Drop and recreate all tables to ensure clean state
          await m.drop(prayerRequests);
          await m.drop(prayerLists);
          await m.drop(churches);
          await m.drop(users);
          await m.createAll();
        }
      },
    );
  }

  /// Deletes the database file completely. Use only for development/debugging.
  static Future<void> resetDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'prayer_sync.sqlite'));
    if (await file.exists()) {
      await file.delete();
      print('Database file deleted: ${file.path}');
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'prayer_sync.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}