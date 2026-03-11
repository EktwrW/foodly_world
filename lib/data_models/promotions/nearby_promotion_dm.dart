import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_promotion_dm.freezed.dart';
part 'nearby_promotion_dm.g.dart';

/// Lightweight promotion model for the home carousel feed.
/// Only contains fields needed to render a promo card.
@freezed
class NearbyPromotionDM with _$NearbyPromotionDM {
  const factory NearbyPromotionDM({
    required String uuid,
    required String title,
    @JsonKey(name: 'sub_title') @Default('') String subTitle,
    @JsonKey(name: 'media_link') String? mediaLink,
    @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
    @JsonKey(name: 'business_uuid') required String businessUuid,
    @JsonKey(name: 'business_name') required String businessName,
    @JsonKey(name: 'business_logo') String? businessLogo,
    @JsonKey(name: 'rating_avg') @Default(0.0) double ratingAvg,
    @JsonKey(name: 'is_favorited') @Default(false) bool isFavorited,
    @JsonKey(name: 'distance_km') double? distanceKm,
  }) = _NearbyPromotionDM;

  factory NearbyPromotionDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionDMFromJson(json);
}

@freezed
class PromoMediaLiteDM with _$PromoMediaLiteDM {
  const PromoMediaLiteDM._();

  const factory PromoMediaLiteDM({
    required String uuid,
    @JsonKey(name: 'business_promo_media_url') required String mediaUrl,
    @JsonKey(name: 'media_type') @Default('Image') String mediaType,
  }) = _PromoMediaLiteDM;

  factory PromoMediaLiteDM.fromJson(Map<String, dynamic> json) =>
      _$PromoMediaLiteDMFromJson(json);

  bool get isVideo => mediaType.toLowerCase() == 'video';
  bool get isImage => !isVideo;
}

@freezed
class NearbyPromotionsResponseDM with _$NearbyPromotionsResponseDM {
  const factory NearbyPromotionsResponseDM({
    required List<NearbyPromotionDM> data,
    required NearbyPromotionsMeta meta,
  }) = _NearbyPromotionsResponseDM;

  factory NearbyPromotionsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionsResponseDMFromJson(json);
}

@freezed
class NearbyPromotionsMeta with _$NearbyPromotionsMeta {
  const factory NearbyPromotionsMeta({
    required int total,
    required int page,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'has_more') required bool hasMore,
    @JsonKey(name: 'max_total') @Default(50) int maxTotal,
    @JsonKey(name: 'radius_km') @Default(10.0) double radiusKm,
  }) = _NearbyPromotionsMeta;

  factory NearbyPromotionsMeta.fromJson(Map<String, dynamic> json) =>
      _$NearbyPromotionsMetaFromJson(json);
}
