import 'package:json_annotation/json_annotation.dart';

part 'user_body_login_dto.g.dart';

@JsonSerializable()
class UserBodyLoginDTO {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'token')
  final String? token;

  const UserBodyLoginDTO({required this.email, this.password, this.token});

  factory UserBodyLoginDTO.fromJson(Map<String, dynamic> json) => _$UserBodyLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserBodyLoginDTOToJson(this);
}
