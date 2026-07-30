part of 'check_availabilities_cubit.dart';

@freezed
sealed class CheckAvailabilitiesState with _$CheckAvailabilitiesState {
  const CheckAvailabilitiesState._();

  const factory CheckAvailabilitiesState.initial() = _Initial;
  const factory CheckAvailabilitiesState.loading() = _Loading;
  const factory CheckAvailabilitiesState.available() = _Available;
  const factory CheckAvailabilitiesState.unavailable() = _Unavailable;
  const factory CheckAvailabilitiesState.error(String message) = _Error;

  bool get isNotInitialState => this is! _Initial;
  bool get isInitialState => this is _Initial;
  bool get isAvailable => this is _Available;
  bool get isUnavailable => this is _Unavailable;
  bool get isLoading => this is _Loading;
}
