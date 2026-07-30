// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_package_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServicePackagesResponseDM _$ServicePackagesResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ServicePackagesResponseDM(
      success: json['success'] as bool? ?? false,
      servicePackages: (json['service_packages'] as List<dynamic>?)
              ?.map((e) => ServicePackageDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServicePackagesResponseDMToJson(
        _ServicePackagesResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'service_packages':
          instance.servicePackages.map((e) => e.toJson()).toList(),
    };

_ServicePackageActionResponseDM _$ServicePackageActionResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ServicePackageActionResponseDM(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      servicePackage: json['service_package'] == null
          ? null
          : ServicePackageDM.fromJson(
              json['service_package'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServicePackageActionResponseDMToJson(
        _ServicePackageActionResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.servicePackage?.toJson() case final value?)
        'service_package': value,
    };

_GenericSuccessResponseDM _$GenericSuccessResponseDMFromJson(
        Map<String, dynamic> json) =>
    _GenericSuccessResponseDM(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$GenericSuccessResponseDMToJson(
        _GenericSuccessResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

_PhotoUploadResponseDM _$PhotoUploadResponseDMFromJson(
        Map<String, dynamic> json) =>
    _PhotoUploadResponseDM(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) =>
                  ServicePackagePhotoDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PhotoUploadResponseDMToJson(
        _PhotoUploadResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };

_ServicePackageDM _$ServicePackageDMFromJson(Map<String, dynamic> json) =>
    _ServicePackageDM(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      businessId: (json['business_id'] as num?)?.toInt(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      serviceType:
          $enumDecodeNullable(_$ServiceTypeEnumMap, json['service_type']) ??
              ServiceType.custom,
      priceType: $enumDecodeNullable(_$PriceTypeEnumMap, json['price_type']) ??
          PriceType.onQuote,
      price: _doubleFromJson(json['price']),
      currency: json['currency'] as String?,
      minGuests: (json['min_guests'] as num?)?.toInt(),
      maxGuests: (json['max_guests'] as num?)?.toInt(),
      durationHours: _doubleFromJson(json['duration_hours']),
      includes: (json['includes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      addOns: (json['add_ons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFeatured: json['is_featured'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) =>
                  ServicePackagePhotoDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServicePackageDMToJson(_ServicePackageDM instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.uuid case final value?) 'uuid': value,
      if (instance.businessId case final value?) 'business_id': value,
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      'service_type': _$ServiceTypeEnumMap[instance.serviceType]!,
      'price_type': _$PriceTypeEnumMap[instance.priceType]!,
      if (instance.price case final value?) 'price': value,
      if (instance.currency case final value?) 'currency': value,
      if (instance.minGuests case final value?) 'min_guests': value,
      if (instance.maxGuests case final value?) 'max_guests': value,
      if (instance.durationHours case final value?) 'duration_hours': value,
      'includes': instance.includes,
      'add_ons': instance.addOns,
      'is_featured': instance.isFeatured,
      'is_active': instance.isActive,
      'sort_order': instance.sortOrder,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$ServiceTypeEnumMap = {
  ServiceType.dinner: 'dinner',
  ServiceType.lunch: 'lunch',
  ServiceType.brunch: 'brunch',
  ServiceType.cocktail: 'cocktail',
  ServiceType.wedding: 'wedding',
  ServiceType.corporate: 'corporate',
  ServiceType.birthday: 'birthday',
  ServiceType.cookingClassPrivate: 'cooking_class_private',
  ServiceType.custom: 'custom',
};

const _$PriceTypeEnumMap = {
  PriceType.fixed: 'fixed',
  PriceType.perPerson: 'per_person',
  PriceType.perHour: 'per_hour',
  PriceType.onQuote: 'on_quote',
};

_ServicePackagePhotoDM _$ServicePackagePhotoDMFromJson(
        Map<String, dynamic> json) =>
    _ServicePackagePhotoDM(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      servicePackageId: (json['service_package_id'] as num?)?.toInt(),
      photoPath: json['photo_path'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ServicePackagePhotoDMToJson(
        _ServicePackagePhotoDM instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.uuid case final value?) 'uuid': value,
      if (instance.servicePackageId case final value?)
        'service_package_id': value,
      if (instance.photoPath case final value?) 'photo_path': value,
      'sort_order': instance.sortOrder,
    };
