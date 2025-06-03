import 'package:json_annotation/json_annotation.dart';

part 'church.g.dart';

@JsonSerializable()
class Church {
  final String id;
  final String name;
  final String? description;
  final String? address;
  final String? phone;
  final String? email;
  final String? website;
  final List<String> adminIds;
  final List<String> memberIds;
  final DateTime createdAt;
  final DateTime? lastModified;
  final String? syncId;
  final String? logoUrl;
  final Map<String, dynamic>? settings;

  Church({
    required this.id,
    required this.name,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.adminIds = const [],
    this.memberIds = const [],
    required this.createdAt,
    this.lastModified,
    this.syncId,
    this.logoUrl,
    this.settings,
  });

  factory Church.fromJson(Map<String, dynamic> json) =>
      _$ChurchFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchToJson(this);

  Church copyWith({
    String? id,
    String? name,
    String? description,
    String? address,
    String? phone,
    String? email,
    String? website,
    List<String>? adminIds,
    List<String>? memberIds,
    DateTime? createdAt,
    DateTime? lastModified,
    String? syncId,
    String? logoUrl,
    Map<String, dynamic>? settings,
  }) {
    return Church(
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
    );
  }
}