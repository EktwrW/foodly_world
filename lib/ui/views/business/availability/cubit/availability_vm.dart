import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability_vm.freezed.dart';

/// View model for the manager's availability calendar (Catering & Chefs vertical).
///
/// Holds the currently-loaded calendar window plus in-flight flags. The
/// cubit updates this VM and emits it inside each state variant so the
/// widgets can read a single consistent snapshot.
@freezed
abstract class AvailabilityVM with _$AvailabilityVM {
  const AvailabilityVM._();

  const factory AvailabilityVM({
    String? businessUuid,
    DateTime? dateFrom,
    DateTime? dateTo,
    @Default([]) List<BusinessAvailabilityDM> entries,
    @Default(false) bool isSaving,
    @Default(false) bool isDeleting,
  }) = _AvailabilityVM;

  // ── Derived helpers ──────────────────────────────────────────

  /// Manual entries the manager can freely edit or delete.
  List<BusinessAvailabilityDM> get manualEntries =>
      entries.where((e) => e.isManual).toList(growable: false);

  /// Entries auto-created from confirmed reservations (read-only in UI).
  List<BusinessAvailabilityDM> get autoReservationEntries =>
      entries.where((e) => e.isAutoReservation).toList(growable: false);

  /// Returns every entry that falls on [date] (ignoring time component).
  /// Entries with a null `date` are skipped defensively.
  List<BusinessAvailabilityDM> entriesForDate(DateTime date) {
    final target = DateTime(date.year, date.month, date.day);
    return entries.where((e) {
      final ed = e.date;
      if (ed == null) return false;
      final d = DateTime(ed.year, ed.month, ed.day);
      return d == target;
    }).toList(growable: false);
  }

  /// True when [date] is fully blocked (any `isFullDay` entry on that date).
  bool isFullyBlocked(DateTime date) =>
      entriesForDate(date).any((e) => e.isFullDay && e.isBlocked);

  /// True when [date] has partial blocks but no full-day block.
  bool hasPartialBlocks(DateTime date) {
    final list = entriesForDate(date);
    return list.any((e) => e.isPartial && e.isBlocked) &&
        !list.any((e) => e.isFullDay && e.isBlocked);
  }
}
