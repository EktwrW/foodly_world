// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessUpdateDTOImpl _$$BusinessUpdateDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessUpdateDTOImpl(
      businessName: json['business_name'] as String?,
      businessAboutUs: json['business_about_us'] as String?,
      businessAdditionalInfo: json['business_additional_info'] as String?,
      businessServices: (json['business_services'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BusinessServicesEnumMap, e))
          .toList(),
      businessEmail: json['business_email'] as String?,
      businessPhone: json['business_phone'] as String?,
      businessAddress: json['business_address'] as String?,
      businessZipcode: json['business_zipcode'] as String?,
      businessCity: json['business_city'] as String?,
      businessCountry: $enumDecodeNullable(
          _$FoodlyCountriesEnumMap, json['business_country']),
      businessWebsite: json['business_website'] as String?,
      businessLatitude: (json['business_latitude'] as num?)?.toDouble(),
      businessLongitude: (json['business_longitude'] as num?)?.toDouble(),
      category:
          $enumDecodeNullable(_$FoodlyCategoriesEnumMap, json['category_id']),
      businessDays: json['business_opening_hours'] == null
          ? null
          : BusinessDays.fromJson(
              json['business_opening_hours'] as Map<String, dynamic>),
      allowReservations: json['allow_reservations'] as bool?,
      reservationSizeLimit: (json['reservation_size_limit'] as num?)?.toInt(),
      combosLabel: json['combos_label'] as String?,
    );

Map<String, dynamic> _$$BusinessUpdateDTOImplToJson(
        _$BusinessUpdateDTOImpl instance) =>
    <String, dynamic>{
      if (instance.businessName case final value?) 'business_name': value,
      if (instance.businessAboutUs case final value?)
        'business_about_us': value,
      if (instance.businessAdditionalInfo case final value?)
        'business_additional_info': value,
      if (instance.businessServices
              ?.map((e) => _$BusinessServicesEnumMap[e]!)
              .toList()
          case final value?)
        'business_services': value,
      if (instance.businessEmail case final value?) 'business_email': value,
      if (instance.businessPhone case final value?) 'business_phone': value,
      if (instance.businessAddress case final value?) 'business_address': value,
      if (instance.businessZipcode case final value?) 'business_zipcode': value,
      if (instance.businessCity case final value?) 'business_city': value,
      if (_$FoodlyCountriesEnumMap[instance.businessCountry] case final value?)
        'business_country': value,
      if (instance.businessWebsite case final value?) 'business_website': value,
      if (instance.businessLatitude case final value?)
        'business_latitude': value,
      if (instance.businessLongitude case final value?)
        'business_longitude': value,
      if (_$FoodlyCategoriesEnumMap[instance.category] case final value?)
        'category_id': value,
      if (instance.businessDays?.toJson() case final value?)
        'business_opening_hours': value,
      if (instance.allowReservations case final value?)
        'allow_reservations': value,
      if (instance.reservationSizeLimit case final value?)
        'reservation_size_limit': value,
      if (instance.combosLabel case final value?) 'combos_label': value,
    };

const _$BusinessServicesEnumMap = {
  BusinessServices.wifi: 1,
  BusinessServices.multiLanguage: 2,
  BusinessServices.kidChairs: 3,
  BusinessServices.babyChangingStation: 4,
  BusinessServices.kidsPlayArea: 5,
  BusinessServices.outdoor: 6,
  BusinessServices.accessiblePMR: 7,
  BusinessServices.delivery: 8,
  BusinessServices.takeAway: 9,
  BusinessServices.smokingArea: 10,
  BusinessServices.happyHours: 11,
  BusinessServices.happyBirthday: 12,
  BusinessServices.parking: 13,
  BusinessServices.petFriendly: 14,
  BusinessServices.catering: 15,
  BusinessServices.liveMusic: 16,
  BusinessServices.onSite: 17,
  BusinessServices.kidsMenu: 18,
  BusinessServices.reservations: 21,
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
};
