import 'dart:async';
import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/views/business/business_page.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/manage_menu_screen.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/manage_promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/manage_promotions_page.dart';
import 'package:foodly_world/ui/views/home/home_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/categories_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/my_favorites_page.dart';
import 'package:foodly_world/ui/views/home/pages/notifications_page/notifications_page.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/saved_promotions_page.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/users_community_page.dart';
import 'package:foodly_world/ui/views/not_found/not_found_page.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/sign_up_business_page.dart';
import 'package:foodly_world/ui/views/sign_up/sign_up_user_page.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/user_profile/cubit/user_profile_cubit.dart';
import 'package:foodly_world/ui/views/user_profile/user_profile_page.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/visited_menu_screen.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/cubit/promotions_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/promotions_page.dart';
import 'package:foodly_world/ui/views/visited_business/visit_business_page.dart';
import 'package:go_router/go_router.dart';

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

    if (_routeHistory.length >= 100) _routeHistory.removeAt(0);
    _routeHistory.add(state.uri.toString());

    await saveLastRoute(state.matchedLocation);
  }

  void goBackToLastRoute(BuildContext context) async {
    if (_routeHistory.length > 2) {
      final lastRoute = _routeHistory[_routeHistory.length - 2];
      if (lastRoute == '/' && authSessService.isLoggedIn) {
        context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: authSessService.uuid});
      }
      await saveLastRoute(lastRoute);
      appRouter.go(lastRoute);
      _routeHistory.removeLast();
      _routeHistory.removeLast();
      return;
    }

    if (authSessService.isLoggedIn) {
      context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: authSessService.uuid});
    } else {
      context.goNamed(AppRoutes.login.name);
    }
  }

  Future<void> saveLastRoute(String lastRoute) async {
    if (lastRoute != '/') {
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
        return state.uri.toString() == appRoute.path ? AppRoutes.notFoundScreen.path : null;
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
    ];

    return exactPublicPaths.contains(path) || path.startsWith('/menu/');
  }

  bool _isLoginRoute(String path) => path == AppRoutes.login.path;

  bool _isProfileRoute(String path) => path == AppRoutes.profileScreen.path;

  AppRouter({
    required this.rootBloc,
  }) {
    appRouter = GoRouter(
      debugLogDiagnostics: di<BaseConfig>().isLoggingEnabled,
      navigatorKey: rootNavigatorKey,
      redirect: (context, state) async {
        updateCurrentRoute(state);

        // Si el usuario está siendo forzado a hacer login
        if (di<AuthSessionService>().forceToLogin) {
          return AppRoutes.login.path;
        }

        // Si el usuario no está autenticado y no está en una ruta pública
        if (!authSessService.isLoggedIn && !_isPublicRoute(state.matchedLocation)) {
          return AppRoutes.login.path;
        }

        final lastPath = await localStorageService.getString(FoodlyStrings.LAST_PATH);

        // Si el usuario está autenticado y tiene una última ruta válida
        if (authSessService.isLoggedIn &&
            lastPath != null &&
            lastPath != state.matchedLocation &&
            !_isLoginRoute(state.matchedLocation)) {
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
                  _goRouteWithTransition(AppRoutes.usersCommunity, const UsersCommunityPage(),
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
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            transitionDuration: Durations.medium4,
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => CategoriesCubit(state.extra as FoodlyCategories?),
              child: const CategoriesPage(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
        ),
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
            create: (context) => BusinessBloc(di(), di(), di()),
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
              ),
              child: const ManagePromotionsPage(),
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
      ],
      errorPageBuilder: (context, state) => const MaterialPage(child: NotFoundPage()),
    );
  }
}
