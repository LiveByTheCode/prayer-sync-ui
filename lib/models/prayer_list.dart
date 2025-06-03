import 'package:json_annotation/json_annotation.dart';
import 'prayer_request.dart';

part 'prayer_list.g.dart';

@JsonSerializable()
class PrayerList {
  final String id;
  final String? churchId;
  final String name;
  final String? description;
  final String ownerId;
  final String ownerName;
  final List<String> memberIds;
  final PrivacyLevel privacyLevel;
  final DateTime createdAt;
  final DateTime? lastModified;
  final String? syncId;
  final int requestCount;
  final String? color;
  final String? icon;

  PrayerList({
    required this.id,
    this.churchId,
    required this.name,
    this.description,
    required this.ownerId,
    required this.ownerName,
    this.memberIds = const [],
    this.privacyLevel = PrivacyLevel.private,
    required this.createdAt,
    this.lastModified,
    this.syncId,
    this.requestCount = 0,
    this.color,
    this.icon,
  });

  factory PrayerList.fromJson(Map<String, dynamic> json) =>
      _$PrayerListFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerListToJson(this);

  PrayerList copyWith({
    String? id,
    String? churchId,
    String? name,
    String? description,
    String? ownerId,
    String? ownerName,
    List<String>? memberIds,
    PrivacyLevel? privacyLevel,
    DateTime? createdAt,
    DateTime? lastModified,
    String? syncId,
    int? requestCount,
    String? color,
    String? icon,
  }) {
    return PrayerList(
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
    );
  }
}