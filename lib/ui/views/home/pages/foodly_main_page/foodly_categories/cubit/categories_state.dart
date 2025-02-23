part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial(CategoriesVM vm) = _Initial;
  const factory CategoriesState.loading(CategoriesVM vm) = _Loading;
  const factory CategoriesState.loaded(CategoriesVM vm) = _Loaded;
  const factory CategoriesState.error(CategoriesVM vm, String errorMessage) = _Error;
}
