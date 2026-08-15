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

    // Sello de generación, ANTES de cualquier rama: identifica a qué sesión
    // pertenece esta request. Lo lee el error handler para descartar los 401
    // que son eco de una sesión que ya no existe (ver [sessionGeneration]).
    //
    // Va acá arriba y no al final porque los endpoints de auth salen por un
    // `return` temprano unas líneas más abajo: si el sello se pusiera después,
    // esas requests viajarían sin él.
    options.extra[_kSessionGenerationKey] = authSessionService.sessionGeneration;

    // EN QUÉ IDIOMA ESTÁ ESTE COMENSAL (2026-08-14).
    //
    // La app NUNCA mandaba `Accept-Language`. El backend tiene un middleware
    // que lo lee (`SetLocaleFromHeader`) y, sin cabecera, `app()->getLocale()`
    // se queda en el default de Laravel: inglés. Consecuencia: todo lo que la
    // API devuelve con `__()` salía en inglés a una app en español — los
    // errores de group orders, de reservas, de auth, y la página del Checkout
    // hosteado de Stripe, que recibe este mismo locale.
    //
    // El modal que decía "We couldn't start the payment" en una app en español
    // era exactamente esto, y estuvo a la vista toda la tarde del e2e sin que
    // nadie —yo el primero— se preguntara por qué estaba en inglés.
    //
    // Va en el INTERCEPTOR y no en los `BaseOptions` del Dio para que se
    // recalcule en cada petición: las cabeceras base se fijan al construir el
    // cliente, y el idioma del dispositivo puede cambiar mientras la app vive.
    //
    // Misma fuente que el registro del DeviceToken (`FoodlyLocales`), para que
    // el idioma del push y el de la API no puedan discrepar. Se manda el tag
    // completo ('pt-PT', 'es-AR'); el backend se queda con el primario.
    options.headers[FoodlyStrings.ACCEPT_LANGUAGE] = FoodlyLocales.deviceLocaleTag;

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
        //
        // Re-sellar. El sello registra bajo QUÉ SESIÓN sale efectivamente la
        // request, y unas líneas más abajo se le inyecta el token vigente.
        // Un refresco no cambia la generación (es la misma sesión con
        // credenciales frescas), así que normalmente esto no altera nada;
        // importa si la sesión cambió por otro motivo durante el await.
        options.extra[_kSessionGenerationKey] = authSessionService.sessionGeneration;
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
      // Modo invitado (5.1.1.v) / sin sesión: NO mandamos `Authorization:
      // Bearer null`. Los endpoints de descubrimiento (`/promotions/nearby`,
      // `/business/new-releases`, `/business/nearby|search`, `/public/menu/*`)
      // tienen auth Sanctum OPCIONAL: con un token inválido el BE podría
      // 401-ear en vez de responder como anónimo. Quitamos el header para que
      // el invitado reciba la respuesta pública. Una llamada genuinamente
      // authed que se escape sin token recibirá 401 silencioso (el error
      // handler + notifyTokenExpired ya guardan contra `!isLoggedIn`).
      if (activeToken != null && activeToken.isNotEmpty) {
        options.headers[FoodlyStrings.AUTHORIZATION] =
            '${authSessionService.userSessionDM?.tokenType ?? 'Bearer'} $activeToken';
      } else {
        options.headers.remove(FoodlyStrings.AUTHORIZATION);
      }
    }

    return handler.next(options);
  }

  /// Clave del sello de generación dentro de `RequestOptions.extra`.
  static const _kSessionGenerationKey = 'foodly_session_generation';

  /// Marca de "esta request ya se reintentó una vez tras refrescar".
  ///
  /// `dio.fetch()` vuelve a recorrer los interceptores, así que un reintento
  /// que también recibe 401 vuelve a caer acá: refresca, reintenta, 401,
  /// refresca… sin fin, martillando `/token/refresh` y la batería. Basta con
  /// que el BE devuelva 401 donde correspondería un 403 (permiso denegado)
  /// para entrar en ese bucle. Un solo reintento es suficiente: si con un
  /// token recién emitido sigue dando 401, el problema no es el token.
  static const _kRetriedKey = 'foodly_retried_after_refresh';

  static void dioErrorHandler(DioException e, ErrorInterceptorHandler handler) async {
    final authSessionService = di<AuthSessionService>();

    // Handle 401 Unauthenticated — clear session and force login.
    // Skip for auth endpoints (login, register, social login): a 401 from
    // those means wrong credentials, not an expired session — the cubit
    // already handles the error and showing a second "session expired"
    // modal would confuse the user.
    // Also suppress during biometric login (token rotation race condition).
    if (e.response?.statusCode == 401) {
      // Eco de una sesión anterior: la request salió bajo otra sesión (o sin
      // ninguna) y su respuesta llegó tarde. No puede opinar sobre la sesión
      // vigente — ni para refrescarla, ni mucho menos para declararla muerta.
      //
      // El caso real (2026-08-09): app actualizada desde Play Store, la sesión
      // cacheada ya estaba muerta, salieron requests con el token viejo, el
      // usuario entró de nuevo con Google, y esos 401 rezagados aterrizaron
      // sobre la sesión NUEVA. `notifyTokenExpired` solo exige `isLoggedIn`,
      // que ahora era true, así que pintaba "tu sesión expiró" encima de un
      // login recién hecho, mientras cargaba el home.
      //
      // El guard vive DENTRO del bloque 401 a propósito: un 500 rezagado
      // sigue mereciendo su aviso genérico, y acotarlo evita cambiarle el
      // comportamiento a todo lo demás.
      final stamp = e.requestOptions.extra[_kSessionGenerationKey];
      if (stamp is int && stamp != authSessionService.sessionGeneration) {
        return handler.reject(e);
      }

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
        final alreadyRetried = e.requestOptions.extra[_kRetriedKey] == true;

        // Attempt a silent refresh before declaring the session dead.
        //
        // Ya NO se pregunta por `isRefreshingToken`. Esa condición hacía que
        // el segundo 401 concurrente cayera directo al `else` —
        // `notifyTokenExpired()`— mientras el primero estaba refrescando con
        // éxito: el home dispara varias requests juntas, todas 401ean, una
        // refresca y las otras echaban al usuario. Ahora `silentRefresh()`
        // deduplica y cada llamante espera el resultado REAL del refresco en
        // curso (2026-08-09).
        if (authSessionService.hasRefreshToken && !alreadyRetried) {
          final refreshed = await authSessionService.silentRefresh();
          if (refreshed) {
            // Retry the original request with the fresh access token.
            try {
              final activeToken = authSessionService.userSessionDM?.accessToken ??
                  authSessionService.userSessionDM?.token;
              e.requestOptions.headers[FoodlyStrings.AUTHORIZATION] =
                  '${authSessionService.userSessionDM?.tokenType ?? 'Bearer'} $activeToken';
              // Marcar el reintento para que su propio 401 no vuelva a entrar
              // al ciclo de refresco (ver [_kRetriedKey]). El sello no hace
              // falta tocarlo: `fetch` recorre de nuevo el request handler,
              // que lo pone con la generación del momento del envío.
              e.requestOptions.extra[_kRetriedKey] = true;
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
