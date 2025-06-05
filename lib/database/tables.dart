import 'package:drift/drift.dart';

class PrayerRequests extends Table {
  TextColumn get id => text()();
  TextColumn get listId => text().nullable()();
  TextColumn get churchId => text().nullable()();
  DateTimeColumn get dateAdded => dateTime()();
  TextColumn get subject => text()();
  TextColumn get requestDetail => text()();
  BoolColumn get isAnswered => boolean().withDefault(const Constant(false))();
  TextColumn get howAnswered => text().nullable()();
  DateTimeColumn get dateAnswered => dateTime().nullable()();
  TextColumn get category => text()();
  TextColumn get priority => text()();
  TextColumn get scriptureReference => text().nullable()();
  TextColumn get notes => text().withDefault(const Constant('[]'))();
  TextColumn get requestorId => text()();
  TextColumn get requestorName => text()();
  TextColumn get privacyLevel => text().withDefault(const Constant('private'))();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get prayerCount => integer().withDefault(const Constant(0))();
  TextColumn get reminderSettings => text().nullable()();
  DateTimeColumn get lastModified => dateTime().nullable()();
  TextColumn get syncId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PrayerLists extends Table {
  TextColumn get id => text()();
  TextColumn get churchId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get ownerName => text()();
  TextColumn get memberIds => text().withDefault(const Constant('[]'))();
  TextColumn get privacyLevel => text().withDefault(const Constant('private'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastModified => dateTime().nullable()();
  TextColumn get syncId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  IntColumn get requestCount => integer().withDefault(const Constant(0))();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Churches extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get adminIds => text().withDefault(const Constant('[]'))();
  TextColumn get memberIds => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastModified => dateTime().nullable()();
  TextColumn get syncId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get settings => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get displayName => text()();
  TextColumn get photoUrl => text().nullable()();
  TextColumn get churchIds => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastLogin => dateTime().nullable()();
  TextColumn get preferences => text().nullable()();
  TextColumn get syncId => text().nullable()();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}