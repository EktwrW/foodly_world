import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';

import 'user_scoped_cubit_fakes.dart';

/// `setSession` es el único punto por el que pasan TODOS los logins —
/// email/password, Google, Apple, biométrico y el `silentRefresh`— y desde el
/// 2026-08-29 también dispara la recuperación de la orden grupal activa.
///
/// EL BUG QUE ARREGLA. El chip flotante pedía `GET /group-orders/mine` en su
/// postFrame de arranque. En frío esa llamada le gana la carrera a la
/// restauración de sesión: sale sin header, el backend responde 401 y el 401
/// se descarta en silencio a propósito (no queremos molestar a un invitado).
/// Nadie reintentaba. El comensal entraba al menú sin chip, sin orden activa y
/// sin botón de agregar ítems, aunque el servidor tuviera su orden abierta.
///
/// POR QUÉ ESTE ARCHIVO. El cableado nuevo vive en el método más transitado
/// del servicio de sesión y no tenía NI UNA línea de test. Lo que se protege
/// acá no es que el sync ande —eso ya se prueba en el cubit— sino QUIÉN lo
/// dispara y, sobre todo, quién NO: disparar de más en una tablet compartida
/// significa que el siguiente comensal hereda la orden del anterior, y
/// disparar en cada rotación de token significa una petición extra cada 23
/// horas por usuario, más una carrera contra el propio refresco.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;
  late _FakeMeRepo meRepo;

  /// `setSession` lanza el sync con `unawaited`: no hay Future al que
  /// agarrarse, así que hay que dejar correr el event loop antes de mirar.
  /// Varias vueltas porque adentro hay más de un `await` encadenado
  /// (`getMyGroupOrders` → `res.when` → `watchActive`).
  Future<void> dejarCorrerElSync() async {
    for (var i = 0; i < 8; i++) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  AuthSessionService construirServicio() => AuthSessionService(
        config: _FakeBaseConfig(),
        meRepo: meRepo,
        localStorageService: LocalStorageService(),
        appApiProvider: _FakeApiProvider(),
        secureTokenService: _FakeSecureTokenService(),
      );

  setUp(() {
    registrarCubitsDeUsuario();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    di.registerSingleton<FoodlyApiProvider>(_FakeApiProvider());
    di.registerSingleton<Logger>(Logger(level: Level.off));

    meRepo = _FakeMeRepo();
    service = construirServicio();
  });

  tearDown(() {
    desregistrarCubitsDeUsuario();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
  });

  // ── El disparo: cuándo sí y cuándo no ────────────────────────────────

  group('quién dispara la recuperación de la orden activa', () {
    late FakeActiveGroupOrderCubit ordenActiva;

    setUp(() => ordenActiva = _cubitFalsoRegistrado());

    test('una sesión NUEVA la dispara exactamente una vez', () async {
      service.setSession(_sesion(uuid: 'u1'));
      await dejarCorrerElSync();

      expect(ordenActiva.vecesSincronizado, 1,
          reason: 'sin esto el comensal entra al menú sin chip y sin orden, '
              'aunque el servidor tenga la suya abierta');
    });

    test('la rotación de token del mismo usuario NO la dispara', () async {
      service.setSession(_sesion(uuid: 'u1', accessToken: 'viejo'));
      await dejarCorrerElSync();

      // Segundo `setSession` con el MISMO uuid: es lo que hace `silentRefresh`
      // cada 23 h. La generación de sesión no sube y el sync tampoco corre:
      // la orden en memoria ya es la buena y `/mine` sería tráfico de más.
      service.setSession(_sesion(uuid: 'u1', accessToken: 'nuevo'));
      await dejarCorrerElSync();

      expect(ordenActiva.vecesSincronizado, 1,
          reason: 'refrescar el token no es empezar una sesión');
    });

    test('el silentRefresh real tampoco la dispara', () async {
      service.setSession(_sesion(uuid: 'u1', accessToken: 'viejo'));
      await dejarCorrerElSync();

      // El camino de verdad, no un `setSession` a mano: `refreshToken()`
      // devuelve una sesión del MISMO usuario y `_performRefresh` la instala.
      meRepo.sesionRefrescada = _sesion(uuid: 'u1', accessToken: 'rotado');
      final ok = await service.silentRefresh();
      await dejarCorrerElSync();

      expect(ok, isTrue);
      expect(meRepo.vecesRefrescado, 1);
      expect(ordenActiva.vecesSincronizado, 1,
          reason: 'el refresco pasa por setSession pero no abre sesión nueva');
    });

    test('sin el cubit registrado en el locator no revienta', () async {
      // En arranques donde el grafo de DI todavía no está armado —o en un
      // test que solo monta la parte de auth— `di<ActiveGroupOrderCubit>()`
      // tiraría "not registered" y se llevaría puesto el login entero.
      // El guard `di.isRegistered` existe para eso.
      //
      // NOTA DE HONESTIDAD: este caso NO falla contra el código pre-arreglo,
      // porque ahí `setSession` no consultaba el locator en absoluto. Es un
      // candado sobre el guard, no un detector de la regresión original.
      di.unregister<ActiveGroupOrderCubit>();

      expect(() => service.setSession(_sesion(uuid: 'u1')), returnsNormally);
      await dejarCorrerElSync();
    });
  });

  // ── Tablet compartida: A se va, B entra ──────────────────────────────

  group('cambio de usuario en el mismo dispositivo', () {
    late _RepoDeMine repo;
    late ActiveGroupOrderCubit cubit;

    setUp(() {
      repo = _RepoDeMine();
      cubit = _registrarCubitReal(repo);
    });

    tearDown(() => cubit.close());

    test('B recibe SU orden y nunca la de A', () async {
      // A entra y el servidor le devuelve lo suyo.
      repo.ordenes = const [GroupOrderDM(uuid: 'orden-de-A', businessUuid: 'b1')];
      service.setSession(_sesion(uuid: 'usuario-A'));
      await dejarCorrerElSync();
      expect(cubit.state?.uuid, 'orden-de-A');

      // A cierra sesión. El carrito es un singleton en memoria: si sobrevive,
      // el siguiente comensal se sienta con la cuenta del anterior.
      service.clearInvalidSession();
      expect(cubit.state, isNull);

      // B entra en el mismo aparato. El backend filtra `/mine` por usuario, así
      // que lo que llega es solo lo de B.
      repo.ordenes = const [GroupOrderDM(uuid: 'orden-de-B', businessUuid: 'b2')];
      service.setSession(_sesion(uuid: 'usuario-B'));
      await dejarCorrerElSync();

      expect(cubit.state?.uuid, 'orden-de-B',
          reason: 'el login de B tiene que recuperar la orden de B');
      expect(repo.llamadasAMine, 2, reason: 'una consulta por sesión, no más');
    });
  });

  // ── La carrera del restore: la respuesta que llega tarde ─────────────

  group('sesión invalidada con /mine todavía en vuelo', () {
    late _RepoDeMine repo;
    late ActiveGroupOrderCubit cubit;

    setUp(() {
      repo = _RepoDeMine();
      cubit = _registrarCubitReal(repo);
    });

    tearDown(() => cubit.close());

    /// El camino de `_validateRestoredSession`: `setSession(sesionCacheada)`
    /// primero, y recién después se valida el token contra el backend. Si esa
    /// validación falla, `clearInvalidSession()` limpia todo — pero el `/mine`
    /// que salió al principio sigue viajando.
    test('la respuesta tardía no repuebla el chip', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'orden-de-la-sesion-muerta')];
      repo.retenerRespuesta = true;

      service.setSession(_sesion(uuid: 'u1'));
      await dejarCorrerElSync();

      // Que de verdad haya algo en vuelo es parte de lo que se prueba: sin el
      // cableado nuevo no sale ninguna petición y el resto del test sería
      // vacío (pasaría por no hacer nada, que es justo el bug).
      expect(repo.llamadasAMine, 1,
          reason: 'setSession tiene que haber lanzado el sync');

      // El token cacheado resultó inválido.
      service.clearInvalidSession();
      repo.liberarRespuesta();
      await dejarCorrerElSync();

      expect(cubit.state, isNull,
          reason: 'la orden de una sesión que ya se cerró no puede resucitar');
    });

    /// El mismo escenario pero por el camino REAL, sin simular la secuencia a
    /// mano: `initializeSessionOrClear` es lo que corre en cada arranque con
    /// sesión cacheada, y adentro hace exactamente `setSession(...)` →
    /// validar contra `/me` → `clearInvalidSession()` si el token murió.
    ///
    /// Importa tenerlo además del de arriba porque el orden de esas tres
    /// cosas es lo único que hace que la carrera exista: si alguien moviera
    /// el disparo del sync antes del `setSession`, el test manual seguiría
    /// pasando y este no.
    test('el arranque con token muerto no deja el chip poblado', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'orden-de-la-sesion-muerta')];
      repo.retenerRespuesta = true;
      meRepo.usuarioLogueado = ApiResult.failure(_http(401)); // el token cacheado ya no vale

      final arranque = service.initializeSessionOrClear(_sesion(uuid: 'u1'));
      await dejarCorrerElSync();
      expect(repo.llamadasAMine, 1, reason: 'el restore lanzó el sync');

      repo.liberarRespuesta();
      await arranque;
      await dejarCorrerElSync();

      expect(service.isLoggedIn, isFalse, reason: 'la sesión cacheada se descartó');
      expect(cubit.state, isNull,
          reason: 'el chip no puede quedar con la orden de una sesión inválida');
    });
  });

  // ── Re-entrada: 401 → refresh → setSession ───────────────────────────

  group('el 401 de /mine no abre un segundo ciclo de sync', () {
    late _RepoDeMine repo;
    late ActiveGroupOrderCubit cubit;

    setUp(() {
      repo = _RepoDeMine();
      cubit = _registrarCubitReal(repo);
    });

    tearDown(() => cubit.close());

    /// La secuencia completa que corre en producción cuando el access token
    /// venció justo en el arranque:
    ///
    ///   setSession → syncAnyActive → GET /mine → 401
    ///     → interceptor Dio → silentRefresh → setSession
    ///
    /// Ese segundo `setSession` es del MISMO usuario. Si disparara el sync de
    /// nuevo, cada 401 alimentaría al siguiente y el arranque se convertiría
    /// en un bucle de peticiones.
    test('refrescar el token tras el 401 no relanza /mine', () async {
      repo.alPedirMine = () {
        // Lo que hace el interceptor: un solo intento de refresco.
        if (meRepo.vecesRefrescado == 0) unawaited(service.silentRefresh());
      };
      repo.respuestaFija = ApiResult.failure(_http(401));
      meRepo.sesionRefrescada = _sesion(uuid: 'u1', accessToken: 'rotado');

      service.setSession(_sesion(uuid: 'u1'));
      await dejarCorrerElSync();

      expect(meRepo.vecesRefrescado, 1, reason: 'el refresco tiene que haber corrido');
      expect(repo.llamadasAMine, 1,
          reason: 'el setSession del refresco no puede lanzar otro sync');
      expect(cubit.state, isNull, reason: 'un 401 no deja estado');
    });

    test('un 401 a secas es silencioso y no rompe la sesión', () async {
      repo.respuestaFija = ApiResult.failure(_http(401));

      service.setSession(_sesion(uuid: 'u1'));
      await dejarCorrerElSync();

      // La petición tiene que haber salido: sin esta línea el test pasaría
      // por no hacer nada, que es exactamente el bug que se está arreglando.
      expect(repo.llamadasAMine, 1);
      expect(cubit.state, isNull);
      expect(service.isLoggedIn, isTrue,
          reason: 'el fallo del chip no puede tirar abajo el login');
    });
  });
}

// ── Helpers ────────────────────────────────────────────────────────────

/// Reemplaza el doble por el cubit REAL. Los tests que miran el estado del
/// carrito (no solo la cuenta de llamadas) necesitan la lógica de verdad:
/// el sello de generación y las guardas de adopción viven ahí.
ActiveGroupOrderCubit _registrarCubitReal(GroupOrderRepo repo) {
  if (di.isRegistered<ActiveGroupOrderCubit>()) di.unregister<ActiveGroupOrderCubit>();
  final cubit = ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off));
  di.registerSingleton<ActiveGroupOrderCubit>(cubit);
  return cubit;
}

FakeActiveGroupOrderCubit _cubitFalsoRegistrado() =>
    di<ActiveGroupOrderCubit>() as FakeActiveGroupOrderCubit;

AppRequestException _http(int status) => AppRequestException(
      error: DioException(
        requestOptions: RequestOptions(path: '/group-orders/mine'),
        response: Response(
          requestOptions: RequestOptions(path: '/group-orders/mine'),
          statusCode: status,
        ),
      ),
    );

UserSessionDM _sesion({
  required String uuid,
  String accessToken = 'access',
  String refreshToken = 'refresh',
}) =>
    UserSessionDM(
      user: UserDM(uuid: uuid),
      token: accessToken,
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: 'Bearer',
    );

class _RepoDeMine implements GroupOrderRepo {
  List<GroupOrderDM> ordenes = const [];

  /// Si está puesta, se devuelve tal cual (para 401 y demás fallos).
  ApiResult<GroupOrdersListResponseDM>? respuestaFija;

  int llamadasAMine = 0;

  /// Se ejecuta al entrar a `/mine`, antes de responder. Sirve para simular
  /// lo que hace el interceptor Dio cuando el backend contesta 401.
  void Function()? alPedirMine;

  bool retenerRespuesta = false;
  Completer<void>? _puerta;

  void liberarRespuesta() => _puerta?.complete();

  @override
  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    llamadasAMine++;
    alPedirMine?.call();
    if (retenerRespuesta) {
      final puerta = _puerta = Completer<void>();
      await puerta.future;
    }
    return respuestaFija ?? ApiResult.success(GroupOrdersListResponseDM(groupOrders: ordenes));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeApiProvider implements FoodlyApiProvider {
  late final Dio _dio = Dio();

  @override
  Dio get dio => _dio;

  @override
  void setAuthToken(String token) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeSecureTokenService implements SecureTokenService {
  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {}

  @override
  Future<void> clearAll() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeMeRepo implements MeRepo {
  int vecesRefrescado = 0;
  UserSessionDM? sesionRefrescada;

  /// Resultado de validar el token cacheado contra `/me`. Por defecto vale:
  /// los tests que prueban el descarte lo ponen en `failure`.
  ApiResult<UserDM> usuarioLogueado = const ApiResult.success(UserDM(uuid: 'u1'));

  @override
  Future<ApiResult<UserDM>> fetchLoggedUser() async => usuarioLogueado;

  @override
  Future<ApiResult<UserSessionDM>> refreshToken() async {
    vecesRefrescado++;
    final sesion = sesionRefrescada;
    if (sesion == null) return ApiResult.failure(_http(401));
    return ApiResult.success(sesion);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeBaseConfig implements BaseConfig {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
