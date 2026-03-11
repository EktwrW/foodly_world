import 'package:foodly_world/ui/views/home/widgets/top_offers/view_model/nearby_promotions_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_promotions_state.freezed.dart';

@freezed
class NearbyPromotionsState with _$NearbyPromotionsState {
  const factory NearbyPromotionsState.initial(NearbyPromotionsVM vm) = _Initial;
  const factory NearbyPromotionsState.loading(NearbyPromotionsVM vm) = _Loading;
  const factory NearbyPromotionsState.loaded(NearbyPromotionsVM vm) = _Loaded;
  const factory NearbyPromotionsState.loadingMore(NearbyPromotionsVM vm) = _LoadingMore;
  const factory NearbyPromotionsState.error(NearbyPromotionsVM vm, String message) = _Error;
}
