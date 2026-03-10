import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_reservations_vm.freezed.dart';

@freezed
class ManageReservationsVM with _$ManageReservationsVM {
  const factory ManageReservationsVM({
    @Default([]) List<ReservationDM> reservations,
    ReservationsMetaDM? meta,
    ReservationStatus? statusFilter,
    @Default(false) bool isLoadingMore,
    String? businessUuid,
  }) = _ManageReservationsVM;
}
