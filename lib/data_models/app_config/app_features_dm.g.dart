// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_features_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppFeaturesDM _$AppFeaturesDMFromJson(Map<String, dynamic> json) =>
    _AppFeaturesDM(
      placesProxyEnabled: json['places_proxy_enabled'] as bool? ?? true,
      groupOrdersEnabled: json['group_orders_enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$AppFeaturesDMToJson(_AppFeaturesDM instance) =>
    <String, dynamic>{
      'places_proxy_enabled': instance.placesProxyEnabled,
      'group_orders_enabled': instance.groupOrdersEnabled,
    };
