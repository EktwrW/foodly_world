import 'dart:async';
import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/routing/no_access_notice.dart';
import 'package:foodly_world/core/routing/route_hierarchy.dart';
import 'package:foodly_world/core/services/pending_group_join.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/no_access_snackbar_gate.dart';
import 'package:foodly_world/ui/views/about/about_page.dart';
import 'package:foodly_world/ui/views/analytics/analytics_dashboard_page.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_cubit.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_cubit.dart';
import 'package:foodly_world/ui/views/business/availability/manage_availability_page.dart';
import 'package:foodly_world/ui/views/business/business_page.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/manage_menu_screen.dart';
import 'package:foodly_world/ui/views/business/menu_import/menu_import_page.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/manage_promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/manage_promotions_page.dart';
import 'package:foodly_world/ui/views/business/reservations/manage_reservations_page.dart';
import 'package:foodly_world/ui/views/business/service_packages/manage_service_packages_page.dart';
import 'package:foodly_world/ui/views/group_orders/group_order_page.dart';
import 'package:foodly_world/ui/views/group_orders/join_by_link_page.dart';
import 'package:foodly_world/ui/views/home/home_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/categories_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/my_favorites_page.dart';
import 'package:foodly_world/ui/views/home/pages/notifications_page/notifications_page.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/saved_promotions_page.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/social_page.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_orders_page.dart';
import 'package:foodly_world/ui/views/not_found/not_found_page.dart';
import 'package:foodly_world/ui/views/privacy/privacy_policy_page.dart';
import 'package:foodly_world/ui/views/public_menu/public_menu_page.dart';
import 'package:foodly_world/ui/views/public_menu/stripe_bridge_page.dart';
import 'package:foodly_world/ui/views/reservations/my_reservations_page.dart';
import 'package:foodly_world/ui/views/settings/blocked_users_page.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/sign_up_business_page.dart';
import 'package:foodly_world/ui/views/sign_up/sign_up_user_page.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/terms/terms_conditions_page.dart';
import 'package:foodly_world/ui/views/user_profile/cubit/user_profile_cubit.dart';
import 'package:foodly_world/ui/views/user_profile/user_profile_page.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/visited_menu_screen.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/cubit/promotions_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/promotions_page.dart';
import 'package:foodly_world/ui/views/visited_business/service_packages/cubit/visit_service_packages_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/service_packages/visit_service_packages_page.dart';
import 'package:foodly_world/ui/views/visited_business/visit_business_page.dart';
import 'package:go_router/go_router.dart';

/// True when the app is running on the menu.foodly.solutions subdomain.
/// Production: Uri.base.host starts with 'menu.'
/// CI build: --dart-define=IS_MENU_SUBDOMAIN=true
/// Local dev: port 8889 (see launch.json "public-menu-web" config)
final _isMenuSubdomain =
    const bool.fromEnvironment('IS_MENU_SUBDOMAIN') || Uri.base.host.startsWith('menu.') || Uri.base.port == 8889;

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// El guard de módulo (antes `requiresAccess`) ya no vive acá: se activa
/// pasando `access: ModuleGuardType.x` a [_getRedirectors] — el compilador
/// exige declarar el módulo junto con el guard (no hay "ruta sin mapear").
enum RedirectRoute { requiresAppInitial, requiresLogin }

class AppRouter {
  final RootBloc rootBloc;
  final List<String> _routeHistory = [];
  late final GoRouter appRouter;
  late GoRouterState _currentRoute;
  final LocalStorageService localStorageService = di<LocalStorageService>();
  final authSessService = di<AuthSessionService>();

  String get currentLocation => _currentRoute.uri.toString();
  GoRouterState get currentRoute => _currentRoute;
  UnmodifiableListView<String> get routeHistory => UnmodifiableListView(_routeHistory);

  void removeLastRouteHistory() => _routeHistory.removeLast();
  void clearRouteHistory() => _routeHistory.clear();
  void updateCurrentRoute(GoRouterState state) async {
    _currentRoute = state;

    // Persist the business UUID when visiting a business page. Routes like
    // /visit-menu/:id carry the MENU UUID (not the business UUID), so
    // back-navigation after cold start needs this to reconstruct the correct
    // parent (/main/<businessUuid>/visit-business).
    final loc = state.matchedLocation;
    if (loc.contains('/visit-business')) {
      final bizUuid = state.pathParameters[AppRoutes.routeIdParam];
      if (bizUuid != null && bizUuid.isNotEmpty) {
        await localStorageService.saveString(
          FoodlyStrings.LAST_VISITED_BUSINESS_UUID,
          bizUuid,
        );
      }
    }

    // Análogo para el MENÚ: /group-order/:id no lleva el uuid del menú, y
    // el back de la orden necesita reconstruir /visit-menu/<menuUuid>.
    if (loc.startsWith('/visit-menu/')) {
      final menuUuid = state.pathParameters[AppRoutes.routeIdParam];
      if (menuUuid != null && menuUuid.isNotEmpty) {
        await localStorageService.saveString(
          FoodlyStrings.LAST_VISITED_MENU_UUID,
          menuUuid,
        );
      }
    }

    if (_routeHistory.length >= 100) _routeHistory.removeAt(0);
    _routeHistory.add(state.uri.toString());

    await saveLastRoute(state.matchedLocation);
  }

  /// Whether the current route is a shell (home tab) route.
  bool get isOnShellRoute {
    final loc = currentLocation;
    return loc.contains('/foodly-main-page') ||
        loc.contains('/saved-promotions') ||
        loc.contains('/faved-business') ||
        loc.contains('/users-community') ||
        loc.contains('/notifications');
  }

  void _goToMainPage() {
    appRouter.goNamed(
      AppRoutes.foodlyMainPage.name,
      pathParameters: {AppRoutes.routeIdParam: authSessService.uuid},
    );
  }

  /// Returns true when [route] is a navigation child of [potentialParent].
  /// Used by the ping-pong guard to detect back-button loops.
  /// Lógica pura (testeada) en [RouteHierarchy].
  bool _isNavigationChildOf(String route, String potentialParent) =>
      RouteHierarchy.isNavigationChildOf(route, potentialParent, userUuid: authSessService.uuid);

  void goBackToLastRoute() async {
    if (_routeHistory.length > 2) {
      // Bug e2e r4 (back atascado orden↔menú): los flujos efímeros
      // (/group-order, /join) y la propia ubicación actual NUNCA son
      // destinos válidos de "atrás" — se saltan al buscar en el historial.
      var idx = _routeHistory.length - 2;
      while (idx >= 0 && (RouteHierarchy.isEphemeral(_routeHistory[idx]) || _routeHistory[idx] == currentLocation)) {
        idx--;
      }

      if (idx >= 0) {
        final lastRoute = _routeHistory[idx];

        // Ping-pong guard: if the previous route is a child of the current
        // location, the user arrived here by pressing "back" from that child.
        // Going back again must continue upward to the logical parent — not
        // return to the child we just left (e.g. analytics ↔ myBusiness,
        // visit-menu ↔ visit-business, group-order ↔ visit-menu).
        if (!_isNavigationChildOf(lastRoute, currentLocation)) {
          // Normal history-based back (descarta lo salteado también).
          _routeHistory.removeRange(idx, _routeHistory.length);

          if (lastRoute == '/' && authSessService.isLoggedIn) {
            _goToMainPage();
            return;
          }

          await saveLastRoute(lastRoute);
          appRouter.go(lastRoute);
          return;
        }
        // Ping-pong detected — fall through to _deriveParentRoute below.
      }
    }

    // No sufficient route history (cold start, deep link, route restoration),
    // or previous route was a child (ping-pong avoidance).
    // Derive the logical parent from the current path so the user lands on a
    // sensible screen instead of login or a blank main page.
    if (authSessService.isLoggedIn) {
      // visit-menu carries the MENU UUID in the URL, not the business UUID.
      // _deriveParentRoute returns null for it, so we resolve the parent
      // asynchronously from the persisted business UUID.
      String? parent;
      if (currentLocation.startsWith('/visit-menu/')) {
        final bizUuid = await localStorageService.getString(
          FoodlyStrings.LAST_VISITED_BUSINESS_UUID,
        );
        if (bizUuid != null && bizUuid.isNotEmpty) {
          parent = '${AppRoutes.mainRoute}/$bizUuid/visit-business';
        }
      }
      // El padre de la orden grupal es el MENÚ del negocio (uuid persistido
      // al visitarlo — no viaja en la URL de la orden).
      if (parent == null && currentLocation.startsWith('/group-order/')) {
        final menuUuid = await localStorageService.getString(
          FoodlyStrings.LAST_VISITED_MENU_UUID,
        );
        if (menuUuid != null && menuUuid.isNotEmpty) {
          parent = '/visit-menu/$menuUuid';
        }
      }
      parent ??= _deriveParentRoute(currentLocation);

      if (parent != null) {
        await saveLastRoute(parent);
        appRouter.go(parent);
      } else {
        _goToMainPage();
      }
    } else {
      appRouter.goNamed(AppRoutes.login.name);
    }
  }

  /// Derives the logical parent route from [path] based on the app's route
  /// hierarchy.  Returns `null` when no specific parent can be determined —
  /// the caller should fall back to [_goToMainPage].
  ///
  /// Route tree covered:
  ///   /main/:id/my-business/analytics          → /main/:id/my-business
  ///   /main/:id/my-business/manage-reservations → /main/:id/my-business
  ///   /main/:id/my-business/manage-promotions   → /main/:id/my-business
  ///   /main/:id/visit-business/visit-promotions → /main/:id/visit-business
  ///   /manage-menu/:id                          → /main/{userUuid}/my-business
  ///   /visit-menu/:id                           → null (async — resolved in goBackToLastRoute)
  ///   /main/:id/my-business                     → null (→ main page)
  ///   /main/:id/visit-business                  → null (→ main page)
  ///   everything else                           → null (→ main page)
  /// Padre lógico sincrónico — lógica pura (testeada) en [RouteHierarchy].
  /// Los padres async (/visit-menu vía LAST_VISITED_BUSINESS_UUID,
  /// /group-order vía LAST_VISITED_MENU_UUID) los resuelve goBackToLastRoute.
  String? _deriveParentRoute(String path) => RouteHierarchy.deriveParentRoute(path, userUuid: authSessService.uuid);

  Future<void> saveLastRoute(String lastRoute) async {
    // Flujos efímeros (orden grupal, join) jamás se restauran post-boot:
    // cold-start dentro de una orden vieja = usuario atascado (e2e r4).
    if (RouteHierarchy.shouldPersistAsLastPath(lastRoute, loginPath: AppRoutes.login.path)) {
      await localStorageService.saveString(FoodlyStrings.LAST_PATH, lastRoute);
    }
  }

  List<FutureOr<String?> Function(BuildContext, GoRouterState)> _getRedirectors(
    List<RedirectRoute> redirectors, {
    ModuleGuardType? access,
  }) {
    return [
      if (redirectors.contains(RedirectRoute.requiresAppInitial)) GoRouterRedirector.requiresAppInitial(rootBloc),
      // Guard de módulo con módulo EXPLÍCITO (mismo orden que antes: corre
      // antes que requiresLogin).
      if (access != null) GoRouterRedirector.requiresAccess(access),
      if (redirectors.contains(RedirectRoute.requiresLogin)) GoRouterRedirector.requiresLogin(),
    ];
  }

  Page<dynamic> Function(BuildContext, GoRouterState)? _transitionPageBuilder(Widget page) =>
      (context, state) => CustomTransitionPage<void>(
            transitionDuration: Durations.medium4,
            key: state.pageKey,
            child: page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          );

  GoRoute _goRouteWithTransition(AppRoutes appRoute, Widget page, List<RedirectRoute> redirectors,
          {ModuleGuardType? access}) =>
      GoRoute(
        path: appRoute.path,
        name: appRoute.name,
        redirect: Redirector(_getRedirectors(redirectors, access: access)).call,
        pageBuilder: _transitionPageBuilder(page),
      );

  GoRoute _goRouteForStatefulShell(AppRoutes appRoute, GoRoute route) {
    return GoRoute(
      path: appRoute.path,
      builder: (_, state) {
        return const NotFoundPage();
      },
      redirect: ((_, state) {
        // If the parent shell route is hit (e.g., via system back pop), redirect to main page
        // instead of showing not-found. This is a safety net — PopScope in shell pages should prevent this.
        if (state.uri.toString() == appRoute.path) {
          // Invitado (5.1.1.v): no tiene uuid → sentinel para no armar un path
          // con id vacío (`/main/home//foodly-main-page`).
          final id = authSessService.isGuest ? AppRoutes.guestRouteId : authSessService.uuid;
          return '${appRoute.path}/$id/foodly-main-page';
        }
        return null;
      }),
      routes: [route],
    );
  }

  List<Widget> _getChildrenFadeTransition(List<Widget> children) =>
      children.map((child) => FadeIn(duration: Durations.medium2, child: child)).toList();

  bool _isPublicRoute(String path) {
    final exactPublicPaths = [
      AppRoutes.start.path,
      AppRoutes.login.path,
      AppRoutes.signUp.path,
      AppRoutes.signUpBusiness.path,
      AppRoutes.privacyPolicy.path,
      AppRoutes.termsConditions.path,
    ];

    if (exactPublicPaths.contains(path) || path.startsWith('/visit-menu/')) return true;

    // Deep link: /{businessUuid} from menu.foodly.solutions App/Universal Links.
    final segment = path.startsWith('/') ? path.substring(1) : path;
    if (RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$', caseSensitive: false)
        .hasMatch(segment)) {
      return true;
    }

    return false;
  }

  bool _isProfileRoute(String path) => path == AppRoutes.profileScreen.path;

  AppRouter({
    required this.rootBloc,
  }) {
    appRouter = GoRouter(
      debugLogDiagnostics: di<BaseConfig>().isLoggingEnabled,
      navigatorKey: rootNavigatorKey,
      observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
      redirect: (context, state) async {
        // App Links F3a (bug e2e ronda 3/4): en cold-start sin sesión el
        // redirector global intercepta ANTES de que /join/{code} construya
        // su página — el código se estaciona acá y el bloque de desvío de
        // más abajo lo canjea apenas haya sesión. Lógica y tests en
        // PendingGroupJoin.
        PendingGroupJoin.captureFromUri(state.uri, isLoggedIn: authSessService.isLoggedIn);

        // Public menu subdomain — no auth, no session, no redirects.
        if (_isMenuSubdomain) return null;

        // Read the saved route BEFORE updateCurrentRoute overwrites it.
        // This ensures route restoration works after biometric auth or restart.
        final lastPath = await localStorageService.getString(FoodlyStrings.LAST_PATH);
        updateCurrentRoute(state);

        // Si el usuario está siendo forzado a hacer login
        if (authSessService.forceToLogin) {
          return AppRoutes.login.path;
        }

        // Allow navigation while a session is being restored asynchronously
        // (tokens are loaded from secure storage in background by RootBloc).
        // The biometric guard / token validation will handle protection.
        // Without this, the redirect fires before setSession() completes,
        // sees isLoggedIn == false, and incorrectly sends the user to login.
        if (!authSessService.isLoggedIn &&
            !authSessService.hasPendingSessionRestore &&
            !_isPublicRoute(state.matchedLocation) &&
            // Modo invitado (5.1.1.v): dejamos pasar al invitado a las rutas de
            // descubrimiento sin sesión. El resto sigue cayendo a login como
            // backstop; el gate "amable" (GuestGateSheet) se dispara antes, en
            // el handler de la acción / tap del bottom nav.
            !(authSessService.isGuest && GuestRoutes.isBrowsable(state.matchedLocation))) {
          return AppRoutes.login.path;
        }

        // Route restoration: only on the initial app bootstrap (initialLocation
        // is '/'), so normal in-app navigations are never overridden.
        // Use isLoggedIn (NOT hasSessionOrPending) because during cold start
        // the session hasn't been fully restored yet — tokens are still loading
        // async from secure storage. If we redirect now, the destination route's
        // requiresAccess() redirector will fail (userSessionDM is null) and send
        // the user to /no-access, which falls through to /:businessUuid catch-all.
        // Instead, let the app stay on the start page so biometric/auto-login can
        // complete first; fingerprint_button_login.dart handles route restoration
        // after authentication succeeds.
        // e2e r5: guard de LECTURA además del de escritura — builds viejos
        // pudieron persistir /join o /group-order como LAST_PATH; restaurar
        // hacia un flujo efímero deja al usuario atascado (error de join en
        // loop, orden muerta). Se ignora y se sigue el arranque normal.
        if (state.matchedLocation == AppRoutes.start.path &&
            authSessService.isLoggedIn &&
            lastPath != null &&
            lastPath != state.matchedLocation &&
            !RouteHierarchy.isEphemeral(lastPath)) {
          return lastPath;
        }

        // Si el usuario necesita completar su perfil
        if (authSessService.mustCompleteProfile && !_isProfileRoute(state.matchedLocation)) {
          return AppRoutes.profileScreen.path;
        }

        // App Links F3a (bug e2e ronda 4): código de join pendiente + sesión
        // válida ⇒ se desvía CUALQUIER navegación a la página de join. Antes
        // el canje vivía en setSession (postFrame) y PERDÍA la carrera contra
        // el bootstrap del login, que navegaba a home al final y pisaba la
        // navegación a la orden. Acá no hay carrera: la última navegación del
        // flujo de login — sea cual sea — termina interceptada y desviada.
        final joinDivert = PendingGroupJoin.divertPath(state.uri, isLoggedIn: authSessService.isLoggedIn);
        if (joinDivert != null) return joinDivert;

        return null;
      },
      initialLocation: AppRoutes.start.path,
      routes: [
        if (_isMenuSubdomain) ...[
          // Root path: redirect to the path param version when UUID is missing.
          GoRoute(
            path: '/',
            redirect: (_, __) => '/${const String.fromEnvironment('MENU_DEV_UUID')}',
          ),
          // Puente del onboarding de Stripe: la pestaña del navegador que
          // queda tras el App Link carga estas URLs — página amable en vez
          // del NotFound (bug e2e F4a). ANTES del catch-all /:businessUuid.
          GoRoute(
            path: AppRoutes.stripeReturn.path,
            builder: (_, __) => const StripeBridgePage(completed: true),
          ),
          GoRoute(
            path: AppRoutes.stripeRefresh.path,
            builder: (_, __) => const StripeBridgePage(completed: false),
          ),
          GoRoute(
            path: AppRoutes.publicMenu.path,
            name: AppRoutes.publicMenu.name,
            builder: (ctx, state) => PublicMenuPage(
              businessUuid: state.pathParameters['businessUuid']!,
              dio: di<Dio>(),
            ),
          ),
        ],
        if (!_isMenuSubdomain) ...[
          _goRouteWithTransition(AppRoutes.start, const StartingPage369(), [RedirectRoute.requiresAppInitial]),
          _goRouteWithTransition(AppRoutes.login, const StartingPage369(currentView: StartingPageView.login),
              [RedirectRoute.requiresAppInitial]),
          _goRouteWithTransition(
              AppRoutes.signUp,
              BlocProvider(create: (context) => SignUpCubit(di(), di(), di(), di()), child: const SignUpUserPage()),
              [RedirectRoute.requiresAppInitial]),
          _goRouteWithTransition(
              AppRoutes.signUpBusiness,
              BlocProvider(create: (context) => SignUpCubit(di(), di(), di(), di()), child: const SignUpBusinessPage()),
              [RedirectRoute.requiresAppInitial]),
          StatefulShellRoute(
            navigatorContainerBuilder: (context, navigationShell, children) => FadeIn(
                duration: Durations.medium2,
                child: HomePage369(navigationShell: navigationShell, children: _getChildrenFadeTransition(children))),
            builder: (_, __, navigationShell) => navigationShell,
            branches: [
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(
                        AppRoutes.savedPromotions, const SavedPromotionsPage(), [RedirectRoute.requiresLogin],
                        access: ModuleGuardType.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(
                        AppRoutes.favedBusiness, const MyFavoritesPage(), [RedirectRoute.requiresLogin],
                        access: ModuleGuardType.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(AppRoutes.usersCommunity, const SocialPage(), [RedirectRoute.requiresLogin],
                        access: ModuleGuardType.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(
                        AppRoutes.notifications, const NotificationsPage(), [RedirectRoute.requiresLogin],
                        access: ModuleGuardType.home),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    // Gate del aviso "/no-access con sesión": si el redirect
                    // dejó un NoAccessNotice pendiente, muestra el snackbar.
                    _goRouteWithTransition(AppRoutes.foodlyMainPage,
                        const NoAccessSnackbarGate(child: FoodlyMainPage()), [RedirectRoute.requiresLogin],
                        access: ModuleGuardType.home),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
              path: AppRoutes.categories.path,
              name: AppRoutes.categories.name,
              redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.home)).call,
              pageBuilder: (context, state) {
                final locationService = di<LocationService>();
                final categoryIndex = state.extra as int?;
                final selectedCategory = categoryIndex != null ? FoodlyCategories.values[categoryIndex] : null;

                return CustomTransitionPage<void>(
                  transitionDuration: Durations.medium4,
                  key: state.pageKey,
                  child: BlocProvider(
                    create: (context) => CategoriesCubit(
                      selectedCategory,
                      di(),
                      locationService.currentLocation.position?.latitude ?? 0.0,
                      locationService.currentLocation.position?.longitude ?? 0.0,
                    ),
                    child: const CategoriesPage(),
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              }),
          GoRoute(
            path: AppRoutes.profileScreen.path,
            name: AppRoutes.profileScreen.name,
            redirect:
                Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.accountSettings))
                    .call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => UserProfileCubit(
                  state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  di(),
                  di(),
                  di(),
                  di(),
                ),
                child: const UserProfilePage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          _goRouteWithTransition(
            AppRoutes.myBusiness,
            BlocProvider(
              create: (context) => BusinessBloc(
                di(),
                di(),
                di(),
                di(),
              ),
              child: const BusinessPage(),
            ),
            [RedirectRoute.requiresLogin],
            access: ModuleGuardType.business,
          ),
          GoRoute(
            path: AppRoutes.manageMenu.path,
            name: AppRoutes.manageMenu.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.menu)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => ManageMenuCubit(
                  di(),
                  uuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  businessDM: state.extra as BusinessDM?,
                ),
                child: const ManageMenuScreen(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            // Importar menú con IA (refactor Mateo 2026-05-09).
            // El `routeIdParam` recibe el `BusinessMenu.uuid` (NO el business
            // uuid) — el cubit lo pasa tal cual al BE, que verifica IDOR
            // contra el manager logueado en `resolveMenuOrFail`.
            path: AppRoutes.manageMenuImport.path,
            name: AppRoutes.manageMenuImport.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.menu)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: MenuImportPage(
                businessMenuUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            // App Link F3a: llega desde fuera de la app (QR/link). SIN
            // redirectors: JoinByLinkPage espera la restauración de sesión y
            // decide (join directo o login con código pendiente).
            path: AppRoutes.joinGroupOrder.path,
            name: AppRoutes.joinGroupOrder.name,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: JoinByLinkPage(code: state.pathParameters[AppRoutes.routeIdParam] ?? ''),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.groupOrder.path,
            name: AppRoutes.groupOrder.name,
            // Solo requiresLogin (sin `access:`): ordenar en grupo es una
            // acción de CLIENTE, no un módulo de negocio. El guest-gate del
            // CTA ya garantiza que solo usuarios logueados llegan aquí.
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin])).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: GroupOrderPage(orderUuid: state.pathParameters[AppRoutes.routeIdParam] ?? ''),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.manageServicePackages.path,
            name: AppRoutes.manageServicePackages.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.business)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: ManageServicePackagesPage(
                businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          _goRouteWithTransition(AppRoutes.privacyPolicy, const PrivacyPolicyPage(), []),
          _goRouteWithTransition(AppRoutes.termsConditions, const TermsConditionsPage(), []),
          _goRouteWithTransition(AppRoutes.myReservations, const MyReservationsPage(), [RedirectRoute.requiresLogin]),
          _goRouteWithTransition(AppRoutes.blockedUsers, const BlockedUsersPage(), [RedirectRoute.requiresLogin]),
          _goRouteWithTransition(AppRoutes.about, const AboutPage(), [RedirectRoute.requiresLogin]),
          GoRoute(
            path: AppRoutes.managePromotions.path,
            name: AppRoutes.managePromotions.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.business)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => ManagePromotionsCubit(
                  state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  di(),
                  di(),
                  state.extra as BusinessDM?,
                  di(),
                ),
                child: const ManagePromotionsPage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.manageReservations.path,
            name: AppRoutes.manageReservations.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.home)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: ManageReservationsPage(
                businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                initialFilter: state.uri.queryParameters['filter'],
                // Both call sites (footer buttons + home) already pass the
                // BusinessDM via `extra`. The cubit uses its categoryId to
                // derive the booking_type filter automatically.
                business: state.extra as BusinessDM?,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.manageAvailability.path,
            name: AppRoutes.manageAvailability.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.business)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => AvailabilityCubit(
                  repo: di(),
                  logger: di(),
                  businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                ),
                child: ManageAvailabilityPage(
                  businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                ),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          // F4a: panel "Órdenes en vivo" (dueño). El cubit vive en la ruta:
          // lista + realtime por negocio; el detalle se pushea con
          // BlocProvider.value sobre el MISMO cubit.
          GoRoute(
            path: AppRoutes.liveOrders.path,
            name: AppRoutes.liveOrders.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.business)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => ManagerOrdersCubit(
                      repo: di(),
                      logger: di(),
                      realtime: di(),
                      businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                    )..load(),
                  ),
                  BlocProvider(
                    create: (_) => StripeOnboardingCubit(
                      repo: di(),
                      logger: di(),
                      businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                    )..load(),
                  ),
                ],
                // ?order=<uuid> — el modal de aviso abre la orden concreta.
                child: ManagerOrdersPage(openOrderUuid: state.uri.queryParameters['order']),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.businessAnalytics.path,
            name: AppRoutes.businessAnalytics.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.business)).call,
            pageBuilder: (context, state) {
              // [AnalyticsCubit] now needs the full BusinessDM (not just the
              // uuid) to derive [AnalyticsKind] from `categoryId` — that's
              // what selects between business-overview and service-overview.
              // The footer button in `business_footer_buttons.dart:79` already
              // passes `vm.currentBusiness` via `extra`, so this is a typed
              // read against the existing contract.
              //
              // Defensive fallback: if `extra` is missing (e.g. someone deep-
              // links to the analytics route without going through the
              // dashboard), fall back to the auth user's first business —
              // managers always have one. As a last resort we synthesise a
              // BusinessDM from just the uuid path param so the cubit can
              // still attempt the fetch (will render as `restaurant` flavour
              // until business detail loads downstream).
              final business = (state.extra is BusinessDM)
                  ? state.extra as BusinessDM
                  : (di<AuthSessionService>().userSessionDM?.user.business.firstOrNull ??
                      BusinessDM(uuid: state.pathParameters[AppRoutes.routeIdParam] ?? ''));
              return CustomTransitionPage<void>(
                transitionDuration: Durations.medium4,
                key: state.pageKey,
                child: BlocProvider(
                  create: (_) => AnalyticsCubit(
                    dashboardRepo: di(),
                    logger: di(),
                    business: business,
                  ),
                  child: const AnalyticsDashboardPage(),
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.visitBusiness.path,
            name: AppRoutes.visitBusiness.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.home)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => VisitBusinessCubit(
                  di(),
                  di(),
                  state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  state.extra as BusinessDM?,
                  di(),
                  di(),
                  di(),
                ),
                child: const VisitedBusinessPage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.visitMenu.path,
            name: AppRoutes.visitMenu.name,
            redirect: Redirector([]).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => VisitedMenuCubit(
                  di(),
                  uuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  businessDM: state.extra as BusinessDM?,
                ),
                child: const VisitedMenuScreen(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.visitServicePackages.path,
            name: AppRoutes.visitServicePackages.name,
            redirect: Redirector([]).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => VisitServicePackagesCubit(
                  di(),
                  businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  // Piggy-back the full BusinessDM so the cubit can surface
                  // `allow_reservations` for the CTA disable logic. Null on
                  // deep-link entry, which is fine — see cubit doc.
                  business: state.extra as BusinessDM?,
                ),
                child: const VisitServicePackagesPage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.visitPromotions.path,
            name: AppRoutes.visitPromotions.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresLogin], access: ModuleGuardType.home)).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => PromotionsCubit(
                  state.pathParameters[AppRoutes.routeIdParam] ?? '',
                  state.extra as BusinessDM?,
                  di(),
                  di(),
                ),
                child: const PromotionsPage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          // Puente del onboarding de Stripe (App Link): el botón "volver a
          // Foodly" del onboarding hosteado navega a
          // menu.foodly.solutions/stripe/{return|refresh} y Android abre LA
          // APP acá (dominio verificado). Aterriza en "Órdenes en vivo" del
          // negocio del owner — el banner consulta el estado real contra
          // Stripe al montarse. Sin sesión/negocio (cold start), a start.
          GoRoute(
            path: AppRoutes.stripeReturn.path,
            redirect: (_, __) => GoRouterRedirector.stripeBridgeLandingPath(
              ownerBusinessUuid: authSessService.userSessionDM?.user.business.firstOrNull?.uuid,
            ),
          ),
          GoRoute(
            path: AppRoutes.stripeRefresh.path,
            redirect: (_, __) => GoRouterRedirector.stripeBridgeLandingPath(
              ownerBusinessUuid: authSessService.userSessionDM?.user.business.firstOrNull?.uuid,
            ),
          ),
          // Vuelta del Checkout hosteado (App Link F4b). El comensal paga con
          // MB WAY en el navegador y vuelve acá; sin esta ruta el router no
          // matcheaba nada y lo dejaba en NotFoundPage justo después de pagar.
          //
          // `hasSessionOrPending` y no `isLoggedIn`, por el mismo motivo que el
          // deep link del menú: al volver del navegador la app puede estar
          // arrancando en frío con HydratedBloc todavía rehidratando, y con
          // `isLoggedIn` el comensal caía en start teniendo sesión válida.
          GoRoute(
            path: AppRoutes.checkoutReturn.path,
            redirect: (_, state) => GoRouterRedirector.checkoutReturnLandingPath(
              orderUuid: state.uri.queryParameters['order'],
              hasSession: authSessService.hasSessionOrPending,
            ),
          ),
          // Safety net: noAccess must be registered ABOVE the /:businessUuid
          // catch-all so that /no-access doesn't match publicMenu with
          // businessUuid='no-access'. Destino según sesión: CON sesión va a
          // su home con aviso (jamás al login teniendo sesión); SIN sesión,
          // al login. Decisión pura en [GoRouterRedirector.noAccessLandingPath].
          GoRoute(
            path: AppRoutes.noAccess.path,
            redirect: (_, __) {
              final loggedIn = authSessService.isLoggedIn;
              if (loggedIn) NoAccessNotice.raise();
              return GoRouterRedirector.noAccessLandingPath(
                isLoggedIn: loggedIn,
                userUuid: authSessService.uuid,
              );
            },
            builder: (_, __) => const NotFoundPage(), // never reached
          ),
          // Deep link handler: menu.foodly.solutions/{uuid}
          // Logged-in users → visited business (full experience).
          // Not logged-in → public menu (read-only).
          //
          // IMPORTANT: use [hasSessionOrPending], NOT [isLoggedIn]. On a cold-
          // start triggered by the QR (app closed → scan → app opens AND the
          // deep link is delivered while HydratedBloc is still rehydrating),
          // [setSession] hasn't been called yet, so [isLoggedIn] returns false
          // even when there is a perfectly valid cached session. That made the
          // user land on the public read-only menu when they should have gotten
          // the in-app visited experience. [hasSessionOrPending] also picks up
          // the pending-restore window, closing that race. If the restore
          // ultimately fails (refresh token expired, etc.), the [visitBusiness]
          // route has its own [requiresAccess, requiresLogin] redirector that
          // bounces to login — so this is safe.
          GoRoute(
            path: AppRoutes.publicMenu.path,
            redirect: (context, state) {
              if (authSessService.hasSessionOrPending) {
                final uuid = state.pathParameters['businessUuid'] ?? '';
                return AppRoutes.visitBusiness.path.replaceFirst(':id', uuid);
              }
              return null;
            },
            builder: (ctx, state) => PublicMenuPage(
              businessUuid: state.pathParameters['businessUuid']!,
              dio: di<Dio>(),
            ),
          ),
        ],
      ], // end if (!_isMenuSubdomain)
      errorPageBuilder: (context, state) => const MaterialPage(child: NotFoundPage()),
    );
  }
}
