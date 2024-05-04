part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.checkingLocation() = _CheckingLocation;
  const factory LocationState.locationChecked(LocationDetailsDM locationDM) = _LocationChecked;
}
