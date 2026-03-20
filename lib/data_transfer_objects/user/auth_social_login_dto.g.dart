// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_social_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSocialLoginDTO _$AuthSocialLoginDTOFromJson(Map<String, dynamic> json) =>
    AuthSocialLoginDTO(
      provider: json['provider'] as String,
      accessToken: json['access_provider_token'] as String,
    );

Map<String, dynamic> _$AuthSocialLoginDTOToJson(AuthSocialLoginDTO instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'access_provider_token': instance.accessToken,
    };
