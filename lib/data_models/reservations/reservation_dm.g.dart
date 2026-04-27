// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationsResponseDMImpl _$$ReservationsResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationsResponseDMImpl(
      reservations: (json['reservations'] as List<dynamic>?)
              ?.map((e) => ReservationDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : ReservationsMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReservationsResponseDMImplToJson(
        _$ReservationsResponseDMImpl instance) =>
    <String, dynamic>{
      'reservations': instance.reservations.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_$ReservationsMetaDMImpl _$$ReservationsMetaDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationsMetaDMImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReservationsMetaDMImplToJson(
        _$ReservationsMetaDMImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_$ReservationCreateResponseDMImpl _$$ReservationCreateResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationCreateResponseDMImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      reservation: json['reservation'] == null
          ? null
          : ReservationDM.fromJson(json['reservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReservationCreateResponseDMImplToJson(
        _$ReservationCreateResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.reservation?.toJson() case final value?)
        'reservation': value,
    };

_$ReservationActionResponseDMImpl _$$ReservationActionResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationActionResponseDMImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      reservation: json['reservation'] == null
          ? null
          : ReservationDM.fromJson(json['reservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReservationActionResponseDMImplToJson(
        _$ReservationActionResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.reservation?.toJson() case final value?)
        'reservation': value,
    };

_$ReservationShowResponseDMImpl _$$ReservationShowResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationShowResponseDMImpl(
      reservation: json['reservation'] == null
          ? null
          : ReservationDM.fromJson(json['reservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReservationShowResponseDMImplToJson(
        _$ReservationShowResponseDMImpl instance) =>
    <String, dynamic>{
      if (instance.reservation?.toJson() case final value?)
        'reservation': value,
    };

_$PendingReservationsCountDMImpl _$$PendingReservationsCountDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingReservationsCountDMImpl(
      pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PendingReservationsCountDMImplToJson(
        _$PendingReservationsCountDMImpl instance) =>
    <String, dynamic>{
      'pending_count': instance.pendingCount,
    };

_$ReservationDMImpl _$$ReservationDMImplFromJson(Map<String, dynamic> json) =>
    _$ReservationDMImpl(
      reservationId: (json['reservation_id'] as num?)?.toInt(),
      reservationUuid: json['reservation_uuid'] as String?,
      status: $enumDecodeNullable(_$ReservationStatusEnumMap, json['status']) ??
          ReservationStatus.pending,
      bookingType:
          $enumDecodeNullable(_$BookingTypeEnumMap, json['booking_type']) ??
              BookingType.table,
      reservationDate: json['reservation_date'] == null
          ? null
          : DateTime.parse(json['reservation_date'] as String),
      reservationTime: json['reservation_time'] as String?,
      partySize: (json['party_size'] as num?)?.toInt() ?? 1,
      specialRequests: json['special_requests'] as String?,
      managerNotes: json['manager_notes'] as String?,
      cancelledBy: json['cancelled_by'] as String?,
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      confirmedAt: json['confirmed_at'] == null
          ? null
          : DateTime.parse(json['confirmed_at'] as String),
      rejectedAt: json['rejected_at'] == null
          ? null
          : DateTime.parse(json['rejected_at'] as String),
      businessUuid: json['business_uuid'] as String?,
      businessName: json['business_name'] as String?,
      businessPhoto: json['business_photo'] as String?,
      businessLatitude: (json['business_latitude'] as num?)?.toDouble(),
      businessLongitude: (json['business_longitude'] as num?)?.toDouble(),
      businessAddress: json['business_address'] as String?,
      businessCountry: $enumDecodeNullable(
          _$FoodlyCountriesEnumMap, json['business_country'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      userUuid: json['user_uuid'] as String?,
      userName: json['user_name'] as String?,
      userPhoto: json['user_photo'] as String?,
      userEmail: json['user_email'] as String?,
      userPhone: json['user_phone'] as String?,
      servicePackageUuid: json['service_package_uuid'] as String?,
      servicePackageTitle: json['service_package_title'] as String?,
      eventAddress: json['event_address'] as String?,
      eventCity: json['event_city'] as String?,
      eventLatitude: (json['event_latitude'] as num?)?.toDouble(),
      eventLongitude: (json['event_longitude'] as num?)?.toDouble(),
      eventType: $enumDecodeNullable(_$EventTypeEnumMap, json['event_type']),
      guestCount: (json['guest_count'] as num?)?.toInt(),
      dietaryNotes: json['dietary_notes'] as String?,
      budgetEstimate: (json['budget_estimate'] as num?)?.toDouble(),
      quotedAmount: (json['quoted_amount'] as num?)?.toDouble(),
      quotedAt: json['quoted_at'] == null
          ? null
          : DateTime.parse(json['quoted_at'] as String),
      messagesCount: (json['messages_count'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ReservationDMImplToJson(_$ReservationDMImpl instance) =>
    <String, dynamic>{
      if (instance.reservationId case final value?) 'reservation_id': value,
      if (instance.reservationUuid case final value?) 'reservation_uuid': value,
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'booking_type': _$BookingTypeEnumMap[instance.bookingType]!,
      if (instance.reservationDate?.toIso8601String() case final value?)
        'reservation_date': value,
      if (instance.reservationTime case final value?) 'reservation_time': value,
      'party_size': instance.partySize,
      if (instance.specialRequests case final value?) 'special_requests': value,
      if (instance.managerNotes case final value?) 'manager_notes': value,
      if (instance.cancelledBy case final value?) 'cancelled_by': value,
      if (instance.cancelledAt?.toIso8601String() case final value?)
        'cancelled_at': value,
      if (instance.confirmedAt?.toIso8601String() case final value?)
        'confirmed_at': value,
      if (instance.rejectedAt?.toIso8601String() case final value?)
        'rejected_at': value,
      if (instance.businessUuid case final value?) 'business_uuid': value,
      if (instance.businessName case final value?) 'business_name': value,
      if (instance.businessPhoto case final value?) 'business_photo': value,
      if (instance.businessLatitude case final value?)
        'business_latitude': value,
      if (instance.businessLongitude case final value?)
        'business_longitude': value,
      if (instance.businessAddress case final value?) 'business_address': value,
      if (_$FoodlyCountriesEnumMap[instance.businessCountry] case final value?)
        'business_country': value,
      if (instance.userUuid case final value?) 'user_uuid': value,
      if (instance.userName case final value?) 'user_name': value,
      if (instance.userPhoto case final value?) 'user_photo': value,
      if (instance.userEmail case final value?) 'user_email': value,
      if (instance.userPhone case final value?) 'user_phone': value,
      if (instance.servicePackageUuid case final value?)
        'service_package_uuid': value,
      if (instance.servicePackageTitle case final value?)
        'service_package_title': value,
      if (instance.eventAddress case final value?) 'event_address': value,
      if (instance.eventCity case final value?) 'event_city': value,
      if (instance.eventLatitude case final value?) 'event_latitude': value,
      if (instance.eventLongitude case final value?) 'event_longitude': value,
      if (_$EventTypeEnumMap[instance.eventType] case final value?)
        'event_type': value,
      if (instance.guestCount case final value?) 'guest_count': value,
      if (instance.dietaryNotes case final value?) 'dietary_notes': value,
      if (instance.budgetEstimate case final value?) 'budget_estimate': value,
      if (instance.quotedAmount case final value?) 'quoted_amount': value,
      if (instance.quotedAt?.toIso8601String() case final value?)
        'quoted_at': value,
      'messages_count': instance.messagesCount,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 'pending',
  ReservationStatus.quoted: 'quoted',
  ReservationStatus.confirmed: 'confirmed',
  ReservationStatus.rejected: 'rejected',
  ReservationStatus.cancelled: 'cancelled',
  ReservationStatus.completed: 'completed',
  ReservationStatus.noShow: 'no_show',
};

const _$BookingTypeEnumMap = {
  BookingType.table: 'table',
  BookingType.service: 'service',
};

const _$FoodlyCountriesEnumMap = {
  FoodlyCountries.ARGENTINA: 'Argentina',
  FoodlyCountries.SPAIN: 'Spain',
  FoodlyCountries.PORTUGAL: 'Portugal',
  FoodlyCountries.USA: 'United States',
  FoodlyCountries.VENEZUELA: 'Venezuela',
};

const _$EventTypeEnumMap = {
  EventType.dinner: 'dinner',
  EventType.lunch: 'lunch',
  EventType.brunch: 'brunch',
  EventType.cocktail: 'cocktail',
  EventType.wedding: 'wedding',
  EventType.corporate: 'corporate',
  EventType.birthday: 'birthday',
  EventType.cookingClassPrivate: 'cooking_class_private',
  EventType.custom: 'custom',
};
