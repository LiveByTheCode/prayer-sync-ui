import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final List<String> churchIds;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final Map<String, dynamic>? preferences;
  final String? syncId;

  User({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.churchIds = const [],
    required this.createdAt,
    this.lastLogin,
    this.preferences,
    this.syncId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    List<String>? churchIds,
    DateTime? createdAt,
    DateTime? lastLogin,
    Map<String, dynamic>? preferences,
    String? syncId,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      churchIds: churchIds ?? this.churchIds,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      preferences: preferences ?? this.preferences,
      syncId: syncId ?? this.syncId,
    );
  }
}