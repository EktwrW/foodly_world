part of 'availability_cubit.dart';

/// Union state for the manager's availability calendar.
///
/// Every variant carries the current [AvailabilityVM] so the widget layer
/// can render from a single consistent snapshot regardless of the variant.
/// Error/saved/deleted variants add a message for snackbar consumption.
@freezed
class AvailabilityState with _$AvailabilityState {
  const factory AvailabilityState.initial(AvailabilityVM vm) = _Initial;
  const factory AvailabilityState.loading(AvailabilityVM vm) = _Loading;
  const factory AvailabilityState.loaded(AvailabilityVM vm) = _Loaded;
  const factory AvailabilityState.saving(AvailabilityVM vm) = _Saving;
  const factory AvailabilityState.saved(AvailabilityVM vm, String message) = _Saved;
  const factory AvailabilityState.deleted(AvailabilityVM vm, String message) = _Deleted;
  const factory AvailabilityState.error(AvailabilityVM vm, String message) = _Error;
}
