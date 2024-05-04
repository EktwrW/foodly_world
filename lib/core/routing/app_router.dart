import 'dart:async';
import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/routing/redirectors.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/local_storage_service.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/dashboard_page.dart';
import 'package:foodly_world/ui/views/home/bloc/home_bloc.dart';
import 'package:foodly_world/ui/views/home/home_page.dart';
import 'package:foodly_world/ui/views/home/pages/faved_business_page/faved_business_page.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
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
        context
            .goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: authSessService.userId});
      }
      await saveLastRoute(lastRoute);
      appRouter.go(lastRoute);
      _routeHistory.removeLast();
      _routeHistory.removeLast();
    } else {
      context.goNamed(AppRoutes.foodlyMainPage.name, pathParameters: {AppRoutes.routeIdParam: authSessService.userId});
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

  GoRoute _goRouteFadeTransition(AppRoutes appRoute, Widget page, List<RedirectRoute> redirectors) {
    return GoRoute(
      path: appRoute.path,
      name: appRoute.name,
      redirect: Redirector(_getRedirectors(redirectors)).call,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 400),
        key: state.pageKey,
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
      builder: (context, state) => page,
    );
  }

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
      children.map((child) => FadeIn(duration: const Duration(milliseconds: 300), child: child)).toList();

  AppRouter({
    required this.rootBloc,
  }) {
    appRouter = GoRouter(
      debugLogDiagnostics: di<BaseConfig>().isLoggingEnabled,
      navigatorKey: rootNavigatorKey,
      redirect: (context, state) async {
        updateCurrentRoute(state);

        if (authSessService.forceToLogin) {
          return AppRoutes.login.path;
        }

        final lastPath = await localStorageService.getString(FoodlyStrings.LAST_PATH);

        if (authSessService.isLoggedIn && lastPath != state.matchedLocation) {
          return lastPath;
        }

        if (authSessService.mustCompleteProfile) return AppRoutes.profileScreen.path;

        return null;
      },
      initialLocation: AppRoutes.start.path,
      routes: [
        _goRouteFadeTransition(AppRoutes.start, const StartingPage369(), [RedirectRoute.requiresAppInitial]),
        _goRouteFadeTransition(AppRoutes.login, const StartingPage369(currentView: StartingPageView.login),
            [RedirectRoute.requiresAppInitial]),
        _goRouteFadeTransition(
            AppRoutes.signUp,
            BlocProvider(create: (context) => SignUpCubit(), child: const SignUpUserPage()),
            [RedirectRoute.requiresAppInitial]),
        _goRouteFadeTransition(
            AppRoutes.signUpBusiness,
            BlocProvider(create: (context) => SignUpCubit(), child: const SignUpBusinessPage()),
            [RedirectRoute.requiresAppInitial]),
        StatefulShellRoute(
          navigatorContainerBuilder: (context, navigationShell, children) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeBloc()),
              BlocProvider(create: (context) => MainDrawerCubit()),
            ],
            child: FadeIn(
                duration: const Duration(milliseconds: 300),
                child: HomePage369(navigationShell: navigationShell, children: _getChildrenFadeTransition(children))),
          ),
          builder: (_, __, navigationShell) => navigationShell,
          branches: [
            StatefulShellBranch(
              routes: [
                _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteFadeTransition(AppRoutes.savedPromotions, const SavedPromotionsPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])),
              ],
            ),
            StatefulShellBranch(
              routes: [
                _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteFadeTransition(AppRoutes.favedBusiness, const FavedBusinessPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])),
              ],
            ),
            StatefulShellBranch(
              routes: [
                _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteFadeTransition(AppRoutes.usersCommunity, const UsersCommunityPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])),
              ],
            ),
            StatefulShellBranch(
              routes: [
                _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteFadeTransition(AppRoutes.notifications, const NotificationsPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])),
              ],
            ),
            StatefulShellBranch(
              routes: [
                _goRouteForStatefulShell(
                    AppRoutes.home,
                    _goRouteFadeTransition(AppRoutes.foodlyMainPage, const FoodlyMainPage(),
                        [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin])),
              ],
            ),
          ],
        ),
        _goRouteFadeTransition(
            AppRoutes.businessPanel,
            BlocProvider(create: (context) => DashboardBloc(), child: const DashboardPage()),
            [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
        _goRouteFadeTransition(
            AppRoutes.profileScreen,
            BlocProvider(create: (context) => UserProfileCubit(), child: const UserProfilePage()),
            [RedirectRoute.requiresAccess, RedirectRoute.requiresLogin]),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: NotFoundPage());
      },
    );
  }
}
