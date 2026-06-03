import 'package:json_annotation/json_annotation.dart';

part 'auth_social_register_dto.g.dart';

/// Payload del alta automática para usuarios que entran por login social
/// (Apple / Google). A diferencia del alta por email, NO pasan por el form de
/// sign-up: se registran al instante con lo mínimo y van directo al home.
///
/// Claves importantes:
/// - El backend (`CreateUserController::store`) detecta el alta social por
///   `provider` + `provider_id` y **perdona el password** (queda NULL; el
///   usuario puede setear uno luego vía reset si quiere login por email).
/// - `username` se OMITE a propósito: el backend lo autogenera único (el
///   usuario lo puede cambiar después en su perfil).
/// - `name` / `last_name` vienen del credential (en Apple solo llegan la
///   primera vez), por eso es CRÍTICO mandarlos acá para que queden
///   persistidos aunque Apple no los reenvíe en logins futuros.
/// - `role_id` 4 = Customer. El alta social siempre arranca como customer;
///   para volverse negocio el usuario migra desde su perfil.
@JsonSerializable(includeIfNull: false)
class AuthSocialRegisterDTO {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'provider')
  final String provider;

  @JsonKey(name: 'provider_id')
  final String providerId;

  @JsonKey(name: 'provider_avatar')
  final String? providerAvatar;

  /// Mismo valor que [providerAvatar], pero con la clave `avatar_url` que el
  /// backend usa para DESCARGAR la imagen y setearla como `profile_photo_path`.
  /// Sin esto el avatar solo queda en la tabla `providers` y `getPhotoUrl`
  /// (que usa el ReservationResource para el comerciante) devuelve placeholder.
  /// Null en Apple (no provee avatar) → no se envía.
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @JsonKey(name: 'role_id')
  final int roleId;

  const AuthSocialRegisterDTO({
    required this.name,
    this.lastName,
    required this.email,
    required this.provider,
    required this.providerId,
    this.providerAvatar,
    this.avatarUrl,
    this.roleId = 4,
  });

  factory AuthSocialRegisterDTO.fromJson(Map<String, dynamic> json) => _$AuthSocialRegisterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSocialRegisterDTOToJson(this);
}
