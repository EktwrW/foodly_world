import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, DioRequestHandler, FoodlyStrings;

class FoodlyApiProvider {
  Dio? _dio;

  Dio get dio => _dio!;

  /// Handshake TCP + TLS, nada más. Medido contra `api.foodly.solutions`
  /// desde una conexión sana: 50 ms. Diez segundos son doscientas veces eso;
  /// lo único capaz de consumirlos es una red que ya no va a responder.
  static const connectTimeout = Duration(seconds: 10);

  /// Tiempo hasta el primer byte, y después inactividad ENTRE bytes — no la
  /// duración total de la descarga (`dio/src/options.dart:404`). Un listado
  /// largo no lo agota mientras siga llegando.
  ///
  /// Treinta y no veinte porque el backend vive en Cloud Run sin ping que lo
  /// mantenga caliente —el que hay es para el NLP, que es otro servicio— y un
  /// arranque en frío tiene que caber. El caso normal medido es 0,2 s de
  /// TTFB: esto es una red de seguridad contra el cuelgue infinito, no una
  /// promesa de velocidad, y una que salta sobre tráfico legítimo hace más
  /// daño que la que no está.
  static const receiveTimeout = Duration(seconds: 30);

  /// Subida del cuerpo. Para el JSON de unos KB que manda casi toda la app
  /// sobra de largo; **las subidas de ficheros NO usan este valor**, se lo
  /// sube [DioRequestHandler] por petición (ver [uploadSendTimeout]).
  static const sendTimeout = Duration(seconds: 30);

  /// Subidas multipart. `sendTimeout` acota la subida ENTERA del cuerpo
  /// (`dio/src/adapters/io_adapter.dart:142` lo aplica sobre
  /// `request.addStream`), así que el global de 30 s rompería lo que hoy
  /// funciona: el vídeo de una promo admite hasta 80 MB
  /// (`edit_promo_media.dart:205`), que a 2 Mbps de subida son 320 s.
  ///
  /// Cinco minutos no cubren cualquier red —a 1 Mbps harían falta diez— pero
  /// acotan lo que hoy no tiene techo. Quien suba por una red así va a fallar
  /// igual; la diferencia es que ahora falla con un error en vez de dejar la
  /// pantalla girando para siempre.
  static const uploadSendTimeout = Duration(minutes: 5);

  /// Y el backend todavía tiene que mover el fichero a GCS antes de contestar,
  /// así que el primer byte tarda más que en un GET normal.
  static const uploadReceiveTimeout = Duration(seconds: 60);

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
