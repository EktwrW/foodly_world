// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buzz_item_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuzzResponseDMImpl _$$BuzzResponseDMImplFromJson(Map<String, dynamic> json) =>
    _$BuzzResponseDMImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BuzzItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : BuzzMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BuzzResponseDMImplToJson(
        _$BuzzResponseDMImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_$BuzzMetaDMImpl _$$BuzzMetaDMImplFromJson(Map<String, dynamic> json) =>
    _$BuzzMetaDMImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BuzzMetaDMImplToJson(_$BuzzMetaDMImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_$BuzzItemDMImpl _$$BuzzItemDMImplFromJson(Map<String, dynamic> json) =>
    _$BuzzItemDMImpl(
      uuid: json['uuid'] as String,
      message: json['message'] as String? ?? '',
      subType: json['sub_type'] as String? ?? '',
      businessUuid: json['business_uuid'] as String?,
      businessName: json['business_name'] as String? ?? '',
      businessPhoto: json['business_photo'] as String?,
      menuUuid: json['menu_uuid'] as String?,
      entityName: json['entity_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BuzzItemDMImplToJson(_$BuzzItemDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'message': instance.message,
      'sub_type': instance.subType,
      if (instance.businessUuid case final value?) 'business_uuid': value,
      'business_name': instance.businessName,
      if (instance.businessPhoto case final value?) 'business_photo': value,
      if (instance.menuUuid case final value?) 'menu_uuid': value,
      if (instance.entityName case final value?) 'entity_name': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };
