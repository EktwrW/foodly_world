import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/service_events_tracker.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/views/reservations/cubit/my_reservations_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'my_reservations_cubit.freezed.dart';
part 'my_reservations_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  final ReservationRepo _reservationRepo;
  final Logger _logger;
  MyReservationsVM _vm;

  MyReservationsCubit({
    required ReservationRepo reservationRepo,
    required Logger logger,
  })  : _reservationRepo = reservationRepo,
        _logger = logger,
        _vm = const MyReservationsVM(),
        super(const MyReservationsState.initial(MyReservationsVM()));

  void setStatusFilter(ReservationStatus? status) {
    _vm = _vm.copyWith(statusFilter: status);
    fetchReservations();
  }

  void setBookingTypeFilter(BookingType? bookingType) {
    _vm = _vm.copyWith(bookingTypeFilter: bookingType);
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    emit(MyReservationsState.loading(_vm));

    final result = await _reservationRepo.getMyReservations(
      status: _vm.statusFilter?.name,
      bookingType: _vm.bookingTypeFilter?.name,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          reservations: response.reservations,
          meta: response.meta,
        );
        emit(MyReservationsState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        emit(MyReservationsState.error(_vm, error.toString()));
      },
    );
  }

  Future<void> fetchMoreReservations() async {
    if (_vm.isLoadingMore) return;
    if (_vm.meta == null || _vm.meta!.currentPage >= _vm.meta!.lastPage) return;

    _vm = _vm.copyWith(isLoadingMore: true);
    emit(MyReservationsState.loaded(_vm));

    final nextPage = _vm.meta!.currentPage + 1;

    final result = await _reservationRepo.getMyReservations(
      status: _vm.statusFilter?.name,
      bookingType: _vm.bookingTypeFilter?.name,
      page: nextPage,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          reservations: [..._vm.reservations, ...response.reservations],
          meta: response.meta,
          isLoadingMore: false,
        );
        emit(MyReservationsState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isLoadingMore: false);
        emit(MyReservationsState.loaded(_vm));
      },
    );
  }

  Future<bool> cancelReservation(String uuid) async {
    emit(MyReservationsState.loading(_vm));

    final result = await _reservationRepo.cancelReservation(uuid);

    return result.when(
      success: (response) {
        if (response.reservation != null) {
          final updated = _vm.reservations
              .map((r) => r.reservationUuid == uuid ? response.reservation! : r)
              .toList();
          _vm = _vm.copyWith(reservations: updated);
        }
        emit(MyReservationsState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(MyReservationsState.error(_vm, error.toString()));
        return false;
      },
    );
  }

  Future<bool> approveQuote(String uuid) async {
    emit(MyReservationsState.loading(_vm));

    final result = await _reservationRepo.approveQuote(uuid);

    return result.when(
      success: (response) {
        if (response.reservation != null) {
          final updated = _vm.reservations
              .map((r) => r.reservationUuid == uuid ? response.reservation! : r)
              .toList();
          _vm = _vm.copyWith(reservations: updated);
        }
        // service.booking_succeeded — fired the moment the customer
        // approves the chef's quote, which is what flips the reservation
        // to `confirmed`. Tracked here (cliente-side, explicit action)
        // rather than from a `serviceQuoteApproved` notification on the
        // chef's side, so the funnel ID chain stays in the customer's
        // session and Mateo can compute end-to-end conversion. Only fires
        // for service bookings since approve-quote is a service-only flow.
        final approved = response.reservation;
        if (approved != null && approved.isServiceBooking) {
          di<ServiceEventsTracker>().bookingSucceeded(
            reservationUuid: uuid,
            businessUuid: approved.businessUuid ?? '',
            sourceModule: 'MyReservationsCubit',
          );
        }
        emit(MyReservationsState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(MyReservationsState.error(_vm, error.toString()));
        return false;
      },
    );
  }

  Future<bool> rejectQuote(String uuid, {String? rejectionReason}) async {
    emit(MyReservationsState.loading(_vm));

    final result = await _reservationRepo.rejectQuote(uuid, rejectionReason: rejectionReason);

    return result.when(
      success: (response) {
        if (response.reservation != null) {
          final updated = _vm.reservations
              .map((r) => r.reservationUuid == uuid ? response.reservation! : r)
              .toList();
          _vm = _vm.copyWith(reservations: updated);
        }
        emit(MyReservationsState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(MyReservationsState.error(_vm, error.toString()));
        return false;
      },
    );
  }
}
