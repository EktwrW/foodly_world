// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_import_bulk_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuImportBulkResponseDM _$MenuImportBulkResponseDMFromJson(
        Map<String, dynamic> json) =>
    MenuImportBulkResponseDM(
      success: json['success'] as bool,
      stats:
          MenuImportBulkStatsDM.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuImportBulkResponseDMToJson(
        MenuImportBulkResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'stats': instance.stats.toJson(),
    };

MenuImportBulkStatsDM _$MenuImportBulkStatsDMFromJson(
        Map<String, dynamic> json) =>
    MenuImportBulkStatsDM(
      foodCategoriesCreated: (json['food_categories_created'] as num).toInt(),
      foodItemsCreated: (json['food_items_created'] as num).toInt(),
      drinkCategoriesCreated: (json['drink_categories_created'] as num).toInt(),
      drinkItemsCreated: (json['drink_items_created'] as num).toInt(),
      combosCreated: (json['combos_created'] as num).toInt(),
    );

Map<String, dynamic> _$MenuImportBulkStatsDMToJson(
        MenuImportBulkStatsDM instance) =>
    <String, dynamic>{
      'food_categories_created': instance.foodCategoriesCreated,
      'food_items_created': instance.foodItemsCreated,
      'drink_categories_created': instance.drinkCategoriesCreated,
      'drink_items_created': instance.drinkItemsCreated,
      'combos_created': instance.combosCreated,
    };
