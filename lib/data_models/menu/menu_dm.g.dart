// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuResponseImpl _$$MenuResponseImplFromJson(Map<String, dynamic> json) =>
    _$MenuResponseImpl(
      menuDM: MenuDM.fromJson(json['menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MenuResponseImplToJson(_$MenuResponseImpl instance) =>
    <String, dynamic>{
      'menu': instance.menuDM.toJson(),
    };

_$MenuDMImpl _$$MenuDMImplFromJson(Map<String, dynamic> json) => _$MenuDMImpl(
      uuid: json['uuid'] as String,
      id: (json['id'] as num?)?.toInt(),
      business: json['business'] == null
          ? null
          : BusinessDM.fromJson(json['business'] as Map<String, dynamic>),
      businessUuid: json['business_uuid'] as String,
      businessId: (json['business_id'] as num?)?.toInt(),
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

Map<String, dynamic> _$$MenuDMImplToJson(_$MenuDMImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      if (instance.id case final value?) 'id': value,
      if (instance.business?.toJson() case final value?) 'business': value,
      'business_uuid': instance.businessUuid,
      if (instance.businessId case final value?) 'business_id': value,
      if (instance.lastUpdate?.toIso8601String() case final value?)
        'updated_at': value,
      'business_food_categories':
          instance.foodCategories.map((e) => e.toJson()).toList(),
      'business_drink_categories':
          instance.drinkCategories.map((e) => e.toJson()).toList(),
      'business_combos': instance.combos.map((e) => e.toJson()).toList(),
      'followers_length': instance.followersLength,
    };

_$CategoryDMImpl _$$CategoryDMImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDMImpl(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      id: (json['id'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDMImplToJson(_$CategoryDMImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      if (instance.id case final value?) 'id': value,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
