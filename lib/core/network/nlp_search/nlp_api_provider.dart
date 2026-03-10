import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyStrings;

class NlpApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  /// NLP Search Service standalone URL on Cloud Run
  static const String nlpSearchBaseUrl = 'https://nlp-search-service-r4khhqj4mq-ew.a.run.app';

  NlpApiProvider() {
    _dio = Dio(BaseOptions(
      headers: {
        FoodlyStrings.CONTENT_TYPE: FoodlyStrings.APPLICATION_JSON,
        FoodlyStrings.ACCEPT: FoodlyStrings.APPLICATION_JSON,
      },
      baseUrl: nlpSearchBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }
}
