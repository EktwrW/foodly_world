import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_message_dm.freezed.dart';
part 'reservation_message_dm.g.dart';

/// Response from the `/reservations/{uuid}/messages` endpoint.
///
/// Blocker #5 — [serverNow] is the server's clock at the moment the response
/// was built. The FE uses it as the next `since=` value when polling. This
/// lets us trust ONE clock (server) across customer + manager devices and
/// sidesteps device clock drift.
@freezed
abstract class ReservationMessagesResponseDM with _$ReservationMessagesResponseDM {
  const factory ReservationMessagesResponseDM({
    @Default([]) List<ReservationMessageDM> messages,
    @JsonKey(name: 'server_now') DateTime? serverNow,
  }) = _ReservationMessagesResponseDM;

  factory ReservationMessagesResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationMessagesResponseDMFromJson(json);
}

@freezed
abstract class ReservationMessageCreateResponseDM with _$ReservationMessageCreateResponseDM {
  const factory ReservationMessageCreateResponseDM({
    @Default(false) bool success,
    @Default('') String message,
    ReservationMessageDM? data,
  }) = _ReservationMessageCreateResponseDM;

  factory ReservationMessageCreateResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ReservationMessageCreateResponseDMFromJson(json);
}

enum MessageAuthorType {
  @JsonValue('customer')
  customer,
  @JsonValue('manager')
  manager;
}

@freezed
abstract class ReservationMessageDM with _$ReservationMessageDM {
  const ReservationMessageDM._();

  const factory ReservationMessageDM({
    @JsonKey(name: 'message_uuid') String? messageUuid,
    @JsonKey(name: 'author_type') @Default(MessageAuthorType.customer) MessageAuthorType authorType,
    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'author_photo') String? authorPhoto,
    @Default('') String body,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ReservationMessageDM;

  factory ReservationMessageDM.fromJson(Map<String, dynamic> json) => _$ReservationMessageDMFromJson(json);

  bool get isFromCustomer => authorType == MessageAuthorType.customer;
  bool get isFromManager => authorType == MessageAuthorType.manager;
}
