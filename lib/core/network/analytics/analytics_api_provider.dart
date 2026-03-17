import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyStrings;

class AnalyticsApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  /// Analytics ingest service (Mateo's FastAPI on Cloud Run).
  /// URL will be updated once the service is deployed.
  /// Auth: endpoint is currently open; no Authorization header is sent.
  static const String analyticsBaseUrl = 'https://placeholder-analytics-service.run.app';

  AnalyticsApiProvider() {
    _dio = Dio(BaseOptions(
      headers: {
        FoodlyStrings.CONTENT_TYPE: FoodlyStrings.APPLICATION_JSON,
        FoodlyStrings.ACCEPT: FoodlyStrings.APPLICATION_JSON,
      },
      baseUrl: analyticsBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));
  }
}
