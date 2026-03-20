// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_item_photo_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemPhotoDMDMImpl _$$MenuItemPhotoDMDMImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemPhotoDMDMImpl(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      businessFoodPhotoUrl: json['business_food_photo_url'] as String?,
      businessFoodItemId: (json['business_food_item_id'] as num?)?.toInt(),
      businessDrinkPhotoUrl: json['business_drink_photo_url'] as String?,
      businessDrinkItemId: (json['business_drink_item_id'] as num?)?.toInt(),
      businessComboPhotoUrl: json['business_combos_photo_url'] as String?,
      businessComboItemId: (json['business_combos_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuItemPhotoDMDMImplToJson(
        _$MenuItemPhotoDMDMImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      if (instance.businessFoodPhotoUrl case final value?)
        'business_food_photo_url': value,
      if (instance.businessFoodItemId case final value?)
        'business_food_item_id': value,
      if (instance.businessDrinkPhotoUrl case final value?)
        'business_drink_photo_url': value,
      if (instance.businessDrinkItemId case final value?)
        'business_drink_item_id': value,
      if (instance.businessComboPhotoUrl case final value?)
        'business_combos_photo_url': value,
      if (instance.businessComboItemId case final value?)
        'business_combos_id': value,
    };

_$MenuItemPhotoResponseImpl _$$MenuItemPhotoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemPhotoResponseImpl(
      foodReferencePhotos:
          (json['business_food_reference_photos'] as List<dynamic>?)
              ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
              .toList(),
      drinkReferencePhotos:
          (json['business_drink_reference_photos'] as List<dynamic>?)
              ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
              .toList(),
      comboReferencePhotos: (json['business_combo_photos'] as List<dynamic>?)
          ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuItemPhotoResponseImplToJson(
        _$MenuItemPhotoResponseImpl instance) =>
    <String, dynamic>{
      if (instance.foodReferencePhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_food_reference_photos': value,
      if (instance.drinkReferencePhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_drink_reference_photos': value,
      if (instance.comboReferencePhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_combo_photos': value,
    };
