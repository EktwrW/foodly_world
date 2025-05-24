part of 'saved_promotions_view_cubit.dart';

@freezed
class SavedPromotionsViewState with _$SavedPromotionsViewState {
  const factory SavedPromotionsViewState.initial(SavedPromotionsViewVM vm) = _Initial;
  const factory SavedPromotionsViewState.changeView(SavedPromotionsViewVM vm) = _ChangeView;
}
