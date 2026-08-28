import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';

import 'user_scoped_cubit_fakes.dart';

/// Las DOS salidas de sesión tienen que limpiar lo mismo.
///
/// EL BUG. La app tiene dos formas de cerrar sesión y estaban divergidas:
///
///   - manual (`_tearDownSession`, el usuario toca "cerrar sesión") apagaba
///     favoritos, notificaciones, social, promociones cercanas Y el carrito de
///     orden grupal;
///   - automática (`clearInvalidSession`, el backend rechaza la sesión)
///     apagaba solo favoritos y notificaciones.
///
/// El carrito es un singleton en memoria, así que tras un cierre AUTOMÁTICO
/// sobrevivía. En una tablet compartida —un restaurante, el caso realista—
/// eso es la orden del usuario anterior, con su monto, esperando al siguiente
/// que entre. Es exactamente el bug que ya se arregló para el camino manual
/// (comentario "Bug e2e 2026-07-31" en `_tearDownSession`) y que había quedado
/// abierto por el otro lado; el arreglo de entonces no se aplicó acá porque
/// las dos rutas eran listas de llamadas copiadas a mano.
///
/// Ahora las dos pasan por `_clearUserScopedState`, y este test es lo que
/// impide que vuelvan a separarse.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthSessionService service;
  late ({
    FakeSocialCubit social,
    FakeNearbyPromotionsCubit promociones,
    FakeActiveGroupOrderCubit ordenActiva,
  }) cubits;

  setUp(() {
    cubits = registrarCubitsDeUsuario();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
    di.registerSingleton<Logger>(Logger(level: Level.off));

    service = AuthSessionService(
      config: _FakeBaseConfig(),
      meRepo: _FakeMeRepo(),
      localStorageService: LocalStorageService(),
      appApiProvider: _FakeApiProvider(),
      secureTokenService: _FakeSecureTokenService(),
    );
  });

  tearDown(() {
    desregistrarCubitsDeUsuario();
    if (di.isRegistered<Logger>()) di.unregister<Logger>();
  });

  test('el cierre automático apaga el carrito de orden grupal', () {
    service.clearInvalidSession();

    expect(cubits.ordenActiva.fueTerminado, isTrue,
        reason: 'el carrito sobrevive al cierre automático: en un dispositivo '
            'compartido, el siguiente usuario hereda la orden del anterior');
  });

  test('y también el resto del estado del usuario que se va', () {
    service.clearInvalidSession();

    expect(cubits.social.fueLimpiado, isTrue);
    expect(cubits.promociones.fueLimpiado, isTrue);
  });

  /// Llamarlo dos veces pasa de verdad: el interceptor puede desembocar acá
  /// desde varias requests en vuelo a la vez.
  test('llamarlo dos veces no rompe nada', () {
    service.clearInvalidSession();

    expect(service.clearInvalidSession, returnsNormally);
  });
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
  Future<void> clearAll() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeMeRepo implements MeRepo {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeBaseConfig implements BaseConfig {
  @override
  String get googleSignInClientId => 'test-client-id';

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
