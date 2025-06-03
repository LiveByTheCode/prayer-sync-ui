// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerRequest _$PrayerRequestFromJson(Map<String, dynamic> json) =>
    PrayerRequest(
      id: json['id'] as String,
      listId: json['listId'] as String?,
      churchId: json['churchId'] as String?,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      subject: json['subject'] as String,
      requestDetail: json['requestDetail'] as String,
      isAnswered: json['isAnswered'] as bool? ?? false,
      howAnswered: json['howAnswered'] as String?,
      dateAnswered: json['dateAnswered'] == null
          ? null
          : DateTime.parse(json['dateAnswered'] as String),
      category: $enumDecode(_$RequestCategoryEnumMap, json['category']),
      priority: $enumDecode(_$RequestPriorityEnumMap, json['priority']),
      scriptureReference: json['scriptureReference'] as String?,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      requestorId: json['requestorId'] as String,
      requestorName: json['requestorName'] as String,
      privacyLevel:
          $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacyLevel']) ??
              PrivacyLevel.private,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']) ??
          RequestStatus.active,
      prayerCount: (json['prayerCount'] as num?)?.toInt() ?? 0,
      reminderSettings: json['reminderSettings'] == null
          ? null
          : ReminderSettings.fromJson(
              json['reminderSettings'] as Map<String, dynamic>),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      syncId: json['syncId'] as String?,
    );

Map<String, dynamic> _$PrayerRequestToJson(PrayerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listId': instance.listId,
      'churchId': instance.churchId,
      'dateAdded': instance.dateAdded.toIso8601String(),
      'subject': instance.subject,
      'requestDetail': instance.requestDetail,
      'isAnswered': instance.isAnswered,
      'howAnswered': instance.howAnswered,
      'dateAnswered': instance.dateAnswered?.toIso8601String(),
      'category': _$RequestCategoryEnumMap[instance.category]!,
      'priority': _$RequestPriorityEnumMap[instance.priority]!,
      'scriptureReference': instance.scriptureReference,
      'notes': instance.notes,
      'requestorId': instance.requestorId,
      'requestorName': instance.requestorName,
      'privacyLevel': _$PrivacyLevelEnumMap[instance.privacyLevel]!,
      'tags': instance.tags,
      'status': _$RequestStatusEnumMap[instance.status]!,
      'prayerCount': instance.prayerCount,
      'reminderSettings': instance.reminderSettings,
      'lastModified': instance.lastModified?.toIso8601String(),
      'syncId': instance.syncId,
    };

const _$RequestCategoryEnumMap = {
  RequestCategory.health: 'health',
  RequestCategory.family: 'family',
  RequestCategory.work: 'work',
  RequestCategory.spiritualGrowth: 'spiritualGrowth',
  RequestCategory.relationships: 'relationships',
  RequestCategory.finances: 'finances',
  RequestCategory.ministry: 'ministry',
  RequestCategory.other: 'other',
};

const _$RequestPriorityEnumMap = {
  RequestPriority.high: 'high',
  RequestPriority.medium: 'medium',
  RequestPriority.low: 'low',
};

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.church: 'church',
  PrivacyLevel.public: 'public',
};

const _$RequestStatusEnumMap = {
  RequestStatus.active: 'active',
  RequestStatus.answered: 'answered',
  RequestStatus.noLongerNeeded: 'noLongerNeeded',
  RequestStatus.ongoing: 'ongoing',
};

ReminderSettings _$ReminderSettingsFromJson(Map<String, dynamic> json) =>
    ReminderSettings(
      enabled: json['enabled'] as bool,
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      time: json['time'] as String,
      frequency: (json['frequency'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReminderSettingsToJson(ReminderSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'daysOfWeek': instance.daysOfWeek,
      'time': instance.time,
      'frequency': instance.frequency,
    };
