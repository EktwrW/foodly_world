part of 'business_bloc.dart';

@freezed
class BusinessState with _$BusinessState {
  const factory BusinessState.initial(BusinessVM vm) = _Initial;
  const factory BusinessState.loading(BusinessVM vm) = _Loading;
  const factory BusinessState.loaded(BusinessVM vm) = _Loaded;
  const factory BusinessState.error(String msg, BusinessVM vm) = _Error;
  const factory BusinessState.updatingLogo(BusinessVM vm) = _UpdatingLogo;
  const factory BusinessState.updatingMenu(BusinessVM vm) = _UpdatingMenu;
  const factory BusinessState.updatingPictures(BusinessVM vm) = _UpdatingPictures;
  const factory BusinessState.picturesUpdated(BusinessVM vm) = _PicturesUpdated;
  const factory BusinessState.pictureDeleted(BusinessVM vm) = _PictureDeleted;
  const factory BusinessState.editLocation(BusinessVM vm) = _EditLocation;
  const factory BusinessState.locationUpdated(BusinessVM vm) = _LocationUpdated;
  const factory BusinessState.showCoverImagesDialog(BusinessVM vm) = _ShowCoverImagesDialog;
}
