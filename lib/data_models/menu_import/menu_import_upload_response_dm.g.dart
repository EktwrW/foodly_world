// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_import_upload_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuImportUploadResponseDM _$MenuImportUploadResponseDMFromJson(
        Map<String, dynamic> json) =>
    MenuImportUploadResponseDM(
      success: json['success'] as bool,
      sessionId: json['session_id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) =>
              MenuImportUploadedImageDM.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$MenuImportUploadResponseDMToJson(
        MenuImportUploadResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'session_id': instance.sessionId,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };

MenuImportUploadedImageDM _$MenuImportUploadedImageDMFromJson(
        Map<String, dynamic> json) =>
    MenuImportUploadedImageDM(
      path: json['path'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MenuImportUploadedImageDMToJson(
        MenuImportUploadedImageDM instance) =>
    <String, dynamic>{
      'path': instance.path,
      'url': instance.url,
    };
