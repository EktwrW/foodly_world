import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/enums/permission_guarded_resource_enum.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:go_router/go_router.dart';

class Redirector {
  final List<GoRouterRedirect> redirectors;
  final bool _isOr;
  Redirector(this.redirectors) : _isOr = false;
  Redirector.or(this.redirectors) : _isOr = true;

  FutureOr<String?> call(BuildContext context, GoRouterState state) {
    FutureOr<String?> redirect;
    for (var redirector in redirectors) {
      redirect = redirector(context, state);
      if (redirect != null && !_isOr) return redirect;
      if (redirect == null && _isOr) return null;
    }
    return redirect;
  }
}

abstract class GoRouterRedirector {
  static AuthSessionService get authSessionService => di<AuthSessionService>();

  static GoRouterRedirect requiresLogin() => (context, state) {
        if (!authSessionService.isLoggedIn) {
          return '${AppRoutes.start.path}?return_url=${Uri.encodeQueryComponent(state.uri.toString())}';
        }

        return null;
      };

  static GoRouterRedirect requiresAppInitial(RootBloc rootBloc) => (context, state) {
        String? path;
        rootBloc.state.whenOrNull(
          initial: () => path = null,
          cachedState: (_) => path = !authSessionService.isLoggedIn ? AppRoutes.login.path : null,
        );
        return path;
      };

  /// For new routes that needs to be guarded:
  /// Add an enum value to AppGuardedResource and parseLocation to use this redirector
  static GoRouterRedirect requiresAccess() => (context, state) {
        if (!authSessionService.hasAccessToModule(ModuleGuardType.getModuleGuardTypeByRoute(state))) {
          return AppRoutes.noAccess.path;
        }
        return null;
      };
}
