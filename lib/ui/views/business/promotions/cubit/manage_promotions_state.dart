part of 'manage_promotions_cubit.dart';

@freezed
class ManagePromotionsState with _$ManagePromotionsState {
  const factory ManagePromotionsState.initial(ManagePromotionsVM vm) = _Initial;
  const factory ManagePromotionsState.loading(ManagePromotionsVM vm) = _Loading;
  const factory ManagePromotionsState.loaded(ManagePromotionsVM vm) = _Loaded;
  const factory ManagePromotionsState.error(String message, ManagePromotionsVM vm) = _Error;
  const factory ManagePromotionsState.aiQuotaExhausted(ManagePromotionsVM vm) = _AiQuotaExhausted;
}
