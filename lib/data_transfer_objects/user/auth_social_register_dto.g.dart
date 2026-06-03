// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_social_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSocialRegisterDTO _$AuthSocialRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    AuthSocialRegisterDTO(
      name: json['name'] as String,
      lastName: json['last_name'] as String?,
      email: json['email'] as String,
      provider: json['provider'] as String,
      providerId: json['provider_id'] as String,
      providerAvatar: json['provider_avatar'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      roleId: (json['role_id'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$AuthSocialRegisterDTOToJson(
        AuthSocialRegisterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.lastName case final value?) 'last_name': value,
      'email': instance.email,
      'provider': instance.provider,
      'provider_id': instance.providerId,
      if (instance.providerAvatar case final value?) 'provider_avatar': value,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      'role_id': instance.roleId,
    };
