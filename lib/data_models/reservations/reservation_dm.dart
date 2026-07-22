import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_dm.freezed.dart';
part 'reservation_dm.g.dart';

@freezed
abstract class ReservationsResponseDM with _$ReservationsResponseDM {
  const factory ReservationsResponseDM({
    @Default([]) List<ReservationDM> reservations,
    ReservationsMetaDM? meta,
  }) = _ReservationsResponseDM;

  factory ReservationsResponseDM.fromJson(Map<String, dynamic> json) => _$ReservationsResponseDMFromJson(json);
}

@freezed
abstract class ReservationsMetaDM with _$ReservationsMetaDM {
  const factory ReservationsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _ReservationsMetaDM;

  factory ReservationsMetaDM.fromJson(Map<String, dynamic> json) => _$ReservationsMetaDMFromJson(json);
}

@freezed
abstract class ReservationCreateResponseDM with _$ReservationCreateResponseDM {
  const factory ReservationCreateResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReservationDM? reservation,
  }) = _ReservationCreateResponseDM;

  factory ReservationCreateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateResponseDMFromJson(json);
}

@freezed
abstract class ReservationActionResponseDM with _$ReservationActionResponseDM {
  const factory ReservationActionResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReservationDM? reservation,
  }) = _ReservationActionResponseDM;

  factory ReservationActionResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationActionResponseDMFromJson(json);
}

@freezed
abstract class ReservationShowResponseDM with _$ReservationShowResponseDM {
  const factory ReservationShowResponseDM({
    ReservationDM? reservation,
  }) = _ReservationShowResponseDM;

  factory ReservationShowResponseDM.fromJson(Map<String, dynamic> json) => _$ReservationShowResponseDMFromJson(json);
}

@freezed
abstract class PendingReservationsCountDM with _$PendingReservationsCountDM {
  const factory PendingReservationsCountDM({
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
  }) = _PendingReservationsCountDM;

  factory PendingReservationsCountDM.fromJson(Map<String, dynamic> json) => _$PendingReservationsCountDMFromJson(json);
}

enum ReservationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('quoted')
  quoted,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('rejected')
  rejected,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('completed')
  completed,
  @JsonValue('no_show')
  noShow;
}

enum BookingType {
  @JsonValue('table')
  table,
  @JsonValue('service')
  service;
}

// `EventType` on a reservation is now DERIVED server-side from the selected
// service_package's `service_type`. The customer no longer picks it. For
// that reason this enum must stay in sync with `ServiceType` in
// service_package_dm.dart — same JsonValue strings. Adding a value here
// without adding it to `ServiceType` (or vice versa) will break
// deserialization of existing reservations.
enum EventType {
  @JsonValue('dinner')
  dinner,
  @JsonValue('lunch')
  lunch,
  @JsonValue('brunch')
  brunch,
  @JsonValue('cocktail')
  cocktail,
  @JsonValue('wedding')
  wedding,
  @JsonValue('corporate')
  corporate,
  @JsonValue('birthday')
  birthday,
  @JsonValue('cooking_class_private')
  cookingClassPrivate,
  @JsonValue('custom')
  custom;
}

@freezed
abstract class ReservationDM with _$ReservationDM {
  const ReservationDM._();

  const factory ReservationDM({
    @JsonKey(name: 'reservation_id') int? reservationId,
    @JsonKey(name: 'reservation_uuid') String? reservationUuid,
    @Default(ReservationStatus.pending) ReservationStatus status,
    @JsonKey(name: 'booking_type') @Default(BookingType.table) BookingType bookingType,
    @JsonKey(name: 'reservation_date') DateTime? reservationDate,
    @JsonKey(name: 'reservation_time') String? reservationTime,
    @JsonKey(name: 'party_size') @Default(1) int partySize,
    @JsonKey(name: 'special_requests') String? specialRequests,
    @JsonKey(name: 'manager_notes') String? managerNotes,
    @JsonKey(name: 'cancelled_by') String? cancelledBy,
    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
    // Business info
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'business_photo') String? businessPhoto,
    @JsonKey(name: 'business_latitude') double? businessLatitude,
    @JsonKey(name: 'business_longitude') double? businessLongitude,
    @JsonKey(name: 'business_address') String? businessAddress,
    // Country of the business that owns the reservation. Used by the
    // customer-facing reservation_card to render the quoted_amount in the
    // right currency (€ / $ / ARS / Bs / etc.) instead of always assuming €.
    // [unknownEnumValue: nullForUndefinedEnumValue] is the defensive pattern
    // captured in feedback_defensive_json_enums.md — if the BE ever ships a
    // country we don't have in [FoodlyCountries] (e.g. Brazil in Phase 3),
    // the whole reservations list MUST NOT fail to deserialize. We just
    // fall back to the global '$' default at the consumer site.
    @JsonKey(name: 'business_country', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    FoodlyCountries? businessCountry,
    // User info
    @JsonKey(name: 'user_uuid') String? userUuid,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_photo') String? userPhoto,
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'user_phone') String? userPhone,
    // ISO del país del teléfono cuando `userPhone` es nacional (sin snapshot).
    // Si hay snapshot, viene null porque `userPhone` ya es E.164. Se usa para
    // componer el número internacional (display + botón de llamar).
    @JsonKey(name: 'user_phone_country_code') String? userPhoneCountryCode,
    // Service booking fields (only present when booking_type = service)
    @JsonKey(name: 'service_package_uuid') String? servicePackageUuid,
    @JsonKey(name: 'service_package_title') String? servicePackageTitle,
    @JsonKey(name: 'event_address') String? eventAddress,
    @JsonKey(name: 'event_city') String? eventCity,
    @JsonKey(name: 'event_latitude') double? eventLatitude,
    @JsonKey(name: 'event_longitude') double? eventLongitude,
    @JsonKey(name: 'event_type') EventType? eventType,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'dietary_notes') String? dietaryNotes,
    @JsonKey(name: 'budget_estimate') double? budgetEstimate,
    @JsonKey(name: 'quoted_amount') double? quotedAmount,
    @JsonKey(name: 'quoted_at') DateTime? quotedAt,
    @JsonKey(name: 'messages_count') @Default(0) int messagesCount,
    // Timestamps
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ReservationDM;

  factory ReservationDM.fromJson(Map<String, dynamic> json) => _$ReservationDMFromJson(json);

  // Status helpers
  bool get isPending => status == ReservationStatus.pending;
  bool get isQuoted => status == ReservationStatus.quoted;
  bool get isConfirmed => status == ReservationStatus.confirmed;
  bool get isRejected => status == ReservationStatus.rejected;
  bool get isCancelled => status == ReservationStatus.cancelled;
  bool get isCompleted => status == ReservationStatus.completed;
  bool get isNoShow => status == ReservationStatus.noShow;

  // Booking type helpers
  bool get isServiceBooking => bookingType == BookingType.service;
  bool get isTableBooking => bookingType == BookingType.table;

  // Action eligibility
  bool get canBeCancelledByCustomer => isPending || isConfirmed || isQuoted;
  bool get canBeActedOnByManager => isPending;
  bool get canReceiveQuote => isServiceBooking && isPending;
  bool get canApproveQuote => isServiceBooking && isQuoted;
  bool get canRejectQuote => isServiceBooking && isQuoted;
  bool get hasQuote => quotedAmount != null && quotedAmount! > 0;

  // Content helpers
  bool get hasSpecialRequests => specialRequests != null && specialRequests!.isNotEmpty;
  bool get hasDietaryNotes => dietaryNotes != null && dietaryNotes!.isNotEmpty;
  bool get hasEventLocation => eventAddress != null && eventAddress!.isNotEmpty;
  bool get hasMessages => messagesCount > 0;
}
