part of 'manage_reservations_cubit.dart';

@freezed
sealed class ManageReservationsState with _$ManageReservationsState {
  const factory ManageReservationsState.initial(ManageReservationsVM vm) = _Initial;
  const factory ManageReservationsState.loading(ManageReservationsVM vm) = _Loading;
  const factory ManageReservationsState.loaded(ManageReservationsVM vm) = _Loaded;
  const factory ManageReservationsState.error(ManageReservationsVM vm, String message) = _Error;
}
