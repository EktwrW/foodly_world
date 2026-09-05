import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/data_models/business/business_dm.dart';

part 'promotion_dm.freezed.dart';
part 'promotion_dm.g.dart';

@freezed
abstract class PromotionsResponse with _$PromotionsResponse {
  const factory PromotionsResponse({
    @JsonKey(name: 'business_promotions') required List<PromotionDM> promotions,
  }) = _PromotionsResponse;

  factory PromotionsResponse.fromJson(Map<String, dynamic> json) => _$PromotionsResponseFromJson(json);
}

@JsonSerializable()
class Base64Converter extends JsonConverter<Uint8List?, String?> {
  const Base64Converter();

  @override
  Uint8List? fromJson(String? json) => json != null ? base64.decode(json) : null;

  @override
  String? toJson(Uint8List? object) => object != null ? base64.encode(object) : null;
}

@freezed
abstract class PromotionDM with _$PromotionDM {
  const PromotionDM._();

  factory PromotionDM({
    required int id,
    required String uuid,
    required String title,
    @JsonKey(name: 'sub_title') @Default('') String subTitle,
    required String description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'expire_date') required DateTime expireDate,
    required BusinessDM? business,
    @Default([Version.regular]) List<Version> versions,
    Prices? prices,
    @JsonKey(name: 'favorites_count') @Default(0) int favoritesCount,
    @JsonKey(name: 'media_link') String? mediaLink,
    @JsonKey(name: 'business_promo_reference_media') @Default([]) List<PromoMediaDM> promoMedia,
    @JsonKey(name: 'promo_active_days') required PromoDaysDM promoDays,
    @JsonKey(name: 'followers_length') @Default(0) int followersLength,
  }) = _PromotionDM;

  factory PromotionDM.fromJson(Map<String, dynamic> json) => _$PromotionDMFromJson(json);

  List<Version> get sortedVersions => versions.map((v) => Version.values.firstWhere((e) => e == v)).toList()
    ..sort((a, b) => a.index.compareTo(b.index));

  bool get mediaFileIsExternalLink => mediaLink?.isNotEmpty ?? false;
  bool get mediaFileIsImage => !mediaFileIsExternalLink && (promoMedia.isNotEmpty) && (promoMedia.first.isImage);
  bool get mediaFileIsVideo => !mediaFileIsExternalLink && (promoMedia.isNotEmpty) && (promoMedia.first.isVideo);

  String get mediaFileUrl {
    if (mediaFileIsExternalLink) return mediaLink!;
    if (promoMedia.isEmpty) return '';

    return promoMedia.first.mediaUrl;
  }

  /// LAS TRES SE COMPARAN POR DÍA DE CALENDARIO, NO POR INSTANTE.
  ///
  /// Es la regla del backend (`whereDate` en `NearbyPromotionsController`):
  /// una promo vale desde el primer minuto de su día de inicio hasta el último
  /// de su día de fin. Con comparación por instante, una promo que vencía
  /// "hoy" se daba por terminada a las 00:00 de ese mismo día: seguía saliendo
  /// en la home —que la filtra el backend— y no aparecía en promociones
  /// guardadas ni en las pestañas de promos, que la filtraban acá.
  bool get isActive {
    final today = DateTime.now().dateOnly;

    return !today.isBefore(startDate.dateOnly) && !today.isAfter(expireDate.dateOnly);
  }

  /// Empieza en un día posterior a hoy.
  bool get isUpcoming => startDate.dateOnly.isAfter(DateTime.now().dateOnly);

  /// Terminó en un día anterior a hoy.
  bool get isExpired => expireDate.dateOnly.isBefore(DateTime.now().dateOnly);
}

@JsonEnum()
enum MediaType {
  @JsonValue('Unknown')
  unknown,
  @JsonValue('Image')
  image,
  @JsonValue('Video')
  video;

  bool get mediaFileIsVideo => this == video;
}

@freezed
abstract class PromoMediaDM with _$PromoMediaDM {
  const PromoMediaDM._();

  const factory PromoMediaDM({
    required int id,
    required String uuid,
    @JsonKey(name: 'business_promo_media_url') required String mediaUrl,
    @JsonKey(name: 'business_promo_item_id') required int promoItemId,
    @JsonKey(name: 'media_type') required MediaType mediaType,
  }) = _PromoMediaDM;

  factory PromoMediaDM.fromJson(Map<String, dynamic> json) => _$PromoMediaDMFromJson(json);

  bool get isImage => mediaType == MediaType.image;
  bool get isVideo => mediaType == MediaType.video;
}

@freezed
abstract class PromoDaysDM with _$PromoDaysDM {
  const PromoDaysDM._();

  const factory PromoDaysDM({
    @JsonKey(name: 'day_0') @Default(false) bool sunday,
    @JsonKey(name: 'day_1') @Default(false) bool monday,
    @JsonKey(name: 'day_2') @Default(false) bool tuesday,
    @JsonKey(name: 'day_3') @Default(false) bool wednesday,
    @JsonKey(name: 'day_4') @Default(false) bool thursday,
    @JsonKey(name: 'day_5') @Default(false) bool friday,
    @JsonKey(name: 'day_6') @Default(false) bool saturday,
  }) = _PromoDaysDM;

  factory PromoDaysDM.fromJson(Map<String, dynamic> json) => _$PromoDaysDMFromJson(json);

  bool get hasAnyDay => sunday || monday || tuesday || wednesday || thursday || friday || saturday;

  /// Los siete días con su etiqueta corta y si la promo aplica ese día.
  ///
  /// Antes esto devolvía solo los activos y la card los pintaba en un `Wrap`
  /// de chips con `minWidth: 54`: siete no entran en una fila de 390 dp y
  /// caían 6 + 1, con el último suelto y centrado. Devolviendo los siete, la
  /// card dibuja una fila fija de 7 que no envuelve nunca, y de paso se ve
  /// qué días NO aplica la promo, que es la misma información.
  List<({String label, bool isActive})> get allDays => [
        (label: S.current.weekdayShort1, isActive: sunday),
        (label: S.current.weekdayShort2, isActive: monday),
        (label: S.current.weekdayShort3, isActive: tuesday),
        (label: S.current.weekdayShort4, isActive: wednesday),
        (label: S.current.weekdayShort5, isActive: thursday),
        (label: S.current.weekdayShort6, isActive: friday),
        (label: S.current.weekdayShort7, isActive: saturday),
      ];
}

@freezed
abstract class PromoGenerationResponse with _$PromoGenerationResponse {
  const factory PromoGenerationResponse({
    required String title,
    required String subtitle,
    required String description,
    @Base64Converter() Uint8List? imageBytes,
  }) = _PromoGenerationResponse;

  factory PromoGenerationResponse.fromJson(Map<String, dynamic> json) => _$PromoGenerationResponseFromJson(json);
}

@freezed
abstract class PromoMediaResponse with _$PromoMediaResponse {
  const factory PromoMediaResponse({
    @JsonKey(name: 'business_promo_reference_media') required List<PromoMediaDM> promoMedia,
  }) = _PromoMediaResponse;

  factory PromoMediaResponse.fromJson(Map<String, dynamic> json) => _$PromoMediaResponseFromJson(json);
}
