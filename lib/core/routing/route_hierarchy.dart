/// Jerarquía lógica de rutas de la app — funciones PURAS, sin dependencias
/// de servicios, para poder testearlas exhaustivamente.
///
/// Nacida del bug e2e r4 "back atascado orden↔menú": el historial trataba a
/// /group-order como hermana de /visit-menu, así que el back del menú
/// "volvía" a la orden y viceversa, en ping-pong infinito. La jerarquía real
/// es: home → visit-business → visit-menu → group-order, y los flujos
/// efímeros (orden, join) jamás son destino de "atrás" ni de restauración.
class RouteHierarchy {
  RouteHierarchy._();

  /// Rutas efímeras de flujo (no destinos): nunca se vuelve "atrás" hacia
  /// ellas ni se restauran tras un cold-start.
  ///
  /// `/checkout/return` es efímera por el mismo motivo y con un agravante: lo
  /// que se persiste es `matchedLocation`, que YA descartó la query — o sea el
  /// path guardado nunca lleva el `?order=`. Restaurarlo mandaba al comensal a
  /// una vuelta de pago sin orden, que redirige a `/`, que restaura otra vez:
  /// `redirect loop detected` → NotFoundPage, y reescrito en cada arranque, así
  /// que se quedaba pegado en todos los booteos siguientes. Sin barra final a
  /// propósito: Android declara `pathPrefix="/checkout/return"`, así que
  /// `/checkout/return` a secas también puede llegar acá.
  static bool isEphemeral(String path) =>
      path.startsWith('/group-order/') || path.startsWith('/join/') || path.startsWith('/checkout/return');

  /// ¿[path] merece persistirse como LAST_PATH (restauración post-boot)?
  static bool shouldPersistAsLastPath(String path, {String loginPath = '/login'}) =>
      path != '/' && path != loginPath && !isEphemeral(path);

  /// ¿[route] es hijo de navegación de [potentialParent]? Lo usa el guard
  /// anti ping-pong del back: si el destino "anterior" del historial es en
  /// realidad un HIJO de donde estoy, venir de ahí fue un back — retroceder
  /// debe seguir hacia el padre, no volver al hijo.
  static bool isNavigationChildOf(String route, String potentialParent, {String? userUuid}) {
    final parent = deriveParentRoute(route, userUuid: userUuid);
    if (parent != null) return parent == potentialParent;

    // Padres resueltos asincrónicamente (el uuid del padre no viaja en la
    // URL del hijo) — se matchean estructuralmente:
    if (route.startsWith('/visit-menu/') && potentialParent.contains('/visit-business')) {
      return true;
    }
    // Fix del loop e2e r4: la orden grupal es HIJA del menú del negocio.
    if (route.startsWith('/group-order/') && potentialParent.startsWith('/visit-menu/')) {
      return true;
    }

    return false;
  }

  /// La misma pantalla, sin la query.
  ///
  /// El historial guarda `state.uri.toString()`, o sea CON query, y comparar
  /// así trataba a `/visit-menu/m1?t=Mesa%205` y `/visit-menu/m1` como dos
  /// destinos distintos. Con eso, quien entraba escaneando el QR de su mesa
  /// y terminaba la orden volvía —al tocar atrás— al mismo menú otra vez,
  /// re-montando la mesa del QR, en vez de subir al perfil del negocio.
  /// `_exitOrder` navega al menú SIN el `?t=`, que es lo que destapaba la
  /// diferencia.
  static String pathOf(String uri) => Uri.parse(uri).path;

  /// Índice del historial al que lleva el "atrás", o null si no hay destino
  /// válido y hay que derivar el padre. El caller trunca desde ese índice.
  ///
  /// Vivía dentro de `AppRouter.goBackToLastRoute` y por eso no tenía tests:
  /// los predicados de arriba estaban cubiertos y el RECORRIDO no, que es
  /// donde se esconden los loops.
  static int? backTargetIndex(List<String> history, String current, {String? userUuid}) {
    if (history.length <= 2) return null;

    final actual = pathOf(current);

    var idx = history.length - 2;
    while (idx >= 0 && (isEphemeral(history[idx]) || pathOf(history[idx]) == actual)) {
      idx--;
    }
    if (idx < 0) return null;

    // Si el anterior es HIJO de donde estoy, llegué acá con un back: seguir
    // hacia arriba, no volver al hijo.
    return isNavigationChildOf(pathOf(history[idx]), actual, userUuid: userUuid) ? null : idx;
  }

  /// El "atrás" completo: a qué entrada del historial ir y desde dónde
  /// truncarlo.
  ///
  /// `destino` null = no hay destino válido y el caller deriva el padre lógico.
  ///
  /// `truncarDesde` se aplica SIEMPRE, también en ese caso: si el historial no
  /// sirvió para decidir, tampoco sirve para el back siguiente. Sin eso la
  /// entrada recién dejada seguía debajo y el back volvía a ella — home ↔
  /// visit-business en bucle, sin salida (e2e 2026-08-15).
  static ({int? destino, int truncarDesde}) backStep(
    List<String> history,
    String current, {
    String? userUuid,
  }) {
    final idx = backTargetIndex(history, current, userUuid: userUuid);

    return (destino: idx, truncarDesde: idx ?? 0);
  }

  /// Padre lógico sincrónico de [path]; null cuando no se puede determinar
  /// (el caller decide: resolución async o main page).
  ///
  /// Árbol cubierto:
  ///   /main/:id/(my|visit)-business/[<child>] → /main/:id/(my|visit)-business
  ///   /manage-menu/:id                      → /main/{userUuid}/my-business
  ///   /visit-menu/:id                       → null (async: LAST_VISITED_BUSINESS_UUID)
  ///   /group-order/:id                      → null (async: LAST_VISITED_MENU_UUID)
  ///   todo lo demás                         → null (→ main page)
  static String? deriveParentRoute(String path, {String? userUuid}) {
    final nestedChild = RegExp(r'^(/main/[^/]+/(?:my-business|visit-business))/[^/]+$');
    final nestedMatch = nestedChild.firstMatch(path);
    if (nestedMatch != null) return nestedMatch.group(1);

    if (path.startsWith('/manage-menu/') && userUuid != null && userUuid.isNotEmpty) {
      return '/main/$userUuid/my-business';
    }

    return null;
  }
}
