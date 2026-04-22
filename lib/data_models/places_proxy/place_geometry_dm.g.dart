// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_geometry_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceLatLngDMImpl _$$PlaceLatLngDMImplFromJson(Map<String, dynamic> json) =>
    _$PlaceLatLngDMImpl(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$PlaceLatLngDMImplToJson(_$PlaceLatLngDMImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$PlaceBoundsDMImpl _$$PlaceBoundsDMImplFromJson(Map<String, dynamic> json) =>
    _$PlaceBoundsDMImpl(
      northeast: json['northeast'] == null
          ? null
          : PlaceLatLngDM.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : PlaceLatLngDM.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceBoundsDMImplToJson(_$PlaceBoundsDMImpl instance) =>
    <String, dynamic>{
      if (instance.northeast?.toJson() case final value?) 'northeast': value,
      if (instance.southwest?.toJson() case final value?) 'southwest': value,
    };

_$PlaceGeometryDMImpl _$$PlaceGeometryDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceGeometryDMImpl(
      location:
          PlaceLatLngDM.fromJson(json['location'] as Map<String, dynamic>),
      viewport: json['viewport'] == null
          ? null
          : PlaceBoundsDM.fromJson(json['viewport'] as Map<String, dynamic>),
      bounds: json['bounds'] == null
          ? null
          : PlaceBoundsDM.fromJson(json['bounds'] as Map<String, dynamic>),
      locationType: json['location_type'] as String?,
    );

Map<String, dynamic> _$$PlaceGeometryDMImplToJson(
        _$PlaceGeometryDMImpl instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      if (instance.viewport?.toJson() case final value?) 'viewport': value,
      if (instance.bounds?.toJson() case final value?) 'bounds': value,
      if (instance.locationType case final value?) 'location_type': value,
    };
