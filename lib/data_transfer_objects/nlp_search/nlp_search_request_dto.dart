import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/device_info_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nlp_search_request_dto.g.dart';

@JsonSerializable()
class NlpSearchRequestDTO {
  final String query;
  final double latitude;
  final double longitude;
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  final int? limit;
  final int? offset;
  @JsonKey(name: 'user_uuid')
  final String? userUuid;
  @JsonKey(name: 'session_id')
  final String? sessionId;
  final NlpSearchPlatform? platform;
  @JsonKey(name: 'device_info')
  final DeviceInfoDTO? deviceInfo;

  const NlpSearchRequestDTO({
    required this.query,
    required this.latitude,
    required this.longitude,
    this.distanceKm,
    this.limit,
    this.offset,
    this.userUuid,
    this.sessionId,
    this.platform,
    this.deviceInfo,
  });

  factory NlpSearchRequestDTO.fromJson(Map<String, dynamic> json) => _$NlpSearchRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NlpSearchRequestDTOToJson(this);
}
