import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'user_scoped_cubit_fakes.dart';

/// Tests del reset de la starting page tras invalidar la sesión.
///
/// **Invariante que protegen:** `clearInvalidSession()` SIEMPRE debe dejar al
/// `StartingCubit` en un estado que `StartingPage369` sepa renderizar como
/// contenido (logo + formulario + huella + footer).
///
/// **Contexto del bug (2026-05-24, multi-dispositivo):** con sesión iniciada
/// en el teléfono A y la misma cuenta logueada en el teléfono B, el BE invalida
/// los tokens de A. La próxima request de A da 401 → `silentRefresh` falla →
/// `notifyTokenExpired` → `clearInvalidSession` → navegación a la starting page.
/// Pero tras un login el `StartingCubit` singleton quedó en `_UserAuthenticated`,
/// y `StartingPage369.build()` sólo pinta contenido para `loading`/`welcome`/
/// `error` — para cualquier otro estado cae a `SizedBox.expand()`. Resultado:
/// el usuario veía el snackbar "sesión expirada" sobre una PANTALLA EN BLANCO,
/// y sólo matando y reabriendo la app (que reconstruye el cubit) se destrababa.
///
/// El logout manual (`exit()`) nunca tuvo el bug porque ya hacía
/// `setView(StartingPageView.initial)`. El fix replica ese reset en el logout
/// automático, dentro de `clearInvalidSession()`. Estos tests son la red que
/// detecta si un refactor lo vuelve a romper.

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
  String? _accessToken;
  String? _refreshToken;
  String? _tokenType;
  String? _tokenCreatedAt;

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _tokenType = tokenType;
    _tokenCreatedAt = tokenCreatedAt;
  }

  @override
  Future<void> clearAll() async {
    _accessToken = null;
    _refreshToken = null;
    _tokenType = null;
    _tokenCreatedAt = null;
  }

  @override
  Future<String?> get accessToken async => _accessToken;
  @override
  Future<String?> get refreshToken async => _refreshToken;
  @override
  Future<String?> get tokenType async => _tokenType;
  @override
  Future<String?> get tokenCreatedAt async => _tokenCreatedAt;
  @override
  Future<bool> hasTokens() async => _accessToken != null && _accessToken!.isNotEmpty;
}

/// Fake del MeRepo. Sólo implementa `login()` —es la única llamada de red que
/// estos tests ejercitan (para llevar al `StartingCubit` a `_UserAuthenticated`,
/// que es justo el estado que producía la pantalla en blanco).
class _FakeMeRepo implements MeRepo {
  ApiResult<UserSessionDM> loginOutcome = const ApiResult.success(
    UserSessionDM(
      user: UserDM(uuid: 'u1'),
      token: 'access-A',
      tokenType: 'Bearer',
      accessToken: 'access-A',
      refreshToken: 'refresh-A',
    ),
  );

  @override
  Future<ApiResult<UserSessionDM>> login({required UserBodyLoginDTO loginDTO}) async => loginOutcome;

  @override
  noSuchMethod(Invocation invocation) => null;
}

class _FakeBaseConfig implements BaseConfig {
  // `BaseConfig.googleSignInClientId` es `String` no-nullable y el field
  // initializer de `StartingCubit` (`GoogleSignIn(...)`) lo lee al construirse.
  // Devolver null vía noSuchMethod tira `Null is not a subtype of String`.
  @override
  String get googleSignInClientId => 'test-client-id';

  @override
  noSuchMethod(Invocation invocation) => null;
}

/// True si `state` es uno de los estados para los que `StartingPage369.build()`
/// pinta contenido real (ver el `maybeWhen` de starting_page.dart). Cualquier
/// otro estado renderiza `SizedBox.expand()` → pantalla en blanco.
bool _rendersContent(StartingState state) => state.maybeWhen(
      loading: (_) => true,
      welcome: (_) => true,
      error: (_, __) => true,
      orElse: () => false,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;
  late StartingCubit startingCubit;
  late _FakeMeRepo fakeMeRepo;

  setUp(() {
    // Las rutas de cierre de sesión los piden por el locator.
    registrarCubitsDeUsuario();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    if (di.isRegistered<BaseConfig>()) di.unregister<BaseConfig>();

    di.registerSingleton<FoodlyApiProvider>(_FakeApiProvider());
    di.registerSingleton<Logger>(Logger(level: Level.off));
    // StartingCubit construye un GoogleSignIn en un field initializer que lee
    // di<BaseConfig>() — debe estar registrado antes de instanciar el cubit.
    di.registerSingleton<BaseConfig>(_FakeBaseConfig());

    fakeMeRepo = _FakeMeRepo();

    service = AuthSessionService(
      config: _FakeBaseConfig(),
      meRepo: fakeMeRepo,
      localStorageService: LocalStorageService(),
      appApiProvider: _FakeApiProvider(),
      secureTokenService: _FakeSecureTokenService(),
    );

    startingCubit = StartingCubit(service, di<Logger>(), fakeMeRepo);
    service.setStartingCubit(startingCubit);
  });

  tearDown(() {
    desregistrarCubitsDeUsuario();
    startingCubit.close();
    if (di.isRegistered<FoodlyApiProvider>()) di.unregister<FoodlyApiProvider>();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    if (di.isRegistered<BaseConfig>()) di.unregister<BaseConfig>();
  });

  group('clearInvalidSession — resetea la starting page', () {
    test(
      'tras un login (cubit en _UserAuthenticated) → vuelve a welcome/initial',
      () async {
        // Reproducción exacta del bug: el usuario se logueó, el cubit quedó en
        // _UserAuthenticated.
        startingCubit.login();
        await pumpEventQueue();

        final reproducedBlank = startingCubit.state.maybeWhen(
          userAuthenticated: (_) => true,
          orElse: () => false,
        );
        expect(reproducedBlank, true,
            reason: 'Precondición: el login deja al cubit en _UserAuthenticated, '
                'el estado que StartingPage369 renderiza en blanco');
        expect(_rendersContent(startingCubit.state), false,
            reason: 'Sin el fix, la starting page sería SizedBox.expand()');

        // Una sesión se invalida en runtime (401 multi-dispositivo).
        service.clearInvalidSession();

        expect(_rendersContent(startingCubit.state), true,
            reason: 'El fix: clearInvalidSession devuelve el cubit a un estado renderable');
        final view = startingCubit.state.maybeWhen(
          welcome: (vm) => vm.currentView,
          orElse: () => null,
        );
        expect(view, StartingPageView.initial,
            reason: 'Igual que exit() en el logout manual: la vista vuelve a initial');
      },
    );

    test(
      'cubit recién construido (boot) → el reset es idempotente y no lanza',
      () {
        // En el boot el cubit ya nace en _Welcome/initial (su constructor llama
        // setView). clearInvalidSession se invoca también en el restore de
        // arranque — el reset debe ser un no-op seguro, no un cambio disruptivo.
        expect(_rendersContent(startingCubit.state), true);

        service.clearInvalidSession();

        expect(_rendersContent(startingCubit.state), true);
        expect(
          startingCubit.state.maybeWhen(welcome: (vm) => vm.currentView, orElse: () => null),
          StartingPageView.initial,
        );
      },
    );

    test(
      'sin StartingCubit cableado → clearInvalidSession no lanza (null-safe)',
      () {
        // Cubre la carrera de arranque: si un 401 llega antes de que el
        // BlocProvider de main.dart haya creado el cubit y llamado
        // setStartingCubit, la referencia es null. `_startingCubit?.` lo
        // tolera — y si el cubit nunca se creó, tampoco hay starting page
        // montada que pudiera quedar en blanco.
        final orphanService = AuthSessionService(
          config: _FakeBaseConfig(),
          meRepo: fakeMeRepo,
          localStorageService: LocalStorageService(),
          appApiProvider: _FakeApiProvider(),
          secureTokenService: _FakeSecureTokenService(),
        );

        expect(orphanService.clearInvalidSession, returnsNormally);
      },
    );
  });
}
