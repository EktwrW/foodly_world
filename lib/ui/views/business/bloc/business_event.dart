part of 'business_bloc.dart';

@freezed
class BusinessEvent with _$BusinessEvent {
  const factory BusinessEvent.started() = _Started;
  const factory BusinessEvent.updateLogo(String path) = _UpdateLogo;
  const factory BusinessEvent.editCoverImagesDialog() = _EditCoverImagesDialog;
  const factory BusinessEvent.addPicture(String path) = _AddPicture;
  const factory BusinessEvent.setCategory(FoodlyCategories category) = _SetCategory;
  const factory BusinessEvent.setService(BusinessServices service) = _SetService;
  const factory BusinessEvent.setOpeningHoursDay(int dayIndex, Day day) = _SetOpeningHoursDay;
  const factory BusinessEvent.uploadPictures() = _UploadPictures;
  const factory BusinessEvent.updatePicture(String imageId, String filePath) = _UpdatePicture;
  const factory BusinessEvent.cancelUploadPictures() = _CancelUploadPictures;
  const factory BusinessEvent.deleteCoverImageById(BusinessCoverImageDM coverImageDM) = _DeleteCoverImageById;
  const factory BusinessEvent.cancelDeleteCoverImage() = _CancelDeleteCoverImage;
  const factory BusinessEvent.updateEditing(DashboardEditing editing) = _UpdateEditing;
  const factory BusinessEvent.editLocationDialog() = _EditLocationDialog;
  const factory BusinessEvent.setCountry(FoodlyCountries country) = _SetCountry;
  const factory BusinessEvent.setAddressFromPlacesAPI(Place detail) = _SetAddressFromPlacesAPI;
  const factory BusinessEvent.setMapController(GoogleMapController controller) = _SetMapController;
  const factory BusinessEvent.updateBusiness() = _UpdateBusiness;
}
