import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'user_scoped_cubit_fakes.dart';

/// Fake AuthSessionService que TRACKEA cuántas veces se invoca cada API
/// pública relevante para los tests del interceptor. No usa la real porque
/// la real require Firebase + secure storage + Dio del API provider; los
/// tests del interceptor son sobre la decisión del whitelist, no sobre
/// la sesión.
class _SpyAuthSessionService implements AuthSessionService {
  bool _isLoggedIn = true;
  bool _isAccessTokenExpired = false;
  bool _hasRefreshToken = true;
  bool _isBiometricLoginInProgress = false;

  int notifyTokenExpiredCalls = 0;
  int silentRefreshCalls = 0;

  /// Permite que el test fuerce el outcome de un silentRefresh sin tener
  /// que rendirizar la llamada real a /token/refresh.
  bool silentRefreshOutcome = true;

  @override
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool v) => _isLoggedIn = v;

  @override
  bool get isAccessTokenExpired => _isAccessTokenExpired;
  set isAccessTokenExpired(bool v) => _isAccessTokenExpired = v;

  /// Ver nota en dio_error_handler_401_test.dart: getter nuevo del servicio,
  /// necesita override explícito para no caer en noSuchMethod → null.
  bool _isLoggingOut = false;
  @override
  bool get isLoggingOut => _isLoggingOut;
  set isLoggingOut(bool v) => _isLoggingOut = v;

  /// Sesión logueada con token: desde el modo invitado (ea7e335) el request
  /// handler REESCRIBE el Bearer desde la sesión y lo elimina si no hay
  /// token. Estos tests simulan un usuario autenticado, así que el spy debe
  /// exponer una sesión válida (antes bastaba con setear el header crudo).
  UserSessionDM? _session = const UserSessionDM(
    user: UserDM(uuid: 'test-user'),
    token: 'real_user_token',
    accessToken: 'real_user_token',
    tokenType: 'Bearer',
  );
  @override
  UserSessionDM? get userSessionDM => _session;
  @override
  set userSessionDM(UserSessionDM? v) => _session = v;

  @override
  bool get hasRefreshToken => _hasRefreshToken;
  set hasRefreshToken(bool v) => _hasRefreshToken = v;

  @override
  bool get isBiometricLoginInProgress => _isBiometricLoginInProgress;
  set isBiometricLoginInProgress(bool v) => _isBiometricLoginInProgress = v;

  @override
  bool get isRefreshingToken => false;

  /// El request handler sella cada request con la generación de sesión. Sin
  /// override explícito esto caería en `noSuchMethod` → null, y devolver null
  /// desde un getter declarado `int` revienta en runtime bajo null safety.
  int sessionGenerationValue = 1;
  @override
  int get sessionGeneration => sessionGenerationValue;

  @override
  Future<void> validateAccessToken() async {}

  @override
  void notifyTokenExpired() {
    notifyTokenExpiredCalls++;
  }

  @override
  Future<bool> silentRefresh() async {
    silentRefreshCalls++;
    return silentRefreshOutcome;
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Tests del whitelist del [DioRequestHandler] — protegen 3 bugs ya
/// arreglados de regresar.
///
/// **Bug C (2026-04-21):** `endsWith('/register')` matcheaba accidentalmente
/// `/device-tokens/register` y le quitaba el Authorization header. Como
/// resultado, NINGÚN device token de FCM se registraba server-side y los
/// push notifications no llegaban. La fix: whitelist exacto + Set de paths.
/// Si alguien renombra una constante o agrega `endsWith`, este test rompe.
///
/// **Bug E.1 (2026-04-21):** `/biometric-login` se metió en el whitelist
/// "porque parecía endpoint de auth", pero el controller server-side está
/// envuelto en `auth:sanctum` y necesita el Bearer token del refresh. Sin
/// header → BE retorna 401 → cubit emite _Error → user a /login. La fix:
/// `/biometric-login` NO está en el whitelist. Este test bloquea cualquier
/// intento de devolverlo.
///
/// **Bug F.2 (2026-05-06):** confirmamos que rutas pre-login públicas
/// (`/public/places/details/{id}`, `/geocoding/reverse`) sí están en el
/// whitelist y no piden Bearer.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _SpyAuthSessionService spy;

  setUp(() {
    // Las rutas de cierre de sesión los piden por el locator.
    registrarCubitsDeUsuario();
    if (di.isRegistered<AuthSessionService>()) {
      di.unregister<AuthSessionService>();
    }
    spy = _SpyAuthSessionService();
    di.registerSingleton<AuthSessionService>(spy);
  });

  tearDown(() {
    desregistrarCubitsDeUsuario();
    if (di.isRegistered<AuthSessionService>()) {
      di.unregister<AuthSessionService>();
    }
  });

  group('dioRequestHandler — whitelist de paths públicos', () {
    test(
      '/login → strip Authorization header (endpoint público)',
      () async {
        final options = RequestOptions(
          path: '/login',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer stale_token_xyz'},
        );

        final result = await _runRequest(options);

        expect(result.headers.containsKey(FoodlyStrings.AUTHORIZATION), false,
            reason: 'Bearer en endpoint público debe quitarse para evitar 401 con token expirado');
      },
    );

    test(
      '/social-login → strip Authorization header',
      () async {
        final options = RequestOptions(
          path: '/social-login',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer stale'},
        );

        final result = await _runRequest(options);

        expect(result.headers.containsKey(FoodlyStrings.AUTHORIZATION), false);
      },
    );

    test(
      '/register → strip Authorization header',
      () async {
        final options = RequestOptions(
          path: '/register',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer stale'},
        );

        final result = await _runRequest(options);

        expect(result.headers.containsKey(FoodlyStrings.AUTHORIZATION), false);
      },
    );

    test(
      'Bug C regression: /device-tokens/register PRESERVA Authorization',
      () async {
        // Bug C: `endsWith('/register')` matcheaba esto y rompía push.
        // Si vuelve a matchear, el header se elimina y el test rompe.
        final options = RequestOptions(
          path: '/device-tokens/register',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer real_user_token'},
        );

        final result = await _runRequest(options);

        expect(result.headers[FoodlyStrings.AUTHORIZATION], isNotNull,
            reason: '/device-tokens/register requiere Bearer auth — no debe estar en whitelist público (Bug C)');
        expect(result.headers[FoodlyStrings.AUTHORIZATION], contains('Bearer'));
      },
    );

    test(
      'Bug E.1 regression: /biometric-login PRESERVA Authorization',
      () async {
        // Bug E.1: el controller server-side está bajo auth:sanctum y
        // necesita el Bearer (access o refresh) para autenticar al user.
        // Si alguien lo agrega al whitelist, el biometric login devuelve
        // 401 y el cubit emite _Error → user a /login → loop sin escape.
        final options = RequestOptions(
          path: '/biometric-login',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer refresh_or_access_token'},
        );

        final result = await _runRequest(options);

        expect(result.headers[FoodlyStrings.AUTHORIZATION], isNotNull,
            reason: '/biometric-login NO debe estar en el whitelist público (Bug E.1)');
        expect(result.headers[FoodlyStrings.AUTHORIZATION], contains('Bearer'));
      },
    );

    test(
      '/public/places/details/{placeId} → strip header (placeId dinámico)',
      () async {
        // Es la única ruta pública con segmento dinámico — el handler usa
        // startsWith para matchearla. Cubrimos un placeId real y un edge
        // case (slash al final, query string).
        final placeIds = ['ChIJN1t_tDeuEmsRUsoyG83frY4', 'random_place_123'];
        for (final id in placeIds) {
          final options = RequestOptions(
            path: '/public/places/details/$id',
            headers: {FoodlyStrings.AUTHORIZATION: 'Bearer should_strip'},
          );
          final result = await _runRequest(options);
          expect(result.headers.containsKey(FoodlyStrings.AUTHORIZATION), false,
              reason: 'placeId="$id" debe ser tratado como público');
        }
      },
    );

    test(
      '/geocoding/reverse → strip header (pre-login route)',
      () async {
        final options = RequestOptions(
          path: '/geocoding/reverse',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer should_strip'},
        );

        final result = await _runRequest(options);

        expect(result.headers.containsKey(FoodlyStrings.AUTHORIZATION), false);
      },
    );

    test(
      'endpoint authed normal → preserva header (caso negativo del whitelist)',
      () async {
        // Cualquier otra ruta NO está en el whitelist y debe preservar el
        // Bearer. Casos típicos: /reservations, /me, /businesses/...
        final paths = ['/reservations', '/me', '/businesses/abc-123', '/posts'];
        for (final path in paths) {
          final options = RequestOptions(
            path: path,
            headers: {FoodlyStrings.AUTHORIZATION: 'Bearer real_token'},
          );
          final result = await _runRequest(options);
          expect(result.headers[FoodlyStrings.AUTHORIZATION], isNotNull,
              reason: '$path requiere auth, no debe perder el Bearer');
        }
      },
    );
  });

  group('dioRequestHandler — silent refresh + token expirado', () {
    test(
      'token expirado client-side + hasRefresh → dispara silentRefresh',
      () async {
        spy
          ..isAccessTokenExpired = true
          ..hasRefreshToken = true
          ..silentRefreshOutcome = true;

        final options = RequestOptions(
          path: '/me',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer expired'},
        );

        await _runRequest(options);

        expect(spy.silentRefreshCalls, 1,
            reason: 'Pre-flight check debe intentar refresh antes de pegar al BE');
        expect(spy.notifyTokenExpiredCalls, 0,
            reason: 'Refresh exitoso no debe disparar el modal "sesión expirada"');
      },
    );

    test(
      'token expirado client-side + refresh falla → notifyTokenExpired',
      () async {
        spy
          ..isAccessTokenExpired = true
          ..hasRefreshToken = true
          ..silentRefreshOutcome = false;

        final options = RequestOptions(
          path: '/me',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer expired'},
        );

        // Cuando refresh falla y notifyTokenExpired se invoca, el handler
        // NO llama handler.next — la promise no resuelve. Captamos eso vía
        // un timeout corto.
        await _runRequest(options).timeout(
          const Duration(milliseconds: 200),
          onTimeout: () => RequestOptions(),
        );

        expect(spy.silentRefreshCalls, 1);
        expect(spy.notifyTokenExpiredCalls, 1,
            reason: 'Refresh fallido debe escalar a "sesión expirada"');
      },
    );

    test(
      'token expirado client-side + sin refresh → notifyTokenExpired directo',
      () async {
        spy
          ..isAccessTokenExpired = true
          ..hasRefreshToken = false;

        final options = RequestOptions(
          path: '/me',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer expired'},
        );

        await _runRequest(options).timeout(
          const Duration(milliseconds: 200),
          onTimeout: () => RequestOptions(),
        );

        expect(spy.silentRefreshCalls, 0,
            reason: 'Sin refresh token no se debe intentar refresh');
        expect(spy.notifyTokenExpiredCalls, 1);
      },
    );

    test(
      'token vigente → NO refresh, NO notifyTokenExpired, propaga normal',
      () async {
        spy.isAccessTokenExpired = false;

        final options = RequestOptions(
          path: '/me',
          headers: {FoodlyStrings.AUTHORIZATION: 'Bearer fresh'},
        );

        await _runRequest(options);

        expect(spy.silentRefreshCalls, 0);
        expect(spy.notifyTokenExpiredCalls, 0);
      },
    );
  });

  group('sello de generación de sesión', () {
    test(
      'toda request sale sellada con la generación vigente',
      () async {
        // El sello es lo que después permite al error handler distinguir un
        // 401 legítimo del eco de una sesión que ya murió (2026-08-09).
        spy.sessionGenerationValue = 42;

        final options = await _runRequest(RequestOptions(
          path: '/me',
          headers: {'Authorization': 'Bearer tok'},
        ));

        expect(options.extra['foodly_session_generation'], 42);
      },
    );

    test(
      'los endpoints públicos también se sellan',
      () async {
        // Salen sin Bearer, pero un 401 sobre ellos igual pasa por el error
        // handler: sin sello quedarían fuera del criterio.
        spy.sessionGenerationValue = 3;

        final options = await _runRequest(RequestOptions(path: '/login'));

        expect(options.extra['foodly_session_generation'], 3);
      },
    );
  });
}

/// Helper: corre el dioRequestHandler con un sink-handler fake que
/// captura `next()` calls. El handler real muta `options.headers`
/// directamente (strip/inject del Bearer) — verificamos sobre `options`
/// después de que el async termine.
///
/// Cuando el handler dispara `notifyTokenExpired()` no llama next, así
/// que el future se resuelve de todas formas tras el microtick — no
/// queremos colgar el test.
Future<RequestOptions> _runRequest(RequestOptions options) async {
  final handler = _SinkHandler();
  DioRequestHandler.dioRequestHandler(options, handler);
  // Espera que el handler async termine (validateAccessToken,
  // potencialmente silentRefresh dentro). El handler es void, así que
  // esperamos por tiempo. 50ms es suficiente porque los fakes son sync.
  await Future<void>.delayed(const Duration(milliseconds: 50));
  return options;
}

/// Implementación mínima del contract de RequestInterceptorHandler — solo
/// nos importa NO crashear cuando el real handler llama next/reject.
class _SinkHandler implements RequestInterceptorHandler {
  bool nextCalled = false;
  @override
  void next(RequestOptions options) {
    nextCalled = true;
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}
