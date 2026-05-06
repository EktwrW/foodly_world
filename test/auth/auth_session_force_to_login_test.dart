import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';

/// Fake mínimo de [FoodlyApiProvider] — solo necesitamos el lookup por
/// di<>() y un setAuthToken no-op. La instancia real haría llamadas a
/// Dio y headers que no nos interesan acá.
class _FakeApiProvider implements FoodlyApiProvider {
  @override
  Dio get dio => Dio();

  @override
  void setAuthToken(String token) {}

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeSecureTokenService implements SecureTokenService {
  final List<Map<String, String?>> savedCalls = [];

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {
    savedCalls.add({
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
    });
  }

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

UserSessionDM _validSession({String uuid = 'user-uuid-1'}) {
  return UserSessionDM(
    user: UserDM(uuid: uuid),
    token: 'access-token-abc',
    tokenType: 'Bearer',
    refreshToken: 'refresh-token-xyz',
    accessToken: 'access-token-abc',
  );
}

UserSessionDM _emptyUuidSession() {
  return const UserSessionDM(
    user: UserDM(uuid: ''),
    token: 'token',
    tokenType: 'Bearer',
  );
}

/// Tests del invariante de Bug E (2026-05-06):
///
///   "setSession con una sesión válida (uuid no vacío) DEBE bajar
///    forceToLogin a false. Sin esto, un re-login después de un boot
///    fallido (initializeSessionOrClear → 401) deja al usuario atrapado
///    en /login porque el GoRouter redirector sigue forzando el redirect
///    aunque la sesión nueva sea válida."
///
/// Fixture mínima: instanciamos AuthSessionService con fakes para todos
/// los colaboradores no-relevantes y verificamos solo el flag.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;

  setUp(() {
    // di<FoodlyApiProvider>() es invocado dentro de setSession para
    // empujar el header al Dio compartido. Registramos un fake para que
    // el lookup no explote.
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

  group('AuthSessionService.setSession — forceToLogin invariant', () {
    test(
      'sesión válida con uuid → forceToLogin pasa de true a false',
      () {
        // Simula el escenario donde un boot anterior dejó el flag arriba
        // (initializeSessionOrClear falló y _clearInvalidSession se llamó).
        service.forceToLogin = true;

        service.setSession(_validSession());

        expect(service.forceToLogin, false,
            reason: 'Un re-login exitoso debe destrabar el global redirector — '
                'sin este reset el usuario queda en bucle en /login');
      },
    );

    test(
      'sesión válida con uuid → setea userSessionDM',
      () {
        service.setSession(_validSession(uuid: 'user-uuid-2'));

        expect(service.userSessionDM, isNotNull);
        expect(service.userSessionDM!.user.uuid, 'user-uuid-2');
        expect(service.isLoggedIn, true);
      },
    );

    test(
      'sesión con uuid vacío NO baja forceToLogin (defensa contra ghost sessions)',
      () {
        // Un session DM con uuid vacío puede llegar de un BE buggy o de un
        // socialLogin que aún no terminó de hidratar al user. Acá NO
        // queremos destrabar el redirect — la sesión todavía no es real.
        service.forceToLogin = true;

        service.setSession(_emptyUuidSession());

        expect(service.forceToLogin, true,
            reason: 'uuid vacío no califica como sesión válida — el redirect '
                'debe seguir mandando al user a /login hasta que llegue un '
                'uuid real');
      },
    );

    test(
      'setSession(null) NO baja forceToLogin',
      () {
        service.forceToLogin = true;

        service.setSession(null);

        expect(service.forceToLogin, true, reason: 'Limpiar la sesión no es un re-login — el flag se mantiene');
      },
    );

    test(
      'setSession reescribe userSessionDM con tokens nuevos',
      () {
        // Login inicial con un token A.
        service.setSession(_validSession(uuid: 'u-1'));
        expect(service.userSessionDM!.accessToken, 'access-token-abc');

        // Refresh / re-login con un token nuevo (mismo o distinto user).
        final renewed = const UserSessionDM(
          user: UserDM(uuid: 'u-1'),
          token: 'access-NEW',
          tokenType: 'Bearer',
          refreshToken: 'refresh-NEW',
          accessToken: 'access-NEW',
        );
        service.setSession(renewed);

        expect(service.userSessionDM!.accessToken, 'access-NEW');
      },
    );
  });
}

/// Mínimo viable de BaseConfig — el constructor de AuthSessionService lo
/// guarda pero no lo lee en setSession.
class _FakeBaseConfig implements BaseConfig {
  @override
  noSuchMethod(Invocation invocation) => null;
}
