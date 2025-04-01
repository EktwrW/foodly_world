part of 'manage_menu_cubit.dart';

@freezed
class ManageMenuState with _$ManageMenuState {
  const ManageMenuState._();

  const factory ManageMenuState.initial(ManageMenuVM vm) = _Initial;
  const factory ManageMenuState.loading(ManageMenuVM vm) = _Loading;
  const factory ManageMenuState.loaded(ManageMenuVM vm) = _Loaded;
  const factory ManageMenuState.showSnackbar(ManageMenuVM vm, String msg) = _ShowSnackbar;
  const factory ManageMenuState.error(String msg, ManageMenuVM vm) = _Error;

  bool get isLoaded => this is _Loaded;
}
