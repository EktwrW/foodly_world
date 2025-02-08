part of 'check_availabilities_cubit.dart';

@freezed
class CheckAvailabilitiesState with _$CheckAvailabilitiesState {
  const factory CheckAvailabilitiesState.initial() = _Initial;
  const factory CheckAvailabilitiesState.loading() = _Loading;
  const factory CheckAvailabilitiesState.available() = _Available;
  const factory CheckAvailabilitiesState.unavailable() = _Unavailable;
  const factory CheckAvailabilitiesState.error(String message) = _Error;
}
