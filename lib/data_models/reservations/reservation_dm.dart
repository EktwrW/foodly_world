import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_dm.freezed.dart';
part 'reservation_dm.g.dart';

@freezed
class ReservationsResponseDM with _$ReservationsResponseDM {
  const factory ReservationsResponseDM({
    @Default([]) List<ReservationDM> reservations,
    ReservationsMetaDM? meta,
  }) = _ReservationsResponseDM;

  factory ReservationsResponseDM.fromJson(Map<String, dynamic> json) => _$ReservationsResponseDMFromJson(json);
}

@freezed
class ReservationsMetaDM with _$ReservationsMetaDM {
  const factory ReservationsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
  }) = _ReservationsMetaDM;

  factory ReservationsMetaDM.fromJson(Map<String, dynamic> json) => _$ReservationsMetaDMFromJson(json);
}

@freezed
class ReservationCreateResponseDM with _$ReservationCreateResponseDM {
  const factory ReservationCreateResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReservationDM? reservation,
  }) = _ReservationCreateResponseDM;

  factory ReservationCreateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateResponseDMFromJson(json);
}

@freezed
class ReservationActionResponseDM with _$ReservationActionResponseDM {
  const factory ReservationActionResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReservationDM? reservation,
  }) = _ReservationActionResponseDM;

  factory ReservationActionResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationActionResponseDMFromJson(json);
}

@freezed
class ReservationShowResponseDM with _$ReservationShowResponseDM {
  const factory ReservationShowResponseDM({
    ReservationDM? reservation,
  }) = _ReservationShowResponseDM;

  factory ReservationShowResponseDM.fromJson(Map<String, dynamic> json) => _$ReservationShowResponseDMFromJson(json);
}

@freezed
class PendingReservationsCountDM with _$PendingReservationsCountDM {
  const factory PendingReservationsCountDM({
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
  }) = _PendingReservationsCountDM;

  factory PendingReservationsCountDM.fromJson(Map<String, dynamic> json) => _$PendingReservationsCountDMFromJson(json);
}

enum ReservationStatus {
  @JsonValue('pending')
  pending,
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

@freezed
class ReservationDM with _$ReservationDM {
  const ReservationDM._();

  const factory ReservationDM({
    @JsonKey(name: 'reservation_id') int? reservationId,
    @JsonKey(name: 'reservation_uuid') String? reservationUuid,
    @Default(ReservationStatus.pending) ReservationStatus status,
    @JsonKey(name: 'reservation_date') DateTime? reservationDate,
    @JsonKey(name: 'reservation_time') String? reservationTime,
    @JsonKey(name: 'party_size') @Default(1) int partySize,
    @JsonKey(name: 'special_requests') String? specialRequests,
    @JsonKey(name: 'manager_notes') String? managerNotes,
    @JsonKey(name: 'cancelled_by') String? cancelledBy,
    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'rejected_at') DateTime? rejectedAt,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'business_photo') String? businessPhoto,
    @JsonKey(name: 'user_uuid') String? userUuid,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_photo') String? userPhoto,
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'user_phone') String? userPhone,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ReservationDM;

  factory ReservationDM.fromJson(Map<String, dynamic> json) => _$ReservationDMFromJson(json);

  bool get isPending => status == ReservationStatus.pending;
  bool get isConfirmed => status == ReservationStatus.confirmed;
  bool get isRejected => status == ReservationStatus.rejected;
  bool get isCancelled => status == ReservationStatus.cancelled;
  bool get isCompleted => status == ReservationStatus.completed;
  bool get isNoShow => status == ReservationStatus.noShow;
  bool get canBeCancelledByCustomer => isPending || isConfirmed;
  bool get canBeActedOnByManager => isPending;

  bool get hasSpecialRequests => specialRequests != null && specialRequests!.isNotEmpty;
}
