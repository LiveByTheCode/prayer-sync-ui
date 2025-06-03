import 'package:json_annotation/json_annotation.dart';
import 'package:prayer_sync/models/user.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String token;
  @JsonKey(name: 'tokenType', defaultValue: 'Bearer')
  final String type;
  final User user;

  AuthResponse({
    required this.token,
    required this.type,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class SignupRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignupRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}