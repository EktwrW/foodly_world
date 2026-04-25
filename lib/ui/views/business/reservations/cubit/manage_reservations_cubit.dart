import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
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

  /// Unified filter key used by the dropdown.
  /// `null` = all, `'today'` = today's reservations,
  /// otherwise matches a [ReservationStatus] name (e.g. `'pending'`).
  String? _activeFilterKey;

  String? get activeFilterKey => _activeFilterKey;

  /// Derive the booking-type filter from the business's vertical. Today
  /// every business handles exactly one booking_type:
  /// - Catering & Chefs → BOOKING_SERVICE (only service-package bookings)
  /// - Everyone else    → BOOKING_TABLE (traditional table reservations)
  ///
  /// We set this implicitly at construction so the UI doesn't need a
  /// visible filter (which was confusing: it looked like the user could
  /// switch, but there was nothing on the other side). When the
  /// category is unknown (e.g. navigated without `extra: currentBusiness`)
  /// we send no filter and let the BE return whatever exists — fail-open.
  static BookingType? _deriveBookingType(FoodlyCategories? category) {
    if (category == null) return null;
    return category.isCateringOrChefs ? BookingType.service : BookingType.table;
  }

  ManageReservationsCubit({
    required ReservationRepo reservationRepo,
    required Logger logger,
    required String businessUuid,
    FoodlyCategories? businessCategory,
    String? initialFilter,
  })  : _reservationRepo = reservationRepo,
        _logger = logger,
        _activeFilterKey = initialFilter,
        _vm = ManageReservationsVM(
          businessUuid: businessUuid,
          statusFilter: initialFilter != null && initialFilter != 'today'
              ? ReservationStatus.values.where((s) => s.name == initialFilter).firstOrNull
              : null,
          bookingTypeFilter: _deriveBookingType(businessCategory),
        ),
        super(ManageReservationsState.initial(ManageReservationsVM(
          businessUuid: businessUuid,
          bookingTypeFilter: _deriveBookingType(businessCategory),
        ))) {
    fetchReservations();
  }

  void setFilter(String? filterKey) {
    _activeFilterKey = filterKey;
    if (filterKey == null || filterKey == 'today') {
      _vm = _vm.copyWith(statusFilter: null);
    } else {
      final status = ReservationStatus.values.where((s) => s.name == filterKey).firstOrNull;
      _vm = _vm.copyWith(statusFilter: status);
    }
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    if (_vm.businessUuid == null) return;

    emit(ManageReservationsState.loading(_vm));

    final result = await _reservationRepo.getBusinessReservations(
      _vm.businessUuid!,
      status: _vm.statusFilter?.name,
      date: _activeFilterKey == 'today' ? 'today' : null,
      bookingType: _vm.bookingTypeFilter?.name,
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
      date: _activeFilterKey == 'today' ? 'today' : null,
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

  Future<bool> sendQuote(String uuid, {required double quotedAmount, String? managerNotes}) async {
    return _performAction(
      uuid,
      (uuid) => _reservationRepo.sendQuote(uuid, quotedAmount: quotedAmount, managerNotes: managerNotes),
    );
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
