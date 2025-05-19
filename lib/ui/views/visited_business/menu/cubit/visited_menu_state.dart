part of 'visited_menu_cubit.dart';

@freezed
class VisitedMenuState with _$VisitedMenuState {
  const VisitedMenuState._();

  const factory VisitedMenuState.initial(MenuVM vm) = _Initial;
  const factory VisitedMenuState.loading(MenuVM vm) = _Loading;
  const factory VisitedMenuState.loaded(MenuVM vm) = _Loaded;
  const factory VisitedMenuState.showSnackbar(MenuVM vm, String msg) = _ShowSnackbar;
  const factory VisitedMenuState.error(String msg, MenuVM vm) = _Error;

  bool get isLoaded => this is _Loaded;
}
