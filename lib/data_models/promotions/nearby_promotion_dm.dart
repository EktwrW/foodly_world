import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_promotion_dm.freezed.dart';
part 'nearby_promotion_dm.g.dart';

/// Lightweight promotion model for the home carousel and saved promotions.
/// Only contains fields needed to render a promo card.
@freezed
abstract class NearbyPromotionDM with _$NearbyPromotionDM {
  const NearbyPromotionDM._();

  const factory NearbyPromotionDM({
    required String uuid,
    required String title,
    @JsonKey(name: 'sub_title') @Default('') String subTitle,
    @JsonKey(name: 'media_link') String? mediaLink,
    @JsonKey(name: 'promo_media') PromoMediaLiteDM? promoMedia,
    @JsonKey(name: 'business_uuid') @Default('') String businessUuid,
    @JsonKey(name: 'business_name') @Default('') String businessName,
    @JsonKey(name: 'business_logo') String? businessLogo,
    @JsonKey(name: 'rating_avg') @Default(0.0) double ratingAvg,
    @JsonKey(name: 'is_favorited') @Default(false) bool isFavorited,
    @JsonKey(name: 'distance_km') double? distanceKm,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'expire_date') DateTime? expireDate,
  }) = _NearbyPromotionDM;

  factory NearbyPromotionDM.fromJson(Map<String, dynamic> json) => _$NearbyPromotionDMFromJson(json);

  bool get hasMedia => promoMedia != null || mediaLink?.isNotEmpty == false;

  /// True if the promo is currently running. Defaults to true when dates are absent.
  bool get isActive {
    if (startDate == null || expireDate == null) return true;
    final now = DateTime.now();
    return !now.isBefore(startDate!) && now.isBefore(expireDate!);
  }

  /// True if the promo hasn't started yet.
  bool get isUpcoming {
    if (startDate == null) return false;
    return DateTime.now().isBefore(startDate!);
  }
}

@freezed
abstract class PromoMediaLiteDM with _$PromoMediaLiteDM {
  const PromoMediaLiteDM._();

  const factory PromoMediaLiteDM({
    required String uuid,
    @JsonKey(name: 'business_promo_media_url') required String mediaUrl,
    @JsonKey(name: 'media_type') @Default('Image') String mediaType,
  }) = _PromoMediaLiteDM;

  factory PromoMediaLiteDM.fromJson(Map<String, dynamic> json) => _$PromoMediaLiteDMFromJson(json);

  bool get isVideo => mediaType.toLowerCase() == 'video';
  bool get isImage => !isVideo;
}

@freezed
abstract class NearbyPromotionsResponseDM with _$NearbyPromotionsResponseDM {
  const factory NearbyPromotionsResponseDM({
    required List<NearbyPromotionDM> data,
    required NearbyPromotionsMeta meta,
  }) = _NearbyPromotionsResponseDM;

  factory NearbyPromotionsResponseDM.fromJson(Map<String, dynamic> json) => _$NearbyPromotionsResponseDMFromJson(json);
}

@freezed
abstract class NearbyPromotionsMeta with _$NearbyPromotionsMeta {
  const factory NearbyPromotionsMeta({
    required int total,
    required int page,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'has_more') required bool hasMore,
    @JsonKey(name: 'max_total') @Default(50) int maxTotal,
    @JsonKey(name: 'radius_km') @Default(10.0) double radiusKm,
  }) = _NearbyPromotionsMeta;

  factory NearbyPromotionsMeta.fromJson(Map<String, dynamic> json) => _$NearbyPromotionsMetaFromJson(json);
}
