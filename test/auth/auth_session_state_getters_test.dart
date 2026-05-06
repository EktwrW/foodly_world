import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/network/base/app_api_provider.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/local_storage_service.dart';
import 'package:foodly_world/core/services/secure_token_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';

class _FakeApiProvider implements FoodlyApiProvider {
  @override
  Dio get dio => Dio();
  @override
  void setAuthToken(String token) {}
  @override
  noSuchMethod(Invocation invocation) => null;
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
  Future<String?> get accessToken async => null;
  @override
  Future<String?> get refreshToken async => null;
  @override
  Future<String?> get tokenType async => null;
  @override
  Future<String?> get tokenCreatedAt async => null;
  @override
  Future<bool> hasTokens() async => false;
}

class _FakeMeRepo implements MeRepo {
  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeBaseConfig implements BaseConfig {
  @override
  noSuchMethod(Invocation invocation) => null;
}

UserSessionDM _sessionWithCreatedAt(String? createdAtIso) {
  return UserSessionDM(
    user: const UserDM(uuid: 'u1'),
    token: 'tok',
    tokenType: 'Bearer',
    accessToken: 'tok',
    refreshToken: 'refresh',
    tokedCreatedAt: createdAtIso,
  );
}

/// Tests de los getters derivados de [AuthSessionService] que el resto
/// del flujo de auth lee constantemente:
///
/// - [isAccessTokenExpired] — usado por DioRequestHandler para decidir si
///   pre-refrescar antes de pegar al BE. Una regresión acá puede causar
///   que NUNCA se refresque (tokens viejos siempre rechazados) o que
///   SIEMPRE se refresque (overhead innecesario en cada request).
///
/// - [hasSessionOrPending] — usado por LocalAuthCubit y AppRouter para
///   decidir si esperar a la restauración async de tokens antes de
///   tomar decisiones de redirect. Una regresión causa el bug "fresh
///   start sin sesión te tira a /login antes de que setSession termine".
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;

  setUp(() {
    if (di.isRegistered<FoodlyApiProvider>()) {
      di.unregister<FoodlyApiProvider>();
    }
    di.registerSingleton<FoodlyApiProvider>(_FakeApiProvider());

    service = AuthSessionService(
      config: _FakeBaseConfig(),
      meRepo: _FakeMeRepo(),
      localStorageService: LocalStorageService(),
      appApiProvider: _FakeApiProvider(),
      secureTokenService: _FakeSecureTokenService(),
    );
  });

  tearDown(() {
    if (di.isRegistered<FoodlyApiProvider>()) {
      di.unregister<FoodlyApiProvider>();
    }
  });

  group('isAccessTokenExpired', () {
    test(
      'sin sesión activa → false (no es "expirado", es "ausente")',
      () {
        // userSessionDM null → isLoggedIn false → expired returns false.
        expect(service.isLoggedIn, false);
        expect(service.isAccessTokenExpired, false,
            reason: 'No tener sesión NO es "expirado" — son estados distintos. '
                'El interceptor solo refresca cuando hay sesión activa con token viejo');
      },
    );

    test(
      'tokedCreatedAt null → false (defensivo, no asumimos expirado)',
      () {
        service.setSession(_sessionWithCreatedAt(null));

        expect(service.isAccessTokenExpired, false,
            reason: 'Sesión legacy sin tokedCreatedAt no debe forzar refresh — '
                'el server se encarga de validar via Sanctum');
      },
    );

    test(
      'tokedCreatedAt vacío → false',
      () {
        service.setSession(_sessionWithCreatedAt(''));

        expect(service.isAccessTokenExpired, false);
      },
    );

    test(
      'token con < 23h → NOT expired',
      () {
        // 22h hacia atrás — todavía vigente bajo la regla cliente-side.
        final created = DateTime.now().subtract(const Duration(hours: 22));
        service.setSession(_sessionWithCreatedAt(created.toIso8601String()));

        expect(service.isAccessTokenExpired, false);
      },
    );

    test(
      'token con exactamente 23h → expired',
      () {
        // Borde: la regla es `>= 23h`. Documentado en el getter porque el
        // server-side TTL es 24h y queremos margen para refrescar antes.
        final created = DateTime.now().subtract(const Duration(hours: 23, seconds: 1));
        service.setSession(_sessionWithCreatedAt(created.toIso8601String()));

        expect(service.isAccessTokenExpired, true,
            reason: 'A 23h o más, el cliente debe refrescar proactivamente');
      },
    );

    test(
      'token de hace 25h → expired',
      () {
        final created = DateTime.now().subtract(const Duration(hours: 25));
        service.setSession(_sessionWithCreatedAt(created.toIso8601String()));

        expect(service.isAccessTokenExpired, true);
      },
    );

    test(
      'tokedCreatedAt malformado → false (catch defensivo, no expired)',
      () {
        // Si por alguna razón el server manda un valor no-ISO, no queremos
        // forzar refresh ni crashear.  Comportamiento: false (deja que
        // server-side decida via 401).
        service.setSession(_sessionWithCreatedAt('not-a-date'));

        expect(service.isAccessTokenExpired, false,
            reason: 'Parsing failure no debe escalar a logout silencioso');
      },
    );
  });

  group('hasSessionOrPending', () {
    test(
      'sesión activa (isLoggedIn true) → true',
      () {
        service.setSession(_sessionWithCreatedAt(null));
        expect(service.isLoggedIn, true);
        expect(service.hasSessionOrPending, true);
      },
    );

    test(
      'restore en progreso (hasPendingSessionRestore true) → true',
      () {
        // Caso bootstrap: HydratedBloc encontró cachedState pero
        // restoreTokensFromSecureStorage todavía no terminó. setSession
        // no fue invocado, isLoggedIn es false, pero hay sesión "siendo
        // restaurada".
        service.hasPendingSessionRestore = true;

        expect(service.isLoggedIn, false);
        expect(service.hasSessionOrPending, true,
            reason: 'LocalAuthCubit y AppRouter dependen de este getter para '
                'esperar a setSession antes de redirigir a /login');
      },
    );

    test(
      'sin sesión y sin restore pending → false',
      () {
        expect(service.isLoggedIn, false);
        expect(service.hasPendingSessionRestore, false);
        expect(service.hasSessionOrPending, false);
      },
    );

    test(
      'orden temporal: pending → loaded → pending=false',
      () {
        // Simula el flow real del bootstrap:
        // 1. fromJson() setea hasPendingSessionRestore = true
        // 2. setSession() carga tokens
        // 3. initializeSessionOrClear() baja hasPendingSessionRestore = false
        service.hasPendingSessionRestore = true;
        expect(service.hasSessionOrPending, true);

        service.setSession(_sessionWithCreatedAt(null));
        expect(service.hasSessionOrPending, true);

        service.hasPendingSessionRestore = false;
        expect(service.hasSessionOrPending, true,
            reason: 'Una vez cargada, el flag pending baja pero la sesión sigue activa');
      },
    );
  });
}
