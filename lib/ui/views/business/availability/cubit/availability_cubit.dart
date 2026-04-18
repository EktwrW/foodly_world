import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/business_availability/business_availability_repo.dart';
import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'availability_cubit.freezed.dart';
part 'availability_state.dart';

/// Cubit for the manager's availability calendar (Catering & Chefs vertical).
///
/// Lifecycle: instantiated per-route with the current business uuid. The UI
/// is responsible for calling [fetchRange] when the calendar decides which
/// window to display (typically on mount + when the user scrolls between
/// months). All mutations (block / bulk / update / delete) emit `saving`
/// → `saved|deleted|error` → `loaded` in that order so the widget layer
/// can show snackbars via a BlocListener.
class AvailabilityCubit extends Cubit<AvailabilityState> {
  final BusinessAvailabilityRepo _repo;
  final Logger _logger;
  AvailabilityVM _vm;

  AvailabilityCubit({
    required BusinessAvailabilityRepo repo,
    required Logger logger,
    required String businessUuid,
  })  : _repo = repo,
        _logger = logger,
        _vm = AvailabilityVM(businessUuid: businessUuid),
        super(AvailabilityState.initial(AvailabilityVM(businessUuid: businessUuid)));

  // ── Fetch ──────────────────────────────────────────────────────

  /// Loads the calendar entries for [from, to] (both inclusive, dates only).
  /// Replaces the currently-loaded entries in VM on success.
  Future<void> fetchRange(DateTime from, DateTime to) async {
    if (_vm.businessUuid == null || _vm.businessUuid!.isEmpty) return;

    _vm = _vm.copyWith(dateFrom: from, dateTo: to);
    emit(AvailabilityState.loading(_vm));

    final result = await _repo.getBusinessAvailability(
      _vm.businessUuid!,
      from: _formatDate(from),
      to: _formatDate(to),
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(entries: response.availability);
        emit(AvailabilityState.loaded(_vm));
      },
      failure: (error) {
        _logger.e(error);
        emit(AvailabilityState.error(_vm, error.toString()));
      },
    );
  }

  /// Re-fetches the currently-loaded window. Useful after mutations to
  /// stay in sync with auto-reservation rows the BE may have added.
  Future<void> refresh() async {
    if (_vm.dateFrom == null || _vm.dateTo == null) return;
    await fetchRange(_vm.dateFrom!, _vm.dateTo!);
  }

  // ── Mutations ──────────────────────────────────────────────────

  /// Creates a single block (full-day or partial). Returns true on success.
  Future<bool> blockDate({
    required DateTime date,
    required bool isFullDay,
    String? startTime,
    String? endTime,
    String? reason,
  }) async {
    if (_vm.businessUuid == null || _vm.businessUuid!.isEmpty) return false;

    _vm = _vm.copyWith(isSaving: true);
    emit(AvailabilityState.saving(_vm));

    final result = await _repo.createAvailability(
      businessUuid: _vm.businessUuid!,
      date: _formatDate(date),
      isFullDay: isFullDay,
      startTime: startTime,
      endTime: endTime,
      reason: reason,
    );

    return result.when(
      success: (response) {
        if (response.availability != null) {
          _vm = _vm.copyWith(
            entries: [..._vm.entries, response.availability!],
            isSaving: false,
          );
        } else {
          _vm = _vm.copyWith(isSaving: false);
        }
        emit(AvailabilityState.saved(_vm, ''));
        emit(AvailabilityState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSaving: false);
        emit(AvailabilityState.error(_vm, error.toString()));
        emit(AvailabilityState.loaded(_vm));
        return false;
      },
    );
  }

  /// Bulk-blocks a list of dates in one round-trip (e.g. vacation range).
  Future<bool> blockBulk({
    required List<BusinessAvailabilityBulkEntryDM> entries,
    String? reason,
  }) async {
    if (_vm.businessUuid == null || _vm.businessUuid!.isEmpty) return false;
    if (entries.isEmpty) return false;

    _vm = _vm.copyWith(isSaving: true);
    emit(AvailabilityState.saving(_vm));

    final result = await _repo.createBulkAvailability(
      businessUuid: _vm.businessUuid!,
      entries: entries,
      reason: reason,
    );

    return result.when(
      success: (response) {
        _vm = _vm.copyWith(
          entries: [..._vm.entries, ...response.availability],
          isSaving: false,
        );
        emit(AvailabilityState.saved(_vm, ''));
        emit(AvailabilityState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSaving: false);
        emit(AvailabilityState.error(_vm, error.toString()));
        emit(AvailabilityState.loaded(_vm));
        return false;
      },
    );
  }

  /// Updates an existing manual entry. Auto-reservation rows return 403 on
  /// the BE and will surface as an `error` state.
  Future<bool> updateEntry(
    String uuid, {
    DateTime? date,
    bool? isFullDay,
    String? startTime,
    String? endTime,
    String? reason,
  }) async {
    _vm = _vm.copyWith(isSaving: true);
    emit(AvailabilityState.saving(_vm));

    final result = await _repo.updateAvailability(
      uuid,
      date: date != null ? _formatDate(date) : null,
      isFullDay: isFullDay,
      startTime: startTime,
      endTime: endTime,
      reason: reason,
    );

    return result.when(
      success: (response) {
        if (response.availability != null) {
          final updated = response.availability!;
          _vm = _vm.copyWith(
            entries: _vm.entries
                .map((e) => e.availabilityUuid == uuid ? updated : e)
                .toList(growable: false),
            isSaving: false,
          );
        } else {
          _vm = _vm.copyWith(isSaving: false);
        }
        emit(AvailabilityState.saved(_vm, ''));
        emit(AvailabilityState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSaving: false);
        emit(AvailabilityState.error(_vm, error.toString()));
        emit(AvailabilityState.loaded(_vm));
        return false;
      },
    );
  }

  /// Removes an existing manual entry (manager override only — auto rows
  /// are read-only and the BE returns 403).
  Future<bool> deleteEntry(String uuid) async {
    _vm = _vm.copyWith(isDeleting: true);
    emit(AvailabilityState.saving(_vm));

    final result = await _repo.destroyAvailability(uuid);

    return result.when(
      success: (response) {
        _vm = _vm.copyWith(
          entries: _vm.entries
              .where((e) => e.availabilityUuid != uuid)
              .toList(growable: false),
          isDeleting: false,
        );
        emit(AvailabilityState.deleted(_vm, response.message));
        emit(AvailabilityState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isDeleting: false);
        emit(AvailabilityState.error(_vm, error.toString()));
        emit(AvailabilityState.loaded(_vm));
        return false;
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────

  /// Formats [date] as `YYYY-MM-DD` — the shape expected by every endpoint.
  String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
