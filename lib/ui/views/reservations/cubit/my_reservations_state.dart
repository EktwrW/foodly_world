part of 'my_reservations_cubit.dart';

@freezed
sealed class MyReservationsState with _$MyReservationsState {
  const factory MyReservationsState.initial(MyReservationsVM vm) = _Initial;
  const factory MyReservationsState.loading(MyReservationsVM vm) = _Loading;
  const factory MyReservationsState.loaded(MyReservationsVM vm) = _Loaded;
  const factory MyReservationsState.error(MyReservationsVM vm, String message) = _Error;
}
