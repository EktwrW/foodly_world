import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;
import 'package:foodly_world/generated/l10n.dart';

class AppRequestException implements Exception {
  final Object? error;
  final StackTrace? stackTrace;

  const AppRequestException({this.error, this.stackTrace});

  /// HTTP status code if the underlying error came from Dio. Null for
  /// non-network errors (parsing, programmer error, etc.).
  int? get statusCode {
    if (error is DioException) {
      return (error as DioException).response?.statusCode;
    }
    return null;
  }

  /// Application-level error code from the response body, when the BE
  /// includes one. Lets call sites distinguish "current_password_mismatch"
  /// from "current_password_required" without parsing English strings.
  String? get errorCode {
    if (error is DioException) {
      final data = (error as DioException).response?.data;
      if (data is Map) {
        final code = data['code'];
        if (code is String && code.isNotEmpty) return code;
      }
    }
    return null;
  }

  /// Mensaje legible que mandó el backend (`message` del body Laravel);
  /// null si no hay respuesta, no es Dio o el body no lo trae. Permite a la
  /// UI mostrar la causa real ("La orden ya no admite nuevos participantes")
  /// en vez de un genérico (e2e r5).
  String? get serverMessage {
    if (error is DioException) {
      final data = (error as DioException).response?.data;
      if (data is Map) {
        final msg = data['message'];
        if (msg is String && msg.trim().isNotEmpty) return msg;
      }
    }
    return null;
  }

  /// Field-level validation errors keyed by field name. Empty when the
  /// response is not a Laravel-style 422 with `errors`.
  Map<String, List<String>> get fieldErrors {
    if (error is DioException) {
      final data = (error as DioException).response?.data;
      if (data is Map) {
        final raw = data['errors'];
        if (raw is Map) {
          return {
            for (final e in raw.entries)
              '${e.key}': e.value is List
                  ? List<String>.from(e.value.map((v) => '$v'))
                  : ['${e.value}'],
          };
        }
      }
    }
    return const {};
  }

  /// True for `DioException`s whose `error` is one of the offline-ish
  /// types — used by the presenter to show a "no connection" message
  /// instead of a generic one.
  bool get isOffline {
    if (error is! DioException) return false;
    final t = (error as DioException).type;
    return t == DioExceptionType.connectionError ||
        t == DioExceptionType.connectionTimeout ||
        t == DioExceptionType.receiveTimeout ||
        t == DioExceptionType.sendTimeout;
  }

  String get errorMsg {
    if (error is DioException) {
      final dio = error as DioException;
      final data = dio.response?.data;
      if (data is Map) {
        // If there are field-level validation errors, surface them.
        final errors = data['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final details = errors.entries.map((e) {
            final msgs = e.value is List ? (e.value as List).join(', ') : '${e.value}';
            return '${e.key}: $msgs';
          }).join('\n');
          final msg = data['message'] as String? ?? '';
          return msg.isNotEmpty ? '$msg\n$details' : details;
        }

        final msg = data['message'] as String?;
        if (msg != null && msg.isNotEmpty) return msg;
      }
      return '${dio.response?.statusMessage} error code: ${dio.response?.statusCode}';
    }

    return '${di<BaseConfig>().isDev ? error : S.current.contactAdmin}';
  }

  @override
  String toString() => errorMsg;
}
