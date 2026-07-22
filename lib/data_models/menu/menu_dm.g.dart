// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) =>
    _MenuResponse(
      menuDM: MenuDM.fromJson(json['menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuResponseToJson(_MenuResponse instance) =>
    <String, dynamic>{
      'menu': instance.menuDM.toJson(),
    };

_MenuDM _$MenuDMFromJson(Map<String, dynamic> json) => _MenuDM(
      uuid: json['uuid'] as String,
      id: (json['id'] as num?)?.toInt(),
      business: json['business'] == null
          ? null
          : BusinessDM.fromJson(json['business'] as Map<String, dynamic>),
      businessUuid: json['business_uuid'] as String,
      businessId: (json['business_id'] as num?)?.toInt(),
      businessName: json['business_name'] as String?,
      lastUpdate: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      foodCategories: (json['business_food_categories'] as List<dynamic>?)
              ?.map((e) => CategoryDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      drinkCategories: (json['business_drink_categories'] as List<dynamic>?)
              ?.map((e) => CategoryDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      combos: (json['business_combos'] as List<dynamic>?)
              ?.map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      followersLength: (json['followers_length'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MenuDMToJson(_MenuDM instance) => <String, dynamic>{
      'uuid': instance.uuid,
      if (instance.id case final value?) 'id': value,
      if (instance.business?.toJson() case final value?) 'business': value,
      'business_uuid': instance.businessUuid,
      if (instance.businessId case final value?) 'business_id': value,
      if (instance.businessName case final value?) 'business_name': value,
      if (instance.lastUpdate?.toIso8601String() case final value?)
        'updated_at': value,
      'business_food_categories':
          instance.foodCategories.map((e) => e.toJson()).toList(),
      'business_drink_categories':
          instance.drinkCategories.map((e) => e.toJson()).toList(),
      'business_combos': instance.combos.map((e) => e.toJson()).toList(),
      'followers_length': instance.followersLength,
    };

_CategoryDM _$CategoryDMFromJson(Map<String, dynamic> json) => _CategoryDM(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      id: (json['id'] as num?)?.toInt(),
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDMToJson(_CategoryDM instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      if (instance.id case final value?) 'id': value,
      'sort_order': instance.sortOrder,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
