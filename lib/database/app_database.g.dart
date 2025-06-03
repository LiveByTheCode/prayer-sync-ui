// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PrayerRequestsTable extends PrayerRequests
    with TableInfo<$PrayerRequestsTable, PrayerRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<String> listId = GeneratedColumn<String>(
      'list_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _churchIdMeta =
      const VerificationMeta('churchId');
  @override
  late final GeneratedColumn<String> churchId = GeneratedColumn<String>(
      'church_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateAddedMeta =
      const VerificationMeta('dateAdded');
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
      'date_added', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requestDetailMeta =
      const VerificationMeta('requestDetail');
  @override
  late final GeneratedColumn<String> requestDetail = GeneratedColumn<String>(
      'request_detail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isAnsweredMeta =
      const VerificationMeta('isAnswered');
  @override
  late final GeneratedColumn<bool> isAnswered = GeneratedColumn<bool>(
      'is_answered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_answered" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _howAnsweredMeta =
      const VerificationMeta('howAnswered');
  @override
  late final GeneratedColumn<String> howAnswered = GeneratedColumn<String>(
      'how_answered', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateAnsweredMeta =
      const VerificationMeta('dateAnswered');
  @override
  late final GeneratedColumn<DateTime> dateAnswered = GeneratedColumn<DateTime>(
      'date_answered', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptureReferenceMeta =
      const VerificationMeta('scriptureReference');
  @override
  late final GeneratedColumn<String> scriptureReference =
      GeneratedColumn<String>('scripture_reference', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _requestorIdMeta =
      const VerificationMeta('requestorId');
  @override
  late final GeneratedColumn<String> requestorId = GeneratedColumn<String>(
      'requestor_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requestorNameMeta =
      const VerificationMeta('requestorName');
  @override
  late final GeneratedColumn<String> requestorName = GeneratedColumn<String>(
      'requestor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _privacyLevelMeta =
      const VerificationMeta('privacyLevel');
  @override
  late final GeneratedColumn<String> privacyLevel = GeneratedColumn<String>(
      'privacy_level', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('private'));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _prayerCountMeta =
      const VerificationMeta('prayerCount');
  @override
  late final GeneratedColumn<int> prayerCount = GeneratedColumn<int>(
      'prayer_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _reminderSettingsMeta =
      const VerificationMeta('reminderSettings');
  @override
  late final GeneratedColumn<String> reminderSettings = GeneratedColumn<String>(
      'reminder_settings', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
      'sync_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        listId,
        churchId,
        dateAdded,
        subject,
        requestDetail,
        isAnswered,
        howAnswered,
        dateAnswered,
        category,
        priority,
        scriptureReference,
        notes,
        requestorId,
        requestorName,
        privacyLevel,
        tags,
        status,
        prayerCount,
        reminderSettings,
        lastModified,
        syncId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_requests';
  @override
  VerificationContext validateIntegrity(Insertable<PrayerRequest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    }
    if (data.containsKey('church_id')) {
      context.handle(_churchIdMeta,
          churchId.isAcceptableOrUnknown(data['church_id']!, _churchIdMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta));
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('request_detail')) {
      context.handle(
          _requestDetailMeta,
          requestDetail.isAcceptableOrUnknown(
              data['request_detail']!, _requestDetailMeta));
    } else if (isInserting) {
      context.missing(_requestDetailMeta);
    }
    if (data.containsKey('is_answered')) {
      context.handle(
          _isAnsweredMeta,
          isAnswered.isAcceptableOrUnknown(
              data['is_answered']!, _isAnsweredMeta));
    }
    if (data.containsKey('how_answered')) {
      context.handle(
          _howAnsweredMeta,
          howAnswered.isAcceptableOrUnknown(
              data['how_answered']!, _howAnsweredMeta));
    }
    if (data.containsKey('date_answered')) {
      context.handle(
          _dateAnsweredMeta,
          dateAnswered.isAcceptableOrUnknown(
              data['date_answered']!, _dateAnsweredMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('scripture_reference')) {
      context.handle(
          _scriptureReferenceMeta,
          scriptureReference.isAcceptableOrUnknown(
              data['scripture_reference']!, _scriptureReferenceMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('requestor_id')) {
      context.handle(
          _requestorIdMeta,
          requestorId.isAcceptableOrUnknown(
              data['requestor_id']!, _requestorIdMeta));
    } else if (isInserting) {
      context.missing(_requestorIdMeta);
    }
    if (data.containsKey('requestor_name')) {
      context.handle(
          _requestorNameMeta,
          requestorName.isAcceptableOrUnknown(
              data['requestor_name']!, _requestorNameMeta));
    } else if (isInserting) {
      context.missing(_requestorNameMeta);
    }
    if (data.containsKey('privacy_level')) {
      context.handle(
          _privacyLevelMeta,
          privacyLevel.isAcceptableOrUnknown(
              data['privacy_level']!, _privacyLevelMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('prayer_count')) {
      context.handle(
          _prayerCountMeta,
          prayerCount.isAcceptableOrUnknown(
              data['prayer_count']!, _prayerCountMeta));
    }
    if (data.containsKey('reminder_settings')) {
      context.handle(
          _reminderSettingsMeta,
          reminderSettings.isAcceptableOrUnknown(
              data['reminder_settings']!, _reminderSettingsMeta));
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerRequest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}list_id']),
      churchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}church_id']),
      dateAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      requestDetail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}request_detail'])!,
      isAnswered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_answered'])!,
      howAnswered: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}how_answered']),
      dateAnswered: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_answered']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      scriptureReference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}scripture_reference']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      requestorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requestor_id'])!,
      requestorName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requestor_name'])!,
      privacyLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy_level'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      prayerCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prayer_count'])!,
      reminderSettings: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reminder_settings']),
      lastModified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_modified']),
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_id']),
    );
  }

  @override
  $PrayerRequestsTable createAlias(String alias) {
    return $PrayerRequestsTable(attachedDatabase, alias);
  }
}

class PrayerRequest extends DataClass implements Insertable<PrayerRequest> {
  final String id;
  final String? listId;
  final String? churchId;
  final DateTime dateAdded;
  final String subject;
  final String requestDetail;
  final bool isAnswered;
  final String? howAnswered;
  final DateTime? dateAnswered;
  final String category;
  final String priority;
  final String? scriptureReference;
  final String notes;
  final String requestorId;
  final String requestorName;
  final String privacyLevel;
  final String tags;
  final String status;
  final int prayerCount;
  final String? reminderSettings;
  final DateTime? lastModified;
  final String? syncId;
  const PrayerRequest(
      {required this.id,
      this.listId,
      this.churchId,
      required this.dateAdded,
      required this.subject,
      required this.requestDetail,
      required this.isAnswered,
      this.howAnswered,
      this.dateAnswered,
      required this.category,
      required this.priority,
      this.scriptureReference,
      required this.notes,
      required this.requestorId,
      required this.requestorName,
      required this.privacyLevel,
      required this.tags,
      required this.status,
      required this.prayerCount,
      this.reminderSettings,
      this.lastModified,
      this.syncId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || listId != null) {
      map['list_id'] = Variable<String>(listId);
    }
    if (!nullToAbsent || churchId != null) {
      map['church_id'] = Variable<String>(churchId);
    }
    map['date_added'] = Variable<DateTime>(dateAdded);
    map['subject'] = Variable<String>(subject);
    map['request_detail'] = Variable<String>(requestDetail);
    map['is_answered'] = Variable<bool>(isAnswered);
    if (!nullToAbsent || howAnswered != null) {
      map['how_answered'] = Variable<String>(howAnswered);
    }
    if (!nullToAbsent || dateAnswered != null) {
      map['date_answered'] = Variable<DateTime>(dateAnswered);
    }
    map['category'] = Variable<String>(category);
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || scriptureReference != null) {
      map['scripture_reference'] = Variable<String>(scriptureReference);
    }
    map['notes'] = Variable<String>(notes);
    map['requestor_id'] = Variable<String>(requestorId);
    map['requestor_name'] = Variable<String>(requestorName);
    map['privacy_level'] = Variable<String>(privacyLevel);
    map['tags'] = Variable<String>(tags);
    map['status'] = Variable<String>(status);
    map['prayer_count'] = Variable<int>(prayerCount);
    if (!nullToAbsent || reminderSettings != null) {
      map['reminder_settings'] = Variable<String>(reminderSettings);
    }
    if (!nullToAbsent || lastModified != null) {
      map['last_modified'] = Variable<DateTime>(lastModified);
    }
    if (!nullToAbsent || syncId != null) {
      map['sync_id'] = Variable<String>(syncId);
    }
    return map;
  }

  PrayerRequestsCompanion toCompanion(bool nullToAbsent) {
    return PrayerRequestsCompanion(
      id: Value(id),
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
      churchId: churchId == null && nullToAbsent
          ? const Value.absent()
          : Value(churchId),
      dateAdded: Value(dateAdded),
      subject: Value(subject),
      requestDetail: Value(requestDetail),
      isAnswered: Value(isAnswered),
      howAnswered: howAnswered == null && nullToAbsent
          ? const Value.absent()
          : Value(howAnswered),
      dateAnswered: dateAnswered == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAnswered),
      category: Value(category),
      priority: Value(priority),
      scriptureReference: scriptureReference == null && nullToAbsent
          ? const Value.absent()
          : Value(scriptureReference),
      notes: Value(notes),
      requestorId: Value(requestorId),
      requestorName: Value(requestorName),
      privacyLevel: Value(privacyLevel),
      tags: Value(tags),
      status: Value(status),
      prayerCount: Value(prayerCount),
      reminderSettings: reminderSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderSettings),
      lastModified: lastModified == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModified),
      syncId:
          syncId == null && nullToAbsent ? const Value.absent() : Value(syncId),
    );
  }

  factory PrayerRequest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerRequest(
      id: serializer.fromJson<String>(json['id']),
      listId: serializer.fromJson<String?>(json['listId']),
      churchId: serializer.fromJson<String?>(json['churchId']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      subject: serializer.fromJson<String>(json['subject']),
      requestDetail: serializer.fromJson<String>(json['requestDetail']),
      isAnswered: serializer.fromJson<bool>(json['isAnswered']),
      howAnswered: serializer.fromJson<String?>(json['howAnswered']),
      dateAnswered: serializer.fromJson<DateTime?>(json['dateAnswered']),
      category: serializer.fromJson<String>(json['category']),
      priority: serializer.fromJson<String>(json['priority']),
      scriptureReference:
          serializer.fromJson<String?>(json['scriptureReference']),
      notes: serializer.fromJson<String>(json['notes']),
      requestorId: serializer.fromJson<String>(json['requestorId']),
      requestorName: serializer.fromJson<String>(json['requestorName']),
      privacyLevel: serializer.fromJson<String>(json['privacyLevel']),
      tags: serializer.fromJson<String>(json['tags']),
      status: serializer.fromJson<String>(json['status']),
      prayerCount: serializer.fromJson<int>(json['prayerCount']),
      reminderSettings: serializer.fromJson<String?>(json['reminderSettings']),
      lastModified: serializer.fromJson<DateTime?>(json['lastModified']),
      syncId: serializer.fromJson<String?>(json['syncId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'listId': serializer.toJson<String?>(listId),
      'churchId': serializer.toJson<String?>(churchId),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'subject': serializer.toJson<String>(subject),
      'requestDetail': serializer.toJson<String>(requestDetail),
      'isAnswered': serializer.toJson<bool>(isAnswered),
      'howAnswered': serializer.toJson<String?>(howAnswered),
      'dateAnswered': serializer.toJson<DateTime?>(dateAnswered),
      'category': serializer.toJson<String>(category),
      'priority': serializer.toJson<String>(priority),
      'scriptureReference': serializer.toJson<String?>(scriptureReference),
      'notes': serializer.toJson<String>(notes),
      'requestorId': serializer.toJson<String>(requestorId),
      'requestorName': serializer.toJson<String>(requestorName),
      'privacyLevel': serializer.toJson<String>(privacyLevel),
      'tags': serializer.toJson<String>(tags),
      'status': serializer.toJson<String>(status),
      'prayerCount': serializer.toJson<int>(prayerCount),
      'reminderSettings': serializer.toJson<String?>(reminderSettings),
      'lastModified': serializer.toJson<DateTime?>(lastModified),
      'syncId': serializer.toJson<String?>(syncId),
    };
  }

  PrayerRequest copyWith(
          {String? id,
          Value<String?> listId = const Value.absent(),
          Value<String?> churchId = const Value.absent(),
          DateTime? dateAdded,
          String? subject,
          String? requestDetail,
          bool? isAnswered,
          Value<String?> howAnswered = const Value.absent(),
          Value<DateTime?> dateAnswered = const Value.absent(),
          String? category,
          String? priority,
          Value<String?> scriptureReference = const Value.absent(),
          String? notes,
          String? requestorId,
          String? requestorName,
          String? privacyLevel,
          String? tags,
          String? status,
          int? prayerCount,
          Value<String?> reminderSettings = const Value.absent(),
          Value<DateTime?> lastModified = const Value.absent(),
          Value<String?> syncId = const Value.absent()}) =>
      PrayerRequest(
        id: id ?? this.id,
        listId: listId.present ? listId.value : this.listId,
        churchId: churchId.present ? churchId.value : this.churchId,
        dateAdded: dateAdded ?? this.dateAdded,
        subject: subject ?? this.subject,
        requestDetail: requestDetail ?? this.requestDetail,
        isAnswered: isAnswered ?? this.isAnswered,
        howAnswered: howAnswered.present ? howAnswered.value : this.howAnswered,
        dateAnswered:
            dateAnswered.present ? dateAnswered.value : this.dateAnswered,
        category: category ?? this.category,
        priority: priority ?? this.priority,
        scriptureReference: scriptureReference.present
            ? scriptureReference.value
            : this.scriptureReference,
        notes: notes ?? this.notes,
        requestorId: requestorId ?? this.requestorId,
        requestorName: requestorName ?? this.requestorName,
        privacyLevel: privacyLevel ?? this.privacyLevel,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        prayerCount: prayerCount ?? this.prayerCount,
        reminderSettings: reminderSettings.present
            ? reminderSettings.value
            : this.reminderSettings,
        lastModified:
            lastModified.present ? lastModified.value : this.lastModified,
        syncId: syncId.present ? syncId.value : this.syncId,
      );
  PrayerRequest copyWithCompanion(PrayerRequestsCompanion data) {
    return PrayerRequest(
      id: data.id.present ? data.id.value : this.id,
      listId: data.listId.present ? data.listId.value : this.listId,
      churchId: data.churchId.present ? data.churchId.value : this.churchId,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      subject: data.subject.present ? data.subject.value : this.subject,
      requestDetail: data.requestDetail.present
          ? data.requestDetail.value
          : this.requestDetail,
      isAnswered:
          data.isAnswered.present ? data.isAnswered.value : this.isAnswered,
      howAnswered:
          data.howAnswered.present ? data.howAnswered.value : this.howAnswered,
      dateAnswered: data.dateAnswered.present
          ? data.dateAnswered.value
          : this.dateAnswered,
      category: data.category.present ? data.category.value : this.category,
      priority: data.priority.present ? data.priority.value : this.priority,
      scriptureReference: data.scriptureReference.present
          ? data.scriptureReference.value
          : this.scriptureReference,
      notes: data.notes.present ? data.notes.value : this.notes,
      requestorId:
          data.requestorId.present ? data.requestorId.value : this.requestorId,
      requestorName: data.requestorName.present
          ? data.requestorName.value
          : this.requestorName,
      privacyLevel: data.privacyLevel.present
          ? data.privacyLevel.value
          : this.privacyLevel,
      tags: data.tags.present ? data.tags.value : this.tags,
      status: data.status.present ? data.status.value : this.status,
      prayerCount:
          data.prayerCount.present ? data.prayerCount.value : this.prayerCount,
      reminderSettings: data.reminderSettings.present
          ? data.reminderSettings.value
          : this.reminderSettings,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerRequest(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('churchId: $churchId, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('subject: $subject, ')
          ..write('requestDetail: $requestDetail, ')
          ..write('isAnswered: $isAnswered, ')
          ..write('howAnswered: $howAnswered, ')
          ..write('dateAnswered: $dateAnswered, ')
          ..write('category: $category, ')
          ..write('priority: $priority, ')
          ..write('scriptureReference: $scriptureReference, ')
          ..write('notes: $notes, ')
          ..write('requestorId: $requestorId, ')
          ..write('requestorName: $requestorName, ')
          ..write('privacyLevel: $privacyLevel, ')
          ..write('tags: $tags, ')
          ..write('status: $status, ')
          ..write('prayerCount: $prayerCount, ')
          ..write('reminderSettings: $reminderSettings, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        listId,
        churchId,
        dateAdded,
        subject,
        requestDetail,
        isAnswered,
        howAnswered,
        dateAnswered,
        category,
        priority,
        scriptureReference,
        notes,
        requestorId,
        requestorName,
        privacyLevel,
        tags,
        status,
        prayerCount,
        reminderSettings,
        lastModified,
        syncId
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerRequest &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.churchId == this.churchId &&
          other.dateAdded == this.dateAdded &&
          other.subject == this.subject &&
          other.requestDetail == this.requestDetail &&
          other.isAnswered == this.isAnswered &&
          other.howAnswered == this.howAnswered &&
          other.dateAnswered == this.dateAnswered &&
          other.category == this.category &&
          other.priority == this.priority &&
          other.scriptureReference == this.scriptureReference &&
          other.notes == this.notes &&
          other.requestorId == this.requestorId &&
          other.requestorName == this.requestorName &&
          other.privacyLevel == this.privacyLevel &&
          other.tags == this.tags &&
          other.status == this.status &&
          other.prayerCount == this.prayerCount &&
          other.reminderSettings == this.reminderSettings &&
          other.lastModified == this.lastModified &&
          other.syncId == this.syncId);
}

class PrayerRequestsCompanion extends UpdateCompanion<PrayerRequest> {
  final Value<String> id;
  final Value<String?> listId;
  final Value<String?> churchId;
  final Value<DateTime> dateAdded;
  final Value<String> subject;
  final Value<String> requestDetail;
  final Value<bool> isAnswered;
  final Value<String?> howAnswered;
  final Value<DateTime?> dateAnswered;
  final Value<String> category;
  final Value<String> priority;
  final Value<String?> scriptureReference;
  final Value<String> notes;
  final Value<String> requestorId;
  final Value<String> requestorName;
  final Value<String> privacyLevel;
  final Value<String> tags;
  final Value<String> status;
  final Value<int> prayerCount;
  final Value<String?> reminderSettings;
  final Value<DateTime?> lastModified;
  final Value<String?> syncId;
  final Value<int> rowid;
  const PrayerRequestsCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.churchId = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.subject = const Value.absent(),
    this.requestDetail = const Value.absent(),
    this.isAnswered = const Value.absent(),
    this.howAnswered = const Value.absent(),
    this.dateAnswered = const Value.absent(),
    this.category = const Value.absent(),
    this.priority = const Value.absent(),
    this.scriptureReference = const Value.absent(),
    this.notes = const Value.absent(),
    this.requestorId = const Value.absent(),
    this.requestorName = const Value.absent(),
    this.privacyLevel = const Value.absent(),
    this.tags = const Value.absent(),
    this.status = const Value.absent(),
    this.prayerCount = const Value.absent(),
    this.reminderSettings = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrayerRequestsCompanion.insert({
    required String id,
    this.listId = const Value.absent(),
    this.churchId = const Value.absent(),
    required DateTime dateAdded,
    required String subject,
    required String requestDetail,
    this.isAnswered = const Value.absent(),
    this.howAnswered = const Value.absent(),
    this.dateAnswered = const Value.absent(),
    required String category,
    required String priority,
    this.scriptureReference = const Value.absent(),
    this.notes = const Value.absent(),
    required String requestorId,
    required String requestorName,
    this.privacyLevel = const Value.absent(),
    this.tags = const Value.absent(),
    this.status = const Value.absent(),
    this.prayerCount = const Value.absent(),
    this.reminderSettings = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        dateAdded = Value(dateAdded),
        subject = Value(subject),
        requestDetail = Value(requestDetail),
        category = Value(category),
        priority = Value(priority),
        requestorId = Value(requestorId),
        requestorName = Value(requestorName);
  static Insertable<PrayerRequest> custom({
    Expression<String>? id,
    Expression<String>? listId,
    Expression<String>? churchId,
    Expression<DateTime>? dateAdded,
    Expression<String>? subject,
    Expression<String>? requestDetail,
    Expression<bool>? isAnswered,
    Expression<String>? howAnswered,
    Expression<DateTime>? dateAnswered,
    Expression<String>? category,
    Expression<String>? priority,
    Expression<String>? scriptureReference,
    Expression<String>? notes,
    Expression<String>? requestorId,
    Expression<String>? requestorName,
    Expression<String>? privacyLevel,
    Expression<String>? tags,
    Expression<String>? status,
    Expression<int>? prayerCount,
    Expression<String>? reminderSettings,
    Expression<DateTime>? lastModified,
    Expression<String>? syncId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (churchId != null) 'church_id': churchId,
      if (dateAdded != null) 'date_added': dateAdded,
      if (subject != null) 'subject': subject,
      if (requestDetail != null) 'request_detail': requestDetail,
      if (isAnswered != null) 'is_answered': isAnswered,
      if (howAnswered != null) 'how_answered': howAnswered,
      if (dateAnswered != null) 'date_answered': dateAnswered,
      if (category != null) 'category': category,
      if (priority != null) 'priority': priority,
      if (scriptureReference != null) 'scripture_reference': scriptureReference,
      if (notes != null) 'notes': notes,
      if (requestorId != null) 'requestor_id': requestorId,
      if (requestorName != null) 'requestor_name': requestorName,
      if (privacyLevel != null) 'privacy_level': privacyLevel,
      if (tags != null) 'tags': tags,
      if (status != null) 'status': status,
      if (prayerCount != null) 'prayer_count': prayerCount,
      if (reminderSettings != null) 'reminder_settings': reminderSettings,
      if (lastModified != null) 'last_modified': lastModified,
      if (syncId != null) 'sync_id': syncId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrayerRequestsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? listId,
      Value<String?>? churchId,
      Value<DateTime>? dateAdded,
      Value<String>? subject,
      Value<String>? requestDetail,
      Value<bool>? isAnswered,
      Value<String?>? howAnswered,
      Value<DateTime?>? dateAnswered,
      Value<String>? category,
      Value<String>? priority,
      Value<String?>? scriptureReference,
      Value<String>? notes,
      Value<String>? requestorId,
      Value<String>? requestorName,
      Value<String>? privacyLevel,
      Value<String>? tags,
      Value<String>? status,
      Value<int>? prayerCount,
      Value<String?>? reminderSettings,
      Value<DateTime?>? lastModified,
      Value<String?>? syncId,
      Value<int>? rowid}) {
    return PrayerRequestsCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      churchId: churchId ?? this.churchId,
      dateAdded: dateAdded ?? this.dateAdded,
      subject: subject ?? this.subject,
      requestDetail: requestDetail ?? this.requestDetail,
      isAnswered: isAnswered ?? this.isAnswered,
      howAnswered: howAnswered ?? this.howAnswered,
      dateAnswered: dateAnswered ?? this.dateAnswered,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      scriptureReference: scriptureReference ?? this.scriptureReference,
      notes: notes ?? this.notes,
      requestorId: requestorId ?? this.requestorId,
      requestorName: requestorName ?? this.requestorName,
      privacyLevel: privacyLevel ?? this.privacyLevel,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      prayerCount: prayerCount ?? this.prayerCount,
      reminderSettings: reminderSettings ?? this.reminderSettings,
      lastModified: lastModified ?? this.lastModified,
      syncId: syncId ?? this.syncId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<String>(listId.value);
    }
    if (churchId.present) {
      map['church_id'] = Variable<String>(churchId.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (requestDetail.present) {
      map['request_detail'] = Variable<String>(requestDetail.value);
    }
    if (isAnswered.present) {
      map['is_answered'] = Variable<bool>(isAnswered.value);
    }
    if (howAnswered.present) {
      map['how_answered'] = Variable<String>(howAnswered.value);
    }
    if (dateAnswered.present) {
      map['date_answered'] = Variable<DateTime>(dateAnswered.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (scriptureReference.present) {
      map['scripture_reference'] = Variable<String>(scriptureReference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (requestorId.present) {
      map['requestor_id'] = Variable<String>(requestorId.value);
    }
    if (requestorName.present) {
      map['requestor_name'] = Variable<String>(requestorName.value);
    }
    if (privacyLevel.present) {
      map['privacy_level'] = Variable<String>(privacyLevel.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (prayerCount.present) {
      map['prayer_count'] = Variable<int>(prayerCount.value);
    }
    if (reminderSettings.present) {
      map['reminder_settings'] = Variable<String>(reminderSettings.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerRequestsCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('churchId: $churchId, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('subject: $subject, ')
          ..write('requestDetail: $requestDetail, ')
          ..write('isAnswered: $isAnswered, ')
          ..write('howAnswered: $howAnswered, ')
          ..write('dateAnswered: $dateAnswered, ')
          ..write('category: $category, ')
          ..write('priority: $priority, ')
          ..write('scriptureReference: $scriptureReference, ')
          ..write('notes: $notes, ')
          ..write('requestorId: $requestorId, ')
          ..write('requestorName: $requestorName, ')
          ..write('privacyLevel: $privacyLevel, ')
          ..write('tags: $tags, ')
          ..write('status: $status, ')
          ..write('prayerCount: $prayerCount, ')
          ..write('reminderSettings: $reminderSettings, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrayerListsTable extends PrayerLists
    with TableInfo<$PrayerListsTable, models.PrayerList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _churchIdMeta =
      const VerificationMeta('churchId');
  @override
  late final GeneratedColumn<String> churchId = GeneratedColumn<String>(
      'church_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerNameMeta =
      const VerificationMeta('ownerName');
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
      'owner_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdsMeta =
      const VerificationMeta('memberIds');
  @override
  late final GeneratedColumn<String> memberIds = GeneratedColumn<String>(
      'member_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _privacyLevelMeta =
      const VerificationMeta('privacyLevel');
  @override
  late final GeneratedColumn<String> privacyLevel = GeneratedColumn<String>(
      'privacy_level', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('private'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
      'sync_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requestCountMeta =
      const VerificationMeta('requestCount');
  @override
  late final GeneratedColumn<int> requestCount = GeneratedColumn<int>(
      'request_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        churchId,
        name,
        description,
        ownerId,
        ownerName,
        memberIds,
        privacyLevel,
        createdAt,
        lastModified,
        syncId,
        requestCount,
        color,
        icon
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_lists';
  @override
  VerificationContext validateIntegrity(Insertable<models.PrayerList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('church_id')) {
      context.handle(_churchIdMeta,
          churchId.isAcceptableOrUnknown(data['church_id']!, _churchIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('owner_name')) {
      context.handle(_ownerNameMeta,
          ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta));
    } else if (isInserting) {
      context.missing(_ownerNameMeta);
    }
    if (data.containsKey('member_ids')) {
      context.handle(_memberIdsMeta,
          memberIds.isAcceptableOrUnknown(data['member_ids']!, _memberIdsMeta));
    }
    if (data.containsKey('privacy_level')) {
      context.handle(
          _privacyLevelMeta,
          privacyLevel.isAcceptableOrUnknown(
              data['privacy_level']!, _privacyLevelMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    }
    if (data.containsKey('request_count')) {
      context.handle(
          _requestCountMeta,
          requestCount.isAcceptableOrUnknown(
              data['request_count']!, _requestCountMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  models.PrayerList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      churchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}church_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_id'])!,
      ownerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_name'])!,
      memberIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_ids'])!,
      privacyLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privacy_level'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastModified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_modified']),
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_id']),
      requestCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}request_count'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
    );
  }

  @override
  $PrayerListsTable createAlias(String alias) {
    return $PrayerListsTable(attachedDatabase, alias);
  }
}

class PrayerList extends DataClass implements Insertable<models.PrayerList> {
  final String id;
  final String? churchId;
  final String name;
  final String? description;
  final String ownerId;
  final String ownerName;
  final String memberIds;
  final String privacyLevel;
  final DateTime createdAt;
  final DateTime? lastModified;
  final String? syncId;
  final int requestCount;
  final String? color;
  final String? icon;
  const PrayerList(
      {required this.id,
      this.churchId,
      required this.name,
      this.description,
      required this.ownerId,
      required this.ownerName,
      required this.memberIds,
      required this.privacyLevel,
      required this.createdAt,
      this.lastModified,
      this.syncId,
      required this.requestCount,
      this.color,
      this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || churchId != null) {
      map['church_id'] = Variable<String>(churchId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['owner_name'] = Variable<String>(ownerName);
    map['member_ids'] = Variable<String>(memberIds);
    map['privacy_level'] = Variable<String>(privacyLevel);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastModified != null) {
      map['last_modified'] = Variable<DateTime>(lastModified);
    }
    if (!nullToAbsent || syncId != null) {
      map['sync_id'] = Variable<String>(syncId);
    }
    map['request_count'] = Variable<int>(requestCount);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  PrayerListsCompanion toCompanion(bool nullToAbsent) {
    return PrayerListsCompanion(
      id: Value(id),
      churchId: churchId == null && nullToAbsent
          ? const Value.absent()
          : Value(churchId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ownerId: Value(ownerId),
      ownerName: Value(ownerName),
      memberIds: Value(memberIds),
      privacyLevel: Value(privacyLevel),
      createdAt: Value(createdAt),
      lastModified: lastModified == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModified),
      syncId:
          syncId == null && nullToAbsent ? const Value.absent() : Value(syncId),
      requestCount: Value(requestCount),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory PrayerList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerList(
      id: serializer.fromJson<String>(json['id']),
      churchId: serializer.fromJson<String?>(json['churchId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      memberIds: serializer.fromJson<String>(json['memberIds']),
      privacyLevel: serializer.fromJson<String>(json['privacyLevel']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastModified: serializer.fromJson<DateTime?>(json['lastModified']),
      syncId: serializer.fromJson<String?>(json['syncId']),
      requestCount: serializer.fromJson<int>(json['requestCount']),
      color: serializer.fromJson<String?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'churchId': serializer.toJson<String?>(churchId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'ownerId': serializer.toJson<String>(ownerId),
      'ownerName': serializer.toJson<String>(ownerName),
      'memberIds': serializer.toJson<String>(memberIds),
      'privacyLevel': serializer.toJson<String>(privacyLevel),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastModified': serializer.toJson<DateTime?>(lastModified),
      'syncId': serializer.toJson<String?>(syncId),
      'requestCount': serializer.toJson<int>(requestCount),
      'color': serializer.toJson<String?>(color),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  PrayerList copyWith(
          {String? id,
          Value<String?> churchId = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          String? ownerId,
          String? ownerName,
          String? memberIds,
          String? privacyLevel,
          DateTime? createdAt,
          Value<DateTime?> lastModified = const Value.absent(),
          Value<String?> syncId = const Value.absent(),
          int? requestCount,
          Value<String?> color = const Value.absent(),
          Value<String?> icon = const Value.absent()}) =>
      PrayerList(
        id: id ?? this.id,
        churchId: churchId.present ? churchId.value : this.churchId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        ownerId: ownerId ?? this.ownerId,
        ownerName: ownerName ?? this.ownerName,
        memberIds: memberIds ?? this.memberIds,
        privacyLevel: privacyLevel ?? this.privacyLevel,
        createdAt: createdAt ?? this.createdAt,
        lastModified:
            lastModified.present ? lastModified.value : this.lastModified,
        syncId: syncId.present ? syncId.value : this.syncId,
        requestCount: requestCount ?? this.requestCount,
        color: color.present ? color.value : this.color,
        icon: icon.present ? icon.value : this.icon,
      );
  PrayerList copyWithCompanion(PrayerListsCompanion data) {
    return PrayerList(
      id: data.id.present ? data.id.value : this.id,
      churchId: data.churchId.present ? data.churchId.value : this.churchId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      memberIds: data.memberIds.present ? data.memberIds.value : this.memberIds,
      privacyLevel: data.privacyLevel.present
          ? data.privacyLevel.value
          : this.privacyLevel,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
      requestCount: data.requestCount.present
          ? data.requestCount.value
          : this.requestCount,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerList(')
          ..write('id: $id, ')
          ..write('churchId: $churchId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerName: $ownerName, ')
          ..write('memberIds: $memberIds, ')
          ..write('privacyLevel: $privacyLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId, ')
          ..write('requestCount: $requestCount, ')
          ..write('color: $color, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      churchId,
      name,
      description,
      ownerId,
      ownerName,
      memberIds,
      privacyLevel,
      createdAt,
      lastModified,
      syncId,
      requestCount,
      color,
      icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerList &&
          other.id == this.id &&
          other.churchId == this.churchId &&
          other.name == this.name &&
          other.description == this.description &&
          other.ownerId == this.ownerId &&
          other.ownerName == this.ownerName &&
          other.memberIds == this.memberIds &&
          other.privacyLevel == this.privacyLevel &&
          other.createdAt == this.createdAt &&
          other.lastModified == this.lastModified &&
          other.syncId == this.syncId &&
          other.requestCount == this.requestCount &&
          other.color == this.color &&
          other.icon == this.icon);
}

class PrayerListsCompanion extends UpdateCompanion<models.PrayerList> {
  final Value<String> id;
  final Value<String?> churchId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> ownerId;
  final Value<String> ownerName;
  final Value<String> memberIds;
  final Value<String> privacyLevel;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastModified;
  final Value<String?> syncId;
  final Value<int> requestCount;
  final Value<String?> color;
  final Value<String?> icon;
  final Value<int> rowid;
  const PrayerListsCompanion({
    this.id = const Value.absent(),
    this.churchId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.memberIds = const Value.absent(),
    this.privacyLevel = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.requestCount = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrayerListsCompanion.insert({
    required String id,
    this.churchId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String ownerId,
    required String ownerName,
    this.memberIds = const Value.absent(),
    this.privacyLevel = const Value.absent(),
    required DateTime createdAt,
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.requestCount = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        ownerId = Value(ownerId),
        ownerName = Value(ownerName),
        createdAt = Value(createdAt);
  static Insertable<models.PrayerList> custom({
    Expression<String>? id,
    Expression<String>? churchId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ownerId,
    Expression<String>? ownerName,
    Expression<String>? memberIds,
    Expression<String>? privacyLevel,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastModified,
    Expression<String>? syncId,
    Expression<int>? requestCount,
    Expression<String>? color,
    Expression<String>? icon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (churchId != null) 'church_id': churchId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ownerId != null) 'owner_id': ownerId,
      if (ownerName != null) 'owner_name': ownerName,
      if (memberIds != null) 'member_ids': memberIds,
      if (privacyLevel != null) 'privacy_level': privacyLevel,
      if (createdAt != null) 'created_at': createdAt,
      if (lastModified != null) 'last_modified': lastModified,
      if (syncId != null) 'sync_id': syncId,
      if (requestCount != null) 'request_count': requestCount,
      if (color != null) 'color': color,
      if (icon != null) 'icon': icon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrayerListsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? churchId,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? ownerId,
      Value<String>? ownerName,
      Value<String>? memberIds,
      Value<String>? privacyLevel,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastModified,
      Value<String?>? syncId,
      Value<int>? requestCount,
      Value<String?>? color,
      Value<String?>? icon,
      Value<int>? rowid}) {
    return PrayerListsCompanion(
      id: id ?? this.id,
      churchId: churchId ?? this.churchId,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      memberIds: memberIds ?? this.memberIds,
      privacyLevel: privacyLevel ?? this.privacyLevel,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      syncId: syncId ?? this.syncId,
      requestCount: requestCount ?? this.requestCount,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (churchId.present) {
      map['church_id'] = Variable<String>(churchId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (memberIds.present) {
      map['member_ids'] = Variable<String>(memberIds.value);
    }
    if (privacyLevel.present) {
      map['privacy_level'] = Variable<String>(privacyLevel.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (requestCount.present) {
      map['request_count'] = Variable<int>(requestCount.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerListsCompanion(')
          ..write('id: $id, ')
          ..write('churchId: $churchId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerName: $ownerName, ')
          ..write('memberIds: $memberIds, ')
          ..write('privacyLevel: $privacyLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId, ')
          ..write('requestCount: $requestCount, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChurchesTable extends Churches with TableInfo<$ChurchesTable, Churche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChurchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _adminIdsMeta =
      const VerificationMeta('adminIds');
  @override
  late final GeneratedColumn<String> adminIds = GeneratedColumn<String>(
      'admin_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _memberIdsMeta =
      const VerificationMeta('memberIds');
  @override
  late final GeneratedColumn<String> memberIds = GeneratedColumn<String>(
      'member_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
      'sync_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _logoUrlMeta =
      const VerificationMeta('logoUrl');
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
      'logo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _settingsMeta =
      const VerificationMeta('settings');
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
      'settings', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        address,
        phone,
        email,
        website,
        adminIds,
        memberIds,
        createdAt,
        lastModified,
        syncId,
        logoUrl,
        settings
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'churches';
  @override
  VerificationContext validateIntegrity(Insertable<Churche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('admin_ids')) {
      context.handle(_adminIdsMeta,
          adminIds.isAcceptableOrUnknown(data['admin_ids']!, _adminIdsMeta));
    }
    if (data.containsKey('member_ids')) {
      context.handle(_memberIdsMeta,
          memberIds.isAcceptableOrUnknown(data['member_ids']!, _memberIdsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    }
    if (data.containsKey('logo_url')) {
      context.handle(_logoUrlMeta,
          logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta));
    }
    if (data.containsKey('settings')) {
      context.handle(_settingsMeta,
          settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Churche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Churche(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      adminIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admin_ids'])!,
      memberIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_ids'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastModified: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_modified']),
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_id']),
      logoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_url']),
      settings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings']),
    );
  }

  @override
  $ChurchesTable createAlias(String alias) {
    return $ChurchesTable(attachedDatabase, alias);
  }
}

class Churche extends DataClass implements Insertable<Churche> {
  final String id;
  final String name;
  final String? description;
  final String? address;
  final String? phone;
  final String? email;
  final String? website;
  final String adminIds;
  final String memberIds;
  final DateTime createdAt;
  final DateTime? lastModified;
  final String? syncId;
  final String? logoUrl;
  final String? settings;
  const Churche(
      {required this.id,
      required this.name,
      this.description,
      this.address,
      this.phone,
      this.email,
      this.website,
      required this.adminIds,
      required this.memberIds,
      required this.createdAt,
      this.lastModified,
      this.syncId,
      this.logoUrl,
      this.settings});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    map['admin_ids'] = Variable<String>(adminIds);
    map['member_ids'] = Variable<String>(memberIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastModified != null) {
      map['last_modified'] = Variable<DateTime>(lastModified);
    }
    if (!nullToAbsent || syncId != null) {
      map['sync_id'] = Variable<String>(syncId);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || settings != null) {
      map['settings'] = Variable<String>(settings);
    }
    return map;
  }

  ChurchesCompanion toCompanion(bool nullToAbsent) {
    return ChurchesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      adminIds: Value(adminIds),
      memberIds: Value(memberIds),
      createdAt: Value(createdAt),
      lastModified: lastModified == null && nullToAbsent
          ? const Value.absent()
          : Value(lastModified),
      syncId:
          syncId == null && nullToAbsent ? const Value.absent() : Value(syncId),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      settings: settings == null && nullToAbsent
          ? const Value.absent()
          : Value(settings),
    );
  }

  factory Churche.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Churche(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      adminIds: serializer.fromJson<String>(json['adminIds']),
      memberIds: serializer.fromJson<String>(json['memberIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastModified: serializer.fromJson<DateTime?>(json['lastModified']),
      syncId: serializer.fromJson<String?>(json['syncId']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      settings: serializer.fromJson<String?>(json['settings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'adminIds': serializer.toJson<String>(adminIds),
      'memberIds': serializer.toJson<String>(memberIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastModified': serializer.toJson<DateTime?>(lastModified),
      'syncId': serializer.toJson<String?>(syncId),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'settings': serializer.toJson<String?>(settings),
    };
  }

  Churche copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> website = const Value.absent(),
          String? adminIds,
          String? memberIds,
          DateTime? createdAt,
          Value<DateTime?> lastModified = const Value.absent(),
          Value<String?> syncId = const Value.absent(),
          Value<String?> logoUrl = const Value.absent(),
          Value<String?> settings = const Value.absent()}) =>
      Churche(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        website: website.present ? website.value : this.website,
        adminIds: adminIds ?? this.adminIds,
        memberIds: memberIds ?? this.memberIds,
        createdAt: createdAt ?? this.createdAt,
        lastModified:
            lastModified.present ? lastModified.value : this.lastModified,
        syncId: syncId.present ? syncId.value : this.syncId,
        logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
        settings: settings.present ? settings.value : this.settings,
      );
  Churche copyWithCompanion(ChurchesCompanion data) {
    return Churche(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      adminIds: data.adminIds.present ? data.adminIds.value : this.adminIds,
      memberIds: data.memberIds.present ? data.memberIds.value : this.memberIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      settings: data.settings.present ? data.settings.value : this.settings,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Churche(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('adminIds: $adminIds, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('settings: $settings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      address,
      phone,
      email,
      website,
      adminIds,
      memberIds,
      createdAt,
      lastModified,
      syncId,
      logoUrl,
      settings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Churche &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.website == this.website &&
          other.adminIds == this.adminIds &&
          other.memberIds == this.memberIds &&
          other.createdAt == this.createdAt &&
          other.lastModified == this.lastModified &&
          other.syncId == this.syncId &&
          other.logoUrl == this.logoUrl &&
          other.settings == this.settings);
}

class ChurchesCompanion extends UpdateCompanion<Churche> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> website;
  final Value<String> adminIds;
  final Value<String> memberIds;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastModified;
  final Value<String?> syncId;
  final Value<String?> logoUrl;
  final Value<String?> settings;
  final Value<int> rowid;
  const ChurchesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.adminIds = const Value.absent(),
    this.memberIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.settings = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChurchesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.adminIds = const Value.absent(),
    this.memberIds = const Value.absent(),
    required DateTime createdAt,
    this.lastModified = const Value.absent(),
    this.syncId = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.settings = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<Churche> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? adminIds,
    Expression<String>? memberIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastModified,
    Expression<String>? syncId,
    Expression<String>? logoUrl,
    Expression<String>? settings,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (adminIds != null) 'admin_ids': adminIds,
      if (memberIds != null) 'member_ids': memberIds,
      if (createdAt != null) 'created_at': createdAt,
      if (lastModified != null) 'last_modified': lastModified,
      if (syncId != null) 'sync_id': syncId,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (settings != null) 'settings': settings,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChurchesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? website,
      Value<String>? adminIds,
      Value<String>? memberIds,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastModified,
      Value<String?>? syncId,
      Value<String?>? logoUrl,
      Value<String?>? settings,
      Value<int>? rowid}) {
    return ChurchesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      adminIds: adminIds ?? this.adminIds,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      syncId: syncId ?? this.syncId,
      logoUrl: logoUrl ?? this.logoUrl,
      settings: settings ?? this.settings,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (adminIds.present) {
      map['admin_ids'] = Variable<String>(adminIds.value);
    }
    if (memberIds.present) {
      map['member_ids'] = Variable<String>(memberIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChurchesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('adminIds: $adminIds, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncId: $syncId, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('settings: $settings, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoUrlMeta =
      const VerificationMeta('photoUrl');
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
      'photo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _churchIdsMeta =
      const VerificationMeta('churchIds');
  @override
  late final GeneratedColumn<String> churchIds = GeneratedColumn<String>(
      'church_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastLoginMeta =
      const VerificationMeta('lastLogin');
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
      'last_login', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _preferencesMeta =
      const VerificationMeta('preferences');
  @override
  late final GeneratedColumn<String> preferences = GeneratedColumn<String>(
      'preferences', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
      'sync_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        displayName,
        photoUrl,
        churchIds,
        createdAt,
        lastLogin,
        preferences,
        syncId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta));
    }
    if (data.containsKey('church_ids')) {
      context.handle(_churchIdsMeta,
          churchIds.isAcceptableOrUnknown(data['church_ids']!, _churchIdsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_login')) {
      context.handle(_lastLoginMeta,
          lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta));
    }
    if (data.containsKey('preferences')) {
      context.handle(
          _preferencesMeta,
          preferences.isAcceptableOrUnknown(
              data['preferences']!, _preferencesMeta));
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      photoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_url']),
      churchIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}church_ids'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login']),
      preferences: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preferences']),
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_id']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final String churchIds;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final String? preferences;
  final String? syncId;
  const User(
      {required this.id,
      required this.email,
      required this.displayName,
      this.photoUrl,
      required this.churchIds,
      required this.createdAt,
      this.lastLogin,
      this.preferences,
      this.syncId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['church_ids'] = Variable<String>(churchIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    if (!nullToAbsent || preferences != null) {
      map['preferences'] = Variable<String>(preferences);
    }
    if (!nullToAbsent || syncId != null) {
      map['sync_id'] = Variable<String>(syncId);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      displayName: Value(displayName),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      churchIds: Value(churchIds),
      createdAt: Value(createdAt),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
      preferences: preferences == null && nullToAbsent
          ? const Value.absent()
          : Value(preferences),
      syncId:
          syncId == null && nullToAbsent ? const Value.absent() : Value(syncId),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      displayName: serializer.fromJson<String>(json['displayName']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      churchIds: serializer.fromJson<String>(json['churchIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
      preferences: serializer.fromJson<String?>(json['preferences']),
      syncId: serializer.fromJson<String?>(json['syncId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'displayName': serializer.toJson<String>(displayName),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'churchIds': serializer.toJson<String>(churchIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
      'preferences': serializer.toJson<String?>(preferences),
      'syncId': serializer.toJson<String?>(syncId),
    };
  }

  User copyWith(
          {String? id,
          String? email,
          String? displayName,
          Value<String?> photoUrl = const Value.absent(),
          String? churchIds,
          DateTime? createdAt,
          Value<DateTime?> lastLogin = const Value.absent(),
          Value<String?> preferences = const Value.absent(),
          Value<String?> syncId = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
        churchIds: churchIds ?? this.churchIds,
        createdAt: createdAt ?? this.createdAt,
        lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
        preferences: preferences.present ? preferences.value : this.preferences,
        syncId: syncId.present ? syncId.value : this.syncId,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      churchIds: data.churchIds.present ? data.churchIds.value : this.churchIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
      preferences:
          data.preferences.present ? data.preferences.value : this.preferences,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('churchIds: $churchIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('preferences: $preferences, ')
          ..write('syncId: $syncId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, displayName, photoUrl, churchIds,
      createdAt, lastLogin, preferences, syncId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.photoUrl == this.photoUrl &&
          other.churchIds == this.churchIds &&
          other.createdAt == this.createdAt &&
          other.lastLogin == this.lastLogin &&
          other.preferences == this.preferences &&
          other.syncId == this.syncId);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> email;
  final Value<String> displayName;
  final Value<String?> photoUrl;
  final Value<String> churchIds;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastLogin;
  final Value<String?> preferences;
  final Value<String?> syncId;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.churchIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.preferences = const Value.absent(),
    this.syncId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String email,
    required String displayName,
    this.photoUrl = const Value.absent(),
    this.churchIds = const Value.absent(),
    required DateTime createdAt,
    this.lastLogin = const Value.absent(),
    this.preferences = const Value.absent(),
    this.syncId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        displayName = Value(displayName),
        createdAt = Value(createdAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? photoUrl,
    Expression<String>? churchIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastLogin,
    Expression<String>? preferences,
    Expression<String>? syncId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (churchIds != null) 'church_ids': churchIds,
      if (createdAt != null) 'created_at': createdAt,
      if (lastLogin != null) 'last_login': lastLogin,
      if (preferences != null) 'preferences': preferences,
      if (syncId != null) 'sync_id': syncId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? email,
      Value<String>? displayName,
      Value<String?>? photoUrl,
      Value<String>? churchIds,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastLogin,
      Value<String?>? preferences,
      Value<String?>? syncId,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      churchIds: churchIds ?? this.churchIds,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      preferences: preferences ?? this.preferences,
      syncId: syncId ?? this.syncId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (churchIds.present) {
      map['church_ids'] = Variable<String>(churchIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (preferences.present) {
      map['preferences'] = Variable<String>(preferences.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('churchIds: $churchIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('preferences: $preferences, ')
          ..write('syncId: $syncId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PrayerRequestsTable prayerRequests = $PrayerRequestsTable(this);
  late final $PrayerListsTable prayerLists = $PrayerListsTable(this);
  late final $ChurchesTable churches = $ChurchesTable(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [prayerRequests, prayerLists, churches, users];
}

typedef $$PrayerRequestsTableCreateCompanionBuilder = PrayerRequestsCompanion
    Function({
  required String id,
  Value<String?> listId,
  Value<String?> churchId,
  required DateTime dateAdded,
  required String subject,
  required String requestDetail,
  Value<bool> isAnswered,
  Value<String?> howAnswered,
  Value<DateTime?> dateAnswered,
  required String category,
  required String priority,
  Value<String?> scriptureReference,
  Value<String> notes,
  required String requestorId,
  required String requestorName,
  Value<String> privacyLevel,
  Value<String> tags,
  Value<String> status,
  Value<int> prayerCount,
  Value<String?> reminderSettings,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<int> rowid,
});
typedef $$PrayerRequestsTableUpdateCompanionBuilder = PrayerRequestsCompanion
    Function({
  Value<String> id,
  Value<String?> listId,
  Value<String?> churchId,
  Value<DateTime> dateAdded,
  Value<String> subject,
  Value<String> requestDetail,
  Value<bool> isAnswered,
  Value<String?> howAnswered,
  Value<DateTime?> dateAnswered,
  Value<String> category,
  Value<String> priority,
  Value<String?> scriptureReference,
  Value<String> notes,
  Value<String> requestorId,
  Value<String> requestorName,
  Value<String> privacyLevel,
  Value<String> tags,
  Value<String> status,
  Value<int> prayerCount,
  Value<String?> reminderSettings,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<int> rowid,
});

class $$PrayerRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerRequestsTable> {
  $$PrayerRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get listId => $composableBuilder(
      column: $table.listId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get churchId => $composableBuilder(
      column: $table.churchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestDetail => $composableBuilder(
      column: $table.requestDetail, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAnswered => $composableBuilder(
      column: $table.isAnswered, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get howAnswered => $composableBuilder(
      column: $table.howAnswered, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateAnswered => $composableBuilder(
      column: $table.dateAnswered, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scriptureReference => $composableBuilder(
      column: $table.scriptureReference,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestorId => $composableBuilder(
      column: $table.requestorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestorName => $composableBuilder(
      column: $table.requestorName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get prayerCount => $composableBuilder(
      column: $table.prayerCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reminderSettings => $composableBuilder(
      column: $table.reminderSettings,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnFilters(column));
}

class $$PrayerRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerRequestsTable> {
  $$PrayerRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get listId => $composableBuilder(
      column: $table.listId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get churchId => $composableBuilder(
      column: $table.churchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestDetail => $composableBuilder(
      column: $table.requestDetail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAnswered => $composableBuilder(
      column: $table.isAnswered, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get howAnswered => $composableBuilder(
      column: $table.howAnswered, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateAnswered => $composableBuilder(
      column: $table.dateAnswered,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scriptureReference => $composableBuilder(
      column: $table.scriptureReference,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestorId => $composableBuilder(
      column: $table.requestorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestorName => $composableBuilder(
      column: $table.requestorName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get prayerCount => $composableBuilder(
      column: $table.prayerCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminderSettings => $composableBuilder(
      column: $table.reminderSettings,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnOrderings(column));
}

class $$PrayerRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerRequestsTable> {
  $$PrayerRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get listId =>
      $composableBuilder(column: $table.listId, builder: (column) => column);

  GeneratedColumn<String> get churchId =>
      $composableBuilder(column: $table.churchId, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get requestDetail => $composableBuilder(
      column: $table.requestDetail, builder: (column) => column);

  GeneratedColumn<bool> get isAnswered => $composableBuilder(
      column: $table.isAnswered, builder: (column) => column);

  GeneratedColumn<String> get howAnswered => $composableBuilder(
      column: $table.howAnswered, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAnswered => $composableBuilder(
      column: $table.dateAnswered, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get scriptureReference => $composableBuilder(
      column: $table.scriptureReference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get requestorId => $composableBuilder(
      column: $table.requestorId, builder: (column) => column);

  GeneratedColumn<String> get requestorName => $composableBuilder(
      column: $table.requestorName, builder: (column) => column);

  GeneratedColumn<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get prayerCount => $composableBuilder(
      column: $table.prayerCount, builder: (column) => column);

  GeneratedColumn<String> get reminderSettings => $composableBuilder(
      column: $table.reminderSettings, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);
}

class $$PrayerRequestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrayerRequestsTable,
    PrayerRequest,
    $$PrayerRequestsTableFilterComposer,
    $$PrayerRequestsTableOrderingComposer,
    $$PrayerRequestsTableAnnotationComposer,
    $$PrayerRequestsTableCreateCompanionBuilder,
    $$PrayerRequestsTableUpdateCompanionBuilder,
    (
      PrayerRequest,
      BaseReferences<_$AppDatabase, $PrayerRequestsTable, PrayerRequest>
    ),
    PrayerRequest,
    PrefetchHooks Function()> {
  $$PrayerRequestsTableTableManager(
      _$AppDatabase db, $PrayerRequestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerRequestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerRequestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> listId = const Value.absent(),
            Value<String?> churchId = const Value.absent(),
            Value<DateTime> dateAdded = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String> requestDetail = const Value.absent(),
            Value<bool> isAnswered = const Value.absent(),
            Value<String?> howAnswered = const Value.absent(),
            Value<DateTime?> dateAnswered = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String?> scriptureReference = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<String> requestorId = const Value.absent(),
            Value<String> requestorName = const Value.absent(),
            Value<String> privacyLevel = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> prayerCount = const Value.absent(),
            Value<String?> reminderSettings = const Value.absent(),
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrayerRequestsCompanion(
            id: id,
            listId: listId,
            churchId: churchId,
            dateAdded: dateAdded,
            subject: subject,
            requestDetail: requestDetail,
            isAnswered: isAnswered,
            howAnswered: howAnswered,
            dateAnswered: dateAnswered,
            category: category,
            priority: priority,
            scriptureReference: scriptureReference,
            notes: notes,
            requestorId: requestorId,
            requestorName: requestorName,
            privacyLevel: privacyLevel,
            tags: tags,
            status: status,
            prayerCount: prayerCount,
            reminderSettings: reminderSettings,
            lastModified: lastModified,
            syncId: syncId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> listId = const Value.absent(),
            Value<String?> churchId = const Value.absent(),
            required DateTime dateAdded,
            required String subject,
            required String requestDetail,
            Value<bool> isAnswered = const Value.absent(),
            Value<String?> howAnswered = const Value.absent(),
            Value<DateTime?> dateAnswered = const Value.absent(),
            required String category,
            required String priority,
            Value<String?> scriptureReference = const Value.absent(),
            Value<String> notes = const Value.absent(),
            required String requestorId,
            required String requestorName,
            Value<String> privacyLevel = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> prayerCount = const Value.absent(),
            Value<String?> reminderSettings = const Value.absent(),
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrayerRequestsCompanion.insert(
            id: id,
            listId: listId,
            churchId: churchId,
            dateAdded: dateAdded,
            subject: subject,
            requestDetail: requestDetail,
            isAnswered: isAnswered,
            howAnswered: howAnswered,
            dateAnswered: dateAnswered,
            category: category,
            priority: priority,
            scriptureReference: scriptureReference,
            notes: notes,
            requestorId: requestorId,
            requestorName: requestorName,
            privacyLevel: privacyLevel,
            tags: tags,
            status: status,
            prayerCount: prayerCount,
            reminderSettings: reminderSettings,
            lastModified: lastModified,
            syncId: syncId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PrayerRequestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PrayerRequestsTable,
    PrayerRequest,
    $$PrayerRequestsTableFilterComposer,
    $$PrayerRequestsTableOrderingComposer,
    $$PrayerRequestsTableAnnotationComposer,
    $$PrayerRequestsTableCreateCompanionBuilder,
    $$PrayerRequestsTableUpdateCompanionBuilder,
    (
      PrayerRequest,
      BaseReferences<_$AppDatabase, $PrayerRequestsTable, PrayerRequest>
    ),
    PrayerRequest,
    PrefetchHooks Function()>;
typedef $$PrayerListsTableCreateCompanionBuilder = PrayerListsCompanion
    Function({
  required String id,
  Value<String?> churchId,
  required String name,
  Value<String?> description,
  required String ownerId,
  required String ownerName,
  Value<String> memberIds,
  Value<String> privacyLevel,
  required DateTime createdAt,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<int> requestCount,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});
typedef $$PrayerListsTableUpdateCompanionBuilder = PrayerListsCompanion
    Function({
  Value<String> id,
  Value<String?> churchId,
  Value<String> name,
  Value<String?> description,
  Value<String> ownerId,
  Value<String> ownerName,
  Value<String> memberIds,
  Value<String> privacyLevel,
  Value<DateTime> createdAt,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<int> requestCount,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});

class $$PrayerListsTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerListsTable> {
  $$PrayerListsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get churchId => $composableBuilder(
      column: $table.churchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ownerName => $composableBuilder(
      column: $table.ownerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get requestCount => $composableBuilder(
      column: $table.requestCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));
}

class $$PrayerListsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerListsTable> {
  $$PrayerListsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get churchId => $composableBuilder(
      column: $table.churchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ownerName => $composableBuilder(
      column: $table.ownerName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get requestCount => $composableBuilder(
      column: $table.requestCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));
}

class $$PrayerListsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerListsTable> {
  $$PrayerListsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get churchId =>
      $composableBuilder(column: $table.churchId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<String> get memberIds =>
      $composableBuilder(column: $table.memberIds, builder: (column) => column);

  GeneratedColumn<String> get privacyLevel => $composableBuilder(
      column: $table.privacyLevel, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);

  GeneratedColumn<int> get requestCount => $composableBuilder(
      column: $table.requestCount, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$PrayerListsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrayerListsTable,
    models.PrayerList,
    $$PrayerListsTableFilterComposer,
    $$PrayerListsTableOrderingComposer,
    $$PrayerListsTableAnnotationComposer,
    $$PrayerListsTableCreateCompanionBuilder,
    $$PrayerListsTableUpdateCompanionBuilder,
    (
      models.PrayerList,
      BaseReferences<_$AppDatabase, $PrayerListsTable, models.PrayerList>
    ),
    models.PrayerList,
    PrefetchHooks Function()> {
  $$PrayerListsTableTableManager(_$AppDatabase db, $PrayerListsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerListsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerListsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerListsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> churchId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> ownerId = const Value.absent(),
            Value<String> ownerName = const Value.absent(),
            Value<String> memberIds = const Value.absent(),
            Value<String> privacyLevel = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> requestCount = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrayerListsCompanion(
            id: id,
            churchId: churchId,
            name: name,
            description: description,
            ownerId: ownerId,
            ownerName: ownerName,
            memberIds: memberIds,
            privacyLevel: privacyLevel,
            createdAt: createdAt,
            lastModified: lastModified,
            syncId: syncId,
            requestCount: requestCount,
            color: color,
            icon: icon,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> churchId = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required String ownerId,
            required String ownerName,
            Value<String> memberIds = const Value.absent(),
            Value<String> privacyLevel = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> requestCount = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrayerListsCompanion.insert(
            id: id,
            churchId: churchId,
            name: name,
            description: description,
            ownerId: ownerId,
            ownerName: ownerName,
            memberIds: memberIds,
            privacyLevel: privacyLevel,
            createdAt: createdAt,
            lastModified: lastModified,
            syncId: syncId,
            requestCount: requestCount,
            color: color,
            icon: icon,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PrayerListsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PrayerListsTable,
    models.PrayerList,
    $$PrayerListsTableFilterComposer,
    $$PrayerListsTableOrderingComposer,
    $$PrayerListsTableAnnotationComposer,
    $$PrayerListsTableCreateCompanionBuilder,
    $$PrayerListsTableUpdateCompanionBuilder,
    (
      models.PrayerList,
      BaseReferences<_$AppDatabase, $PrayerListsTable, models.PrayerList>
    ),
    models.PrayerList,
    PrefetchHooks Function()>;
typedef $$ChurchesTableCreateCompanionBuilder = ChurchesCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> website,
  Value<String> adminIds,
  Value<String> memberIds,
  required DateTime createdAt,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<String?> logoUrl,
  Value<String?> settings,
  Value<int> rowid,
});
typedef $$ChurchesTableUpdateCompanionBuilder = ChurchesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> website,
  Value<String> adminIds,
  Value<String> memberIds,
  Value<DateTime> createdAt,
  Value<DateTime?> lastModified,
  Value<String?> syncId,
  Value<String?> logoUrl,
  Value<String?> settings,
  Value<int> rowid,
});

class $$ChurchesTableFilterComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get adminIds => $composableBuilder(
      column: $table.adminIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnFilters(column));
}

class $$ChurchesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get adminIds => $composableBuilder(
      column: $table.adminIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnOrderings(column));
}

class $$ChurchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get adminIds =>
      $composableBuilder(column: $table.adminIds, builder: (column) => column);

  GeneratedColumn<String> get memberIds =>
      $composableBuilder(column: $table.memberIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);
}

class $$ChurchesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChurchesTable,
    Churche,
    $$ChurchesTableFilterComposer,
    $$ChurchesTableOrderingComposer,
    $$ChurchesTableAnnotationComposer,
    $$ChurchesTableCreateCompanionBuilder,
    $$ChurchesTableUpdateCompanionBuilder,
    (Churche, BaseReferences<_$AppDatabase, $ChurchesTable, Churche>),
    Churche,
    PrefetchHooks Function()> {
  $$ChurchesTableTableManager(_$AppDatabase db, $ChurchesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChurchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChurchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChurchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String> adminIds = const Value.absent(),
            Value<String> memberIds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> settings = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChurchesCompanion(
            id: id,
            name: name,
            description: description,
            address: address,
            phone: phone,
            email: email,
            website: website,
            adminIds: adminIds,
            memberIds: memberIds,
            createdAt: createdAt,
            lastModified: lastModified,
            syncId: syncId,
            logoUrl: logoUrl,
            settings: settings,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String> adminIds = const Value.absent(),
            Value<String> memberIds = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> lastModified = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> settings = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChurchesCompanion.insert(
            id: id,
            name: name,
            description: description,
            address: address,
            phone: phone,
            email: email,
            website: website,
            adminIds: adminIds,
            memberIds: memberIds,
            createdAt: createdAt,
            lastModified: lastModified,
            syncId: syncId,
            logoUrl: logoUrl,
            settings: settings,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChurchesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChurchesTable,
    Churche,
    $$ChurchesTableFilterComposer,
    $$ChurchesTableOrderingComposer,
    $$ChurchesTableAnnotationComposer,
    $$ChurchesTableCreateCompanionBuilder,
    $$ChurchesTableUpdateCompanionBuilder,
    (Churche, BaseReferences<_$AppDatabase, $ChurchesTable, Churche>),
    Churche,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String email,
  required String displayName,
  Value<String?> photoUrl,
  Value<String> churchIds,
  required DateTime createdAt,
  Value<DateTime?> lastLogin,
  Value<String?> preferences,
  Value<String?> syncId,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<String> displayName,
  Value<String?> photoUrl,
  Value<String> churchIds,
  Value<DateTime> createdAt,
  Value<DateTime?> lastLogin,
  Value<String?> preferences,
  Value<String?> syncId,
  Value<int> rowid,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get churchIds => $composableBuilder(
      column: $table.churchIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get churchIds => $composableBuilder(
      column: $table.churchIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get churchIds =>
      $composableBuilder(column: $table.churchIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);

  GeneratedColumn<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String?> photoUrl = const Value.absent(),
            Value<String> churchIds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<String?> preferences = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            churchIds: churchIds,
            createdAt: createdAt,
            lastLogin: lastLogin,
            preferences: preferences,
            syncId: syncId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String email,
            required String displayName,
            Value<String?> photoUrl = const Value.absent(),
            Value<String> churchIds = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<String?> preferences = const Value.absent(),
            Value<String?> syncId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            churchIds: churchIds,
            createdAt: createdAt,
            lastLogin: lastLogin,
            preferences: preferences,
            syncId: syncId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PrayerRequestsTableTableManager get prayerRequests =>
      $$PrayerRequestsTableTableManager(_db, _db.prayerRequests);
  $$PrayerListsTableTableManager get prayerLists =>
      $$PrayerListsTableTableManager(_db, _db.prayerLists);
  $$ChurchesTableTableManager get churches =>
      $$ChurchesTableTableManager(_db, _db.churches);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
