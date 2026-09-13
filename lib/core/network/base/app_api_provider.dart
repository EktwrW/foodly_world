import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, DioRequestHandler, FoodlyStrings;

/// Cliente HTTP de la API. La política de timeouts y por qué es así:
/// CLAUDE.md, «El cliente HTTP no tenía techo» (2026-09-12).
class FoodlyApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  /// Handshake TCP+TLS. Medido contra `api.foodly.solutions`: 50 ms.
  static const connectTimeout = Duration(seconds: 10);

  /// Hasta el primer byte, y luego inactividad ENTRE bytes — no la duración
  /// total de la descarga. Tiene que caber un arranque en frío de Cloud Run.
  static const receiveTimeout = Duration(seconds: 30);

  /// Acota la subida ENTERA del cuerpo, así que las subidas de ficheros no
  /// pueden usarlo: se lo sube [DioRequestHandler] por petición.
  static const sendTimeout = Duration(seconds: 30);

  /// 80 MB —el vídeo máximo de una promo— a 2 Mbps de subida son 320 s.
  static const uploadSendTimeout = Duration(minutes: 10);

  /// El backend todavía mueve el fichero a GCS antes de contestar.
  static const uploadReceiveTimeout = Duration(seconds: 60);

  /// Para las rutas de `DioRequestHandler._endpointsLentos`.
  static const slowEndpointReceiveTimeout = Duration(minutes: 3);

  FoodlyApiProvider(BaseConfig config) {
    _dio = Dio(BaseOptions(
      headers: {
        FoodlyStrings.CONTENT_TYPE: FoodlyStrings.APPLICATION_JSON,
        FoodlyStrings.ACCEPT: FoodlyStrings.APPLICATION_JSON,
      },
      baseUrl: '${config.foodlyBaseUrl}${config.foodlyApiVersion}',
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
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
