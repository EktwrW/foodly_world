part of 'promotions_cubit.dart';

@freezed
sealed class PromotionsState with _$PromotionsState {
  const PromotionsState._();
  
  const factory PromotionsState.initial(PromotionsVM vm) = _Initial;
  const factory PromotionsState.loading(PromotionsVM vm) = _Loading;
  const factory PromotionsState.loaded(PromotionsVM vm) = _Loaded;
  const factory PromotionsState.error(String message, PromotionsVM vm) = _Error;
  
  bool get isLoaded => this is _Loaded;
}
