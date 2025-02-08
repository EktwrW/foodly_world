import 'package:json_annotation/json_annotation.dart';

part 'user_recover_password_dto.g.dart';

@JsonSerializable()
class UserRecoverPasswordDTO {
  @JsonKey(name: 'email')
  final String email;

  const UserRecoverPasswordDTO({required this.email});

  Map<String, dynamic> toJson() => _$UserRecoverPasswordDTOToJson(this);
}
