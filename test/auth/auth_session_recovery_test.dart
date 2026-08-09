// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';

class _FakeApiProvider implements FoodlyApiProvider {
  // Lazy: una sola instancia por fake, no una nueva cada acceso. Sin
  // esto, `dio.options.headers.remove(...)` desde _clearInvalidSession
  // operaría sobre un Dio descartable.
  late final Dio _dio = Dio();

  @override
  Dio get dio => _dio;
  @override
  void setAuthToken(String token) {}
  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Fake con storage interno tipo dictionary — los tests setean tokens
/// programáticamente y verificamos lo que se persiste vía saveTokens.
class _FakeSecureTokenService implements SecureTokenService {
  String? storedAccessToken;
  String? storedRefreshToken;
  String? storedTokenType;
  String? storedTokenCreatedAt;

  int saveTokensCalls = 0;
  int clearAllCalls = 0;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {
    saveTokensCalls++;
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

/// Fake del MeRepo que permite programar el outcome de refreshToken().
class _FakeMeRepo implements MeRepo {
  /// Outcome del próximo refreshToken(). Inicializado a "exitoso" con
  /// una sesión válida nueva — los tests pueden setearlo a `failure` o
  /// a un Future que demora.
  ApiResult<UserSessionDM> refreshOutcome = const ApiResult.success(
    UserSessionDM(
      user: UserDM(uuid: 'u1'),
      token: 'NEW-access',
      tokenType: 'Bearer',
      accessToken: 'NEW-access',
      refreshToken: 'NEW-refresh',
    ),
  );

  /// Si != null, refreshToken() awaiteará por este future antes de
  /// devolver el outcome. Permite tests de concurrencia.
  Future<void>? refreshDelay;

  int refreshTokenCalls = 0;

  @override
  Future<ApiResult<UserSessionDM>> refreshToken() async {
    refreshTokenCalls++;
    if (refreshDelay != null) await refreshDelay;
    return refreshOutcome;
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

/// Tests de recovery del flujo de auth — cubren los métodos que arreglan
/// sesión expirada, restauran del Keychain, y notifican expiración.
///
/// Estas son las rutas críticas que un refactor descuidado puede romper
/// silenciosamente — los tests existentes cubren el happy path; estos
/// cubren los guards.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;
  late _FakeSecureTokenService fakeSecure;
  late _FakeMeRepo fakeMeRepo;

  setUp(() {
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    di.registerSingleton<FoodlyApiProvider>(_FakeApiProvider());
    // notifyTokenExpired() loguea al catch del navigate cuando AppRouter
    // no está disponible (caso típico de test). Sin un Logger registrado,
    // GetIt throw "type Logger is not registered". Lo silenciamos con
    // Level.off para no contaminar el output del test runner.
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
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
  });

  group('silentRefresh — guards de concurrencia', () {
    test(
      'sin refresh token → returns false sin tocar el repo',
      () async {
        // Sesión sin refresh token (escenario: dual-token recién migrado
        // o build legacy).
        service.setSession(_session(refreshToken: null));
        // Manualmente forzamos hasRefreshToken=false porque setSession
        // guarda _refreshToken interno cuando viene en la session.
        // Reseteo manual para el test:
        service.setSession(_session(refreshToken: ''));

        final result = await service.silentRefresh();

        expect(result, false);
        expect(fakeMeRepo.refreshTokenCalls, 0,
            reason: 'No tiene sentido pegar al BE sin refresh token');
      },
    );

    test(
      'refresh exitoso → setSession con tokens nuevos, returns true',
      () async {
        service.setSession(_session(accessToken: 'OLD'));

        final result = await service.silentRefresh();

        expect(result, true);
        expect(fakeMeRepo.refreshTokenCalls, 1);
        expect(service.userSessionDM?.accessToken, 'NEW-access',
            reason: 'La sesión activa debe quedar con el access token nuevo');
        expect(fakeSecure.storedAccessToken, 'NEW-access',
            reason: 'Los tokens nuevos deben persistirse al Keychain');
      },
    );

    test(
      'refresh fallido → returns false, sesión NO se reemplaza',
      () async {
        service.setSession(_session(accessToken: 'OLD'));
        fakeMeRepo.refreshOutcome = ApiResult.failure(
          AppRequestException(error: 'token revoked', stackTrace: StackTrace.current),
        );

        final result = await service.silentRefresh();

        expect(result, false);
        expect(service.userSessionDM?.accessToken, 'OLD',
            reason: 'Si refresh falla, dejar la sesión vieja intacta — '
                'el caller decide si llamar notifyTokenExpired');
      },
    );

    test(
      'concurrent silentRefresh: el segundo ESPERA al primero y recibe su '
      'resultado real, sin pegar al BE',
      () async {
        // Este test aseveraba lo contrario —que el segundo recibía `false`—
        // y con eso codificaba el bug (2026-08-09). La intención de no apilar
        // requests al BE era correcta; devolver `false` para lograrlo, no:
        // para quien llama, `false` significa "la sesión está muerta". El
        // interceptor Dio lo lee así y dispara `notifyTokenExpired()`.
        //
        // Consecuencia en producción: el home dispara varias requests
        // autenticadas a la vez, todas reciben 401, la primera refresca con
        // ÉXITO y las demás echan al usuario con el modal "tu sesión expiró"
        // mientras la pantalla todavía está cargando.
        service.setSession(_session(refreshToken: 'r1'));
        final firstCallCompleter = Completer<void>();
        fakeMeRepo.refreshDelay = firstCallCompleter.future;

        final firstFuture = service.silentRefresh();
        final secondFuture = service.silentRefresh();
        final thirdFuture = service.silentRefresh();

        // Nadie resolvió todavía: los tres cuelgan del mismo refresco.
        expect(fakeMeRepo.refreshTokenCalls, 1,
            reason: 'Solo el primer caller pega al BE; los simultáneos se suman al suyo');

        firstCallCompleter.complete();
        final results = await Future.wait([firstFuture, secondFuture, thirdFuture]);

        expect(results, [true, true, true],
            reason: 'Un refresco exitoso es exitoso para TODOS los que lo esperaron.');
        expect(fakeMeRepo.refreshTokenCalls, 1);
      },
    );

    test(
      'un refresco de token NO cambia la generación de sesión',
      () async {
        // Regresión encontrada en autoreview (2026-08-09): al principio puse
        // el incremento dentro de `setSession`, por donde también pasa
        // `silentRefresh`. Con eso, dos requests concurrentes con el token
        // vencido se rompían: A recibe 401, refresca, la generación cambia, y
        // el 401 de B —sellado un instante antes— se descartaba como eco de
        // una sesión vieja. B era legítima y debía reintentarse.
        //
        // Un refresco es la MISMA sesión con credenciales frescas.
        service.setSession(_session(refreshToken: 'r1'));
        final generationBefore = service.sessionGeneration;

        expect(await service.silentRefresh(), true);

        expect(service.sessionGeneration, generationBefore,
            reason: 'La generación identifica la sesión, no la versión del token.');
      },
    );

    test(
      'establecer y cerrar sesión SÍ cambian la generación',
      () async {
        final atStart = service.sessionGeneration;

        service.setSession(_session(uuid: 'u1'));
        final afterLogin = service.sessionGeneration;
        expect(afterLogin, greaterThan(atStart));

        // Re-emitir la MISMA sesión (p. ej. tras editar el perfil) no cuenta.
        service.setSession(_session(uuid: 'u1'));
        expect(service.sessionGeneration, afterLogin);

        service.clearInvalidSession();
        expect(service.sessionGeneration, greaterThan(afterLogin),
            reason: 'Los 401 en vuelo de la sesión que se fue quedan invalidados');
      },
    );

    test(
      'concurrent silentRefresh: si el refresco falla, todos reciben false',
      () async {
        service.setSession(_session(refreshToken: 'r1'));
        final gate = Completer<void>();
        fakeMeRepo
          ..refreshDelay = gate.future
          ..refreshOutcome = const ApiResult.failure(AppRequestException(error: '401'));

        final a = service.silentRefresh();
        final b = service.silentRefresh();
        gate.complete();

        expect(await Future.wait([a, b]), [false, false],
            reason: 'La deduplicación comparte el veredicto, sea cual sea.');
        expect(fakeMeRepo.refreshTokenCalls, 1);
      },
    );

    test(
      'tras un refresh terminado, otro silentRefresh sí ejecuta (no quedó atascado)',
      () async {
        // Verifica que el guard `_isRefreshingToken` se libera bien en el
        // finally del primer call. Sin esto, un solo refresh podría
        // bloquear todos los siguientes hasta restart.
        service.setSession(_session(refreshToken: 'r1'));

        final r1 = await service.silentRefresh();
        final r2 = await service.silentRefresh();

        expect(r1, true);
        expect(r2, true);
        expect(fakeMeRepo.refreshTokenCalls, 2,
            reason: 'Refresh A termina → guard libera → refresh B puede correr');
      },
    );
  });

  group('restoreTokensFromSecureStorage — 3 paths', () {
    test(
      'tokens en Keychain → return session con tokens hidratados',
      () async {
        // Simula el caso post-relogin: HydratedBloc cacheó session SIN
        // tokens (los strip en toJson) pero el Keychain los tiene.
        fakeSecure.storedAccessToken = 'kc-access';
        fakeSecure.storedRefreshToken = 'kc-refresh';
        fakeSecure.storedTokenType = 'Bearer';
        fakeSecure.storedTokenCreatedAt = '2026-05-06T10:00:00Z';

        final session = _session(accessToken: null, refreshToken: null);
        final restored = await service.restoreTokensFromSecureStorage(session);

        expect(restored, isNotNull);
        expect(restored!.accessToken, 'kc-access');
        expect(restored.refreshToken, 'kc-refresh');
        expect(restored.tokenType, 'Bearer');
        expect(restored.tokedCreatedAt, '2026-05-06T10:00:00Z');
        expect(fakeSecure.saveTokensCalls, 0,
            reason: 'Keychain ya tiene tokens — no re-savear');
      },
    );

    test(
      'sin Keychain pero session.token presente → migration path',
      () async {
        // Simula el escenario de upgrade de versión: el usuario corría
        // una build pre-Phase-3 donde tokens vivían en HydratedBloc
        // plaintext. La nueva build los detecta y los migra al Keychain.
        fakeSecure.storedAccessToken = null;
        final legacySession = _session(
          accessToken: 'legacy-access',
          refreshToken: 'legacy-refresh',
        );

        final restored = await service.restoreTokensFromSecureStorage(legacySession);

        expect(restored, isNotNull);
        expect(restored!.accessToken, 'legacy-access',
            reason: 'En migration, devolvemos la session as-is');
        expect(fakeSecure.saveTokensCalls, 1,
            reason: 'La migración debe persistir los tokens al Keychain');
        expect(fakeSecure.storedAccessToken, 'legacy-access',
            reason: 'Tras migration, el Keychain queda con los tokens legacy');
      },
    );

    test(
      'sin tokens en ningún lado → return null (Bug F path)',
      () async {
        // Este es el path que dispara la rama de Bug F en RootBloc:
        // restoredSession == null → emit userLogout en vez de
        // notifyTokenExpired. Sin este test la rama es invisible al refactor.
        fakeSecure.storedAccessToken = null;
        final emptySession = _session(accessToken: null, refreshToken: null);
        // Con accessToken=null el helper le pone null al token también
        // (mismo valor en _session()), así que session.token también es null.

        final restored = await service.restoreTokensFromSecureStorage(emptySession);

        expect(restored, isNull,
            reason: 'Sin tokens ni en Keychain ni en HydratedBloc, no hay '
                'sesión que restaurar — RootBloc debe emitir userLogout');
      },
    );

    test(
      'token vacío string también cuenta como ausente',
      () async {
        fakeSecure.storedAccessToken = '';
        final emptyTokenSession = _session(accessToken: '', refreshToken: '');

        final restored = await service.restoreTokensFromSecureStorage(emptyTokenSession);

        expect(restored, isNull,
            reason: 'Empty string no debe disparar el migration path');
      },
    );
  });

  group('notifyTokenExpired — re-entrancy y guards', () {
    test(
      're-entrancy: forceToLogin=true → noop',
      () async {
        // Bursts de 401 simultáneos pueden disparar notifyTokenExpired
        // varias veces. El guard debe absorber los duplicados; sin él,
        // el snackbar parpadea y addPostFrameCallback se acumula.
        //
        // Importante el ORDEN: primero setSession (que automáticamente
        // baja forceToLogin por el fix de Bug E), después subir el flag
        // a true para simular el estado "ya en flujo de logout".
        service.setSession(_session());
        service.forceToLogin = true;

        final sessionBefore = service.userSessionDM;
        service.notifyTokenExpired();

        expect(service.userSessionDM, sessionBefore,
            reason: 'Re-entry guard: si ya está en flujo de logout, no '
                'volver a clear');
      },
    );

    test(
      'isBiometricLoginInProgress=true → noop (token rotation race)',
      () async {
        service.setSession(_session());
        service.setBiometricLoginInProgress(true);
        final sessionBefore = service.userSessionDM;

        service.notifyTokenExpired();

        expect(service.userSessionDM, sessionBefore,
            reason: 'Durante biometric login el BE rota el token; los 401 '
                'transitorios NO son sesión expirada real');
      },
    );

    test(
      'caso normal → clearInvalidSession + setea forceToLogin=true',
      () async {
        service.setSession(_session());
        expect(service.isLoggedIn, true);

        service.notifyTokenExpired();

        expect(service.isLoggedIn, false,
            reason: 'La sesión debe limpiarse');
        expect(service.forceToLogin, true,
            reason: 'El flag debe levantarse para que el GoRouter rediriga a /login');
        expect(fakeSecure.clearAllCalls, 1,
            reason: 'Los tokens del Keychain deben limpiarse junto con la sesión');
      },
    );
  });
}

