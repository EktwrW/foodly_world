import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;
import 'package:foodly_world/generated/l10n.dart';

class AppRequestException implements Exception {
  final Object? error;
  final StackTrace? stackTrace;

  const AppRequestException({this.error, this.stackTrace});

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
