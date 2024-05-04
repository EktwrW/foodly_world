import 'package:dio/dio.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';

class AppRequestException implements Exception {
  final Object? error;
  final StackTrace? stackTrace;

  AppRequestException({this.error, this.stackTrace});

  String get errorMsg {
    if (error is DioException) {
      return '${(error as DioException).response?.data}';
    }

    return '${di<BaseConfig>().isDev ? error : 'An error occurred, please contact admin.'}';
  }

  @override
  String toString() => errorMsg;
}
