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
  static bool isEphemeral(String path) => path.startsWith('/group-order/') || path.startsWith('/join/');

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
