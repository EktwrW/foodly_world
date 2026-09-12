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
  /// duración total de la descarga (`dio/src/options.dart:403`). Un listado
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

  /// Subidas multipart CON FICHEROS. `sendTimeout` acota la subida ENTERA del
  /// cuerpo (`dio/src/adapters/io_adapter.dart:145` lo aplica sobre el
  /// `request.addStream` de la 144), así que el global de 30 s rompería lo que
  /// hoy funciona: el vídeo de una promo admite hasta 80 MB
  /// (`edit_promo_media.dart:203`).
  ///
  /// Y el número sale de esos 80 MB, no de una cifra redonda: a 2 Mbps de
  /// subida —un 4G mediocre, que es la red de la que hay que preocuparse— son
  /// **320 s**. La primera versión de esta PR puso cinco minutos y su propio
  /// comentario ya decía 320 s: el vídeo máximo, en la red de referencia que
  /// yo mismo elegí, se habría cortado al 94 %. Lo cazó la revisión
  /// independiente.
  ///
  /// Diez minutos cubren esos 80 MB con holgura y siguen acotando lo que hoy
  /// no tiene techo: quien suba por una red peor va a fallar igual, y la
  /// diferencia es que falla con un error en vez de dejar la pantalla girando
  /// para siempre.
  static const uploadSendTimeout = Duration(minutes: 10);

  /// Y el backend todavía tiene que mover el fichero a GCS antes de contestar,
  /// así que el primer byte tarda más que en un GET normal.
  static const uploadReceiveTimeout = Duration(seconds: 60);

  /// Para el puñado de endpoints cuya espera legítima no cabe en el techo
  /// global — hoy sólo `/promotions/ai-generate`, que proxea síncronamente dos
  /// generaciones de Replicate. La lista vive en [DioRequestHandler]; esto es
  /// sólo el número, aquí para que la política de timeouts se lea entera en un
  /// sitio.
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
