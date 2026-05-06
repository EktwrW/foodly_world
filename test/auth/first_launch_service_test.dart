import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/first_launch_service.dart';
import 'package:foodly_world/core/services/secure_token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Fake manual de [SecureTokenService] — solo nos interesa contar cuántas
/// veces se llamó a [clearAll]. No usamos mocktail/mockito porque el repo
/// no tiene esa dependency en dev_dependencies (ver patrón de
/// app_features_repo_test.dart).
class _FakeSecureTokenService implements SecureTokenService {
  int clearAllCount = 0;

  @override
  Future<void> clearAll() async {
    clearAllCount++;
  }

  // Métodos no usados en estos tests pero requeridos por el contrato.
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
  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String tokenType = 'Bearer',
    String? tokenCreatedAt,
  }) async {}
}

/// Tests del [FirstLaunchService] — protegen el invariante de Bug F:
///
///   "En primera ejecución de un binario (post-install/reinstall)
///    limpiamos el Keychain residual antes de que cualquier consumidor
///    intente restaurar tokens."
///
/// Por qué importa: el iOS Keychain sobrevive al uninstall, así que sin
/// este servicio el flujo de bootstrap leía tokens viejos, los validaba
/// con el BE, recibía 401 y mostraba "tu sesión expiró" arriba de la
/// welcome screen — UX rota para una instalación que el usuario percibe
/// como nueva.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeSecureTokenService fakeSecure;
  late FirstLaunchService service;

  setUp(() {
    fakeSecure = _FakeSecureTokenService();
    service = FirstLaunchService(secureTokenService: fakeSecure);
  });

  group('FirstLaunchService', () {
    test(
      'primera ejecución (flag ausente) → limpia Keychain y persiste flag',
      () async {
        SharedPreferences.setMockInitialValues({});

        await service.ensureCleanInstall();

        expect(fakeSecure.clearAllCount, 1,
            reason: 'En primera ejecución debe limpiar el Keychain residual');

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('foodly_first_launch_done'), true,
            reason: 'El flag debe persistirse para que la próxima ejecución sea no-op');
      },
    );

    test(
      'segunda ejecución (flag=true) → NO limpia Keychain',
      () async {
        SharedPreferences.setMockInitialValues({'foodly_first_launch_done': true});

        await service.ensureCleanInstall();

        expect(fakeSecure.clearAllCount, 0,
            reason: 'Si ya corrió antes, NO debe limpiar — eso desautenticaría '
                'a usuarios legítimos en cada arranque');
      },
    );

    test(
      'flag explícitamente false (caso histórico improbable) → limpia',
      () async {
        // Defensivo: si en una migración futura alguien escribe el flag en
        // false en vez de borrarlo, igual debemos correr el clear.
        SharedPreferences.setMockInitialValues({'foodly_first_launch_done': false});

        await service.ensureCleanInstall();

        expect(fakeSecure.clearAllCount, 1);
      },
    );

    test(
      'idempotente — múltiples calls en la misma sesión solo limpian una vez',
      () async {
        SharedPreferences.setMockInitialValues({});

        await service.ensureCleanInstall();
        await service.ensureCleanInstall();
        await service.ensureCleanInstall();

        expect(fakeSecure.clearAllCount, 1,
            reason: 'Después de la primera el flag queda en true; '
                'las siguientes deben ser no-op aunque alguien las llame en loop');
      },
    );

    test(
      'falla silenciosamente si SecureTokenService throw (no propaga)',
      () async {
        SharedPreferences.setMockInitialValues({});
        final throwingFake = _ThrowingSecureTokenService();
        final throwingService = FirstLaunchService(secureTokenService: throwingFake);

        // No debe propagar — la consecuencia de fallar acá es el mismo bug
        // que arregla, pero crashear la app antes de la splash es peor.
        await expectLater(throwingService.ensureCleanInstall(), completes);
      },
    );
  });
}

class _ThrowingSecureTokenService extends _FakeSecureTokenService {
  @override
  Future<void> clearAll() async {
    throw Exception('Simulated keychain failure');
  }
}
