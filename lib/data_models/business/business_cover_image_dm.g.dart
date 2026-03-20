// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_cover_image_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessCoverImageDMImpl _$$BusinessCoverImageDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessCoverImageDMImpl(
      intId: _intFromJson(json['id']),
      imageId: json['business_image_uuid'] as String?,
      url: json['business_image_path'] as String?,
      businessId: _intFromJson(json['business_id']),
      dateCreated: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      dateUpdated: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BusinessCoverImageDMImplToJson(
        _$BusinessCoverImageDMImpl instance) =>
    <String, dynamic>{
      if (instance.intId case final value?) 'id': value,
      if (instance.imageId case final value?) 'business_image_uuid': value,
      if (instance.url case final value?) 'business_image_path': value,
      if (instance.businessId case final value?) 'business_id': value,
      if (instance.dateCreated?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.dateUpdated?.toIso8601String() case final value?)
        'updated_at': value,
    };
