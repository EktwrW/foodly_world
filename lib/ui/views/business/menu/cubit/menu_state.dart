part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  const MenuState._();

  const factory MenuState.initial(MenuVM vm) = _Initial;
  const factory MenuState.loading(MenuVM vm) = _Loading;
  const factory MenuState.loaded(MenuVM vm) = _Loaded;
  const factory MenuState.showSnackbar(MenuVM vm, String msg) = _ShowSnackbar;
  const factory MenuState.error(String msg, MenuVM vm) = _Error;

  bool get isLoaded => this is _Loaded;
}
