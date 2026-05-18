// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_import_parse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuImportParseDTO _$MenuImportParseDTOFromJson(Map<String, dynamic> json) =>
    MenuImportParseDTO(
      imagePath: json['image_path'] as String,
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$MenuImportParseDTOToJson(MenuImportParseDTO instance) =>
    <String, dynamic>{
      'image_path': instance.imagePath,
      if (instance.locale case final value?) 'locale': value,
    };
