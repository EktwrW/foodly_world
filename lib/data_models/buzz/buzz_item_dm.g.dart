// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buzz_item_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuzzResponseDM _$BuzzResponseDMFromJson(Map<String, dynamic> json) =>
    _BuzzResponseDM(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BuzzItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : BuzzMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BuzzResponseDMToJson(_BuzzResponseDM instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_BuzzMetaDM _$BuzzMetaDMFromJson(Map<String, dynamic> json) => _BuzzMetaDM(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BuzzMetaDMToJson(_BuzzMetaDM instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_BuzzItemDM _$BuzzItemDMFromJson(Map<String, dynamic> json) => _BuzzItemDM(
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
      fromFollowing: json['from_following'] as bool? ?? false,
      actorUuid: json['actor_uuid'] as String?,
      actorName: json['actor_name'] as String?,
      actorPhotoUrl: json['actor_photo_url'] as String?,
    );

Map<String, dynamic> _$BuzzItemDMToJson(_BuzzItemDM instance) =>
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
      'from_following': instance.fromFollowing,
      if (instance.actorUuid case final value?) 'actor_uuid': value,
      if (instance.actorName case final value?) 'actor_name': value,
      if (instance.actorPhotoUrl case final value?) 'actor_photo_url': value,
    };
