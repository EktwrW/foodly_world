import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/network/base/app_api_provider.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/menu_import/menu_import_client.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/utils/foodly_error_presenter.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_parse_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:logger/logger.dart';

/// UNA PETICIÓN TIENE QUE TERMINAR (2026-09-12).
///
/// `FoodlyApiProvider` no fijaba ninguno de los tres timeouts de Dio, y en Dio
/// 5.9.2 los tres son `null` por defecto —comprobado en
/// `dio-5.9.2/lib/src/options.dart`—, que significa SIN LÍMITE. En un móvil eso
/// no es teórico: un salto de WiFi a datos, o una red que se traga los paquetes,
/// deja la petición en vuelo para siempre. La pantalla se queda girando sin
/// error y sin reintento, y sólo se destraba matando la app.
///
/// Salió revisando la PR #69: una versión anterior de aquel coalescer retenía
/// la petición en vuelo hasta que terminara, y sin timeouts «una petición
/// colgada» se convertía en «la orden queda muda toda la sesión». Aquella PR se
/// arregló por otro lado (acotó la ventana a un turno síncrono), pero la falta
/// de timeouts seguía afectando a la app entera.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async => S.load(const Locale('es')));

  late _SesionFalsa sesion;
  late _AdaptadorEspia adaptador;
  late FoodlyApiProvider proveedor;

  setUp(() {
    sesion = _SesionFalsa();
    adaptador = _AdaptadorEspia();

    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    di.registerSingleton<AuthSessionService>(sesion);
    di.registerSingleton<Logger>(Logger(level: Level.off));

    proveedor = FoodlyApiProvider(_ConfigFalsa());
    proveedor.dio.httpClientAdapter = adaptador;
  });

  tearDown(() {
    di.unregister<AuthSessionService>();
    di.unregister<Logger>();
  });

  group('el cliente fija un techo', () {
    test('los tres timeouts salen puestos, no null', () {
      final o = proveedor.dio.options;

      expect(o.connectTimeout, isNotNull, reason: 'null en Dio es SIN LÍMITE, no "el del sistema"');
      expect(o.receiveTimeout, isNotNull);
      expect(o.sendTimeout, isNotNull);
    });

    test('y son los del proveedor, no los que invente cada quien', () {
      final o = proveedor.dio.options;

      expect(o.connectTimeout, FoodlyApiProvider.connectTimeout);
      expect(o.receiveTimeout, FoodlyApiProvider.receiveTimeout);
      expect(o.sendTimeout, FoodlyApiProvider.sendTimeout);
    });

    /// El techo no sirve de nada si no llega al adaptador, que es quien lo
    /// aplica de verdad (`io_adapter.dart:142` y `:162`).
    test('una petición normal llega al adaptador con ellos puestos', () async {
      await proveedor.dio.get<dynamic>('/negocios');

      expect(adaptador.visto?.connectTimeout, FoodlyApiProvider.connectTimeout);
      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.receiveTimeout);
      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.sendTimeout);
    });
  });

  /// `sendTimeout` acota la subida ENTERA del cuerpo, no un tramo de ella. Con
  /// el global de 30 s, el vídeo de una promo —hasta 80 MB, `edit_promo_media
  /// .dart:205`— se cortaría a mitad de subida en cualquier red de móvil. Sería
  /// romper en nombre de arreglar.
  group('una subida no puede heredar el techo de un JSON', () {
    test('un multipart sube su propio techo de envío', () async {
      await proveedor.dio.post<dynamic>('/promos/media', data: _subidaConFichero());

      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.uploadSendTimeout);
      expect(
        adaptador.visto!.sendTimeout!,
        greaterThan(FoodlyApiProvider.sendTimeout),
        reason: 'si no es mayor que el global, el bloque no sirve para nada',
      );
    });

    test('y también el de recepción: el backend todavía tiene que mover el fichero', () async {
      await proveedor.dio.post<dynamic>('/promos/media', data: _subidaConFichero());

      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.uploadReceiveTimeout);
    });

    test('pero el de conexión NO: un handshake no tarda más por subir un vídeo', () async {
      await proveedor.dio.post<dynamic>('/promos/media', data: _subidaConFichero());

      expect(adaptador.visto?.connectTimeout, FoodlyApiProvider.connectTimeout);
    });

    /// El matiz que se me escapó y cazó la revisión: `@MultiPart()` genera
    /// `FormData` TAMBIÉN para formularios de puro texto —`updateProfile` no
    /// manda ni un `MultipartFile`—. Lo que hay que acotar es el peso, no el
    /// `Content-Type`: darle diez minutos a un cambio de nombre de usuario es
    /// dejarlo colgado diez minutos.
    test('un multipart SIN ficheros se queda con el global', () async {
      await proveedor.dio.post<dynamic>('/me/update', data: FormData.fromMap({'username': 'hector'}));

      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.sendTimeout);
      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.receiveTimeout);
    });

    test('el techo de subida cubre el vídeo más grande que la app deja elegir', () {
      // 80 MB (`edit_promo_media.dart:203`) a 2 Mbps de subida son 320 s. La
      // primera versión puso 5 min = 300 s, o sea que el vídeo máximo en la
      // red de referencia del propio comentario se cortaba al 94 %.
      const segundosDeUnVideoMaximoA2Mbps = 80 * 1024 * 1024 * 8 / (2 * 1000 * 1000);

      expect(
        FoodlyApiProvider.uploadSendTimeout.inSeconds,
        greaterThan(segundosDeUnVideoMaximoA2Mbps),
        reason: 'el techo corta el vídeo más grande que la propia app admite',
      );
    });

    test('un JSON se queda con el global', () async {
      await proveedor.dio.post<dynamic>('/reservas', data: {'mesa': 4});

      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.sendTimeout);
      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.receiveTimeout);
    });

    /// `/register` es multipart —manda la foto de perfil— y sale por el
    /// `return` temprano de los endpoints de auth. Si el bloque se colocara
    /// después de ese `return`, el registro se quedaría con el techo del JSON.
    test('el registro también, aunque salga por el atajo de los endpoints de auth', () async {
      await proveedor.dio.post<dynamic>('/register', data: _subidaConFichero());

      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.uploadSendTimeout);
    });

    /// Y la otra dirección, que es la que se rompe en silencio: hay repos que
    /// eligen su propio techo a conciencia —`MenuImportRepo` le da 90 s al
    /// parse de una foto porque el fallback de visión es lento—. Pisárselo
    /// desde el interceptor sería decidir por ellos.
    test('quien pasa su propio techo se lo queda', () async {
      await proveedor.dio.post<dynamic>(
        '/menu-import/parse',
        data: _subidaConFichero(),
        options: Options(sendTimeout: const Duration(seconds: 90), receiveTimeout: const Duration(seconds: 90)),
      );

      expect(adaptador.visto?.sendTimeout, const Duration(seconds: 90));
      expect(adaptador.visto?.receiveTimeout, const Duration(seconds: 90));
    });
  });

  /// El techo puesto en `BaseOptions` NO llega a todas las peticiones, y esto
  /// lo destapó la revisión independiente. Los endpoints con `@DioOptions()`
  /// no pasan por `Options.compose`: Retrofit les construye un `RequestOptions`
  /// desde cero copiando sólo lo que cabe en un `Options`, y `connectTimeout`
  /// no es un campo de `Options`. Salían sin límite de conexión — justo en la
  /// ruta del onboarding que ya colgó una vez.
  group('el techo llega por todos los caminos, no sólo por el compuesto', () {
    test('la ruta @DioOptions de Retrofit también trae connectTimeout', () async {
      final cliente = MenuImportClient(proveedor.dio);

      // El adaptador responde `{}` y el DM no sabe parsearlo: da igual, lo que
      // se mira es lo que VIO el adaptador, anotado antes de responder.
      try {
        await cliente.parseImage(
          'menu-1',
          const MenuImportParseDTO(imagePath: 'gs://x/1.jpg'),
          options: Options(sendTimeout: const Duration(seconds: 90), receiveTimeout: const Duration(seconds: 90)),
        );
      } catch (_) {}

      expect(
        adaptador.visto?.connectTimeout,
        FoodlyApiProvider.connectTimeout,
        reason: 'Options no lleva connectTimeout: si no lo pone el interceptor, no lo pone nadie',
      );
      expect(adaptador.visto?.receiveTimeout, const Duration(seconds: 90), reason: 'y sin pisar lo que eligió el repo');
    });

    test('una RequestOptions construida a mano y sin techos los recibe', () async {
      await proveedor.dio.fetch<dynamic>(RequestOptions(path: '/lo-que-sea', method: 'GET'));

      expect(adaptador.visto?.connectTimeout, FoodlyApiProvider.connectTimeout);
      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.receiveTimeout);
      expect(adaptador.visto?.sendTimeout, FoodlyApiProvider.sendTimeout);
    });
  });

  /// Un JSON diminuto con una espera larguísima: `/promotions/ai-generate`
  /// proxea síncronamente dos generaciones de Replicate. Los 30 s globales lo
  /// cortarían a media faena, y la cuota mensual la aplica el backend en la
  /// misma transacción que genera — el manager pagaría la generación y se
  /// quedaría sin ella.
  group('el endpoint lento tiene su propia espera, sin subir la de nadie', () {
    test('/promotions/ai-generate recibe más que el global', () async {
      await proveedor.dio.post<dynamic>('/promotions/ai-generate', data: {'prompt': 'pizza'});

      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.slowEndpointReceiveTimeout);
      expect(adaptador.visto!.receiveTimeout!, greaterThan(FoodlyApiProvider.receiveTimeout));
    });

    test('y el de al lado NO se contagia', () async {
      await proveedor.dio.post<dynamic>('/promotions', data: {'title': 'x'});

      expect(adaptador.visto?.receiveTimeout, FoodlyApiProvider.receiveTimeout);
    });
  });

  /// EL CUELGUE QUE NINGÚN TIMEOUT ARREGLA. Los timeouts de Dio empiezan a
  /// contar en el adaptador, o sea DESPUÉS de los interceptores. Una petición
  /// que se queda dentro del interceptor no los ve nunca.
  ///
  /// Y ahí había dos `return;` pelados en el camino de `silentRefresh`. En un
  /// interceptor de petición eso no cancela nada: el futuro de quien llamó se
  /// completa cuando alguien invoca `handler.next/resolve/reject`
  /// (`dio_mixin.dart:400`) y con nada más. El usuario veía la redirección a
  /// /login con el spinner de la pantalla anterior girando debajo.
  group('la petición que no llega a salir tampoco se queda colgada', () {
    setUp(() {
      sesion
        ..isLoggedIn = true
        ..isAccessTokenExpired = true;
      proveedor.setAuthToken('Bearer caducado');
    });

    test('sin refresh token: falla, no se queda pendiente', () async {
      sesion.hasRefreshToken = false;

      final r = await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));

      expect(r, isNot(_colgada), reason: 'el futuro de quien llamó no se completó NUNCA');
      expect(r, isA<DioException>());
    });

    test('con el refresco fallado: falla, no se queda pendiente', () async {
      sesion
        ..hasRefreshToken = true
        ..refrescoSaleBien = false;

      final r = await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));

      expect(r, isNot(_colgada));
      expect(r, isA<DioException>());
    });

    test('y no sale a la red: no tiene sentido gastar el viaje', () async {
      sesion.hasRefreshToken = false;

      await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));

      expect(adaptador.visto, isNull);
    });

    test('y avisa UNA vez de que la sesión expiró', () async {
      sesion.hasRefreshToken = false;

      await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));

      expect(sesion.avisosDeExpiracion, 1);
    });

    /// LO QUE SE PINTA. La primera versión rechazaba con un 401 sintético
    /// confiando en que `FoodlyErrorPresenter` lo silenciaría… y ese presenter
    /// NO TIENE NI UN LLAMANTE en `lib/`: es código muerto que sólo usaban
    /// estos tests. La ruta real son los ~63 `emit(_Error(e.errorMsg, ...))`,
    /// y por ahí salía a pantalla «Unauthenticated error code: 401», en inglés,
    /// encima del aviso de sesión expirada. Lo demostró ejecutándolo la
    /// revisión independiente.
    test('y lo que llega a pantalla es el aviso de sesión, no «error code: 401»', () async {
      sesion.hasRefreshToken = false;

      final r = await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));
      final e = AppRequestException(error: r);

      expect(e.errorMsg, S.current.sessionExpiredMessage);
      expect(e.errorMsg, isNot(contains('error code')));
      expect(e.errorMsg, isNot(contains('Unauthenticated')));
    });

    /// Y un 401 DE VERDAD tiene que leerse igual: hoy Laravel manda
    /// `{"message": "Unauthenticated."}` y eso se pintaba tal cual, en inglés,
    /// en una app en español.
    test('un 401 del servidor tampoco enseña «Unauthenticated.»', () {
      final opciones = RequestOptions(path: '/x');
      final e = AppRequestException(
        error: DioException(
          requestOptions: opciones,
          type: DioExceptionType.badResponse,
          response: Response<dynamic>(
            requestOptions: opciones,
            statusCode: 401,
            data: {'message': 'Unauthenticated.'},
          ),
        ),
      );

      expect(e.errorMsg, S.current.sessionExpiredMessage);
    });

    test('el fallo sigue clasificándose como auth', () async {
      sesion.hasRefreshToken = false;

      final r = await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));
      final e = AppRequestException(error: r);

      expect(e.statusCode, 401);
      expect(FoodlyErrorPresenter.classify(e), FoodlyErrorCategory.auth);
    });

    test('y el refresco que SÍ sale bien sigue dejando pasar la petición', () async {
      sesion
        ..hasRefreshToken = true
        ..refrescoSaleBien = true;

      final r = await _resuelveOSeCuelga(proveedor.dio.get<dynamic>('/mi-perfil'));

      expect(r, isNot(_colgada));
      expect(r, isA<Response<dynamic>>(), reason: 'un refresco bueno no puede costar la petición');
      expect(adaptador.visto, isNotNull);
    });
  });

  /// Que la petición termine no basta: lo que termina tiene que poder pintarse.
  /// Y `errorMsg` devolvía, para un error SIN respuesta, la cadena
  /// `'${statusMessage} error code: ${statusCode}'` con los dos a null — o sea
  /// «null error code: null», en un snackbar, en producción. Hay 82 sitios que
  /// pintan `errorMsg` sin pasar por `FoodlyErrorPresenter`.
  ///
  /// Esta rama era casi inalcanzable mientras no hubiera timeouts: la petición
  /// no terminaba. Fijarlos es justo lo que la vuelve alcanzable.
  group('un timeout se puede leer en pantalla', () {
    for (final tipo in const [
      DioExceptionType.connectionTimeout,
      DioExceptionType.receiveTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.connectionError,
    ]) {
      test('$tipo cuenta como falta de red', () {
        final e = AppRequestException(error: _sinRespuesta(tipo));

        expect(e.isOffline, isTrue);
        expect(FoodlyErrorPresenter.classify(e), FoodlyErrorCategory.network);
      });

      test('$tipo no le enseña al usuario «null error code: null»', () {
        final e = AppRequestException(error: _sinRespuesta(tipo));

        expect(e.errorMsg, S.current.noConnection);
        expect(e.errorMsg, isNot(contains('null')));
      });
    }

    test('un error sin respuesta que NO es de red cae al genérico', () {
      final e = AppRequestException(error: _sinRespuesta(DioExceptionType.badCertificate));

      expect(e.errorMsg, S.current.genericErrorRetry);
      expect(e.errorMsg, isNot(contains('null')));
    });

    /// La otra mitad: lo que SÍ trae respuesta no puede cambiar de mensaje, o
    /// se perderían los errores del backend que ya se pintan bien.
    test('el mensaje del backend sigue mandando cuando lo hay', () {
      final opciones = RequestOptions(path: '/x');
      final e = AppRequestException(
        error: DioException(
          requestOptions: opciones,
          type: DioExceptionType.badResponse,
          response: Response<dynamic>(
            requestOptions: opciones,
            statusCode: 422,
            data: {'message': 'La orden ya no admite nuevos participantes'},
          ),
        ),
      );

      expect(e.errorMsg, 'La orden ya no admite nuevos participantes');
    });
  });
}

/// Marcador de «este futuro no se completó». Un objeto y no un bool porque el
/// resultado legítimo de una petición también puede ser falsy.
final Object _colgada = Object();

/// Espera al futuro de una petición y devuelve su respuesta, su error, o
/// [_colgada] si no terminó. Medio segundo sobra: el adaptador es falso y no
/// hay E/S de verdad en ningún camino de estos tests.
Future<Object?> _resuelveOSeCuelga(Future<Object?> peticion) => peticion
    .then<Object?>((r) => r)
    .catchError((Object e) => e)
    .timeout(const Duration(milliseconds: 500), onTimeout: () => _colgada);

/// Un multipart CON un fichero dentro, que es lo que hace cara la subida. Un
/// `FormData` de puro texto no cuenta: `@MultiPart()` también genera uno para
/// `updateProfile`, que no manda ni un `MultipartFile`.
FormData _subidaConFichero() => FormData.fromMap({
      'promotion_uuid': 'p1',
      'business_promo_media_url[]': MultipartFile.fromBytes([1, 2, 3], filename: 'promo.mp4'),
    });

DioException _sinRespuesta(DioExceptionType tipo) =>
    DioException(requestOptions: RequestOptions(path: '/x'), type: tipo);

class _ConfigFalsa implements BaseConfig {
  @override
  String get foodlyBaseUrl => 'https://api.example.test';
  @override
  String get foodlyApiVersion => '/v1';
  @override
  bool get isDev => false;
  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Adaptador que anota las `RequestOptions` tal y como le llegan —después de
/// los interceptores— y responde 200 sin tocar la red. Es el único sitio donde
/// se puede comprobar qué techo acabó teniendo la petición de verdad.
class _AdaptadorEspia implements HttpClientAdapter {
  RequestOptions? visto;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    visto = options;
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// Sesión a mano. Sólo los miembros que lee el interceptor: los demás caen en
/// `noSuchMethod`, y los que devuelven `bool`/`int` no pueden caer ahí porque
/// null no es asignable.
class _SesionFalsa implements AuthSessionService {
  bool refrescoSaleBien = false;
  int refrescos = 0;
  int avisosDeExpiracion = 0;

  @override
  bool isLoggedIn = false;
  @override
  bool isAccessTokenExpired = false;
  @override
  bool hasRefreshToken = false;
  @override
  bool isLoggingOut = false;
  @override
  bool isBiometricLoginInProgress = false;
  @override
  int sessionGeneration = 1;
  @override
  UserSessionDM? userSessionDM = const UserSessionDM(
    user: UserDM(uuid: 'u1'),
    token: 'vigente',
    tokenType: 'Bearer',
    accessToken: 'vigente',
    refreshToken: 'refresco',
  );

  @override
  Map<String, dynamic>? get deviceForSession => null;

  @override
  Future<void> validateAccessToken() async {}

  @override
  Future<bool> silentRefresh() async {
    refrescos++;
    return refrescoSaleBien;
  }

  @override
  void notifyTokenExpired() => avisosDeExpiracion++;

  @override
  noSuchMethod(Invocation invocation) => null;
}
