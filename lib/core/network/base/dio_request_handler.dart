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

    // Auth endpoints (login, social-login, register) must NEVER be blocked
    // by stale token checks. These endpoints are unauthenticated on the
    // backend but Dio's base headers may carry a stale Bearer token from a
    // previous session. Strip the auth header and let them through.
    final path = options.path;
    final isAuthEndpoint = path.endsWith('/login') ||
        path.endsWith('/social-login') ||
        path.endsWith('/register') ||
        path.endsWith('/forgot-password');

    if (isAuthEndpoint) {
      options.headers.remove(FoodlyStrings.AUTHORIZATION);
      return handler.next(options);
    }

    // If the access token looks expired client-side, try a silent refresh
    // before sending the request. This avoids a guaranteed 401 round-trip.
    if (authHeader.isNotEmpty &&
        authHeader.startsWith(TokenType.bearer.name) &&
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
    if (authHeader.isNotEmpty && authHeader.startsWith(TokenType.bearer.name)) {
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
      final path = e.requestOptions.path;
      final isAuthEndpoint = path.endsWith('/login') ||
          path.endsWith('/register') ||
          path.endsWith('/social-login') ||
          path.endsWith('/token/refresh');

      if (!authSessionService.isBiometricLoginInProgress && !isAuthEndpoint) {
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
