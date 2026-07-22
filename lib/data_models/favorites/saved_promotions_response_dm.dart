import 'package:foodly_world/core/enums/business_enums.dart' show BusinessStatus;
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_promotions_response_dm.freezed.dart';
part 'saved_promotions_response_dm.g.dart';

@freezed
abstract class SavedPromoBusinessDM with _$SavedPromoBusinessDM {
  const SavedPromoBusinessDM._();

  const factory SavedPromoBusinessDM({
    required String uuid,
    required String name,
    String? logo,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_image_path') String? categoryImagePath,
    @Default('closed') String status, // "open" | "closed" | "opening_soon"
    @JsonKey(name: 'hours_display') String? hoursDisplay,
  }) = _SavedPromoBusinessDM;

  factory SavedPromoBusinessDM.fromJson(Map<String, dynamic> json) =>
      _$SavedPromoBusinessDMFromJson(json);

  /// Same parsing rules as [BusinessDM.currentStatus] — keeps the saved-
  /// promotions card and the regular business card on the same enum
  /// surface for the UI badge.
  BusinessStatus get currentStatus => switch (status) {
        'open' => BusinessStatus.open,
        'opening_soon' => BusinessStatus.openingSoon,
        'closed' => BusinessStatus.closed,
        _ => BusinessStatus.closed,
      };
}

@freezed
abstract class SavedPromotionsResponseDM with _$SavedPromotionsResponseDM {
  const factory SavedPromotionsResponseDM({
    @Default([]) List<NearbyPromotionDM> data,
    @Default([]) List<SavedPromoBusinessDM> businesses,
    SavedPromosMeta? meta,
  }) = _SavedPromotionsResponseDM;

  factory SavedPromotionsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$SavedPromotionsResponseDMFromJson(json);
}

@freezed
abstract class SavedPromosMeta with _$SavedPromosMeta {
  const factory SavedPromosMeta({
    @Default(0) int total,
  }) = _SavedPromosMeta;

  factory SavedPromosMeta.fromJson(Map<String, dynamic> json) =>
      _$SavedPromosMetaFromJson(json);
}
