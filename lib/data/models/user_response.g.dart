// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      total: json['total'] as int?,
      totalPages: json['totalPages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
    };

_$_SingleUserResponse _$$_SingleUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SingleUserResponse(
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SingleUserResponseToJson(
        _$_SingleUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'support': instance.support,
    };

_$_CreateUserResponse _$$_CreateUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CreateUserResponse(
      name: json['name'] as String?,
      job: json['job'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CreateUserResponseToJson(
        _$_CreateUserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };

_$_Support _$$_SupportFromJson(Map<String, dynamic> json) => _$_Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_SupportToJson(_$_Support instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
