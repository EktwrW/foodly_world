import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction_dm.freezed.dart';
part 'place_prediction_dm.g.dart';

/// Item de la lista `predictions` que devuelve Places Autocomplete.
///
/// No incluye coordenadas — para obtenerlas hay que hacer un segundo call
/// a `/places/details/{placeId}` (misma sessionToken que el Autocomplete,
/// para que Google lo cobre como 1 sesión, no 2).
///
/// `structured_formatting` de Google separa la descripción en:
///   - `main_text` (nombre del lugar o primera línea)
///   - `secondary_text` (resto de la dirección)
/// Útil para UIs que quieren renderizar el nombre en bold y la dirección
/// en un peso menor.
@freezed
class PlacePredictionDM with _$PlacePredictionDM {
  const factory PlacePredictionDM({
    @JsonKey(name: 'place_id') required String placeId,
    required String description,
    @JsonKey(name: 'structured_formatting') PlaceStructuredFormattingDM? structuredFormatting,
    @Default(<String>[]) List<String> types,
  }) = _PlacePredictionDM;

  factory PlacePredictionDM.fromJson(Map<String, dynamic> json) => _$PlacePredictionDMFromJson(json);
}

@freezed
class PlaceStructuredFormattingDM with _$PlaceStructuredFormattingDM {
  const factory PlaceStructuredFormattingDM({
    @JsonKey(name: 'main_text') String? mainText,
    @JsonKey(name: 'secondary_text') String? secondaryText,
  }) = _PlaceStructuredFormattingDM;

  factory PlaceStructuredFormattingDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceStructuredFormattingDMFromJson(json);
}
