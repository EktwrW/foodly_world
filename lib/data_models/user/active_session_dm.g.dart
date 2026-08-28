// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_session_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActiveSessionDM _$ActiveSessionDMFromJson(Map<String, dynamic> json) =>
    _ActiveSessionDM(
      id: json['id'] as String,
      current: json['current'] as bool? ?? false,
      platform: json['platform'] as String?,
      model: json['model'] as String?,
      osVersion: json['os_version'] as String?,
      appVersion: json['app_version'] as String?,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      lastUsedAt: json['last_used_at'] == null
          ? null
          : DateTime.parse(json['last_used_at'] as String),
    );

Map<String, dynamic> _$ActiveSessionDMToJson(_ActiveSessionDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current': instance.current,
      if (instance.platform case final value?) 'platform': value,
      if (instance.model case final value?) 'model': value,
      if (instance.osVersion case final value?) 'os_version': value,
      if (instance.appVersion case final value?) 'app_version': value,
      if (instance.startedAt?.toIso8601String() case final value?)
        'started_at': value,
      if (instance.lastUsedAt?.toIso8601String() case final value?)
        'last_used_at': value,
    };

_ActiveSessionsDM _$ActiveSessionsDMFromJson(Map<String, dynamic> json) =>
    _ActiveSessionsDM(
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => ActiveSessionDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ActiveSessionDM>[],
      max: (json['max'] as num?)?.toInt() ?? 6,
    );

Map<String, dynamic> _$ActiveSessionsDMToJson(_ActiveSessionsDM instance) =>
    <String, dynamic>{
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'max': instance.max,
    };
