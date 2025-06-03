// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerList _$PrayerListFromJson(Map<String, dynamic> json) => PrayerList(
      id: json['id'] as String,
      churchId: json['churchId'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String,
      memberIds: (json['memberIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      privacyLevel:
          $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacyLevel']) ??
              PrivacyLevel.private,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      syncId: json['syncId'] as String?,
      requestCount: (json['requestCount'] as num?)?.toInt() ?? 0,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$PrayerListToJson(PrayerList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'memberIds': instance.memberIds,
      'privacyLevel': _$PrivacyLevelEnumMap[instance.privacyLevel]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModified': instance.lastModified?.toIso8601String(),
      'syncId': instance.syncId,
      'requestCount': instance.requestCount,
      'color': instance.color,
      'icon': instance.icon,
    };

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.private: 'private',
  PrivacyLevel.church: 'church',
  PrivacyLevel.public: 'public',
};
