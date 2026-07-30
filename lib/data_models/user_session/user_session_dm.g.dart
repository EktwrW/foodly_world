// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSessionDM _$UserSessionDMFromJson(Map<String, dynamic> json) =>
    _UserSessionDM(
      user: UserDM.fromJson(json['user'] as Map<String, dynamic>),
      welcomeMessage: json['message'] as String?,
      tokedCreatedAt: json['token_created_at'] as String?,
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      refreshToken: json['refresh_token'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserSessionDMToJson(_UserSessionDM instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      if (instance.welcomeMessage case final value?) 'message': value,
      if (instance.tokedCreatedAt case final value?) 'token_created_at': value,
      if (instance.token case final value?) 'token': value,
      if (instance.tokenType case final value?) 'token_type': value,
      if (instance.refreshToken case final value?) 'refresh_token': value,
      if (instance.accessToken case final value?) 'access_token': value,
    };
