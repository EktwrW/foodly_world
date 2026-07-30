import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_promotions_vm.freezed.dart';

@freezed
abstract class NearbyPromotionsVM with _$NearbyPromotionsVM {
  const factory NearbyPromotionsVM({
    @Default([]) List<NearbyPromotionDM> promotions,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMore,
    @Default(1) int currentPage,
    String? error,
  }) = _NearbyPromotionsVM;
}
