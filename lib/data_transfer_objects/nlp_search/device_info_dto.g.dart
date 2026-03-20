// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfoDTO _$DeviceInfoDTOFromJson(Map<String, dynamic> json) =>
    DeviceInfoDTO(
      model: json['model'] as String?,
      osVersion: json['os_version'] as String?,
      appVersion: json['app_version'] as String?,
    );

Map<String, dynamic> _$DeviceInfoDTOToJson(DeviceInfoDTO instance) =>
    <String, dynamic>{
      if (instance.model case final value?) 'model': value,
      if (instance.osVersion case final value?) 'os_version': value,
      if (instance.appVersion case final value?) 'app_version': value,
    };
