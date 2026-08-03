/// Aviso one-shot de "sin acceso": el redirect de /no-access lo enciende
/// cuando un usuario CON sesión cae ahí (denegación de permisos o dev error),
/// y el home lo consume para mostrar el snackbar — así el aterrizaje no es un
/// teletransporte mudo. Estático a propósito: un redirect de go_router no
/// puede pasar `extra` al destino.
abstract class NoAccessNotice {
  static bool _pending = false;

  static void raise() => _pending = true;

  /// Devuelve true UNA sola vez por aviso (lo consume).
  static bool consume() {
    final v = _pending;
    _pending = false;
    return v;
  }
}
