import 'package:dio/dio.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/network/base/dio_request_handler.dart';

class FoodlyApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  FoodlyApiProvider(BaseConfig config) {
    _dio = Dio(BaseOptions(
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
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
