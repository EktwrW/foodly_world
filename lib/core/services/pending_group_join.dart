/// Código de invitación pendiente de canje (App Links, F3a).
///
/// Cuando alguien abre foodly.solutions/join/{code} SIN sesión, el código se
/// estaciona acá, el usuario pasa por el login y el redirect global de
/// GoRouter desvía la primera navegación post-login a /join/{code}, donde
/// JoinByLinkPage canjea y navega al menú del negocio. Efímero en memoria a
/// propósito (un cold-start descarta el intento).
///
/// La lógica de captura/desvío está acá como funciones puras (y no inline en
/// el redirect del router) para poder testearla exhaustivamente — regresión
/// del bug e2e r4: el canje en setSession perdía la carrera contra la
/// navegación final del bootstrap del login.
class PendingGroupJoin {
  PendingGroupJoin._();

  static const _codeLength = 6;

  static String? code;

  static String? consume() {
    final c = code;
    code = null;
    return c;
  }

  /// Estaciona el código si [uri] es un deep link /join/{code} válido y NO
  /// hay sesión (con sesión la propia ruta /join hace el join directo — no
  /// estacionar evita loops de re-captura al navegar a /join ya logueado).
  static void captureFromUri(Uri uri, {required bool isLoggedIn}) {
    if (isLoggedIn || !uri.path.startsWith('/join/')) return;
    final seg = uri.pathSegments;
    if (seg.length >= 2 && seg[1].length == _codeLength) {
      code = seg[1].toUpperCase();
    }
  }

  /// Path de desvío para el redirect global: con código estacionado + sesión
  /// válida, CUALQUIER navegación (salvo a /join mismo) se desvía a la página
  /// de join, consumiendo el código. Sin sesión el código queda estacionado
  /// intacto esperando el login. Devuelve null si no corresponde desviar.
  static String? divertPath(Uri uri, {required bool isLoggedIn}) {
    if (code == null || !isLoggedIn || uri.path.startsWith('/join/')) {
      return null;
    }
    return '/join/${consume()}';
  }
}
