import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';

abstract class DioRequestHandler {
  static void dioRequestHandler(RequestOptions options, RequestInterceptorHandler handler) async {
    final authHeader = options.headers.containsKey(FoodlyStrings.AUTHORIZATION)
        ? options.headers[FoodlyStrings.AUTHORIZATION].toString()
        : '';
    final authSessionService = di<AuthSessionService>();
    await authSessionService.validateAccessToken();

    // Public auth endpoints must NEVER be blocked by stale token checks.
    // These endpoints are UNAUTHENTICATED on the backend but Dio's base
    // headers may carry a stale Bearer token from a previous session. Strip
    // the auth header and let them through.
    //
    // IMPORTANT: use a whitelist of exact paths (prefixed with '/'), NOT
    // endsWith. A lazy `endsWith('/register')` matched `/device-tokens/register`
    // too, stripped its Authorization header, and made every FCM token
    // registration return 401 server-side — the reason no push notifications
    // were being delivered before 2026-04-21. See Bug C.
    //
    // CRITICAL: /biometric-login is NOT in this list. Although it looks like
    // an auth endpoint, server-side it is wrapped by `auth:sanctum`
    // (routes/api.php) and `BiometricAuthController::store` calls
    // `auth()->user()` — so it REQUIRES the Authorization header (the user's
    // currently cached access or refresh token). Putting it here was the
    // cause of Bug E.1: every biometric login returned 401 server-side, the
    // cubit emitted _Error, and FoodlyWrapper bounced the user back to login.
    //
    // Public proxy endpoints (no auth:sanctum in routes/api.php) also belong
    // here so that:
    //   1. No stale Bearer is sent on requests that happen pre-login
    //      (e.g. reverse geocoding en onboarding/signup).
    //   2. If the cached access token is expired, we do NOT stall the
    //      public request on a silent refresh the user's flow doesn't need.
    // - /geocoding/reverse               → throttle:geocoding-public
    // - /config/features                 → throttle:120,1 (bootstrap feature flags)
    // - /public/places/autocomplete      → throttle:places-public (signup)
    // - /public/places/details/{placeId} → throttle:places-public (signup)
    const authEndpoints = <String>{
      '/login',
      '/social-login',
      '/register',
      '/forgot-password',
      '/geocoding/reverse',
      '/config/features',
      '/public/places/autocomplete',
    };
    final path = options.path;

    // `/public/places/details/{placeId}` es una ruta pública CON segmento
    // dinámico — no cabe en el Set exacto (cada placeId es diferente).
    // Usamos `startsWith('/public/places/details/')` SOLO para este caso,
    // asumiendo que NO existe (ni va a existir) una ruta authed con ese
    // prefijo — todas las rutas authed de places viven en `/places/...`
    // sin el `/public/` delante. El naming convention (namespace
    // `/public/`) protege contra falsos positivos estilo Bug C.
    //
    // Si algún día alguien inventa `/public/places/details/admin/...`
    // authed, este chequeo lo dejaría pasar sin Bearer — pero el problema
    // sería estructural (contradicción en naming), no este whitelist.
    final isAuthEndpoint = authEndpoints.contains(path) ||
        path.startsWith('/public/places/details/');

    if (isAuthEndpoint) {
      options.headers.remove(FoodlyStrings.AUTHORIZATION);
      return handler.next(options);
    }

    // If the access token looks expired client-side, try a silent refresh
    // before sending the request. This avoids a guaranteed 401 round-trip.
    //
    // Bug G (2026-05-06): el chequeo era `.startsWith(TokenType.bearer.name)`
    // donde `TokenType.bearer.name == 'bearer'` (lowercase, derivado del
    // identifier del enum). Pero `setSession` construye el header como
    // `'Bearer ...'` con B mayúscula (porque tokenType viene del BE con
    // capital o del default 'Bearer'). startsWith es case-sensitive,
    // así que el predicado NUNCA matcheaba en producción y el pre-flight
    // refresh nunca corría — cada request con token expirado pagaba un
    // 401 + retry en vez de refrescar proactivamente.
    //
    // Fix: comparar lowercase. Es robusto a cualquier casing futuro del BE
    // y elimina la dependencia entre `.name` del enum y el casing del
    // header construído en otra parte del código.
    final isBearer = authHeader.toLowerCase().startsWith('bearer');
    // !isLoggingOut: durante un cierre de sesión NO queremos pre-flight
    // refresh — silentRefresh → setSession → saveTokens repoblaría el secure
    // storage que clearSession está limpiando, dejando una sesión fantasma
    // que al reabrir la app dispara el modal "sesión expirada".
    if (authHeader.isNotEmpty &&
        isBearer &&
        !authSessionService.isLoggingOut &&
        authSessionService.isAccessTokenExpired &&
        authSessionService.isLoggedIn) {
      if (authSessionService.hasRefreshToken) {
        final refreshed = await authSessionService.silentRefresh();
        if (!refreshed) {
          authSessionService.notifyTokenExpired();
          return;
        }
        // After refresh, fall through to use the new access token below.
      } else {
        authSessionService.notifyTokenExpired();
        return;
      }
    }

    // Always inject the latest access token into the request header.
    // Mismo fix de case-sensitivity que arriba (Bug G).
    if (authHeader.isNotEmpty && isBearer) {
      final activeToken = authSessionService.userSessionDM?.accessToken ??
          authSessionService.userSessionDM?.token;
      options.headers[FoodlyStrings.AUTHORIZATION] =
          '${authSessionService.userSessionDM?.tokenType ?? 'Bearer'} $activeToken';
    }

    return handler.next(options);
  }

  static void dioErrorHandler(DioException e, ErrorInterceptorHandler handler) async {
    final authSessionService = di<AuthSessionService>();

    // Handle 401 Unauthenticated — clear session and force login.
    // Skip for auth endpoints (login, register, social login): a 401 from
    // those means wrong credentials, not an expired session — the cubit
    // already handles the error and showing a second "session expired"
    // modal would confuse the user.
    // Also suppress during biometric login (token rotation race condition).
    if (e.response?.statusCode == 401) {
      // Same whitelist pattern as the request handler — see Bug C comment
      // above. Never use endsWith here or `/device-tokens/register`,
      // `/businesses/.../token/refresh`-style paths will match falsely.
      //
      // Los endpoints públicos (`/public/places/*`, `/geocoding/reverse`)
      // también van acá: un 401 sobre ellos sería un bug del backend (mal
      // middleware) y NO debe kickear la sesión del usuario. En prod
      // serviría de escudo si alguien accidentalmente envuelve estas
      // rutas en `auth:sanctum` — el usuario vería un error suave en el
      // widget en vez de un modal de "sesión expirada" + logout.
      const authEndpoints = <String>{
        '/login',
        '/register',
        '/social-login',
        '/biometric-login',
        '/token/refresh',
        '/geocoding/reverse',
        '/public/places/autocomplete',
      };
      final path = e.requestOptions.path;
      final isAuthEndpoint = authEndpoints.contains(path) ||
          // Ver comentario del request handler: placeId dinámico obliga a
          // usar startsWith aislado a este prefijo específico.
          path.startsWith('/public/places/details/');

      // Sudo-mode validation surfaced as 401 (legacy BE behaviour).
      //
      // The "correct" status for `current_password mismatch / required` is
      // 422 — the session is still valid; we're refusing because the user
      // didn't prove they're the legit owner. The BE has been updated to
      // return 422, but in case Cloud Run is still serving the old code
      // (or any other endpoint regresses to 401 for sudo-mode in the
      // future), we sniff the response body and bail out of the
      // session-expired flow when we see signs of a validation error.
      //
      // This avoids the brutal cascade we hit:
      //   1. Interceptor classifies 401 as expired session.
      //   2. Triggers silent refresh → succeeds.
      //   3. Retries original request → still 401 (password still wrong).
      //   4. Calls notifyTokenExpired → forceToLogin + redirect to /login.
      //   5. User is thrown out for mistyping their password.
      final body = e.response?.data;
      bool looksLikeSudoModeFailure = false;
      if (body is Map) {
        final code = body['code'];
        if (code is String &&
            (code == 'current_password_mismatch' || code == 'current_password_required')) {
          looksLikeSudoModeFailure = true;
        } else {
          // Older BE responses include just `{error: "Current password ..."}`.
          // Match conservatively to avoid false positives.
          final raw = '${body['error'] ?? body['message'] ?? ''}'.toLowerCase();
          if (raw.contains('current password')) {
            looksLikeSudoModeFailure = true;
          }
        }
      }

      // !isLoggingOut: un 401 mientras se cierra sesión es esperado (el
      // server ya invalidó el token). No debe gatillar silentRefresh
      // (resucitaría la sesión) ni notifyTokenExpired (modal "sesión
      // expirada"). Simplemente se rechaza el error.
      if (!authSessionService.isBiometricLoginInProgress &&
          !authSessionService.isLoggingOut &&
          !isAuthEndpoint &&
          !looksLikeSudoModeFailure) {
        // Attempt a silent refresh before declaring the session dead.
        if (authSessionService.hasRefreshToken && !authSessionService.isRefreshingToken) {
          final refreshed = await authSessionService.silentRefresh();
          if (refreshed) {
            // Retry the original request with the fresh access token.
            try {
              final activeToken = authSessionService.userSessionDM?.accessToken ??
                  authSessionService.userSessionDM?.token;
              e.requestOptions.headers[FoodlyStrings.AUTHORIZATION] =
                  '${authSessionService.userSessionDM?.tokenType ?? 'Bearer'} $activeToken';
              final response = await di<FoodlyApiProvider>().dio.fetch(e.requestOptions);
              return handler.resolve(response);
            } catch (retryError) {
              // Retry failed — fall through to reject.
            }
          }
          // Refresh failed — session is truly expired.
          authSessionService.notifyTokenExpired();
        } else {
          authSessionService.notifyTokenExpired();
        }
      }
      return handler.reject(e);
    }

    if (e.response?.statusCode == ApiResponseStatus.internalServerError.code) {
      authSessionService.notifyInternalServerError(e);
      return handler.reject(e);
    }

    return handler.next(e);
  }

  static void dioResponseHandler(Response<dynamic> response, ResponseInterceptorHandler handler) async {
    if (response.data is String &&
        response.data.toString().toLowerCase() != 'ok' &&
        response.data.toString().toLowerCase() != 'user active' &&
        !response.data.toString().toLowerCase().contains('DOCTYPE html'.toLowerCase())) {
      try {
        response.data = jsonDecode(response.data as String);
      } on FormatException {
        di<Logger>().e('Format exception - data = ${response.data}');
      } catch (e) {
        di<Logger>().e('$e');
      }
    }
    return handler.next(response);
  }
}
