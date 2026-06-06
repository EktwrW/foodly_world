import 'package:foodly_world/core/routing/app_routes.dart';

/// Rutas que un usuario en **modo invitado** (guest browsing, App Store 5.1.1.v)
/// puede abrir SIN sesión. Es la única fuente de verdad usada tanto por el
/// `redirect` global del GoRouter como por los redirectors `requiresLogin` /
/// `requiresAccess`, para no duplicar la lógica en dos lados.
///
/// Superficie permitida al invitado (descubrimiento, solo lectura):
///   - Home (`foodly-main-page`): promos cerca, nuevos negocios, búsqueda.
///   - Categorías (`/main/categories`).
///   - Perfil de negocio (`visit-business`) y sus hijos públicos
///     (`visit-promotions`, `visit-service-packages`).
///   - Menú (`visit-menu/<uuid>`) — además ya es público vía `_isPublicRoute`.
///
/// Todo lo demás (reservas, favoritos guardados, comunidad/Buzz, notificaciones,
/// perfil de usuario, gestión de negocio) queda gateado: el invitado recibe el
/// [GuestGateSheet] al intentar la acción/navegación.
class GuestRoutes {
  const GuestRoutes._();

  static bool isBrowsable(String path) {
    return path.contains('/foodly-main-page') ||
        path.contains('/visit-business') ||
        path.contains('/visit-menu/') ||
        path == AppRoutes.categories.path ||
        // "About Foodly" (manifiesto + explicación del producto) es contenido
        // institucional público: el invitado debe poder verlo sin loguearse.
        path == AppRoutes.about.path;
  }
}
