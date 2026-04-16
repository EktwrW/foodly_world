// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_body_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessBodyRegisterDTO _$BusinessBodyRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    BusinessBodyRegisterDTO(
      businessName: json['business_name'] as String,
      businessEmail: json['business_email'] as String,
      businessPhone: json['business_phone'] as String,
      businessAddress: json['business_address'] as String,
      businessZipcode: json['business_zipcode'] as String,
      businessCity: json['business_city'] as String,
      businessCountry:
          $enumDecode(_$FoodlyCountriesEnumMap, json['business_country']),
      businessWebsite: json['business_website'] as String,
      businessLatitude: (json['business_latitude'] as num?)?.toDouble(),
      businessLongitude: (json['business_longitude'] as num?)?.toDouble(),
      categoryId: $enumDecode(_$FoodlyCategoriesEnumMap, json['category_id']),
      introMessage: json['intro_message'] as String?,
      termsAccepted: json['terms_accepted'] as bool? ?? false,
    );

Map<String, dynamic> _$BusinessBodyRegisterDTOToJson(
        BusinessBodyRegisterDTO instance) =>
    <String, dynamic>{
      'business_name': instance.businessName,
      'business_email': instance.businessEmail,
      'business_phone': instance.businessPhone,
      'business_address': instance.businessAddress,
      'business_zipcode': instance.businessZipcode,
      'business_city': instance.businessCity,
      'business_country': _$FoodlyCountriesEnumMap[instance.businessCountry]!,
      'business_website': instance.businessWebsite,
      if (instance.businessLatitude case final value?)
        'business_latitude': value,
      if (instance.businessLongitude case final value?)
        'business_longitude': value,
      'category_id': _$FoodlyCategoriesEnumMap[instance.categoryId]!,
      if (instance.introMessage case final value?) 'intro_message': value,
      'terms_accepted': instance.termsAccepted,
    };

const _$FoodlyCountriesEnumMap = {
  FoodlyCountries.ARGENTINA: 'Argentina',
  FoodlyCountries.SPAIN: 'Spain',
  FoodlyCountries.PORTUGAL: 'Portugal',
  FoodlyCountries.USA: 'United States',
  FoodlyCountries.VENEZUELA: 'Venezuela',
};

const _$FoodlyCategoriesEnumMap = {
  FoodlyCategories.international: 1,
  FoodlyCategories.fastFood: 2,
  FoodlyCategories.pizza: 3,
  FoodlyCategories.sushi: 4,
  FoodlyCategories.steakhouse: 5,
  FoodlyCategories.fusion: 6,
  FoodlyCategories.vegetarian: 7,
  FoodlyCategories.mexican: 8,
  FoodlyCategories.korean: 9,
  FoodlyCategories.portuguese: 10,
  FoodlyCategories.bakery: 11,
  FoodlyCategories.drinkHouse: 12,
  FoodlyCategories.coffee: 13,
  FoodlyCategories.stores: 14,
  FoodlyCategories.academy: 15,
  FoodlyCategories.italian: 16,
  FoodlyCategories.argentinian: 17,
  FoodlyCategories.peruvian: 18,
  FoodlyCategories.seaFood: 19,
  FoodlyCategories.asian: 20,
  FoodlyCategories.arabic: 21,
  FoodlyCategories.venezuelan: 22,
  FoodlyCategories.foodTrucks: 25,
  FoodlyCategories.cateringAndChefs: 26,
};
