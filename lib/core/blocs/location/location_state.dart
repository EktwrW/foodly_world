part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.checkingLocation() = _CheckingLocation;
  const factory LocationState.locationChecked(LocationDetailsDM locationDM) = _LocationChecked;
  const factory LocationState.locationError(String message) = _LocationError;
  const factory LocationState.serviceDisabled(String message) = _ServiceDisabled;
  const factory LocationState.permissionDenied(String message) = _PermissionDenied;
  const factory LocationState.permissionPermanentlyDenied(String message) = _PermissionPermanentlyDenied;
}
