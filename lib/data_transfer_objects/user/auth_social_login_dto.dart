import 'package:json_annotation/json_annotation.dart';

part 'auth_social_login_dto.g.dart';

@JsonSerializable()
class AuthSocialLoginDTO {
  @JsonKey(name: 'provider')
  final String provider;

  @JsonKey(name: 'access_provider_token')
  final String accessToken;

  const AuthSocialLoginDTO({required this.provider, required this.accessToken});

  factory AuthSocialLoginDTO.fromJson(Map<String, dynamic> json) => _$AuthSocialLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSocialLoginDTOToJson(this);
}