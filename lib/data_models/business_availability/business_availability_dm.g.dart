// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_availability_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessAvailabilityDMImpl _$$BusinessAvailabilityDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessAvailabilityDMImpl(
      availabilityUuid: json['availability_uuid'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isFullDay: json['is_full_day'] as bool? ?? true,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      type: $enumDecodeNullable(_$AvailabilityTypeEnumMap, json['type']) ??
          AvailabilityType.blocked,
      source:
          $enumDecodeNullable(_$AvailabilitySourceEnumMap, json['source']) ??
              AvailabilitySource.manual,
      reservationUuid: json['reservation_uuid'] as String?,
      reason: json['reason'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BusinessAvailabilityDMImplToJson(
        _$BusinessAvailabilityDMImpl instance) =>
    <String, dynamic>{
      if (instance.availabilityUuid case final value?)
        'availability_uuid': value,
      if (instance.date?.toIso8601String() case final value?) 'date': value,
      'is_full_day': instance.isFullDay,
      if (instance.startTime case final value?) 'start_time': value,
      if (instance.endTime case final value?) 'end_time': value,
      'type': _$AvailabilityTypeEnumMap[instance.type]!,
      'source': _$AvailabilitySourceEnumMap[instance.source]!,
      if (instance.reservationUuid case final value?) 'reservation_uuid': value,
      if (instance.reason case final value?) 'reason': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };

const _$AvailabilityTypeEnumMap = {
  AvailabilityType.blocked: 'blocked',
  AvailabilityType.availableOverride: 'available_override',
};

const _$AvailabilitySourceEnumMap = {
  AvailabilitySource.manual: 'manual',
  AvailabilitySource.autoReservation: 'auto_reservation',
};

_$BusinessAvailabilityResponseDMImpl
    _$$BusinessAvailabilityResponseDMImplFromJson(Map<String, dynamic> json) =>
        _$BusinessAvailabilityResponseDMImpl(
          from: json['from'] as String?,
          to: json['to'] as String?,
          availability: (json['availability'] as List<dynamic>?)
                  ?.map((e) => BusinessAvailabilityDM.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$BusinessAvailabilityResponseDMImplToJson(
        _$BusinessAvailabilityResponseDMImpl instance) =>
    <String, dynamic>{
      if (instance.from case final value?) 'from': value,
      if (instance.to case final value?) 'to': value,
      'availability': instance.availability.map((e) => e.toJson()).toList(),
    };

_$BusinessAvailabilityCreateResponseDMImpl
    _$$BusinessAvailabilityCreateResponseDMImplFromJson(
            Map<String, dynamic> json) =>
        _$BusinessAvailabilityCreateResponseDMImpl(
          success: json['success'] as bool? ?? false,
          availability: json['availability'] == null
              ? null
              : BusinessAvailabilityDM.fromJson(
                  json['availability'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$BusinessAvailabilityCreateResponseDMImplToJson(
        _$BusinessAvailabilityCreateResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.availability?.toJson() case final value?)
        'availability': value,
    };

_$BusinessAvailabilityBulkResponseDMImpl
    _$$BusinessAvailabilityBulkResponseDMImplFromJson(
            Map<String, dynamic> json) =>
        _$BusinessAvailabilityBulkResponseDMImpl(
          success: json['success'] as bool? ?? false,
          count: (json['count'] as num?)?.toInt() ?? 0,
          availability: (json['availability'] as List<dynamic>?)
                  ?.map((e) => BusinessAvailabilityDM.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$BusinessAvailabilityBulkResponseDMImplToJson(
        _$BusinessAvailabilityBulkResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'availability': instance.availability.map((e) => e.toJson()).toList(),
    };

_$BusinessAvailabilityActionResponseDMImpl
    _$$BusinessAvailabilityActionResponseDMImplFromJson(
            Map<String, dynamic> json) =>
        _$BusinessAvailabilityActionResponseDMImpl(
          success: json['success'] as bool? ?? false,
          message: json['message'] as String? ?? '',
        );

Map<String, dynamic> _$$BusinessAvailabilityActionResponseDMImplToJson(
        _$BusinessAvailabilityActionResponseDMImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };

_$PublicAvailabilitySlotDMImpl _$$PublicAvailabilitySlotDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicAvailabilitySlotDMImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isFullDay: json['is_full_day'] as bool? ?? true,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$PublicAvailabilitySlotDMImplToJson(
        _$PublicAvailabilitySlotDMImpl instance) =>
    <String, dynamic>{
      if (instance.date?.toIso8601String() case final value?) 'date': value,
      'is_full_day': instance.isFullDay,
      if (instance.startTime case final value?) 'start_time': value,
      if (instance.endTime case final value?) 'end_time': value,
    };

_$PublicBusinessAvailabilityResponseDMImpl
    _$$PublicBusinessAvailabilityResponseDMImplFromJson(
            Map<String, dynamic> json) =>
        _$PublicBusinessAvailabilityResponseDMImpl(
          from: json['from'] as String?,
          to: json['to'] as String?,
          availability: (json['availability'] as List<dynamic>?)
                  ?.map((e) => PublicAvailabilitySlotDM.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$PublicBusinessAvailabilityResponseDMImplToJson(
        _$PublicBusinessAvailabilityResponseDMImpl instance) =>
    <String, dynamic>{
      if (instance.from case final value?) 'from': value,
      if (instance.to case final value?) 'to': value,
      'availability': instance.availability.map((e) => e.toJson()).toList(),
    };

_$BusinessAvailabilityBulkEntryDMImpl
    _$$BusinessAvailabilityBulkEntryDMImplFromJson(Map<String, dynamic> json) =>
        _$BusinessAvailabilityBulkEntryDMImpl(
          date: json['date'] as String,
          isFullDay: json['is_full_day'] as bool,
          startTime: json['start_time'] as String?,
          endTime: json['end_time'] as String?,
        );

Map<String, dynamic> _$$BusinessAvailabilityBulkEntryDMImplToJson(
        _$BusinessAvailabilityBulkEntryDMImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'is_full_day': instance.isFullDay,
      if (instance.startTime case final value?) 'start_time': value,
      if (instance.endTime case final value?) 'end_time': value,
    };
