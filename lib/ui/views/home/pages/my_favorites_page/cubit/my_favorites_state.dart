part of 'my_favorites_cubit.dart';

@freezed
class MyFavoritesState with _$MyFavoritesState {
  const factory MyFavoritesState.initial(MyFavoritesVM vm) = _Initial;
  const factory MyFavoritesState.loading(MyFavoritesVM vm) = _Loading;
  const factory MyFavoritesState.loaded(MyFavoritesVM vm) = _Loaded;
  const factory MyFavoritesState.error(MyFavoritesVM vm, String errorMessage) = _Error;
}