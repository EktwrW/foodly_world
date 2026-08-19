import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_promo_generation_dm.freezed.dart';
part 'ai_promo_generation_dm.g.dart';

/// Una de las tres artes que devuelve `POST /promotions/ai-generate`.
///
/// El BE genera dos artes distintas del mismo producto —`product` (el
/// producto solo, en pleno servicio) y `people` (el producto siendo
/// disfrutado, sin caras nítidas para evitar las deformidades típicas de la
/// IA)— para que el manager elija. No son dos tiradas del mismo prompt: eso
/// daría dos fotos casi iguales y la elección sería vacía. Ver
/// `ReplicateImageService::generateVariants` en el backend.
@freezed
abstract class AiPromoImageOption with _$AiPromoImageOption {
  const AiPromoImageOption._();

  const factory AiPromoImageOption({
    /// `product` | `people`. Sólo para telemetría y para el label — el FE no
    /// debería ramificar lógica sobre esto.
    @Default('') String look,
    @JsonKey(name: 'image_base64') @Default('') String imageBase64,
  }) = _AiPromoImageOption;

  factory AiPromoImageOption.fromJson(Map<String, dynamic> json) => _$AiPromoImageOptionFromJson(json);

  /// Decodifica el base64. Null si el payload vino corrupto — el caller
  /// descarta esa opción y muestra las que sí sirven.
  Uint8List? get bytes {
    if (imageBase64.isEmpty) return null;
    try {
      return base64Decode(imageBase64);
    } on FormatException {
      return null;
    }
  }
}

/// Respuesta de `POST /promotions/ai-generate`.
///
/// Reemplaza al par de llamadas (texto + imagen) que antes hacía el cliente
/// directamente contra los proveedores. Ambas credenciales viajaban
/// compiladas en el binario vía `--dart-define`, así que la generación se
/// movió entera al BE (2026-08-18).
///
/// Trae el mismo shape de cuota que [AiPromoQuotaResponse] porque el
/// endpoint hace las dos cosas en un solo round-trip: valida el límite y
/// genera. Cuando `granted` es `false` la cuota está agotada y los campos de
/// contenido vienen vacíos.
@freezed
abstract class AiPromoGenerationResponse with _$AiPromoGenerationResponse {
  const AiPromoGenerationResponse._();

  const factory AiPromoGenerationResponse({
    @Default(false) bool granted,
    @Default('') String title,
    @Default('') String subtitle,
    @Default('') String description,

    /// Hasta dos artes. Puede venir con una —o vacía— sin que la generación
    /// se considere fallida: el BE entrega el copy igual porque es lo caro de
    /// rehacer a mano, y una imagen es mejor que un error.
    @Default([]) List<AiPromoImageOption> images,
    @JsonKey(name: 'ai_promo_monthly_limit') @Default(3) int aiPromoMonthlyLimit,
    @JsonKey(name: 'ai_promos_used_this_month') @Default(0) int aiPromosUsedThisMonth,
    @Default(0) int remaining,
    String? message,
  }) = _AiPromoGenerationResponse;

  factory AiPromoGenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$AiPromoGenerationResponseFromJson(json);

  bool get quotaExhausted => !granted && remaining <= 0;

  /// Sólo las opciones cuyo base64 decodifica. Una imagen corrupta no debería
  /// dejar un hueco en el selector.
  List<AiPromoImageOption> get usableImages => images.where((i) => i.bytes != null).toList();
}
