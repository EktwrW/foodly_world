// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDMImpl _$$UserDMImplFromJson(Map<String, dynamic> json) => _$UserDMImpl(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['photo'] as String? ?? FoodlyStrings.USER_AVATAR_PLACEHOLDER,
      phone: json['phone'] as String?,
      signUpDate: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lastUpdated: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
      roleId: $enumDecodeNullable(_$UserRoleEnumMap, json['role_id']) ??
          UserRole.visitor,
      userRole: json['user_role'] as String?,
      termsAndConditions: json['terms_and_conditions'] as bool? ?? false,
      business: (json['business'] as List<dynamic>?)
              ?.map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userPrefs: json['user-prefs'] == null
          ? null
          : UserPrefsDM.fromJson(json['user-prefs'] as Map<String, dynamic>),
      socialProvider: (json['social_provider'] as List<dynamic>?)
          ?.map((e) => LoginProviderDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      provider: json['provider'] as String?,
      providerId: json['provider_id'] as String?,
      providerAvatar: json['provider_avatar'] as String?,
      hasPassword: json['has_password'] as bool?,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => AddressDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      favoriteBusiness: (json['favorite_businesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteMenus: (json['favorite_menus'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteItems: (json['favorite_items'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteCombos: (json['favorite_combos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      savedPromotions: (json['saved_promotions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followersLength: (json['followers_length'] as num?)?.toInt() ?? 0,
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followingLength: (json['following_length'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserDMImplToJson(_$UserDMImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.uuid case final value?) 'uuid': value,
      if (instance.email case final value?) 'email': value,
      if (instance.username case final value?) 'username': value,
      if (instance.firstName case final value?) 'name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.avatar case final value?) 'photo': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.signUpDate?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.lastUpdated?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.deletedAt?.toIso8601String() case final value?)
        'deleted_at': value,
      if (instance.dateOfBirth?.toIso8601String() case final value?)
        'date_of_birth': value,
      if (_$UserGenderEnumMap[instance.gender] case final value?)
        'gender': value,
      if (_$UserRoleEnumMap[instance.roleId] case final value?)
        'role_id': value,
      if (instance.userRole case final value?) 'user_role': value,
      'terms_and_conditions': instance.termsAndConditions,
      'business': instance.business.map((e) => e.toJson()).toList(),
      if (instance.userPrefs?.toJson() case final value?) 'user-prefs': value,
      if (instance.socialProvider?.map((e) => e.toJson()).toList()
          case final value?)
        'social_provider': value,
      if (instance.emailVerifiedAt?.toIso8601String() case final value?)
        'email_verified_at': value,
      if (instance.provider case final value?) 'provider': value,
      if (instance.providerId case final value?) 'provider_id': value,
      if (instance.providerAvatar case final value?) 'provider_avatar': value,
      if (instance.hasPassword case final value?) 'has_password': value,
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'favorite_businesses': instance.favoriteBusiness,
      'favorite_menus': instance.favoriteMenus,
      'favorite_items': instance.favoriteItems,
      'favorite_combos': instance.favoriteCombos,
      'saved_promotions': instance.savedPromotions,
      'followers': instance.followers,
      'followers_length': instance.followersLength,
      'following': instance.following,
      'following_length': instance.followingLength,
    };

const _$UserGenderEnumMap = {
  UserGender.male: 'male',
  UserGender.female: 'female',
  UserGender.other: 'other',
  UserGender.preferNotToSay: 'prefer_not_to_say',
};

const _$UserRoleEnumMap = {
  UserRole.visitor: null,
  UserRole.superAdmin: 1,
  UserRole.owner: 2,
  UserRole.admin: 3,
  UserRole.customer: 4,
};

_$AddressLabelDMImpl _$$AddressLabelDMImplFromJson(Map<String, dynamic> json) =>
    _$AddressLabelDMImpl(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$$AddressLabelDMImplToJson(
        _$AddressLabelDMImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.uuid case final value?) 'uuid': value,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.icon case final value?) 'icon': value,
      'is_active': instance.isActive,
    };

_$AddressDMImpl _$$AddressDMImplFromJson(Map<String, dynamic> json) =>
    _$AddressDMImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      country:
          const FoodlyCountriesConverter().fromJson(json['country'] as String?),
      zipCode: json['zip_code'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      addressLabel:
          AddressLabelDM.fromJson(json['label'] as Map<String, dynamic>),
      principal: json['principal'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AddressDMImplToJson(_$AddressDMImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'address': instance.address,
      'city': instance.city,
      if (const FoodlyCountriesConverter().toJson(instance.country)
          case final value?)
        'country': value,
      'zip_code': instance.zipCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'label': instance.addressLabel.toJson(),
      'principal': instance.principal,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$LoginProviderDMImpl _$$LoginProviderDMImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginProviderDMImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      provider: json['provider'] as String,
      providerId: json['provider_id'] as String,
      providerAvatar: json['provider_avatar'] as String,
      userId: (json['user_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LoginProviderDMImplToJson(
        _$LoginProviderDMImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'provider': instance.provider,
      'provider_id': instance.providerId,
      'provider_avatar': instance.providerAvatar,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
