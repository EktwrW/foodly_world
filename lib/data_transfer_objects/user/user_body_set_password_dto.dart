import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body_set_password_dto.freezed.dart';
part 'user_body_set_password_dto.g.dart';

/// Payload for `POST /set-password` — the endpoint that sets a password for
/// the FIRST time on a social-login user (whose stored password is NULL).
///
/// Intentionally distinct from [UserBodyUpdateDTO] which carries both
/// `current_password` and `new_password`. Keeping them separate avoids
/// collapsing two semantically different operations — change-password and
/// set-password — into one payload that a caller or refactor could misuse.
@freezed
class UserBodySetPasswordDTO with _$UserBodySetPasswordDTO {
  const factory UserBodySetPasswordDTO({
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _UserBodySetPasswordDTO;

  factory UserBodySetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$UserBodySetPasswordDTOFromJson(json);
}
