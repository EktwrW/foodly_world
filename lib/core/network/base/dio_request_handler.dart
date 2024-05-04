import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:logger/logger.dart';

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
    final responseMsg = e.response?.data.toString().toLowerCase() ?? '';
    if (e.response?.statusCode == ApiResponseStatus.internalServerError.code) {
      authSessionService.notifyInternalServerError(e);
      return handler.reject(e);
    }

    await authSessionService.validateAccessToken();
    if (responseMsg.contains('invalid token') || responseMsg.toLowerCase().contains('no authorization header found')) {
      authSessionService.notifyTokenExpired();
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
