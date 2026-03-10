import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/views/business/reservations/cubit/manage_reservations_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'manage_reservations_cubit.freezed.dart';
part 'manage_reservations_state.dart';

class ManageReservationsCubit extends Cubit<ManageReservationsState> {
  final ReservationRepo _reservationRepo;
  final Logger _logger;
  ManageReservationsVM _vm;

  ManageReservationsCubit({
    required ReservationRepo reservationRepo,
    required Logger logger,
    required String businessUuid,
  })  : _reservationRepo = reservationRepo,
        _logger = logger,
        _vm = ManageReservationsVM(businessUuid: businessUuid),
        super(ManageReservationsState.initial(ManageReservationsVM(businessUuid: businessUuid))) {
    fetchReservations();
  }

  void setStatusFilter(ReservationStatus? status) {
    _vm = _vm.copyWith(statusFilter: status);
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    if (_vm.businessUuid == null) return;

    emit(ManageReservationsState.loading(_vm));

    final result = await _reservationRepo.getBusinessReservations(
      _vm.businessUuid!,
      status: _vm.statusFilter?.name,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          reservations: response.reservations,
          meta: response.meta,
        );
        emit(ManageReservationsState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        emit(ManageReservationsState.error(_vm, error.toString()));
      },
    );
  }

  Future<void> fetchMoreReservations() async {
    if (_vm.isLoadingMore || _vm.businessUuid == null) return;
    if (_vm.meta == null || _vm.meta!.currentPage >= _vm.meta!.lastPage) return;

    _vm = _vm.copyWith(isLoadingMore: true);
    emit(ManageReservationsState.loaded(_vm));

    final nextPage = _vm.meta!.currentPage + 1;

    final result = await _reservationRepo.getBusinessReservations(
      _vm.businessUuid!,
      status: _vm.statusFilter?.name,
      page: nextPage,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          reservations: [..._vm.reservations, ...response.reservations],
          meta: response.meta,
          isLoadingMore: false,
        );
        emit(ManageReservationsState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isLoadingMore: false);
        emit(ManageReservationsState.loaded(_vm));
      },
    );
  }

  Future<bool> confirmReservation(String uuid) async {
    return _performAction(uuid, (uuid) => _reservationRepo.confirmReservation(uuid));
  }

  Future<bool> rejectReservation(String uuid, {String? managerNotes}) async {
    return _performAction(uuid, (uuid) => _reservationRepo.rejectReservation(uuid, managerNotes: managerNotes));
  }

  Future<bool> managerCancelReservation(String uuid, {String? managerNotes}) async {
    return _performAction(uuid, (uuid) => _reservationRepo.managerCancelReservation(uuid, managerNotes: managerNotes));
  }

  Future<bool> markNoShow(String uuid) async {
    return _performAction(uuid, (uuid) => _reservationRepo.markNoShow(uuid));
  }

  Future<bool> markComplete(String uuid) async {
    return _performAction(uuid, (uuid) => _reservationRepo.markComplete(uuid));
  }

  Future<bool> _performAction(
    String uuid,
    Future<dynamic> Function(String) action,
  ) async {
    emit(ManageReservationsState.loading(_vm));

    final result = await action(uuid);

    return result.when(
      success: (response) {
        final ReservationDM? updated = response.reservation;
        if (updated != null) {
          final list = _vm.reservations
              .map((r) => r.reservationUuid == uuid ? updated : r)
              .toList();
          _vm = _vm.copyWith(reservations: list);
        }
        emit(ManageReservationsState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(ManageReservationsState.error(_vm, error.toString()));
        return false;
      },
    );
  }
}
