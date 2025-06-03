// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: User._idFromJson(json['id']),
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['profileImageUrl'] as String?,
      churchIds: json['churchId'] == null
          ? const []
          : User._churchIdsFromJson(json['churchId']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLogin: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      preferences: json['preferences'] as Map<String, dynamic>?,
      syncId: json['syncId'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'profileImageUrl': instance.photoUrl,
      'churchId': instance.churchIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.lastLogin?.toIso8601String(),
      'preferences': instance.preferences,
      'syncId': instance.syncId,
    };
