import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_reservations_vm.freezed.dart';

@freezed
class MyReservationsVM with _$MyReservationsVM {
  const factory MyReservationsVM({
    @Default([]) List<ReservationDM> reservations,
    ReservationsMetaDM? meta,
    ReservationStatus? statusFilter,
    @Default(false) bool isLoadingMore,
  }) = _MyReservationsVM;
}
