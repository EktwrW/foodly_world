part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;
  const factory DashboardEvent.updateLogo(String path) = _UpdateLogo;
  const factory DashboardEvent.editCoverImagesDialog() = _EditCoverImagesDialog;
  const factory DashboardEvent.addPicture(String path) = _AddPicture;
  const factory DashboardEvent.uploadPictures() = _UploadPictures;
  const factory DashboardEvent.cancelUploadPictures() = _CancelUploadPictures;
  const factory DashboardEvent.deleteCoverImageById(BusinessCoverImageDM coverImageDM) = _DeleteCoverImageById;
  const factory DashboardEvent.cancelDeleteCoverImage() = _CancelDeleteCoverImage;
}
