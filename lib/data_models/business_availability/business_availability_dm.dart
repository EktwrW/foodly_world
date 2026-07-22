import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_availability_dm.freezed.dart';
part 'business_availability_dm.g.dart';

/// Category of a calendar entry.
///
/// `blocked` — the slot is unavailable for new reservations.
/// `availableOverride` — reserved for future use (explicitly open a slot
/// that would otherwise be outside business hours). The BE already
/// accepts this value; the FE calendar treats non-blocked rows as
/// display-only hints today.
enum AvailabilityType {
  @JsonValue('blocked')
  blocked,
  @JsonValue('available_override')
  availableOverride;
}

/// Origin of a calendar entry.
///
/// `manual` — created by the manager via BusinessAvailability CRUD.
/// `autoReservation` — auto-generated from a confirmed reservation.
/// The latter is READ-ONLY from the manager calendar UI — the only
/// way to remove it is to cancel the underlying reservation.
enum AvailabilitySource {
  @JsonValue('manual')
  manual,
  @JsonValue('auto_reservation')
  autoReservation;
}

/// A single entry on a business calendar.
///
/// Full-day blocks have `isFullDay = true` with null `startTime` / `endTime`.
/// Partial blocks have `isFullDay = false` and both times populated (HH:MM:SS).
@freezed
abstract class BusinessAvailabilityDM with _$BusinessAvailabilityDM {
  const BusinessAvailabilityDM._();

  const factory BusinessAvailabilityDM({
    @JsonKey(name: 'availability_uuid') String? availabilityUuid,
    DateTime? date,
    @JsonKey(name: 'is_full_day') @Default(true) bool isFullDay,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @Default(AvailabilityType.blocked) AvailabilityType type,
    @Default(AvailabilitySource.manual) AvailabilitySource source,
    @JsonKey(name: 'reservation_uuid') String? reservationUuid,
    String? reason,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _BusinessAvailabilityDM;

  factory BusinessAvailabilityDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessAvailabilityDMFromJson(json);

  // ── Semantic helpers ──────────────────────────────────────────

  bool get isManual => source == AvailabilitySource.manual;
  bool get isAutoReservation => source == AvailabilitySource.autoReservation;
  bool get isBlocked => type == AvailabilityType.blocked;

  /// Auto-reservation rows cannot be edited or deleted from the calendar
  /// UI — the manager has to cancel the underlying reservation instead.
  bool get isReadOnly => isAutoReservation;

  bool get isPartial =>
      !isFullDay && startTime != null && endTime != null;
}

/// Response shape of `GET /business-availability/business/{businessUuid}`
/// and `GET /public/business-availability/{businessUuid}` (the public
/// variant carries stripped-down entries — see [PublicAvailabilitySlotDM]).
@freezed
abstract class BusinessAvailabilityResponseDM with _$BusinessAvailabilityResponseDM {
  const factory BusinessAvailabilityResponseDM({
    String? from,
    String? to,
    @Default([]) List<BusinessAvailabilityDM> availability,
  }) = _BusinessAvailabilityResponseDM;

  factory BusinessAvailabilityResponseDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessAvailabilityResponseDMFromJson(json);
}

/// Response shape of `POST /business-availability/store` and
/// `PATCH /business-availability/update/{uuid}`.
@freezed
abstract class BusinessAvailabilityCreateResponseDM
    with _$BusinessAvailabilityCreateResponseDM {
  const factory BusinessAvailabilityCreateResponseDM({
    @Default(false) bool success,
    BusinessAvailabilityDM? availability,
  }) = _BusinessAvailabilityCreateResponseDM;

  factory BusinessAvailabilityCreateResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityCreateResponseDMFromJson(json);
}

/// Response shape of `POST /business-availability/bulk`.
@freezed
abstract class BusinessAvailabilityBulkResponseDM
    with _$BusinessAvailabilityBulkResponseDM {
  const factory BusinessAvailabilityBulkResponseDM({
    @Default(false) bool success,
    @Default(0) int count,
    @Default([]) List<BusinessAvailabilityDM> availability,
  }) = _BusinessAvailabilityBulkResponseDM;

  factory BusinessAvailabilityBulkResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityBulkResponseDMFromJson(json);
}

/// Response shape of `DELETE /business-availability/destroy/{uuid}`.
@freezed
abstract class BusinessAvailabilityActionResponseDM
    with _$BusinessAvailabilityActionResponseDM {
  const factory BusinessAvailabilityActionResponseDM({
    @Default(false) bool success,
    @Default('') String message,
  }) = _BusinessAvailabilityActionResponseDM;

  factory BusinessAvailabilityActionResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAvailabilityActionResponseDMFromJson(json);
}

/// A single entry on the public calendar. The public endpoint strips
/// `reason`, `reservation_uuid`, `type`, `source`, and `availability_uuid`
/// — customers only need to know "this slot is unavailable".
@freezed
abstract class PublicAvailabilitySlotDM with _$PublicAvailabilitySlotDM {
  const PublicAvailabilitySlotDM._();

  const factory PublicAvailabilitySlotDM({
    DateTime? date,
    @JsonKey(name: 'is_full_day') @Default(true) bool isFullDay,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _PublicAvailabilitySlotDM;

  factory PublicAvailabilitySlotDM.fromJson(Map<String, dynamic> json) =>
      _$PublicAvailabilitySlotDMFromJson(json);

  bool get isPartial =>
      !isFullDay && startTime != null && endTime != null;
}

/// Response shape of `GET /public/business-availability/{businessUuid}`.
@freezed
abstract class PublicBusinessAvailabilityResponseDM
    with _$PublicBusinessAvailabilityResponseDM {
  const factory PublicBusinessAvailabilityResponseDM({
    String? from,
    String? to,
    @Default([]) List<PublicAvailabilitySlotDM> availability,
  }) = _PublicBusinessAvailabilityResponseDM;

  factory PublicBusinessAvailabilityResponseDM.fromJson(
          Map<String, dynamic> json) =>
      _$PublicBusinessAvailabilityResponseDMFromJson(json);
}

/// Bulk-create entry payload (client → BE). One row of the `entries[]`
/// array sent to `POST /business-availability/bulk`.
@freezed
abstract class BusinessAvailabilityBulkEntryDM
    with _$BusinessAvailabilityBulkEntryDM {
  const factory BusinessAvailabilityBulkEntryDM({
    required String date,
    @JsonKey(name: 'is_full_day') required bool isFullDay,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _BusinessAvailabilityBulkEntryDM;

  factory BusinessAvailabilityBulkEntryDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessAvailabilityBulkEntryDMFromJson(json);
}
