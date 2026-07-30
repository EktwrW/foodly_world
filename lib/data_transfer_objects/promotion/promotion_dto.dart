import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_dto.freezed.dart';
part 'promotion_dto.g.dart';

@freezed
abstract class PromotionDTO with _$PromotionDTO {
  const factory PromotionDTO({
    @JsonKey(name: 'business_uuid') String? businessUuid,
    String? title,
    @JsonKey(name: 'sub_title') String? subTitle,
    String? description,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'expire_date') String? expireDate,
    @Default([Version.regular]) List<Version> versions,
    Prices? prices,
    @JsonKey(name: 'promo_active_days') PromoDaysDM? promoActiveDays,
    bool? available,
    @JsonKey(name: 'media_link') String? mediaLink,
  }) = _PromotionDTO;

  factory PromotionDTO.fromJson(Map<String, dynamic> json) => _$PromotionDTOFromJson(json);
}
