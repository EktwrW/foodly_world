import 'package:json_annotation/json_annotation.dart';

part 'geocoding_forward_request_dto.g.dart';

/// Payload para `POST /api/geocoding/forward`.
///
/// Espejo de la validación backend (GeocodingController::forward):
///   - `query`    required, string min:2 max:300 — dirección free-form.
///   - `language` optional, size:2.
///   - `region`   optional, size:2.
///
/// ¿Cuándo se usa?
/// Fallback para cuando Autocomplete no matchea (negocios en zonas poco
/// cubiertas por Places), o cuando el usuario tipea algo tipo "Casa de
/// mi abuela, Covilhã" y aceptamos lo que Google geocodifique como
/// aproximación.
///
/// Ruta autenticada (auth:sanctum + throttle:places-authed 60/min/user) —
/// no como `reverse` que es pública.
@JsonSerializable(includeIfNull: false)
class GeocodingForwardRequestDTO {
  final String query;
  final String? language;
  final String? region;

  const GeocodingForwardRequestDTO({
    required this.query,
    this.language,
    this.region,
  });

  factory GeocodingForwardRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$GeocodingForwardRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingForwardRequestDTOToJson(this);
}
