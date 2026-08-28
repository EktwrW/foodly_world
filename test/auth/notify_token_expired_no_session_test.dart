// ignore_for_file: missing_default_constructor, must_be_immutable, override_on_non_overriding_member

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'user_scoped_cubit_fakes.dart';

/// Stubs mínimos para satisfacer el constructor de [AuthSessionService].
///
/// El guard `if (!isLoggedIn) return;` que validamos en este archivo se
/// ejecuta ANTES de tocar ninguna de estas dependencias — los stubs nunca
/// reciben llamadas en el camino feliz del test. Si por error el guard se
/// rompe y el método sigue, las invocaciones caerán en `noSuchMethod` y
/// retornarán null, terminando aguas abajo en NoSuchMethodError / TypeError
/// — el test fallará ruidosamente, exactamente lo que queremos.
///
/// Estrategia por dependencia:
/// - [BaseConfig]: clase abstracta con defaults para TODOS sus getters
///   (`=> ''`, `=> false`). `extends` hereda esos defaults sin más trabajo.
/// - [LocalStorageService]: clase concreta con constructor implícito y sin
///   inicialización pesada. `extends` funciona limpiamente.
/// - [SecureTokenService]: clase concreta PERO su constructor instancia un
///   `FlutterSecureStorage` que requiere platform channels — explotaría en
///   un test sin binding. Por eso `implements + noSuchMethod`, que no toca
///   el constructor original.
/// - [MeRepo] / [FoodlyApiProvider]: clases concretas pero su constructor
///   exige otras dependencias (MeClient, Dio configurado). Usamos
///   `implements + noSuchMethod => null` para evitar el chaining.
class _StubBaseConfig extends BaseConfig {}

class _StubLocalStorageService extends LocalStorageService {}

class _StubSecureTokenService implements SecureTokenService {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubMeRepo implements MeRepo {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _StubFoodlyApiProvider implements FoodlyApiProvider {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

/// Tests del guard `if (!isLoggedIn) return;` agregado a
/// [AuthSessionService.notifyTokenExpired] el 2026-06-01 (Bug H, post-go-live
/// 1.6.4 en Play Store).
///
/// **Escenario del bug.** App recién instalada de Play Store, primera
/// apertura sin login previo. Algún Bloc/Cubit (NearbyPromotionsCubit,
/// NewReleasesCubit) dispara un endpoint authed (`/promotions/nearby`,
/// `/business/new-releases`) en cuanto LocationService resuelve la posición
/// GPS. Sin Bearer token, el BE responde 401, el ErrorInterceptor cae en
/// `notifyTokenExpired()` y pinta un modal "Tu sesión ha expirado" sobre la
/// welcome screen — primera impresión arruinada.
///
/// **Lo que validamos acá.** Que cuando `isLoggedIn == false` el método
/// salga early ANTES de llamar a `clearInvalidSession`, sin tocar el router,
/// sin emitir snackbar y sin cambiar el estado de los flags. Verificamos
/// también que el guard NO bloquea el path normal cuando sí hay sesión
/// (sesión legítimamente expirada con UUID válido).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;

  tearDown(desregistrarCubitsDeUsuario);

  setUp(() {
    // Las rutas de cierre de sesión los piden por el locator.
    registrarCubitsDeUsuario();
    // Limpiamos di entre tests para no contaminar (el método podría llegar
    // a usar `di<AppRouter>` o `di<Logger>` en el path tras los guards;
    // si llega ahí, lanzaría StateError y el test fallaría — exactamente
    // el comportamiento que NO queremos. Si el guard funciona, di nunca
    // se invoca).
    if (di.isRegistered<AuthSessionService>()) di.unregister<AuthSessionService>();

    service = AuthSessionService(
      config: _StubBaseConfig(),
      meRepo: _StubMeRepo(),
      localStorageService: _StubLocalStorageService(),
      appApiProvider: _StubFoodlyApiProvider(),
      secureTokenService: _StubSecureTokenService(),
    );
  });

  group('notifyTokenExpired — guard !isLoggedIn (Bug H)', () {
    test(
      'userSessionDM == null → return sin tocar router, snackbar o flags',
      () {
        // Pre-condición: no hay sesión.
        expect(service.userSessionDM, isNull);
        expect(service.isLoggedIn, isFalse);
        expect(service.forceToLogin, isFalse);

        // Act: llamar notifyTokenExpired. Si el guard NO funciona, el método
        // intenta `di<AppRouter>()` y tira StateError (no hay AppRouter
        // registrado en di para este test).
        expect(() => service.notifyTokenExpired(), returnsNormally,
            reason: 'Sin sesión, el método debe salir early — si llega al '
                'router (sin AppRouter en di), explota con StateError');

        // Post-condición: nada cambió.
        expect(service.forceToLogin, isFalse,
            reason: 'forceToLogin NO debe activarse si nunca hubo sesión');
      },
    );

    test(
      'userSessionDM con uuid vacío → return (isLoggedIn=false por uuid)',
      () {
        // Edge case: restoración parcial deja un DM con user.uuid vacío.
        // El getter isLoggedIn devuelve false por la condición de UUID,
        // entonces el guard nuevo debe cubrir este caso también.
        service.userSessionDM = const UserSessionDM(
          user: UserDM(uuid: ''),
          token: 'orphan-token',
        );
        expect(service.isLoggedIn, isFalse,
            reason: 'isLoggedIn exige uuid no vacío');

        expect(() => service.notifyTokenExpired(), returnsNormally,
            reason: 'DM con uuid vacío = sesión zombie, NO modal');
        expect(service.forceToLogin, isFalse);
      },
    );

    test(
      'userSessionDM con uuid válido → guard no bloquea (sesión legítima)',
      () {
        // Verificación negativa: el guard NO debe romper el flujo normal.
        // Una sesión legítimamente expirada (token vencido + UUID poblado)
        // debe seguir disparando el modal como antes.
        service.userSessionDM = const UserSessionDM(
          user: UserDM(uuid: 'real-user-uuid'),
          token: 'expired-token',
          accessToken: 'expired-token',
          refreshToken: 'also-expired',
        );
        expect(service.isLoggedIn, isTrue);

        // Acá esperamos que el método ENTRE al cuerpo y eventualmente toque
        // el router (que no está registrado). El primer guard del método —
        // `forceToLogin || _isBiometricLoginInProgress || _isLoggingOut` —
        // no aplica. El nuevo guard isLoggedIn tampoco. Llegará a
        // clearInvalidSession y luego intentará di<AppRouter>() →
        // throws StateError de get_it (o NoSuchMethodError aguas abajo).
        // Cualquier excepción confirma que el guard no bloqueó.
        expect(
          () => service.notifyTokenExpired(),
          throwsA(anything),
          reason: 'Con sesión legítima, el método debe proceder más allá del '
              'guard (y eventualmente fallar al buscar AppRouter en di — '
              'esperado en este test unitario sin di poblada)',
        );
      },
    );
  });

  group('notifyTokenExpired — guard pre-existente sigue funcionando', () {
    test(
      'forceToLogin=true → return (re-entrancy guard)',
      () {
        service.userSessionDM = const UserSessionDM(
          user: UserDM(uuid: 'real-user-uuid'),
          token: 'token',
        );
        service.forceToLogin = true;

        expect(() => service.notifyTokenExpired(), returnsNormally,
            reason: 'forceToLogin=true bloquea re-entrancy aunque haya sesión');
        // Verificamos que NO se reseteó (el reset es postFrame, no se
        // dispara en este path).
        expect(service.forceToLogin, isTrue);
      },
    );
  });
}
