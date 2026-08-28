import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'user_scoped_cubit_fakes.dart';

/// Tests del veredicto de validación de sesión — `sessionRestoreVerdict`.
///
/// **Invariante que protegen:** `initializeSessionOrClear` SIEMPRE debe
/// completar `sessionRestoreVerdict`, sea cual sea su exit path (sesión
/// válida, inválida, refresh fallido con `return` temprano, o excepción).
/// Si alguna rama no lo completara, `LocalAuthCubit.initializeLocalAuth`
/// quedaría esperando el veredicto para siempre y la app colgaría en el
/// splash. El `finally` de `initializeSessionOrClear` es la garantía; estos
/// tests son la red que detecta si un refactor lo rompe.
///
/// Contexto del bug original (2026-05-22): sin este gate, la app ofrecía el
/// prompt biométrico sobre un token ya muerto en el BE; el user autenticaba,
/// `biometricLogin()` recibía 401, y caía a starting page — huella para nada.

class _FakeApiProvider implements FoodlyApiProvider {
  late final Dio _dio = Dio();

  @override
  Dio get dio => _dio;
  @override
  void setAuthToken(String token) {}
  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeSecureTokenService implements SecureTokenService {
  String? storedAccessToken;
  String? storedRefreshToken;
  String? storedTokenType;
  String? storedTokenCreatedAt;
  int clearAllCalls = 0;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {
    storedAccessToken = accessToken;
    storedRefreshToken = refreshToken;
    storedTokenType = tokenType;
    storedTokenCreatedAt = tokenCreatedAt;
  }

  @override
  Future<void> clearAll() async {
    clearAllCalls++;
    storedAccessToken = null;
    storedRefreshToken = null;
    storedTokenType = null;
    storedTokenCreatedAt = null;
  }

  @override
  Future<String?> get accessToken async => storedAccessToken;
  @override
  Future<String?> get refreshToken async => storedRefreshToken;
  @override
  Future<String?> get tokenType async => storedTokenType;
  @override
  Future<String?> get tokenCreatedAt async => storedTokenCreatedAt;
  @override
  Future<bool> hasTokens() async => storedAccessToken != null && storedAccessToken!.isNotEmpty;
}

/// Fake del MeRepo: programa el outcome de `refreshToken()` y de
/// `fetchLoggedUser()` — las dos llamadas de red que hace
/// `initializeSessionOrClear`.
class _FakeMeRepo implements MeRepo {
  ApiResult<UserSessionDM> refreshOutcome = const ApiResult.success(
    UserSessionDM(
      user: UserDM(uuid: 'u1'),
      token: 'NEW-access',
      tokenType: 'Bearer',
      accessToken: 'NEW-access',
      refreshToken: 'NEW-refresh',
    ),
  );

  /// Outcome del próximo `fetchLoggedUser()`. Default: éxito.
  ApiResult<UserDM> fetchOutcome = const ApiResult.success(UserDM(uuid: 'u1'));

  /// Si true, `fetchLoggedUser()` lanza en vez de devolver un ApiResult —
  /// ejercita el `catch` interno de `initializeSessionOrClear`.
  bool fetchThrows = false;

  int refreshTokenCalls = 0;
  int fetchLoggedUserCalls = 0;

  @override
  Future<ApiResult<UserSessionDM>> refreshToken() async {
    refreshTokenCalls++;
    return refreshOutcome;
  }

  @override
  Future<ApiResult<UserDM>> fetchLoggedUser() async {
    fetchLoggedUserCalls++;
    if (fetchThrows) throw Exception('network down');
    return fetchOutcome;
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeBaseConfig implements BaseConfig {
  @override
  noSuchMethod(Invocation invocation) => null;
}

UserSessionDM _session({
  String uuid = 'u1',
  String? accessToken = 'access-A',
  String? refreshToken = 'refresh-A',
  String? tokenType = 'Bearer',
  String? tokenCreatedAt,
}) {
  return UserSessionDM(
    user: UserDM(uuid: uuid),
    token: accessToken,
    accessToken: accessToken,
    refreshToken: refreshToken,
    tokenType: tokenType,
    tokedCreatedAt: tokenCreatedAt,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;
  late _FakeSecureTokenService fakeSecure;
  late _FakeMeRepo fakeMeRepo;

  setUp(() {
    // Las rutas de cierre de sesión los piden por el locator.
    registrarCubitsDeUsuario();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    di.registerSingleton<FoodlyApiProvider>(_FakeApiProvider());
    di.registerSingleton<Logger>(Logger(level: Level.off));

    fakeSecure = _FakeSecureTokenService();
    fakeMeRepo = _FakeMeRepo();

    service = AuthSessionService(
      config: _FakeBaseConfig(),
      meRepo: fakeMeRepo,
      localStorageService: LocalStorageService(),
      appApiProvider: _FakeApiProvider(),
      secureTokenService: fakeSecure,
    );
  });

  tearDown(() {
    desregistrarCubitsDeUsuario();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
  });

  group('sessionRestoreVerdict — siempre se completa', () {
    test(
      'sesión válida (fetchLoggedUser OK) → veredicto true, sesión sigue activa',
      () async {
        fakeMeRepo.fetchOutcome = const ApiResult.success(UserDM(uuid: 'u1'));

        await service.initializeSessionOrClear(_session());

        expect(await service.sessionRestoreVerdict, true);
        expect(service.isLoggedIn, true, reason: 'Sesión válida: no se limpia');
      },
    );

    test(
      'sesión inválida (fetchLoggedUser falla con 401) → veredicto false + sesión limpiada',
      () async {
        fakeMeRepo.fetchOutcome = ApiResult.failure(
          AppRequestException(error: '401 unauthorized', stackTrace: StackTrace.current),
        );

        await service.initializeSessionOrClear(_session());

        expect(await service.sessionRestoreVerdict, false,
            reason: 'Es justo el caso del bug: token muerto en el BE → '
                'NO se debe ofrecer biometría');
        expect(service.isLoggedIn, false, reason: 'clearInvalidSession debe haber corrido');
      },
    );

    test(
      'token expirado client-side + refresh OK → refresca y veredicto true',
      () async {
        // tokedCreatedAt de hace 25h → isAccessTokenExpired == true.
        final expired = _session(
          tokenCreatedAt: DateTime.now().subtract(const Duration(hours: 25)).toIso8601String(),
        );

        await service.initializeSessionOrClear(expired);

        expect(fakeMeRepo.refreshTokenCalls, 1, reason: 'Token expirado client-side → debe intentar silentRefresh');
        expect(await service.sessionRestoreVerdict, true, reason: 'Refresh OK + fetchLoggedUser OK → sesión válida');
      },
    );

    test(
      'token expirado + refresh falla → veredicto false, ni se intenta fetchLoggedUser',
      () async {
        fakeMeRepo.refreshOutcome = ApiResult.failure(
          AppRequestException(error: 'refresh token dead', stackTrace: StackTrace.current),
        );
        final expired = _session(
          tokenCreatedAt: DateTime.now().subtract(const Duration(hours: 25)).toIso8601String(),
        );

        await service.initializeSessionOrClear(expired);

        expect(await service.sessionRestoreVerdict, false);
        expect(fakeMeRepo.fetchLoggedUserCalls, 0,
            reason: 'Si el refresh falla, el método retorna temprano — el '
                'finally igual debe completar el veredicto');
        expect(service.isLoggedIn, false);
      },
    );

    test(
      'fetchLoggedUser lanza excepción → veredicto false (el finally cubre el catch)',
      () async {
        fakeMeRepo.fetchThrows = true;

        await service.initializeSessionOrClear(_session());

        expect(await service.sessionRestoreVerdict, false,
            reason: 'Excepción no controlada: la sesión se limpia y el '
                'veredicto igual se completa — nunca se cuelga el await');
        expect(service.isLoggedIn, false);
      },
    );

    test(
      'el veredicto puede esperarse ANTES de que corra initializeSessionOrClear',
      () async {
        // initializeLocalAuth (LocalAuthCubit) arranca en paralelo y puede
        // tocar `sessionRestoreVerdict` antes de que initializeSessionOrClear
        // haya empezado. El getter lazy crea el Completer; el future debe
        // resolver igual cuando la validación termine después.
        final verdictFuture = service.sessionRestoreVerdict;

        await service.initializeSessionOrClear(_session());

        expect(await verdictFuture, true, reason: 'El future creado ANTES debe resolver con el veredicto real');
      },
    );

    test(
      'initializeSessionOrClear dos veces → no lanza "Future already completed"',
      () async {
        await service.initializeSessionOrClear(_session());
        // Segunda corrida: el finally vuelve a llamar al completer; el guard
        // de idempotencia (isCompleted) debe absorberlo sin StateError.
        await service.initializeSessionOrClear(_session());

        expect(await service.sessionRestoreVerdict, true);
      },
    );
  });
}
