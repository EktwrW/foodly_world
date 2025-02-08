part of 'main_drawer_cubit.dart';

@freezed
class MainDrawerState with _$MainDrawerState {
  const factory MainDrawerState.initial(MainDrawerVM vm) = _Initial;
  const factory MainDrawerState.loaded(MainDrawerVM vm) = _Loaded;
  const factory MainDrawerState.openDrawer(MainDrawerVM vm) = _OpenDrawer;
  const factory MainDrawerState.updatingAvatar(MainDrawerVM vm) = _UpdatingAvatar;
  const factory MainDrawerState.error(String msg, MainDrawerVM vm) = _Error;
}
