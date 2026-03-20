// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ItemRegisterDTOToJson(ItemRegisterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'versions': instance.versions,
      'prices': instance.prices,
      'favorites_count': instance.favoritesCount,
      'available': instance.available,
    };

FoodItemRegisterDTO _$FoodItemRegisterDTOFromJson(Map<String, dynamic> json) =>
    FoodItemRegisterDTO(
      businessFoodCategoryId:
          (json['business_food_category_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      versions:
          (json['versions'] as List<dynamic>).map((e) => e as String).toList(),
      prices: (json['prices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      favoritesCount: (json['favorites_count'] as num).toInt(),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$FoodItemRegisterDTOToJson(
        FoodItemRegisterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'versions': instance.versions,
      'prices': instance.prices,
      'favorites_count': instance.favoritesCount,
      'available': instance.available,
      'business_food_category_id': instance.businessFoodCategoryId,
    };

DrinkItemRegisterDTO _$DrinkItemRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    DrinkItemRegisterDTO(
      businessDrinkCategoryId:
          (json['business_drink_category_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      versions:
          (json['versions'] as List<dynamic>).map((e) => e as String).toList(),
      prices: (json['prices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      favoritesCount: (json['favorites_count'] as num).toInt(),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$DrinkItemRegisterDTOToJson(
        DrinkItemRegisterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'versions': instance.versions,
      'prices': instance.prices,
      'favorites_count': instance.favoritesCount,
      'available': instance.available,
      'business_drink_category_id': instance.businessDrinkCategoryId,
    };

ComboItemRegisterDTO _$ComboItemRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    ComboItemRegisterDTO(
      businessMenuId: (json['business_menu_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      versions:
          (json['versions'] as List<dynamic>).map((e) => e as String).toList(),
      prices: (json['prices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      favoritesCount: (json['favorites_count'] as num).toInt(),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$ComboItemRegisterDTOToJson(
        ComboItemRegisterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'versions': instance.versions,
      'prices': instance.prices,
      'favorites_count': instance.favoritesCount,
      'available': instance.available,
      'business_menu_id': instance.businessMenuId,
    };
