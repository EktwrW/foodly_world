import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, DioRequestHandler, FoodlyStrings;

class FoodlyApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  FoodlyApiProvider(BaseConfig config) {
    _dio = Dio(BaseOptions(
      headers: {
        FoodlyStrings.CONTENT_TYPE: FoodlyStrings.APPLICATION_JSON,
        FoodlyStrings.ACCEPT: FoodlyStrings.APPLICATION_JSON,
      },
      baseUrl: '${config.foodlyBaseUrl}${config.foodlyApiVersion}',
    ));
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: DioRequestHandler.dioRequestHandler,
        onResponse: DioRequestHandler.dioResponseHandler,
        onError: DioRequestHandler.dioErrorHandler,
      ),
    );
  }

  void setAuthToken(String token) => _dio?.options.headers[FoodlyStrings.AUTHORIZATION] = token;
}
