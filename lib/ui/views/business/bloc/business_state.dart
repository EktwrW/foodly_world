part of 'business_bloc.dart';

@freezed
class BusinessState with _$BusinessState {
  const factory BusinessState.initial(DashboardVM vm) = _Initial;
  const factory BusinessState.loading(DashboardVM vm) = _Loading;
  const factory BusinessState.loaded(DashboardVM vm) = _Loaded;
  const factory BusinessState.error(String msg, DashboardVM vm) = _Error;
  const factory BusinessState.updatingLogo(DashboardVM vm) = _UpdatingLogo;
  const factory BusinessState.updatingMenu(DashboardVM vm) = _UpdatingMenu;
  const factory BusinessState.updatingPictures(DashboardVM vm) = _UpdatingPictures;
  const factory BusinessState.picturesUpdated(DashboardVM vm) = _PicturesUpdated;
  const factory BusinessState.pictureDeleted(DashboardVM vm) = _PictureDeleted;
  const factory BusinessState.editLocation(DashboardVM vm) = _EditLocation;
  const factory BusinessState.locationUpdated(DashboardVM vm) = _LocationUpdated;
  const factory BusinessState.showCoverImagesDialog(DashboardVM vm) = _ShowCoverImagesDialog;
}
