import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_geometry_dm.freezed.dart';
part 'place_geometry_dm.g.dart';

/// Coordenada simple `{lat, lng}`. Usada en dos shapes distintas de Google:
///   1. `geometry.location` (Place Details, Geocoding result principal)
///   2. `viewport.northeast` / `.southwest` (bounds)
///
/// Los fields NO son nullable en la respuesta real de Google, pero los
/// dejamos con default 0.0 por defensa contra deserializaciones parciales.
/// El caller debe validar con `isZero` antes de persistir — un (0,0) es
/// técnicamente válido (Null Island) pero nunca es lo que queremos mostrar.
@freezed
abstract class PlaceLatLngDM with _$PlaceLatLngDM {
  const factory PlaceLatLngDM({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _PlaceLatLngDM;

  factory PlaceLatLngDM.fromJson(Map<String, dynamic> json) => _$PlaceLatLngDMFromJson(json);
}

/// Bounds rectangulares (northeast + southwest). Ambos opcionales porque
/// Geocoding devuelve `bounds` solo para entidades con extensión (ciudad,
/// país) y no para direcciones puntuales.
@freezed
abstract class PlaceBoundsDM with _$PlaceBoundsDM {
  const factory PlaceBoundsDM({
    PlaceLatLngDM? northeast,
    PlaceLatLngDM? southwest,
  }) = _PlaceBoundsDM;

  factory PlaceBoundsDM.fromJson(Map<String, dynamic> json) => _$PlaceBoundsDMFromJson(json);
}

/// Geometry de un Place o Geocoding result.
///
/// - `location` siempre viene (requerido por Google).
/// - `viewport` siempre viene en Geocoding, a veces en Place Details.
/// - `bounds` solo viene para entidades con extensión.
/// - `locationType` solo viene en Geocoding results (no en Place Details) —
///   valores: `ROOFTOP`, `RANGE_INTERPOLATED`, `GEOMETRIC_CENTER`,
///   `APPROXIMATE`. Útil para medir confianza del pin.
@freezed
abstract class PlaceGeometryDM with _$PlaceGeometryDM {
  const factory PlaceGeometryDM({
    required PlaceLatLngDM location,
    PlaceBoundsDM? viewport,
    PlaceBoundsDM? bounds,
    @JsonKey(name: 'location_type') String? locationType,
  }) = _PlaceGeometryDM;

  factory PlaceGeometryDM.fromJson(Map<String, dynamic> json) => _$PlaceGeometryDMFromJson(json);
}
