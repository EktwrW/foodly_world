import 'package:json_annotation/json_annotation.dart';

part 'geocoding_reverse_request_dto.g.dart';

/// Payload para `POST /api/geocoding/reverse`.
///
/// Espejo de la validación backend (GeocodingController::reverse):
///   - `lat`      required, -90..90   (double).
///   - `lng`      required, -180..180 (double).
///   - `language` optional, size:2    (BCP-47 2 letras).
///   - `region`   optional, size:2    (ISO 3166-1 alpha-2).
///
/// ¿Por qué POST y no GET?
/// Keep lat/lng fuera de las URL strings de access logs → evita que
/// coordenadas personales queden en logs de Cloud Run / intermediarios.
/// Ver docblock del GeocodingController.
///
/// `@JsonKey(includeIfNull: false)` — mismo razonamiento que
/// PlaceAutocompleteRequestDTO: evita falsos positivos del FormRequest
/// cuando el campo es opcional.
@JsonSerializable(includeIfNull: false)
class GeocodingReverseRequestDTO {
  final double lat;
  final double lng;
  final String? language;
  final String? region;

  const GeocodingReverseRequestDTO({
    required this.lat,
    required this.lng,
    this.language,
    this.region,
  });

  factory GeocodingReverseRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$GeocodingReverseRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingReverseRequestDTOToJson(this);
}
