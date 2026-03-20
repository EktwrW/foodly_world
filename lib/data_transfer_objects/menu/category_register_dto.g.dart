// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      businessMenuId: (json['business_menu_id'] as num?)?.toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      if (instance.businessMenuId case final value?) 'business_menu_id': value,
      'name': instance.name,
    };
