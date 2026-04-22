import 'package:json_annotation/json_annotation.dart';

part 'place_autocomplete_request_dto.g.dart';

/// Payload para `POST /api/places/autocomplete` (backend Places Proxy).
///
/// Espejo exacto de la validación server-side (ver PlacesController::autocomplete):
///   - `input` (required, min:1, max:200) — lo que el usuario tipeó.
///   - `sessionToken` (optional, max:64) — UUID v4 del lado cliente. Lo mismo
///     en Autocomplete + Details posterior = **una sola sesión** de billing.
///     Sin esto, Google nos cobra per-keystroke en vez de per-session.
///   - `language` (optional, size:2) — BCP-47 2 letras (es, pt, en).
///   - `region` (optional, size:2) — ISO 3166-1 alpha-2 (pt, ar, es).
///   - `components` (optional, max:200) — "country:pt|country:es" para
///     restringir predictions geográficamente.
///   - `location` (optional, lat,lng) — biasing hacia un punto.
///   - `radius` (optional, 1..50000 metros, requiere location).
///   - `types` (optional, max:100) — filtro de Google ("geocode",
///     "establishment", "address", etc.).
///
/// `@JsonKey(includeIfNull: false)` es crítico: sin eso, el DTO manda
/// `"sessionToken": null` y el FormRequest del backend lo considera presente,
/// tripea la regla `nullable|string|max:64` como false positive y el
/// request entero falla con 422. Con `includeIfNull: false`, el campo
/// simplemente no se serializa.
@JsonSerializable(includeIfNull: false)
class PlaceAutocompleteRequestDTO {
  final String input;

  @JsonKey(name: 'sessionToken')
  final String? sessionToken;

  final String? language;
  final String? region;
  final String? components;

  /// Formato "lat,lng" — string, no objeto. El backend valida con regex:
  /// `/^-?\d{1,3}(\.\d+)?,-?\d{1,3}(\.\d+)?$/`. Usar
  /// `LatLngLiteral.toLocationString()` en el call-site para no equivocarse.
  final String? location;

  final int? radius;
  final String? types;

  const PlaceAutocompleteRequestDTO({
    required this.input,
    this.sessionToken,
    this.language,
    this.region,
    this.components,
    this.location,
    this.radius,
    this.types,
  });

  factory PlaceAutocompleteRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceAutocompleteRequestDTOToJson(this);
}
