part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial(DashboardVM vm) = _Initial;
  const factory DashboardState.loading(DashboardVM vm) = _Loading;
  const factory DashboardState.loaded(DashboardVM vm) = _Loaded;
  const factory DashboardState.error(String msg, DashboardVM vm) = _Error;
  const factory DashboardState.updatingLogo(DashboardVM vm) = _UpdatingLogo;
  const factory DashboardState.updatingMenu(DashboardVM vm) = _UpdatingMenu;
  const factory DashboardState.updatingPictures(DashboardVM vm) = _UpdatingPictures;
}
