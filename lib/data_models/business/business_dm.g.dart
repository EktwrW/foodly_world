// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessDMImpl _$$BusinessDMImplFromJson(Map<String, dynamic> json) =>
    _$BusinessDMImpl(
      intId: (json['id'] as num?)?.toInt(),
      logo: json['business_logo'] as String? ?? FoodlyStrings.LOGO_PLACEHOLDER,
      coverImages: (json['cover_images'] as List<dynamic>?)
              ?.map((e) =>
                  BusinessCoverImageDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      branches: (json['branches'] as List<dynamic>?)
              ?.map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      uuid: json['business_uuid'] as String? ?? '',
      name: json['business_name'] as String?,
      aboutUs: json['business_about_us'] as String?,
      services: (json['business_services'] as List<dynamic>?)
          ?.map((e) => BusinessServicesDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      promotions: (json['business_promotions'] as List<dynamic>?)
          ?.map((e) => PromotionDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalInfo: json['business_additional_info'] as String?,
      email: json['business_email'] as String?,
      phoneNumber: json['business_phone'] as String?,
      address: json['business_address'] as String?,
      zipCode: json['business_zipcode'] as String?,
      city: json['business_city'] as String?,
      country: $enumDecodeNullable(
          _$FoodlyCountriesEnumMap, json['business_country']),
      menus: (json['business_menus'] as List<dynamic>?)
              ?.map((e) => MenuDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      latitude: (json['business_latitude'] as num?)?.toDouble(),
      longitude: (json['business_longitude'] as num?)?.toDouble(),
      categoryId: _safeCategoryFromJson(json['category_id']),
      category: json['category'] == null
          ? null
          : CategoryDM.fromJson(json['category'] as Map<String, dynamic>),
      rating: (json['rating_avg'] as num?)?.toDouble(),
      ratingsCount: (json['ratings_count'] as num?)?.toInt(),
      businessDays: json['business_opening_hours'] == null
          ? const BusinessDays()
          : BusinessDays.fromJson(
              json['business_opening_hours'] as Map<String, dynamic>),
      followersLength: (json['followers_length'] as num?)?.toInt() ?? 0,
      introMessage: json['intro_message'] as String?,
      allowReservations: json['allow_reservations'] as bool? ?? false,
      reservationsSizeLimit: (json['reservations_count'] as num?)?.toInt() ?? 6,
      combosLabel: json['combos_label'] as String?,
      aiPromoMonthlyLimit:
          (json['ai_promo_monthly_limit'] as num?)?.toInt() ?? 6,
      aiPromosUsedThisMonth:
          (json['ai_promos_used_this_month'] as num?)?.toInt() ?? 0,
      minServicePrice: _doubleFromJson(json['min_service_price']),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BusinessDMImplToJson(_$BusinessDMImpl instance) =>
    <String, dynamic>{
      if (instance.intId case final value?) 'id': value,
      'business_logo': instance.logo,
      'cover_images': instance.coverImages.map((e) => e.toJson()).toList(),
      'branches': instance.branches.map((e) => e.toJson()).toList(),
      'business_uuid': instance.uuid,
      if (instance.name case final value?) 'business_name': value,
      if (instance.aboutUs case final value?) 'business_about_us': value,
      if (instance.services?.map((e) => e.toJson()).toList() case final value?)
        'business_services': value,
      if (instance.promotions?.map((e) => e.toJson()).toList()
          case final value?)
        'business_promotions': value,
      if (instance.additionalInfo case final value?)
        'business_additional_info': value,
      if (instance.email case final value?) 'business_email': value,
      if (instance.phoneNumber case final value?) 'business_phone': value,
      if (instance.address case final value?) 'business_address': value,
      if (instance.zipCode case final value?) 'business_zipcode': value,
      if (instance.city case final value?) 'business_city': value,
      if (_$FoodlyCountriesEnumMap[instance.country] case final value?)
        'business_country': value,
      'business_menus': instance.menus.map((e) => e.toJson()).toList(),
      if (instance.latitude case final value?) 'business_latitude': value,
      if (instance.longitude case final value?) 'business_longitude': value,
      if (_$FoodlyCategoriesEnumMap[instance.categoryId] case final value?)
        'category_id': value,
      if (instance.category?.toJson() case final value?) 'category': value,
      if (instance.rating case final value?) 'rating_avg': value,
      if (instance.ratingsCount case final value?) 'ratings_count': value,
      'business_opening_hours': instance.businessDays.toJson(),
      'followers_length': instance.followersLength,
      if (instance.introMessage case final value?) 'intro_message': value,
      'allow_reservations': instance.allowReservations,
      'reservations_count': instance.reservationsSizeLimit,
      if (instance.combosLabel case final value?) 'combos_label': value,
      'ai_promo_monthly_limit': instance.aiPromoMonthlyLimit,
      'ai_promos_used_this_month': instance.aiPromosUsedThisMonth,
      if (instance.minServicePrice case final value?)
        'min_service_price': value,
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
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

_$CategoryDMImpl _$$CategoryDMImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDMImpl(
      id: _safeCategoryFromJson(json['id']),
      categoryUuid: json['category_uuid'] as String?,
      categoryName: json['category_name'] as String?,
      categoryImagePath: json['category_image_path'] as String?,
    );

Map<String, dynamic> _$$CategoryDMImplToJson(_$CategoryDMImpl instance) =>
    <String, dynamic>{
      if (_$FoodlyCategoriesEnumMap[instance.id] case final value?) 'id': value,
      if (instance.categoryUuid case final value?) 'category_uuid': value,
      if (instance.categoryName case final value?) 'category_name': value,
      if (instance.categoryImagePath case final value?)
        'category_image_path': value,
    };

_$BusinessServiceDMImpl _$$BusinessServiceDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessServiceDMImpl(
      service: $enumDecodeNullable(_$BusinessServicesEnumMap, json['id'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      uuid: json['service_uuid'] as String?,
      serviceName: json['service_name'] as String?,
      serviceDescriptio: json['service_description'] as String?,
      serviceImagePath: json['service_image_path'] as String?,
    );

Map<String, dynamic> _$$BusinessServiceDMImplToJson(
        _$BusinessServiceDMImpl instance) =>
    <String, dynamic>{
      if (_$BusinessServicesEnumMap[instance.service] case final value?)
        'id': value,
      if (instance.uuid case final value?) 'service_uuid': value,
      if (instance.serviceName case final value?) 'service_name': value,
      if (instance.serviceDescriptio case final value?)
        'service_description': value,
      if (instance.serviceImagePath case final value?)
        'service_image_path': value,
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
