import 'dart:async';

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
        // Allow navigation while a session is being restored asynchronously
        // (tokens loaded from secure storage by RootBloc). The biometric guard
        // or token validation will handle protection once the restore completes.
        if (!authSessionService.isLoggedIn && !authSessionService.hasPendingSessionRestore) {
          return '${AppRoutes.start.path}?return_url=${Uri.encodeQueryComponent(state.uri.toString())}';
        }

        return null;
      };

  static GoRouterRedirect requiresAppInitial(RootBloc rootBloc) => (context, state) {
        String? path;
        rootBloc.state.whenOrNull(
          initial: () => path = null,
          cachedState: (_) {
            // Allow navigation while session restore is in progress — tokens
            // are being loaded async from secure storage by RootBloc.fromJson().
            if (!authSessionService.isLoggedIn && !authSessionService.hasPendingSessionRestore) {
              // Allow sign-up routes — they are pre-auth and always accessible.
              // Without this, a stale cachedState (HydratedBloc restore) would
              // redirect sign-up to /login, which looks identical to /start,
              // making the button appear broken on any device with prior session.
              final loc = state.matchedLocation;
              final isSignUpRoute =
                  loc == AppRoutes.signUp.path || loc == AppRoutes.signUpBusiness.path;
              path = isSignUpRoute ? null : AppRoutes.login.path;
            }
          },
        );
        return path;
      };

  /// For new routes that needs to be guarded:
  /// Add an enum value to AppGuardedResource and parseLocation to use this redirector
  static GoRouterRedirect requiresAccess() => (context, state) {
        // While a session restore is in progress (tokens loading from secure
        // storage), userSessionDM is still null so hasAccessToModule() would
        // always return false. Allow through — the biometric/auto-login flow
        // will set the session before the page makes any API calls.
        if (authSessionService.hasPendingSessionRestore) return null;

        if (!authSessionService.hasAccessToModule(ModuleGuardType.getModuleGuardTypeByRoute(state))) {
          return AppRoutes.noAccess.path;
        }
        return null;
      };
}
