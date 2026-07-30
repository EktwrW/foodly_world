// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_address_component_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceAddressComponentDM _$PlaceAddressComponentDMFromJson(
        Map<String, dynamic> json) =>
    _PlaceAddressComponentDM(
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$PlaceAddressComponentDMToJson(
        _PlaceAddressComponentDM instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
