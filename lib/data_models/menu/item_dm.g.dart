// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemDM _$ItemDMFromJson(Map<String, dynamic> json) => _ItemDM(
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      versions: (json['versions'] as List<dynamic>)
          .map((e) => $enumDecode(_$VersionEnumMap, e))
          .toList(),
      prices: Prices.fromJson(json['prices'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String,
      menuUuid: json['menu_uuid'] as String?,
      businessUuid: json['business_uuid'] as String?,
      foodPhotos: (json['business_food_reference_photos'] as List<dynamic>?)
          ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinkPhotos: (json['business_drink_reference_photos'] as List<dynamic>?)
          ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      comboPhotos: (json['business_combos_reference_photos'] as List<dynamic>?)
          ?.map((e) => MenuItemPhotoDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoritesCount: (json['favorites_count'] as num?)?.toInt() ?? 0,
      foodCategoryId: (json['business_food_category_id'] as num?)?.toInt(),
      drinkCategoryId: (json['business_drink_category_id'] as num?)?.toInt(),
      comboCategoryId: (json['business_menu_id'] as num?)?.toInt(),
      available: json['available'] as bool? ?? true,
      followersLength: (json['followers_length'] as num?)?.toInt() ?? 0,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ItemDMToJson(_ItemDM instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'versions': instance.versions.map((e) => _$VersionEnumMap[e]!).toList(),
      'prices': instance.prices.toJson(),
      if (instance.id case final value?) 'id': value,
      'uuid': instance.uuid,
      if (instance.menuUuid case final value?) 'menu_uuid': value,
      if (instance.businessUuid case final value?) 'business_uuid': value,
      if (instance.foodPhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_food_reference_photos': value,
      if (instance.drinkPhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_drink_reference_photos': value,
      if (instance.comboPhotos?.map((e) => e.toJson()).toList()
          case final value?)
        'business_combos_reference_photos': value,
      'favorites_count': instance.favoritesCount,
      if (instance.foodCategoryId case final value?)
        'business_food_category_id': value,
      if (instance.drinkCategoryId case final value?)
        'business_drink_category_id': value,
      if (instance.comboCategoryId case final value?) 'business_menu_id': value,
      'available': instance.available,
      'followers_length': instance.followersLength,
      'sort_order': instance.sortOrder,
    };

const _$VersionEnumMap = {
  Version.regular: 'regular',
  Version.medium: 'medium',
  Version.big: 'big',
};

_Prices _$PricesFromJson(Map<String, dynamic> json) => _Prices(
      regular: (json['regular'] as num?)?.toDouble() ?? 0,
      medium: (json['medium'] as num?)?.toDouble() ?? 0,
      big: (json['big'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PricesToJson(_Prices instance) => <String, dynamic>{
      'regular': instance.regular,
      'medium': instance.medium,
      'big': instance.big,
    };
