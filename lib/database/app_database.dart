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
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'prayer_sync.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}