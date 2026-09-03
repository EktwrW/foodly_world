import 'dart:async';

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/blocs/location/location_bloc.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/places_proxy/places_proxy_repo.dart';
import 'package:foodly_world/data_models/app_config/app_features_dm.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_reverse_request_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';
import 'package:logger/logger.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Tests del flujo `LocationBloc.determinePosition()` — la columna vertebral
/// del onboarding de la app post-login. Cubrimos cada punto donde un await
/// puede colgarse y validamos que SIEMPRE se emite un estado terminal,
/// porque el `FoodlyLocationWrapper` y los cubits downstream
/// (`NearbyPromotionsCubit`, `NewReleasesCubit`) NO se disparan hasta ese
/// terminal — y si el bloc se queda en `_CheckingLocation` para siempre,
/// la home queda con shimmer infinito sin retry.
///
/// **Bug histórico que motivó esta batería** (2026-05-09 en un Razr 50 Ultra
/// con MyUX/Hello UI de Motorola): `Geolocator.requestPermission()` se
/// quedó esperando un dialog que el sistema NUNCA mostró. Crashlytics no
/// detectó nada (no es crash ni ANR — el await es async y la UI thread
/// estaba libre). El user vio "cargando ubicación" eternamente y tuvo que
/// matar la app. El fix fue agregar un watchdog de 90 s sobre
/// `requestPermission()` con fallback a `LocationPermission.denied` para
/// que la UI muestre el dialog de retry.
///
/// Los tests usan `requestPermissionTimeout: 200 ms` (inyectado por
/// constructor solo para tests) en lugar de los 90 s de prod, así corren
/// en milisegundos y no se vuelven flaky por timing real.
///
/// **Notación:** los tipos generados por Freezed (`_CheckingLocation`,
/// `_ServiceDisabled`, etc.) son privados al library de `location_bloc.dart`.
/// Por eso los asserts usan `state.maybeWhen(...)` en lugar de `is _Foo` —
/// es la API pública de Freezed para discriminar variantes.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeGeolocatorPlatform fakeGeolocator;
  late _FakePlacesProxyRepo fakeProxy;
  late _FakeAppFeaturesRepo fakeFeatures;
  late _FakeBaseConfig fakeConfig;
  late Logger silentLogger;

  // Inicializa S (intl_utils generated) UNA vez para toda la suite. El bloc
  // usa `S.current.locationServicesDisabled`, `locationPermissionDenied`, etc.
  // dentro de `determinePosition`. Sin esta carga, el `assert(_current != null)`
  // de S.current explota apenas el bloc intenta emitir un terminal con mensaje.
  setUpAll(() async {
    await S.load(const Locale('en'));
  });

  setUp(() {
    fakeGeolocator = _FakeGeolocatorPlatform();
    GeolocatorPlatform.instance = fakeGeolocator;

    fakeProxy = _FakePlacesProxyRepo();
    fakeFeatures = _FakeAppFeaturesRepo();
    fakeConfig = _FakeBaseConfig();
    silentLogger = Logger(level: Level.off);
  });

  // ─── Helpers ───────────────────────────────────────────────────────────

  LocationBloc buildBloc({
    Duration requestPermissionTimeout = const Duration(milliseconds: 200),
  }) {
    return LocationBloc(
      fakeConfig,
      silentLogger,
      fakeProxy,
      fakeFeatures,
      requestPermissionTimeout: requestPermissionTimeout,
    );
  }

  /// Dispara `LocationEvent.checkLocation()` y devuelve TODAS las emisiones
  /// hasta que se observe un estado terminal distinto de `checkingLocation`
  /// e `initial`. Si no aparece terminal en [timeout], devuelve igual lo
  /// emitido hasta el momento — los asserts de "any matches X" detectarán
  /// el cuelgue.
  Future<List<LocationState>> runCheckLocationFlow(
    LocationBloc bloc, {
    Duration timeout = const Duration(seconds: 2),
  }) async {
    final emitted = <LocationState>[];
    final sub = bloc.stream.listen(emitted.add);

    bloc.add(const LocationEvent.checkLocation());

    try {
      await bloc.stream
          .firstWhere(
            (s) => s.maybeWhen(
              checkingLocation: () => false,
              initial: () => false,
              orElse: () => true,
            ),
          )
          .timeout(timeout);
    } on TimeoutException {
      // No-op: el test que llama va a expectar la presencia/ausencia de
      // estados específicos. Si nunca llegó terminal, el any() falla con
      // el reason del expect.
    }

    // Pequeño settle para capturar microtasks pendientes (los emits con
    // `Future.microtask(() => emit(...))` y el finally del bloc).
    await Future<void>.delayed(const Duration(milliseconds: 30));

    await sub.cancel();
    return emitted;
  }

  /// Predicados para discriminar variantes sin acceso a tipos privados.
  bool isServiceDisabled(LocationState s) =>
      s.maybeWhen(serviceDisabled: (_) => true, orElse: () => false);
  bool isPermissionDenied(LocationState s) =>
      s.maybeWhen(permissionDenied: (_) => true, orElse: () => false);
  bool isPermissionPermanentlyDenied(LocationState s) =>
      s.maybeWhen(permissionPermanentlyDenied: (_) => true, orElse: () => false);
  bool isLocationChecked(LocationState s) =>
      s.maybeWhen(locationChecked: (_) => true, orElse: () => false);
  bool isCheckingLocation(LocationState s) =>
      s.maybeWhen(checkingLocation: () => true, orElse: () => false);

  LocationDetailsDM extractCheckedDM(LocationState s) =>
      s.maybeWhen(locationChecked: (dm) => dm, orElse: () => const LocationDetailsDM());

  // ─── Tests ─────────────────────────────────────────────────────────────

  group('determinePosition — escenarios felices', () {
    test('1. service disabled → emite [CheckingLocation, ServiceDisabled]', () async {
      fakeGeolocator
        ..serviceEnabled = false
        ..permission = LocationPermission.whileInUse;

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      expect(emitted.any(isCheckingLocation), true,
          reason: 'Debe emitir checkingLocation primero');
      expect(emitted.any(isServiceDisabled), true,
          reason: 'Sin GPS, debe emitir ServiceDisabled — no LocationChecked');
      expect(emitted.any(isLocationChecked), false,
          reason: 'No debe avanzar al flow normal si el service está disabled');

      await bloc.close();
    });

    test('2. service ON + permission whileInUse + position OK → emite LocationChecked con position', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..nextPosition = _samplePosition();

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      final checked = emitted.firstWhere(isLocationChecked);
      expect(extractCheckedDM(checked).position, isNotNull);
      expect(extractCheckedDM(checked).position!.latitude, closeTo(40.2791, 0.001));

      await bloc.close();
    });
  });

  group('determinePosition — flow de permisos', () {
    test('3. permission inicial denied + requestPermission denied → emite PermissionDenied', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.denied
        ..nextRequestedPermission = LocationPermission.denied;

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      expect(emitted.any(isPermissionDenied), true);
      expect(emitted.any(isLocationChecked), false);

      await bloc.close();
    });

    test(
      '4. permission inicial denied + requestPermission COLGADO → watchdog dispara y emite PermissionDenied (regresión Razr 50 Ultra 2026-05-09)',
      () async {
        // El bug original: el sistema nunca muestra el dialog y
        // `requestPermission()` queda esperando para siempre. Sin el
        // watchdog, este test se cuelga. Con el watchdog (200 ms en
        // tests, 90 s en prod), el bloc cae al fallback `denied` y emite
        // `PermissionDenied` — la UI puede mostrar el retry.
        fakeGeolocator
          ..serviceEnabled = true
          ..permission = LocationPermission.denied
          ..hangRequestPermission = true;

        final bloc = buildBloc();
        final emitted = await runCheckLocationFlow(
          bloc,
          timeout: const Duration(milliseconds: 800),
        );

        expect(emitted.any(isPermissionDenied), true,
            reason: 'Watchdog debe destrabar el bloc cuando requestPermission no responde. '
                'Sin esto la app queda con shimmer eterno (bug Razr 50 Ultra).');
        expect(emitted.any(isCheckingLocation), true);

        await bloc.close();
      },
    );

    test('5. permission deniedForever → emite PermissionPermanentlyDenied (sin pedir requestPermission)', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.deniedForever;

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      expect(emitted.any(isPermissionPermanentlyDenied), true);
      expect(fakeGeolocator.requestPermissionCalls, 0,
          reason: 'Si ya está deniedForever, NO debe llamar a requestPermission '
              '(el sistema lo rechazaría sin mostrar dialog igual)');

      await bloc.close();
    });

    test('6. permission inicial denied + requestPermission whileInUse → flow continúa hasta LocationChecked', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.denied
        ..nextRequestedPermission = LocationPermission.whileInUse
        ..nextPosition = _samplePosition();

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      expect(emitted.any(isLocationChecked), true);
      expect(emitted.any(isPermissionDenied), false);

      await bloc.close();
    });
  });

  group('determinePosition — fallbacks de posición', () {
    test('7. getCurrentPosition timeout → fallback a getLastKnownPosition', () async {
      final lastKnown = _samplePosition(latitude: 38.7169);
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..currentPositionThrows = TimeoutException('simulated current timeout')
        // Solo la PRIMERA llamada devuelve algo: si el bloc perdiera el atajo
        // `provisional != null` y volviera a pedirla, recibiría null y el test
        // fallaría. Así distingue el atajo del re-fetch.
        ..lastKnownSequence = [lastKnown];

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      final checked = emitted.where(isLocationChecked).last;
      expect(extractCheckedDM(checked).position?.latitude, closeTo(38.7169, 0.001),
          reason: 'Cuando getCurrentPosition timeoutea, debe usar la position de getLastKnownPosition');

      await bloc.close();
    });

    test('8. getCurrentPosition timeout + getLastKnownPosition null → emite LocationChecked con position null (no se cuelga)', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..currentPositionThrows = TimeoutException('simulated current timeout')
        ..nextLastKnownPosition = null;

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);

      // Invariante crítica: SIEMPRE se emite terminal — incluso sin
      // position. Downstream (UI) maneja position=null elegantemente.
      // Lo que nunca puede pasar es quedarse en _CheckingLocation.
      final checked = emitted.firstWhere(isLocationChecked);
      expect(extractCheckedDM(checked).position, isNull);

      await bloc.close();
    });
  });

  group('determinePosition — timeouts de IPC al location manager', () {
    test('9. isLocationServiceEnabled timeout (3 s hardcoded) → asume disabled y emite ServiceDisabled', () async {
      fakeGeolocator
        ..isLocationServiceEnabledHangsForever = true
        ..permission = LocationPermission.whileInUse;

      final bloc = buildBloc();
      // El timeout interno del bloc para isLocationServiceEnabled es 3 s
      // hardcoded — esperamos un poco más para que caiga al fallback
      // "asume false" → emite ServiceDisabled.
      final emitted = await runCheckLocationFlow(
        bloc,
        timeout: const Duration(seconds: 4),
      );

      expect(emitted.any(isServiceDisabled), true,
          reason: 'Cuando el IPC al location manager se cuelga, '
              'el bloc asume service=false y emite ServiceDisabled — '
              'no debe quedarse esperando.');

      await bloc.close();
    }, timeout: const Timeout(Duration(seconds: 8)));

    test('10. checkPermission timeout (3 s hardcoded) → asume denied y dispara requestPermission', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..checkPermissionHangsForever = true
        ..nextRequestedPermission = LocationPermission.denied;

      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(
        bloc,
        timeout: const Duration(seconds: 5),
      );

      expect(fakeGeolocator.requestPermissionCalls, greaterThan(0),
          reason: 'Tras timeout de checkPermission, debe asumir denied y disparar requestPermission');
      expect(emitted.any(isPermissionDenied), true);

      await bloc.close();
    }, timeout: const Timeout(Duration(seconds: 8)));
  });

  group('eventos', () {
    test('12. con última posición conocida, emite ANTES con ella y DESPUÉS con el fix preciso', () async {
      final lastKnown = _samplePosition(latitude: 38.7169);
      final fresh = _samplePosition(); // 40.2791, la de por defecto
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..nextLastKnownPosition = lastKnown
        ..nextPosition = fresh;
      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);
      final checked = emitted.where(isLocationChecked).toList();
      expect(checked, hasLength(2), reason: 'provisional + definitiva');
      expect(extractCheckedDM(checked.first).position?.latitude, closeTo(38.7169, 0.001),
          reason: 'la primera emisión es la última conocida, sin esperar al fix');
      expect(extractCheckedDM(checked.last).position?.latitude, closeTo(40.2791, 0.001),
          reason: 'la última emisión lleva el fix preciso');
      await bloc.close();
    });

    test('13. sin última posición conocida sigue habiendo UNA sola emisión con el fix', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..nextPosition = _samplePosition();
      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);
      expect(emitted.where(isLocationChecked).toList(), hasLength(1));
      await bloc.close();
    });

    test('7b. sin provisional y con el fix caído, el fallback a la última conocida sigue funcionando', () async {
      final lastKnown = _samplePosition(latitude: 38.7169);
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..currentPositionThrows = TimeoutException('simulated current timeout')
        ..lastKnownSequence = [null, lastKnown]; // 1.ª (provisional): nada; 2.ª (fallback): la última conocida
      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);
      final checked = emitted.where(isLocationChecked).toList();
      expect(checked, hasLength(1), reason: 'sin provisional solo emite al final');
      expect(extractCheckedDM(checked.single).position?.latitude, closeTo(38.7169, 0.001));
      await bloc.close();
    });

    test('14. una última conocida de hace más de una hora se descarta: una sola emisión con el fix', () async {
      fakeGeolocator
        ..serviceEnabled = true
        ..permission = LocationPermission.whileInUse
        ..nextLastKnownPosition = _samplePosition(latitude: 38.7169, timestamp: DateTime.now().subtract(const Duration(hours: 3)))
        ..nextPosition = _samplePosition();
      final bloc = buildBloc();
      final emitted = await runCheckLocationFlow(bloc);
      final checked = emitted.where(isLocationChecked).toList();
      expect(checked, hasLength(1));
      expect(extractCheckedDM(checked.single).position?.latitude, closeTo(40.2791, 0.001));
      await bloc.close();
    });

    test('11. setManualLocation → emite LocationChecked con el DM exacto', () async {
      final bloc = buildBloc();

      final emitted = <LocationState>[];
      final sub = bloc.stream.listen(emitted.add);

      const manual = LocationDetailsDM(
        country: 'Argentina',
        countryCode: 'AR',
        city: 'CABA',
      );
      bloc.add(const LocationEvent.setManualLocation(manual));

      await Future<void>.delayed(const Duration(milliseconds: 50));

      final checked = emitted.firstWhere(isLocationChecked);
      expect(extractCheckedDM(checked), manual);

      await sub.cancel();
      await bloc.close();
    });
  });
}

// ───────────────────────────── Helpers / Fakes ─────────────────────────────

Position _samplePosition({double latitude = 40.2791, double longitude = -7.5063, DateTime? timestamp}) {
  return Position(
    latitude: latitude,
    longitude: longitude,
    timestamp: timestamp ?? DateTime.now(), // reciente: la provisional caduca a la hora
    accuracy: 5.0,
    altitude: 500.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
  );
}

/// Mock manual del [GeolocatorPlatform] usando [MockPlatformInterfaceMixin]
/// (pattern oficial de Flutter para platform interfaces). Sin `mocktail` —
/// no está en pubspec; el patrón de fakes manuales es la convención del
/// proyecto (ver `_FakeApiProvider` en `test/auth/auth_session_recovery_test.dart`).
///
/// Los flags se setean ANTES de construir el bloc en cada test.
class _FakeGeolocatorPlatform extends GeolocatorPlatform with MockPlatformInterfaceMixin {
  // Inputs configurables.
  bool serviceEnabled = true;
  bool isLocationServiceEnabledHangsForever = false;
  LocationPermission permission = LocationPermission.whileInUse;
  bool checkPermissionHangsForever = false;
  LocationPermission nextRequestedPermission = LocationPermission.whileInUse;
  bool hangRequestPermission = false;
  Position? nextPosition;
  Position? nextLastKnownPosition;
  Object? currentPositionThrows;

  // Counters.
  int requestPermissionCalls = 0;

  @override
  Future<bool> isLocationServiceEnabled() async {
    if (isLocationServiceEnabledHangsForever) {
      return Completer<bool>().future;
    }
    return serviceEnabled;
  }

  @override
  Future<LocationPermission> checkPermission() async {
    if (checkPermissionHangsForever) {
      return Completer<LocationPermission>().future;
    }
    return permission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    requestPermissionCalls++;
    if (hangRequestPermission) {
      return Completer<LocationPermission>().future;
    }
    return nextRequestedPermission;
  }

  @override
  Future<Position> getCurrentPosition({LocationSettings? locationSettings}) async {
    if (currentPositionThrows != null) {
      throw currentPositionThrows!;
    }
    if (nextPosition == null) {
      throw StateError('test did not configure nextPosition');
    }
    return nextPosition!;
  }

  /// Si se define, cada llamada consume el siguiente valor; si no, siempre
  /// `nextLastKnownPosition`.
  List<Position?>? lastKnownSequence;

  @override
  Future<Position?> getLastKnownPosition({bool forceLocationManager = false}) async {
    final seq = lastKnownSequence;
    if (seq != null && seq.isNotEmpty) return seq.removeAt(0);
    return nextLastKnownPosition;
  }
}

/// Fake del repo del Places Proxy. Por default retorna ZERO_RESULTS — que
/// es éxito sin actualizar el DM. El reverse-geocoding ya está testeado
/// en `test/places_proxy/location_bloc_reverse_geocoding_test.dart`, acá
/// solo nos importa que el repo no tire excepciones que rompan el flow.
class _FakePlacesProxyRepo implements PlacesProxyRepo {
  ApiResult<GeocodingResponseDM> reverseOutcome = ApiResult.success(
    GeocodingResponseDM.fromJson({'status': 'ZERO_RESULTS', 'results': <dynamic>[]}),
  );

  @override
  Future<ApiResult<GeocodingResponseDM>> reverse(
    GeocodingReverseRequestDTO body, {
    Duration timeout = const Duration(seconds: 6),
  }) async {
    return reverseOutcome;
  }

  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Fake del repo de feature flags. Por default `placesProxyEnabled=true`,
/// que es el path principal post-Fase 5 del Places Proxy.
class _FakeAppFeaturesRepo implements AppFeaturesRepo {
  AppFeaturesDM cached = const AppFeaturesDM();

  @override
  AppFeaturesDM get cachedOrDefaults => cached;

  @override
  noSuchMethod(Invocation invocation) => null;
}

/// Fake mínimo del [BaseConfig]. El bloc solo lee `googlePlacesBaseUrl` y
/// `googleDefaultApiKey` en el path legacy (`placesProxyEnabled=false`),
/// que estos tests NO ejercitan — el path principal va por el proxy.
class _FakeBaseConfig implements BaseConfig {
  @override
  String get googlePlacesBaseUrl => 'https://example.test/';

  @override
  String get googleDefaultApiKey => 'fake-key';

  @override
  noSuchMethod(Invocation invocation) => null;
}
