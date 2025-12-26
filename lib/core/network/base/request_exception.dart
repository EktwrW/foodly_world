import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;

class AppRequestException implements Exception {
  final Object? error;
  final StackTrace? stackTrace;

  const AppRequestException({this.error, this.stackTrace});

  String get errorMsg {
    if (error is DioException) {
      return '${(error as DioException).response?.statusMessage} error code: ${(error as DioException).response?.statusCode}';
    }

    return '${di<BaseConfig>().isDev ? error : 'An error occurred, please contact admin.'}';
  }

  @override
  String toString() => errorMsg;
}
