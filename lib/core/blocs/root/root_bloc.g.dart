// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Initial _$InitialFromJson(Map<String, dynamic> json) => _Initial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_CachedState _$CachedStateFromJson(Map<String, dynamic> json) => _CachedState(
      userSessionDM:
          UserSessionDM.fromJson(json['userSessionDM'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CachedStateToJson(_CachedState instance) =>
    <String, dynamic>{
      'userSessionDM': instance.userSessionDM.toJson(),
      'runtimeType': instance.$type,
    };

_UserLoggedOut _$UserLoggedOutFromJson(Map<String, dynamic> json) =>
    _UserLoggedOut(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UserLoggedOutToJson(_UserLoggedOut instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_SessionExpired _$SessionExpiredFromJson(Map<String, dynamic> json) =>
    _SessionExpired(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionExpiredToJson(_SessionExpired instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
