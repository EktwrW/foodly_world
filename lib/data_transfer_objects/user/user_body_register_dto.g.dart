// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBodyRegisterDTO _$UserBodyRegisterDTOFromJson(Map<String, dynamic> json) =>
    UserBodyRegisterDTO(
      userName: json['username'] as String,
      firstName: json['name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      phone: json['phone'] as String,
      phoneCountryCode: json['phone_country_code'] as String?,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      address: json['address'] as String,
      zipCode: json['zip_code'] as String,
      city: json['city'] as String,
      country: $enumDecode(_$FoodlyCountriesEnumMap, json['country']),
      gender: json['gender'] as String,
      roleId: $enumDecodeNullable(_$UserRoleEnumMap, json['role_id']),
      termsAndContiditionsAccepted: json['terms_and_conditions'] as bool,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      firebasePhoneToken: json['firebase_phone_token'] as String?,
      provider: json['provider'] as String?,
      providerId: json['provider_id'] as String?,
    );

Map<String, dynamic> _$UserBodyRegisterDTOToJson(
        UserBodyRegisterDTO instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'phone': instance.phone,
      if (instance.phoneCountryCode case final value?)
        'phone_country_code': value,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'address': instance.address,
      'zip_code': instance.zipCode,
      'city': instance.city,
      'country': _$FoodlyCountriesEnumMap[instance.country]!,
      'gender': instance.gender,
      if (_$UserRoleEnumMap[instance.roleId] case final value?)
        'role_id': value,
      'terms_and_conditions': instance.termsAndContiditionsAccepted,
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
      if (instance.addresses?.map((e) => e.toJson()).toList() case final value?)
        'addresses': value,
      if (instance.firebasePhoneToken case final value?)
        'firebase_phone_token': value,
      if (instance.provider case final value?) 'provider': value,
      if (instance.providerId case final value?) 'provider_id': value,
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
