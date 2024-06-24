part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;
  const factory DashboardEvent.updateLogo(String path) = _UpdateLogo;
  const factory DashboardEvent.editCoverImagesDialog() = _EditCoverImagesDialog;
  const factory DashboardEvent.addPicture(String path) = _AddPicture;
  const factory DashboardEvent.setCategory(FoodlyCategories category) = _SetCategory;
  const factory DashboardEvent.setService(BusinessServices service) = _SetService;
  const factory DashboardEvent.setOpeningHoursDay(int dayIndex, Day day) = _SetOpeningHoursDay;
  const factory DashboardEvent.uploadPictures() = _UploadPictures;
  const factory DashboardEvent.updatePicture(String imageId, String filePath) = _UpdatePicture;
  const factory DashboardEvent.cancelUploadPictures() = _CancelUploadPictures;
  const factory DashboardEvent.deleteCoverImageById(BusinessCoverImageDM coverImageDM) = _DeleteCoverImageById;
  const factory DashboardEvent.cancelDeleteCoverImage() = _CancelDeleteCoverImage;
  const factory DashboardEvent.updateEditing(DashboardEditing editing) = _UpdateEditing;
  const factory DashboardEvent.editLocationDialog() = _EditLocationDialog;
  const factory DashboardEvent.setCountry(FoodlyCountries country) = _SetCountry;
  const factory DashboardEvent.setAddressFromPlacesAPI(Place detail) = _SetAddressFromPlacesAPI;
  const factory DashboardEvent.setMapController(GoogleMapController controller) = _SetMapController;
  const factory DashboardEvent.updateBusiness() = _UpdateBusiness;
}
