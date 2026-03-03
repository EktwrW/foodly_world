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
    if (authHeader.isNotEmpty &&
        authHeader.startsWith(TokenType.bearer.name) &&
        authSessionService.isAccessTokenExpired &&
        authSessionService.isLoggedIn) {
      authSessionService.notifyTokenExpired();
      return;
    }

    if (authHeader.isNotEmpty && authHeader.startsWith(TokenType.bearer.name)) {
      options.headers[FoodlyStrings.AUTHORIZATION] = authSessionService.userSessionDM?.token;
    }

    return handler.next(options);
  }

  static void dioErrorHandler(DioException e, ErrorInterceptorHandler handler) async {
    final authSessionService = di<AuthSessionService>();

    // Handle 401 Unauthenticated — clear session and force login.
    // Suppress during biometric login: the backend rotates the token
    // (deletes old, creates new), so stale in-flight requests getting
    // 401 is expected and not a real session expiration.
    if (e.response?.statusCode == 401) {
      if (!authSessionService.isBiometricLoginInProgress) {
        authSessionService.notifyTokenExpired();
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
