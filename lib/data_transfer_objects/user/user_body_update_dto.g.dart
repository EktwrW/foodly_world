// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBodyUpdateDTO _$UserBodyUpdateDTOFromJson(Map<String, dynamic> json) =>
    _UserBodyUpdateDTO(
      userName: json['username'] as String?,
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      password: json['current_password'] as String?,
      newPassword: json['new_password'] as String?,
      phone: json['phone'] as String?,
      phoneCountryCode: json['phone_country_code'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      zipCode: json['zip_code'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: $enumDecodeNullable(_$FoodlyCountriesEnumMap, json['country']),
      gender: json['gender'] as String?,
      roleId: $enumDecodeNullable(_$UserRoleEnumMap, json['role_id']),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserBodyUpdateDTOToJson(_UserBodyUpdateDTO instance) =>
    <String, dynamic>{
      if (instance.userName case final value?) 'username': value,
      if (instance.firstName case final value?) 'name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.email case final value?) 'email': value,
      if (instance.password case final value?) 'current_password': value,
      if (instance.newPassword case final value?) 'new_password': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.phoneCountryCode case final value?)
        'phone_country_code': value,
      if (instance.dateOfBirth?.toIso8601String() case final value?)
        'date_of_birth': value,
      if (instance.zipCode case final value?) 'zip_code': value,
      if (instance.address case final value?) 'address': value,
      if (instance.city case final value?) 'city': value,
      if (_$FoodlyCountriesEnumMap[instance.country] case final value?)
        'country': value,
      if (instance.gender case final value?) 'gender': value,
      if (_$UserRoleEnumMap[instance.roleId] case final value?)
        'role_id': value,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
    };

const _$FoodlyCountriesEnumMap = {
  FoodlyCountries.ARGENTINA: 'Argentina',
  FoodlyCountries.SPAIN: 'Spain',
  FoodlyCountries.PORTUGAL: 'Portugal',
  FoodlyCountries.USA: 'United States',
  FoodlyCountries.VENEZUELA: 'Venezuela',
};

const _$UserRoleEnumMap = {
  UserRole.visitor: null,
  UserRole.superAdmin: 1,
  UserRole.owner: 2,
  UserRole.admin: 3,
  UserRole.customer: 4,
};
