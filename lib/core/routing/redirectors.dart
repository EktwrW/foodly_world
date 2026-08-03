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
        // Modo invitado (5.1.1.v): el invitado puede abrir las rutas de
        // descubrimiento sin sesión. Las rutas NO browsable (reservas, perfil,
        // etc.) siguen exigiendo login — el gate amable se dispara antes en el
        // handler de la acción; esto es el backstop.
        if (authSessionService.isGuest && GuestRoutes.isBrowsable(state.matchedLocation)) {
          return null;
        }

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

  /// Guard de módulo. El [module] se declara EXPLÍCITO al registrar la ruta
  /// (app_router `access:`) — "ruta guardada sin mapear" no puede existir por
  /// construcción: el compilador exige el módulo junto con el guard.
  static GoRouterRedirect requiresAccess(ModuleGuardType module) => (context, state) {
        return accessRedirectPath(
          // Modo invitado (5.1.1.v): las rutas de descubrimiento no tienen
          // módulo de permiso (no hay sesión). Sin este bypass el invitado
          // caería a /no-access. Se permiten solo las rutas browsable.
          guestBrowsable:
              authSessionService.isGuest && GuestRoutes.isBrowsable(state.matchedLocation),
          // While a session restore is in progress (tokens loading from secure
          // storage), userSessionDM is still null so hasAccessToModule() would
          // always return false. Allow through — the biometric/auto-login flow
          // will set the session before the page makes any API calls.
          pendingRestore: authSessionService.hasPendingSessionRestore,
          hasAccess: authSessionService.hasAccessToModule(module),
        );
      };

  /// Decisión pura de [requiresAccess] (testeable sin GoRouter).
  static String? accessRedirectPath({
    required bool guestBrowsable,
    required bool pendingRestore,
    required bool hasAccess,
  }) {
    if (guestBrowsable || pendingRestore) return null;
    return hasAccess ? null : AppRoutes.noAccess.path;
  }

  /// Destino de /no-access según sesión (decisión pura, testeable):
  /// CON sesión → su home (denegación real de permisos: jamás al login
  /// teniendo sesión); SIN sesión → login.
  static String noAccessLandingPath({required bool isLoggedIn, required String userUuid}) =>
      isLoggedIn
          ? '${AppRoutes.home.path}/${AppRoutes.foodlyMainPage.path.replaceFirst(':id', userUuid)}'
          : AppRoutes.login.path;
}
