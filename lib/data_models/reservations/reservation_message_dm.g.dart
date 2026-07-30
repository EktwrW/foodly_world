// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_message_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationMessagesResponseDM _$ReservationMessagesResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ReservationMessagesResponseDM(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) =>
                  ReservationMessageDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      serverNow: json['server_now'] == null
          ? null
          : DateTime.parse(json['server_now'] as String),
    );

Map<String, dynamic> _$ReservationMessagesResponseDMToJson(
        _ReservationMessagesResponseDM instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      if (instance.serverNow?.toIso8601String() case final value?)
        'server_now': value,
    };

_ReservationMessageCreateResponseDM
    _$ReservationMessageCreateResponseDMFromJson(Map<String, dynamic> json) =>
        _ReservationMessageCreateResponseDM(
          success: json['success'] as bool? ?? false,
          message: json['message'] as String? ?? '',
          data: json['data'] == null
              ? null
              : ReservationMessageDM.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ReservationMessageCreateResponseDMToJson(
        _ReservationMessageCreateResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      if (instance.data?.toJson() case final value?) 'data': value,
    };

_ReservationMessageDM _$ReservationMessageDMFromJson(
        Map<String, dynamic> json) =>
    _ReservationMessageDM(
      messageUuid: json['message_uuid'] as String?,
      authorType: $enumDecodeNullable(
              _$MessageAuthorTypeEnumMap, json['author_type']) ??
          MessageAuthorType.customer,
      authorName: json['author_name'] as String?,
      authorPhoto: json['author_photo'] as String?,
      body: json['body'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ReservationMessageDMToJson(
        _ReservationMessageDM instance) =>
    <String, dynamic>{
      if (instance.messageUuid case final value?) 'message_uuid': value,
      'author_type': _$MessageAuthorTypeEnumMap[instance.authorType]!,
      if (instance.authorName case final value?) 'author_name': value,
      if (instance.authorPhoto case final value?) 'author_photo': value,
      'body': instance.body,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };

const _$MessageAuthorTypeEnumMap = {
  MessageAuthorType.customer: 'customer',
  MessageAuthorType.manager: 'manager',
};
