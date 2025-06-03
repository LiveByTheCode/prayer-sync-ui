// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Church _$ChurchFromJson(Map<String, dynamic> json) => Church(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      adminIds: (json['adminIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      memberIds: (json['memberIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
      syncId: json['syncId'] as String?,
      logoUrl: json['logoUrl'] as String?,
      settings: json['settings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ChurchToJson(Church instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'adminIds': instance.adminIds,
      'memberIds': instance.memberIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModified': instance.lastModified?.toIso8601String(),
      'syncId': instance.syncId,
      'logoUrl': instance.logoUrl,
      'settings': instance.settings,
    };
