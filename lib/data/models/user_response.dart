// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<User>? data,
    Support? support,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class SingleUserResponse with _$SingleUserResponse {
  const factory SingleUserResponse({
    User? data,
    Support? support,
  }) = _SingleUserResponse;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleUserResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Support with _$Support {
  const factory Support({
    String? url,
    String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
}
