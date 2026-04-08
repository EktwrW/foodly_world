import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyStrings;

class AnalyticsApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  /// Analytics ingest service (Mateo's FastAPI on Cloud Run).
  static const String analyticsBaseUrl = 'https://nlp-search-service-951890938827.europe-west1.run.app';
  static const String _analyticsToken = String.fromEnvironment('ANALYTICS_TOKEN');

  AnalyticsApiProvider() {
    _dio = Dio(BaseOptions(
      headers: {
        FoodlyStrings.CONTENT_TYPE: FoodlyStrings.APPLICATION_JSON,
        FoodlyStrings.ACCEPT: FoodlyStrings.APPLICATION_JSON,
        if (_analyticsToken.isNotEmpty) 'Authorization': 'Bearer $_analyticsToken',
      },
      baseUrl: analyticsBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));
  }
}
