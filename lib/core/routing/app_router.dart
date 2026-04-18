import 'dart:async';
import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/views/about/about_page.dart';
import 'package:foodly_world/ui/views/analytics/analytics_dashboard_page.dart';
import 'package:foodly_world/ui/views/analytics/cubit/analytics_cubit.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_cubit.dart';
import 'package:foodly_world/ui/views/business/availability/manage_availability_page.dart';
import 'package:foodly_world/ui/views/business/business_page.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/manage_menu_screen.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/manage_promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/manage_promotions_page.dart';
import 'package:foodly_world/ui/views/business/reservations/manage_reservations_page.dart';
import 'package:foodly_world/ui/views/business/service_packages/manage_service_packages_page.dart';
import 'package:foodly_world/ui/views/home/home_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/categories_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/my_favorites_page.dart';
import 'package:foodly_world/ui/views/home/pages/notifications_page/notifications_page.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/saved_promotions_page.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/social_page.dart';
import 'package:foodly_world/ui/views/not_found/not_found_page.dart';
import 'package:foodly_world/ui/views/privacy/privacy_policy_page.dart';
import 'package:foodly_world/ui/views/public_menu/public_menu_page.dart';
import 'package:foodly_world/ui/views/reservations/my_reservations_page.dart';
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

enum RedirectRoute { requiresAppInitial, requiresLogin, requiresAccess }

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
  bool _isNavigationChildOf(String route, String potentialParent) {
    // Synchronous parent derivation covers most cases.
    final parent = _deriveParentRoute(route);
    if (parent != null) return parent == potentialParent;

    // visit-menu's parent is resolved asynchronously (the URL carries the
    // menu UUID, not the business UUID). We know it's always a child of a
    // visit-business route, so match structurally.
    if (route.startsWith('/visit-menu/') && potentialParent.contains('/visit-business')) {
      return true;
    }

    return false;
  }

  void goBackToLastRoute() async {
    if (_routeHistory.length > 2) {
      final lastRoute = _routeHistory[_routeHistory.length - 2];

      // Ping-pong guard: if the previous route is a child of the current
      // location, the user arrived here by pressing "back" from that child.
      // Going back again must continue upward to the logical parent — not
      // return to the child we just left (e.g. analytics ↔ myBusiness,
      // visit-menu ↔ visit-business).
      if (!_isNavigationChildOf(lastRoute, currentLocation)) {
        // Normal history-based back.
        _routeHistory.removeLast();
        _routeHistory.removeLast();

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
  String? _deriveParentRoute(String path) {
    // Children of my-business or visit-business:
    //   /main/<uuid>/my-business/<child>    → /main/<uuid>/my-business
    //   /main/<uuid>/visit-business/<child> → /main/<uuid>/visit-business
    final nestedChild = RegExp(
      r'^(/main/[^/]+/(?:my-business|visit-business))/[^/]+$',
    );
    final nestedMatch = nestedChild.firstMatch(path);
    if (nestedMatch != null) return nestedMatch.group(1);

    // /manage-menu/<businessUuid> → manager's own business page.
    // The myBusiness route uses the *user* UUID, not the business UUID.
    if (path.startsWith('/manage-menu/')) {
      return '${AppRoutes.mainRoute}/${authSessService.uuid}/my-business';
    }

    // /visit-menu/:id — the :id is the MENU UUID, not the business UUID.
    // The correct parent is /main/<businessUuid>/visit-business, but the
    // business UUID isn't in the URL. goBackToLastRoute() resolves this
    // asynchronously via LAST_VISITED_BUSINESS_UUID in LocalStorage.
    // Returning null here makes _deriveParentRoute stay synchronous and
    // lets goBackToLastRoute() handle the async lookup.
    if (path.startsWith('/visit-menu/')) return null;

    // All other routes (myBusiness itself, visitBusiness itself, standalone
    // pages like /about, /privacy, /terms, /my-reservations, profile, etc.)
    // → no specific parent; caller falls back to _goToMainPage().
    return null;
  }

  Future<void> saveLastRoute(String lastRoute) async {
    if (lastRoute != '/' && !_isLoginRoute(lastRoute)) {
      await localStorageService.saveString(FoodlyStrings.LAST_PATH, lastRoute);
    }
  }

  List<FutureOr<String?> Function(BuildContext, GoRouterState)> _getRedirectors(List<RedirectRoute> redirectors) {
    return [
      if (redirectors.contains(RedirectRoute.requiresAppInitial)) GoRouterRedirector.requiresAppInitial(rootBloc),
      if (redirectors.contains(RedirectRoute.requiresAccess)) GoRouterRedirector.requiresAccess(),
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

  GoRoute _goRouteWithTransition(AppRoutes appRoute, Widget page, List<RedirectRoute> redirectors) => GoRoute(
        path: appRoute.path,
        name: appRoute.name,
        redirect: Redirector(_getRedirectors(redirectors)).call,
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
          return '${appRoute.path}/${authSessService.uuid}/foodly-main-page';
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

  bool _isLoginRoute(String path) => path == AppRoutes.login.path;

  bool _isProfileRoute(String path) => path == AppRoutes.profileScreen.path;

  AppRouter({
    required this.rootBloc,
  }) {
    appRouter = GoRouter(
      debugLogDiagnostics: di<BaseConfig>().isLoggingEnabled,
      navigatorKey: rootNavigatorKey,
      observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
      redirect: (context, state) async {
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
            !_isPublicRoute(state.matchedLocation)) {
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
        if (state.matchedLocation == AppRoutes.start.path &&
            authSessService.isLoggedIn &&
            lastPath != null &&
            lastPath != state.matchedLocation) {
          return lastPath;
        }

        // Si el usuario necesita completar su perfil
        if (authSessService.mustCompleteProfile && !_isProfileRoute(state.matchedLocation)) {
          return AppRoutes.profileScreen.path;
        }

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
                    _goRouteWithTransition(AppRoutes.savedPromotions, const SavedPromotionsPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(AppRoutes.favedBusiness, const MyFavoritesPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(AppRoutes.usersCommunity, const SocialPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(AppRoutes.notifications, const NotificationsPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteWithTransition(AppRoutes.foodlyMainPage, const FoodlyMainPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
              path: AppRoutes.categories.path,
              name: AppRoutes.categories.name,
              redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
            [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin],
          ),
          GoRoute(
            path: AppRoutes.manageMenu.path,
            name: AppRoutes.manageMenu.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
            path: AppRoutes.manageServicePackages.path,
            name: AppRoutes.manageServicePackages.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
          _goRouteWithTransition(AppRoutes.about, const AboutPage(), [RedirectRoute.requiresLogin]),
          GoRoute(
            path: AppRoutes.managePromotions.path,
            name: AppRoutes.managePromotions.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: ManageReservationsPage(
                businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                initialFilter: state.uri.queryParameters['filter'],
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.manageAvailability.path,
            name: AppRoutes.manageAvailability.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
          GoRoute(
            path: AppRoutes.businessAnalytics.path,
            name: AppRoutes.businessAnalytics.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Durations.medium4,
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => AnalyticsCubit(
                  dashboardRepo: di(),
                  logger: di(),
                  businessUuid: state.pathParameters[AppRoutes.routeIdParam] ?? '',
                ),
                child: const AnalyticsDashboardPage(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: AppRoutes.visitBusiness.path,
            name: AppRoutes.visitBusiness.name,
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
            redirect: Redirector(_getRedirectors([RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])).call,
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
          // Safety net: noAccess must be registered ABOVE the /:businessUuid
          // catch-all so that /no-access doesn't match publicMenu with
          // businessUuid='no-access'. Redirects to login as a safe fallback.
          GoRoute(
            path: AppRoutes.noAccess.path,
            redirect: (_, __) => AppRoutes.login.path,
            builder: (_, __) => const NotFoundPage(), // never reached
          ),
          // Deep link handler: menu.foodly.solutions/{uuid}
          // Logged-in users → visited business (full experience).
          // Not logged-in → public menu (read-only).
          GoRoute(
            path: AppRoutes.publicMenu.path,
            redirect: (context, state) {
              if (authSessService.isLoggedIn) {
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
