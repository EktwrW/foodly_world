/// Código de invitación pendiente de canje (App Links, F3a).
///
/// Cuando alguien abre foodly.solutions/join/{code} SIN sesión, el código se
/// estaciona acá, el usuario pasa por el login, y [AuthSessionService.setSession]
/// lo consume apenas hay sesión válida: join automático + navegación a la
/// orden. Efímero en memoria a propósito (un cold-start descarta el intento).
class PendingGroupJoin {
  PendingGroupJoin._();

  static String? code;

  static String? consume() {
    final c = code;
    code = null;
    return c;
  }
}
