// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBodyLoginDTO _$UserBodyLoginDTOFromJson(Map<String, dynamic> json) =>
    UserBodyLoginDTO(
      email: json['email'] as String,
      password: json['password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserBodyLoginDTOToJson(UserBodyLoginDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      if (instance.password case final value?) 'password': value,
      if (instance.token case final value?) 'token': value,
    };
