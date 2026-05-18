// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_import_bulk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuImportBulkDTO _$MenuImportBulkDTOFromJson(Map<String, dynamic> json) =>
    MenuImportBulkDTO(
      groupedMenu: (json['grouped_menu'] as List<dynamic>)
          .map(
              (e) => MenuImportBulkGroupDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuImportBulkDTOToJson(MenuImportBulkDTO instance) =>
    <String, dynamic>{
      'grouped_menu': instance.groupedMenu.map((e) => e.toJson()).toList(),
    };

MenuImportBulkGroupDTO _$MenuImportBulkGroupDTOFromJson(
        Map<String, dynamic> json) =>
    MenuImportBulkGroupDTO(
      categoryName: json['category_name'] as String,
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((e) =>
              MenuImportBulkSubcategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => MenuImportBulkItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuImportBulkGroupDTOToJson(
        MenuImportBulkGroupDTO instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      if (instance.subcategories?.map((e) => e.toJson()).toList()
          case final value?)
        'subcategories': value,
      if (instance.items?.map((e) => e.toJson()).toList() case final value?)
        'items': value,
    };

MenuImportBulkSubcategoryDTO _$MenuImportBulkSubcategoryDTOFromJson(
        Map<String, dynamic> json) =>
    MenuImportBulkSubcategoryDTO(
      subcategoryName: json['subcategory_name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuImportBulkItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuImportBulkSubcategoryDTOToJson(
        MenuImportBulkSubcategoryDTO instance) =>
    <String, dynamic>{
      'subcategory_name': instance.subcategoryName,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

MenuImportBulkItemDTO _$MenuImportBulkItemDTOFromJson(
        Map<String, dynamic> json) =>
    MenuImportBulkItemDTO(
      name: json['name'] as String,
      description: json['description'] as String?,
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      prices: (json['prices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$MenuImportBulkItemDTOToJson(
        MenuImportBulkItemDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.versions case final value?) 'versions': value,
      if (instance.prices case final value?) 'prices': value,
    };
