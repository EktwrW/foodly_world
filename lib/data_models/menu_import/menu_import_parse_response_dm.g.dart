// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_import_parse_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuImportParseResponseDM _$MenuImportParseResponseDMFromJson(
        Map<String, dynamic> json) =>
    MenuImportParseResponseDM(
      groupedMenu: (json['grouped_menu'] as List<dynamic>)
          .map((e) => ParsedCategoryGroupDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      parserUsed: json['parser_used'] as String?,
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MenuImportParseResponseDMToJson(
        MenuImportParseResponseDM instance) =>
    <String, dynamic>{
      'grouped_menu': instance.groupedMenu.map((e) => e.toJson()).toList(),
      if (instance.parserUsed case final value?) 'parser_used': value,
      if (instance.warnings case final value?) 'warnings': value,
    };

ParsedCategoryGroupDM _$ParsedCategoryGroupDMFromJson(
        Map<String, dynamic> json) =>
    ParsedCategoryGroupDM(
      categoryName: json['category_name'] as String,
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((e) => ParsedSubcategoryDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ParsedMenuItemDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParsedCategoryGroupDMToJson(
        ParsedCategoryGroupDM instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      if (instance.subcategories?.map((e) => e.toJson()).toList()
          case final value?)
        'subcategories': value,
      if (instance.items?.map((e) => e.toJson()).toList() case final value?)
        'items': value,
    };

ParsedSubcategoryDM _$ParsedSubcategoryDMFromJson(Map<String, dynamic> json) =>
    ParsedSubcategoryDM(
      subcategoryName: json['subcategory_name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ParsedMenuItemDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParsedSubcategoryDMToJson(
        ParsedSubcategoryDM instance) =>
    <String, dynamic>{
      'subcategory_name': instance.subcategoryName,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

ParsedMenuItemDM _$ParsedMenuItemDMFromJson(Map<String, dynamic> json) =>
    ParsedMenuItemDM(
      name: json['name'] as String,
      description: json['description'] as String?,
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      prices: json['prices'] as Map<String, dynamic>?,
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParsedMenuItemDMToJson(ParsedMenuItemDM instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.versions case final value?) 'versions': value,
      if (instance.prices case final value?) 'prices': value,
      if (instance.confidence case final value?) 'confidence': value,
    };
