import 'package:json_annotation/json_annotation.dart';

part 'device_info_dto.g.dart';

/// Metadata about the device and app version from which the NLP search was issued.
@JsonSerializable()
class DeviceInfoDTO {
  final String? model;

  @JsonKey(name: 'os_version')
  final String? osVersion;

  @JsonKey(name: 'app_version')
  final String? appVersion;

  const DeviceInfoDTO({
    this.model,
    this.osVersion,
    this.appVersion,
  });

  factory DeviceInfoDTO.fromJson(Map<String, dynamic> json) => _$DeviceInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoDTOToJson(this);
}
