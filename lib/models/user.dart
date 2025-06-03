import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: true)
class User {
  @JsonKey(fromJson: _idFromJson)
  final String id;
  final String email;
  final String displayName;
  @JsonKey(name: 'profileImageUrl')
  final String? photoUrl;
  @JsonKey(name: 'churchId', fromJson: _churchIdsFromJson)
  final List<String> churchIds;
  final DateTime createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? lastLogin;
  final Map<String, dynamic>? preferences;
  final String? syncId;
  
  // Custom JSON converters
  static String _idFromJson(dynamic id) => id.toString();
  
  static List<String> _churchIdsFromJson(dynamic churchId) {
    if (churchId == null) return [];
    return [churchId.toString()];
  }

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

  factory User.fromJson(Map<String, dynamic> json) {
    // Create a mutable copy of the json map
    final Map<String, dynamic> processedJson = Map<String, dynamic>.from(json);
    
    // Handle backend response format
    if (!processedJson.containsKey('displayName')) {
      final firstName = processedJson['firstName'] ?? '';
      final lastName = processedJson['lastName'] ?? '';
      processedJson['displayName'] = '$firstName $lastName'.trim();
    }
    
    // Ensure required fields have defaults
    if (!processedJson.containsKey('preferences')) {
      processedJson['preferences'] = {};
    }
    
    return _$UserFromJson(processedJson);
  }

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