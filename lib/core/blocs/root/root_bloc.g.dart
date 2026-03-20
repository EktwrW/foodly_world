// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    _$InitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CachedStateImpl _$$CachedStateImplFromJson(Map<String, dynamic> json) =>
    _$CachedStateImpl(
      userSessionDM:
          UserSessionDM.fromJson(json['userSessionDM'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CachedStateImplToJson(_$CachedStateImpl instance) =>
    <String, dynamic>{
      'userSessionDM': instance.userSessionDM.toJson(),
      'runtimeType': instance.$type,
    };

_$UserLoggedOutImpl _$$UserLoggedOutImplFromJson(Map<String, dynamic> json) =>
    _$UserLoggedOutImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserLoggedOutImplToJson(_$UserLoggedOutImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SessionExpiredImpl _$$SessionExpiredImplFromJson(Map<String, dynamic> json) =>
    _$SessionExpiredImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SessionExpiredImplToJson(
        _$SessionExpiredImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
