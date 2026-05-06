import 'package:foodly_world/core/services/secure_token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Detecta la primera ejecución de la app después de instalar (o reinstalar)
/// el binario y limpia residuos de tokens en el Keychain de iOS.
///
/// **Por qué existe esto.** Apple decidió hace años que las entradas del
/// Keychain sobreviven al uninstall por defecto — cuando el usuario borra
/// y vuelve a instalar la misma app, el Keychain queda intacto. Sin este
/// servicio, [SecureTokenService] lee tokens viejos en el primer arranque
/// post-reinstalación, [RootBloc.fromJson] cree que hay sesión, valida con
/// el BE → 401 → modal "sesión expirada" en lo que el usuario percibe como
/// una instalación nueva. Reproducible 1.5.4+41 (2026-05-06): borrar
/// memoria → desinstalar → reinstalar → abrir → modal de sesión expirada
/// arriba de la welcome screen.
///
/// **Cómo funciona.** SharedPreferences SÍ se borra al uninstall en iOS y
/// Android (vive en el container del app, no en Keychain). Si el flag
/// `foodly_first_launch_done` no existe, asumimos que estamos en una
/// instalación fresca y borramos el Keychain antes de que cualquier consumidor
/// (RootBloc, AuthSessionService.restoreTokensFromSecureStorage) intente
/// leer.
///
/// **Idempotencia.** Llamarlo varias veces es seguro: tras la primera
/// ejecución el flag queda en `true` y los siguientes arranques son no-op.
///
/// **Orden de invocación.** Debe correrse en `main()` ANTES de:
/// - `HydratedBloc.storage = await HydratedStorage.build(...)` — porque al
///   construirse RootBloc se llama `fromJson` y se dispara
///   `restoreTokensFromSecureStorage`.
/// - Cualquier `di<RootBloc>()` o construcción explícita de RootBloc.
class FirstLaunchService {
  /// Key persistida. NO renombrar — un cambio de nombre rompería la
  /// detección para usuarios que ya tienen el flag actual y dispararía el
  /// clear del Keychain en su próximo arranque (= logout silencioso para
  /// todos los users existentes).
  static const _kFirstLaunchKey = 'foodly_first_launch_done';

  final SecureTokenService _secureTokenService;

  FirstLaunchService({required SecureTokenService secureTokenService})
      : _secureTokenService = secureTokenService;

  /// Si es la primera ejecución del binario actual, borra cualquier token
  /// residual del Keychain y persiste el flag para que las siguientes
  /// ejecuciones sean no-op.
  ///
  /// No throws — falla silenciosamente. La consecuencia de un fallo aquí
  /// (ej. SharedPreferences indisponible) sería el mismo bug que arregla,
  /// no algo peor; ergo no tiene sentido propagar la excepción y crashear
  /// la app antes incluso de mostrar la splash screen.
  Future<void> ensureCleanInstall() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final alreadyRan = prefs.getBool(_kFirstLaunchKey) ?? false;
      if (alreadyRan) return;

      // Fresh install — wipe Keychain residue antes de que nadie intente
      // leer.  Awaitamos para garantizar que el clear haya terminado antes
      // de que RootBloc.fromJson dispare restoreTokensFromSecureStorage.
      await _secureTokenService.clearAll();
      await prefs.setBool(_kFirstLaunchKey, true);
    } catch (_) {
      // No-op por diseño. Ver docblock arriba.
    }
  }
}
