import 'package:json_annotation/json_annotation.dart';

part 'business_search_body_dto.g.dart';

@JsonSerializable()
class BusinessSearchBodyDTO {
  final double latitude;
  final double longitude;
  final double? radius;
  @JsonKey(name: 'voice_text')
  final String voiceText;

  const BusinessSearchBodyDTO({
    required this.latitude,
    required this.longitude,
    this.radius,
    required this.voiceText,
  });

  factory BusinessSearchBodyDTO.fromJson(Map<String, dynamic> json) => _$BusinessSearchBodyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessSearchBodyDTOToJson(this);
}
