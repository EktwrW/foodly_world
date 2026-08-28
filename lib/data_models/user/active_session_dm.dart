import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_session_dm.freezed.dart';
part 'active_session_dm.g.dart';

/// Una sesión abierta de la cuenta — espejo de `UserSessionController::index`.
///
/// Existe desde que una cuenta admite varias sesiones a la vez: antes entrar
/// en un aparato echaba de todos los demás, así que no había nada que listar.
///
/// TODOS LOS DATOS DEL DISPOSITIVO SON NULLABLES, y no por precaución: las
/// sesiones abiertas antes de esta versión no los tienen y no se pueden
/// inventar hacia atrás. Se rellenan solos en el siguiente inicio de sesión de
/// cada aparato. La UI las pinta como "sin identificar" —deliberadamente, no
/// como un hueco roto.
@freezed
abstract class ActiveSessionDM with _$ActiveSessionDM {
  const factory ActiveSessionDM({
    required String id,

    /// La sesión desde la que se está mirando la lista. No se puede cerrar
    /// desde aquí: para eso está cerrar sesión.
    @Default(false) bool current,

    /// `ios`, `android`, `web` o `desktop`. Decide el icono y el título.
    String? platform,

    /// El modelo CRUDO que devuelve el aparato: `iPhone16,1`, `SM-G991B`.
    /// No es un nombre comercial y no se traduce a uno — esa tabla envejece
    /// con cada dispositivo que sale. Va en la línea de detalle, no de título.
    String? model,

    @JsonKey(name: 'os_version') String? osVersion,
    @JsonKey(name: 'app_version') String? appVersion,

    /// Cuándo se abrió la sesión. Es lo ÚNICO que se sabe de las anteriores a
    /// esta versión, así que para ellas es el dato que se muestra.
    @JsonKey(name: 'started_at') DateTime? startedAt,

    /// Última actividad. Es el dato con el que uno reconoce una sesión propia
    /// ("sí, ese soy yo esta mañana") o ajena.
    @JsonKey(name: 'last_used_at') DateTime? lastUsedAt,
  }) = _ActiveSessionDM;

  const ActiveSessionDM._();

  factory ActiveSessionDM.fromJson(Map<String, dynamic> json) => _$ActiveSessionDMFromJson(json);

  /// ¿Sabemos de qué aparato es? Falso solo para las sesiones anteriores a
  /// esta versión, que es justo el caso que la UI trata aparte.
  bool get isIdentified => platform != null;
}

/// La lista completa, con el tope de dispositivos que impone el backend.
///
/// `max` viaja en la respuesta en vez de estar escrito en la app: si algún día
/// el tope cambia, la pantalla no miente hasta la siguiente release.
@freezed
abstract class ActiveSessionsDM with _$ActiveSessionsDM {
  const factory ActiveSessionsDM({
    @Default(<ActiveSessionDM>[]) List<ActiveSessionDM> sessions,
    @Default(6) int max,
  }) = _ActiveSessionsDM;

  factory ActiveSessionsDM.fromJson(Map<String, dynamic> json) => _$ActiveSessionsDMFromJson(json);
}
