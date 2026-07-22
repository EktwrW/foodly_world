// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_geometry_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceLatLngDM _$PlaceLatLngDMFromJson(Map<String, dynamic> json) =>
    _PlaceLatLngDM(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$PlaceLatLngDMToJson(_PlaceLatLngDM instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_PlaceBoundsDM _$PlaceBoundsDMFromJson(Map<String, dynamic> json) =>
    _PlaceBoundsDM(
      northeast: json['northeast'] == null
          ? null
          : PlaceLatLngDM.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : PlaceLatLngDM.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceBoundsDMToJson(_PlaceBoundsDM instance) =>
    <String, dynamic>{
      if (instance.northeast?.toJson() case final value?) 'northeast': value,
      if (instance.southwest?.toJson() case final value?) 'southwest': value,
    };

_PlaceGeometryDM _$PlaceGeometryDMFromJson(Map<String, dynamic> json) =>
    _PlaceGeometryDM(
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

Map<String, dynamic> _$PlaceGeometryDMToJson(_PlaceGeometryDM instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      if (instance.viewport?.toJson() case final value?) 'viewport': value,
      if (instance.bounds?.toJson() case final value?) 'bounds': value,
      if (instance.locationType case final value?) 'location_type': value,
    };
