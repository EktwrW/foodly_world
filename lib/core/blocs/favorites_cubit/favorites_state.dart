part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial(FavoritesVM vm) = _Initial;
  const factory FavoritesState.loading(FavoritesVM vm) = _Loading;
  const factory FavoritesState.loaded(FavoritesVM vm) = _Loaded;
  const factory FavoritesState.error(FavoritesVM vm, String errorMessage) = _Error;
}
