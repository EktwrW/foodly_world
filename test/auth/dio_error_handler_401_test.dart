import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';

/// Spy del [AuthSessionService] que trackea las llamadas relevantes al
/// 401 path: notifyTokenExpired, silentRefresh, y los flags de guard.
class _SpyAuthSessionService implements AuthSessionService {
  bool _isLoggedIn = true;
  bool _hasRefreshToken = true;
  bool _isBiometricLoginInProgress = false;
  bool _isRefreshingToken = false;
  UserSessionDM? _session;

  int notifyTokenExpiredCalls = 0;
  int silentRefreshCalls = 0;

  /// Outcome programable del silentRefresh — el handler real espera un
  /// bool y bifurca según; los tests setean esto antes de cada caso.
  bool silentRefreshOutcome = true;

  @override
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool v) => _isLoggedIn = v;

  @override
  bool get isAccessTokenExpired => false;

  /// `isLoggingOut` se añadió a AuthSessionService después de escribir este
  /// spy; sin override explícito caía en noSuchMethod (null → cast a bool).
  bool _isLoggingOut = false;
  @override
  bool get isLoggingOut => _isLoggingOut;
  set isLoggingOut(bool v) => _isLoggingOut = v;

  @override
  bool get hasRefreshToken => _hasRefreshToken;
  set hasRefreshToken(bool v) => _hasRefreshToken = v;

  @override
  bool get isBiometricLoginInProgress => _isBiometricLoginInProgress;
  set isBiometricLoginInProgress(bool v) => _isBiometricLoginInProgress = v;

  @override
  bool get isRefreshingToken => _isRefreshingToken;
  set isRefreshingToken(bool v) => _isRefreshingToken = v;

  @override
  UserSessionDM? get userSessionDM => _session;
  set session(UserSessionDM s) => _session = s;

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

/// Fake API provider — el handler usa `di<FoodlyApiProvider>().dio.fetch`
/// para hacer el retry tras un refresh exitoso. Le pasamos un Dio que
/// devuelve un response controlado para verificar la rama de retry.
class _FakeApiProvider implements FoodlyApiProvider {
  final Dio _dio = Dio();
  Response? programmedRetryResponse;
  Object? programmedRetryError;

  _FakeApiProvider() {
    // Interceptor que captura cualquier `fetch` que el handler dispare
    // para el retry del request original. Lo resolvemos con la respuesta
    // o el error programados por el test.
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, h) {
          if (programmedRetryError != null) {
            h.reject(DioException(requestOptions: options, error: programmedRetryError));
            return;
          }
          if (programmedRetryResponse != null) {
            h.resolve(programmedRetryResponse!);
            return;
          }
          // Default: 200 vacío. Suficiente para que el handler.resolve()
          // reciba algo no-null.
          h.resolve(Response(requestOptions: options, statusCode: 200));
        },
      ),
    );
  }

  @override
  Dio get dio => _dio;

  @override
  void setAuthToken(String token) {}

  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Sink-handler que captura cuál de las salidas del interceptor se llamó
/// (`resolve`, `reject`, `next`). El test inspecciona el contador para
/// validar el comportamiento sin tener que envolver Dio entero.
class _SinkErrorHandler implements ErrorInterceptorHandler {
  int resolveCalls = 0;
  int rejectCalls = 0;
  int nextCalls = 0;
  Response? lastResolved;
  DioException? lastRejected;

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {
    resolveCalls++;
    lastResolved = response;
  }

  @override
  void reject(DioException error, [bool callFollowingErrorInterceptor = false]) {
    rejectCalls++;
    lastRejected = error;
  }

  @override
  void next(DioException err) {
    nextCalls++;
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}

DioException _build401(
  String path, {
  Map<String, dynamic>? body,
  int statusCode = 401,
}) {
  final options = RequestOptions(
    path: path,
    headers: {'Authorization': 'Bearer something'},
  );
  return DioException(
    requestOptions: options,
    response: Response(
      requestOptions: options,
      statusCode: statusCode,
      data: body,
    ),
  );
}

/// Tests del [DioRequestHandler.dioErrorHandler] — protegen 4 bugs
/// históricos (Bug C, Bug E.1, Bug E.2, sudo-mode cascade) y la lógica
/// de recovery vía silent refresh + retry.
///
/// Importante: el handler real es ASYNC. Para detectar las acciones
/// (notifyTokenExpired, silentRefresh, resolve/reject del handler) hay
/// que esperar un microtick después de invocarlo. Lo encapsulamos en
/// `_runError`.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _SpyAuthSessionService spy;
  late _FakeApiProvider apiProvider;

  setUp(() {
    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();

    spy = _SpyAuthSessionService();
    apiProvider = _FakeApiProvider();
    di.registerSingleton<AuthSessionService>(spy);
    di.registerSingleton<FoodlyApiProvider>(apiProvider);

    // Le damos una sesión válida al spy para que el retry pueda
    // reconstruir el header con el token "nuevo".
    spy.session = const UserSessionDM(
      user: UserDM(uuid: 'u1'),
      token: 'fresh-token',
      tokenType: 'Bearer',
      accessToken: 'fresh-token',
      refreshToken: 'refresh-xyz',
    );
  });

  tearDown(() {
    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
  });

  group('dioErrorHandler 401 — auth endpoints whitelist', () {
    test(
      '/login con 401 → NO notifyTokenExpired (mal password ≠ sesión expirada)',
      () async {
        final handler = await _runError(_build401('/login'));

        expect(spy.notifyTokenExpiredCalls, 0,
            reason: 'Un 401 en /login significa credenciales incorrectas — '
                'la cubit ya muestra el error inline. Disparar el modal '
                'de "sesión expirada" confunde al usuario');
        expect(spy.silentRefreshCalls, 0,
            reason: 'No tiene sentido refrescar un token cuando todavía no hay sesión');
        expect(handler.rejectCalls, 1,
            reason: 'El error sigue propagando para que la cubit lo reciba');
      },
    );

    test(
      '/biometric-login con 401 → NO notifyTokenExpired (Bug E.1 regression)',
      () async {
        final handler = await _runError(_build401('/biometric-login'));

        expect(spy.notifyTokenExpiredCalls, 0,
            reason: '/biometric-login es endpoint authed pero su 401 lo maneja '
                'el LocalAuthCubit con _Error — escalar al modal global rompía '
                'el flujo (Bug E.1)');
        expect(handler.rejectCalls, 1);
      },
    );

    test(
      '/token/refresh con 401 → NO notifyTokenExpired',
      () async {
        // Si refrescar devuelve 401, ya estamos en el flow de "sesión
        // muerta" — el caller (silentRefresh) maneja la falla y
        // eventualmente alguien llamará notifyTokenExpired. Pero el
        // interceptor NO debe disparar otro encima en cascada.
        final handler = await _runError(_build401('/token/refresh'));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(spy.silentRefreshCalls, 0,
            reason: 'Un 401 en /token/refresh NO debe re-disparar refresh — '
                'cascade infinita');
        expect(handler.rejectCalls, 1);
      },
    );

    test(
      '/social-login y /register con 401 → NO notifyTokenExpired',
      () async {
        for (final path in ['/social-login', '/register']) {
          spy.notifyTokenExpiredCalls = 0;
          await _runError(_build401(path));
          expect(spy.notifyTokenExpiredCalls, 0,
              reason: '$path es endpoint público, 401 = error de credenciales');
        }
      },
    );

    test(
      '/public/places/details/{id} con 401 → NO notifyTokenExpired (defensa BE buggy)',
      () async {
        // Si por algún motivo el BE empieza a devolver 401 en una ruta
        // pública, no queremos kickear la sesión del usuario por eso.
        final handler = await _runError(_build401('/public/places/details/place_xyz'));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(handler.rejectCalls, 1);
      },
    );
  });

  group('dioErrorHandler 401 — sudo-mode failures (no kickear al user)', () {
    test(
      '401 con code=current_password_mismatch → NO notifyTokenExpired',
      () async {
        // Bug histórico documentado en código:
        //   1. Interceptor clasifica 401 como expired session.
        //   2. Trigger silent refresh → succeeds.
        //   3. Retry original request → still 401 (password sigue mal).
        //   4. notifyTokenExpired → user pateado a /login por mistypear contraseña.
        // Fix: sniff del body para detectar sudo-mode.
        final handler = await _runError(_build401(
          '/update-password',
          body: {'code': 'current_password_mismatch'},
        ));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(spy.silentRefreshCalls, 0,
            reason: 'No refrescamos si la falla es de validación de password');
        expect(handler.rejectCalls, 1,
            reason: 'El error propaga para que el form lo muestre inline');
      },
    );

    test(
      '401 con code=current_password_required → NO notifyTokenExpired',
      () async {
        final handler = await _runError(_build401(
          '/update-email',
          body: {'code': 'current_password_required'},
        ));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(handler.rejectCalls, 1);
      },
    );

    test(
      '401 con body legacy {error: "Current password ..."} → NO notifyTokenExpired',
      () async {
        // Conservative match para BE viejos que no usan el campo `code`.
        final handler = await _runError(_build401(
          '/update-password',
          body: {'error': 'Current password is required'},
        ));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(handler.rejectCalls, 1);
      },
    );

    test(
      '401 con body legacy {message: "current password mismatch"} → NO notifyTokenExpired',
      () async {
        final handler = await _runError(_build401(
          '/update-password',
          body: {'message': 'current password mismatch'},
        ));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(handler.rejectCalls, 1);
      },
    );

    test(
      '401 con body random NO matching sudo-mode → SÍ notifyTokenExpired (negativo)',
      () async {
        // Defensa contra falsos positivos: el sniff debe ser conservador.
        // Un body que no contiene "current password" debe seguir el flow
        // normal de "sesión expirada".
        spy.silentRefreshOutcome = false; // sin refresh para llegar al notifyTokenExpired
        spy.hasRefreshToken = false;

        await _runError(_build401(
          '/me',
          body: {'message': 'Token has expired'},
        ));

        expect(spy.notifyTokenExpiredCalls, 1,
            reason: 'Body sin signs de sudo-mode debe escalar normalmente');
      },
    );
  });

  group('dioErrorHandler 401 — biometric-login-in-progress guard', () {
    test(
      'isBiometricLoginInProgress=true → NO notifyTokenExpired (token rotation race)',
      () async {
        // Mientras el BE rota el token (delete viejo + create nuevo), un
        // request en vuelo con el token viejo recibe 401. Si el handler
        // dispara notifyTokenExpired ahí, kickea al user en mitad del
        // login biométrico. El guard suprime exactamente ese caso.
        spy.isBiometricLoginInProgress = true;

        await _runError(_build401('/me'));

        expect(spy.notifyTokenExpiredCalls, 0);
        expect(spy.silentRefreshCalls, 0,
            reason: 'No refrescamos durante biometric login; el endpoint '
                '/biometric-login ya está rotando');
      },
    );
  });

  group('dioErrorHandler 401 — refresh + retry', () {
    test(
      'refresh exitoso + retry exitoso → resolve con response del retry',
      () async {
        spy
          ..hasRefreshToken = true
          ..silentRefreshOutcome = true;
        apiProvider.programmedRetryResponse = Response(
          requestOptions: RequestOptions(path: '/me'),
          statusCode: 200,
          data: {'ok': true},
        );

        final handler = await _runError(_build401('/me'));

        expect(spy.silentRefreshCalls, 1);
        expect(spy.notifyTokenExpiredCalls, 0,
            reason: 'Recovery exitoso NO debe disparar el modal');
        expect(handler.resolveCalls, 1,
            reason: 'El handler debe resolver con la respuesta del retry');
        expect(handler.lastResolved?.statusCode, 200);
      },
    );

    test(
      'refresh exitoso + retry falla → cae al notifyTokenExpired (defensa)',
      () async {
        spy
          ..hasRefreshToken = true
          ..silentRefreshOutcome = true;
        apiProvider.programmedRetryError = Exception('network');

        await _runError(_build401('/me'));

        expect(spy.silentRefreshCalls, 1);
        // El handler real: si refresh OK pero retry falla, el catch
        // engloba el retry pero el flujo cae al notifyTokenExpired() que
        // está fuera del `if (refreshed)`. Comportamiento defensivo —
        // algo roto en el retry sugiere problema mayor y es mejor
        // expulsar al user que dejar la app en limbo.
        expect(spy.notifyTokenExpiredCalls, 1,
            reason: 'Retry fail tras refresh OK debe escalar a "sesión expirada"; '
                'el flow cae al notifyTokenExpired al final del bloque');
      },
    );

    test(
      'refresh fallido (token also expired) → notifyTokenExpired',
      () async {
        spy
          ..hasRefreshToken = true
          ..silentRefreshOutcome = false;

        await _runError(_build401('/me'));

        expect(spy.silentRefreshCalls, 1);
        expect(spy.notifyTokenExpiredCalls, 1,
            reason: 'Si refresh también muere, es game over: forceToLogin');
      },
    );

    test(
      'sin refresh token + isRefreshingToken=false → notifyTokenExpired directo',
      () async {
        spy
          ..hasRefreshToken = false
          ..isRefreshingToken = false;

        await _runError(_build401('/me'));

        expect(spy.silentRefreshCalls, 0,
            reason: 'No hay token para refrescar — no intentar');
        expect(spy.notifyTokenExpiredCalls, 1);
      },
    );

    test(
      'isRefreshingToken=true (otro request ya está refrescando) → notifyTokenExpired',
      () async {
        // Cuando hay un refresh en vuelo el handler NO encadena otro;
        // cae al else y dispara notifyTokenExpired. Esto evita storms de
        // refresh durante bursts de 401s simultáneos.
        spy
          ..hasRefreshToken = true
          ..isRefreshingToken = true;

        await _runError(_build401('/me'));

        expect(spy.silentRefreshCalls, 0,
            reason: 'Otro caller ya está refrescando — no apilar más');
        expect(spy.notifyTokenExpiredCalls, 1);
      },
    );
  });

  group('dioErrorHandler — códigos no-401', () {
    test(
      '500 → no toca el flujo de auth',
      () async {
        await _runError(_build401('/me', statusCode: 500));

        expect(spy.notifyTokenExpiredCalls, 0,
            reason: '500 es internal server error, no auth — el authService '
                'lo logea pero no kickea sesión');
        expect(spy.silentRefreshCalls, 0);
      },
    );

    test(
      '404, 422, 400 → no tocan el flujo de auth',
      () async {
        for (final code in [404, 422, 400, 403]) {
          spy.notifyTokenExpiredCalls = 0;
          spy.silentRefreshCalls = 0;
          await _runError(_build401('/me', statusCode: code));
          expect(spy.notifyTokenExpiredCalls, 0,
              reason: 'status=$code no debe escalar a notifyTokenExpired');
          expect(spy.silentRefreshCalls, 0);
        }
      },
    );
  });
}

/// Helper: corre el dioErrorHandler con un sink-handler. El handler es
/// async (await silentRefresh + await dio.fetch en el retry path), así
/// que esperamos lo suficiente para que toda la cadena resuelva.
Future<_SinkErrorHandler> _runError(DioException e) async {
  final handler = _SinkErrorHandler();
  DioRequestHandler.dioErrorHandler(e, handler);
  await Future<void>.delayed(const Duration(milliseconds: 80));
  return handler;
}
