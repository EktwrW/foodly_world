part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.checkLocation() = _CheckLocation;
  const factory LocationEvent.setManualLocation(LocationDetailsDM locationDM) = _SetManualLocation;
}
