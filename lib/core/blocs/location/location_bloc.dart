import 'dart:async' show TimeoutException;

import 'package:dio/dio.dart';

import 'package:foodly_world/core/core_exports.dart' show BaseConfig, Bloc, Emitter, FoodlyStrings, Logger, S;
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/network/places_proxy/places_proxy_repo.dart';

import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_reverse_request_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart' show Intl;

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationDetailsDM _locationDM;

  /// HTTP client usado para el reverse-geocoding DIRECTO contra Google
  /// Places Geocoding API — modo legacy (flag `placesProxyEnabled = false`).
  ///
  /// Desde Fase 4 (Places Proxy) el path primario es el backend proxy vía
  /// [_placesProxyRepo]. Este Dio queda como **fallback controlado por
  /// flag** y se eliminará en Fase 6 junto con `BaseConfig.googlePlacesBaseUrl`
  /// / `googleDefaultApiKey` y el package `nova_places_api`.
  ///
  /// NO reutilizamos el Dio de la API de Foodly porque ése tiene
  /// interceptors de auth / base URL que no aplican para una llamada a
  /// *.googleapis.com.
  ///
  /// Los timeouts son CRÍTICOS: antes de configurarlos, si el request a
  /// Places quedaba colgado (típicamente por degradación de red: transición
  /// wifi↔4G, DNS lento, operador saturado), el `await dio.get` nunca tiraba
  /// excepción y el bloc se quedaba en `_CheckingLocation` indefinidamente,
  /// dejando el botón de current location atrapado en "Verificando
  /// ubicación..." hasta que el usuario mataba la app. Reproducido en prod
  /// 2026-04 sobre 1.4.x. 6 s es largo para un fallback degradado elegante
  /// (sin ciudad/dirección) y corto para que la UI no se sienta muerta.
  ///
  /// El path nuevo (vía proxy) preserva el MISMO contrato de 6 s pero vía
  /// `Options(sendTimeout, receiveTimeout)` per-request en
  /// [PlacesProxyRepo.reverse] — Dio cancela la conexión TCP real cuando
  /// vence, a diferencia de un `Future.any` que sólo canceleaba el Future
  /// local y dejaba la request viva en background. La lógica del timeout
  /// vive ahora en el repo, donde corresponde; el bloc ya no la duplica.
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 6),
    sendTimeout: const Duration(seconds: 6),
  ));

  final BaseConfig _baseConfig;
  final Logger _logger;
  final PlacesProxyRepo _placesProxyRepo;
  final AppFeaturesRepo _appFeaturesRepo;

  String get _placesBaseUrl => _baseConfig.googlePlacesBaseUrl;
  String get _apiKey => _baseConfig.googleDefaultApiKey;
  double get _latitude => _locationDM.position?.latitude ?? 0.0;
  double get _longitude => _locationDM.position?.longitude ?? 0.0;

  /// Idioma ISO 639-1 (2 letras) del usuario, para pasarlo al reverse-geocoding.
  ///
  /// Mismo patrón que `AuthSessionService.lang` y `datetime_extension` —
  /// `Intl.getCurrentLocale()` devuelve algo como `"es_AR"` / `"pt_PT"` /
  /// `"en_US"`, y Google acepta sólo los 2 primeros caracteres (`"es"`,
  /// `"pt"`, `"en"`) como sesgo de idioma de los componentes.
  ///
  /// **Por qué importa:** sin este parámetro, Google devuelve los
  /// `long_name` en el idioma que infiera de las coords (p.ej. portugués
  /// para un business en Lisboa), lo cual genera UI inconsistente —
  /// "Covilhã / Castelo Branco / Portugal" mezclado con strings en ES de
  /// la app para usuarios con locale `es_AR`. Pasar `language` hace que
  /// Google traduzca los componentes al idioma del usuario cuando existe
  /// traducción oficial.
  String get _currentLanguageCode => Intl.getCurrentLocale().substring(0, 2);

  LocationBloc(
    BaseConfig baseConfig,
    Logger logger,
    PlacesProxyRepo placesProxyRepo,
    AppFeaturesRepo appFeaturesRepo,
  )   : _baseConfig = baseConfig,
        _logger = logger,
        _placesProxyRepo = placesProxyRepo,
        _appFeaturesRepo = appFeaturesRepo,
        _locationDM = const LocationDetailsDM(),
        super(const _Initial()) {
    on<LocationEvent>((event, emit) async {
      await event.map(
        checkLocation: (event) async => await determinePosition(emit),
        setManualLocation: (event) async {
          _locationDM = event.locationDM;
          emit(_LocationChecked(_locationDM));
        },
      );
    });
  }

  Future<void> checkLocationServiceEnabled() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    _locationDM = _locationDM.copyWith(serviceEnabled: isEnabled);
  }

  /// Determina la posición del usuario y emite el estado terminal
  /// correspondiente. Contrato invariante: **SIEMPRE** se emite un estado
  /// terminal distinto de `_CheckingLocation` (o `_ServiceDisabled`,
  /// `_PermissionDenied`, `_PermissionPermanentlyDenied`, o `_LocationChecked`),
  /// porque el botón `CurrentLocationButton` y todos los cubits downstream
  /// dependen de esa transición para salir del spinner "Verificando ubicación...".
  ///
  /// Defensas multicapa contra cuelgues:
  ///  1. Dio con timeouts de 6 s (ver constructor) — cubre el caso donde el
  ///     reverse-geocoding de Places nunca responde.
  ///  2. `timeLimit: 10 s` en `LocationSettings` — timeout nativo del plugin.
  ///  3. Backup Dart-side `Future.any` con 12 s — cubre dispositivos donde el
  ///     timeLimit nativo no se propaga (bug conocido en Huawei/Xiaomi MIUI
  ///     con Play Services desactualizado).
  ///  4. `try / finally` con flag `terminalStateEmitted` — garantiza que si
  ///     cualquier `await` dentro del try lanza algo no previsto, el finally
  ///     emite `_LocationChecked` con lo que tengamos para que la UI se
  ///     destrabe.
  Future<void> determinePosition(Emitter<LocationState> emit) async {
    emit(const _CheckingLocation());

    // true cuando ya emitimos un terminal específico (ServiceDisabled /
    // PermissionDenied / PermissionPermanentlyDenied). El finally mira este
    // flag para NO pisar ese terminal con _LocationChecked.
    bool terminalStateEmitted = false;

    try {
      await checkLocationServiceEnabled();

      if (!_locationDM.serviceEnabled) {
        emit(_ServiceDisabled(S.current.locationServicesDisabled));
        terminalStateEmitted = true;
        return;
      }

      final permission = await Geolocator.checkPermission();
      _locationDM = _locationDM.copyWith(permission: permission);

      if (_locationDM.permission == LocationPermission.denied) {
        final newPermission = await Geolocator.requestPermission();
        _locationDM = _locationDM.copyWith(permission: newPermission);

        if (_locationDM.permission == LocationPermission.denied) {
          await Future.microtask(() => emit(_PermissionDenied(S.current.locationPermissionDenied)));
          terminalStateEmitted = true;
          return;
        }
      }

      if (_locationDM.permission == LocationPermission.deniedForever) {
        await Future.microtask(() => emit(_PermissionPermanentlyDenied(S.current.locationPermissionPermanentlyDenied)));
        terminalStateEmitted = true;
        return;
      }

      // Estrategia: fix rápido con timeLimit de 10 s; si expira o falla,
      // fallback a lastKnownPosition. Si AMBOS fallan, emitimos con position
      // null y downstream (cubits + UI) maneja "sin ubicación" elegantemente.
      //
      // Future.any con Future.delayed(12s) = belt-and-suspenders sobre el
      // timeLimit nativo por si el plugin no lo propaga al isolate Dart.
      Position? currentPosition;
      try {
        currentPosition = await Future.any<Position?>([
          Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
              timeLimit: Duration(seconds: 10),
            ),
          ),
          Future<Position?>.delayed(const Duration(seconds: 12))
              .then((_) => throw TimeoutException('getCurrentPosition Dart-side fallback (12 s)')),
        ]);
      } catch (e) {
        _logger.w('Geolocator.getCurrentPosition timed out / failed: $e — falling back to lastKnownPosition');
        try {
          currentPosition = await Geolocator.getLastKnownPosition();
        } catch (e2) {
          _logger.e('Geolocator.getLastKnownPosition also failed: $e2');
        }
      }
      _locationDM = _locationDM.copyWith(position: currentPosition);

      if (_locationDM.position != null) await getLocationDetailsFromCoordinates();
    } finally {
      // Garantía de salida del estado _CheckingLocation. Si llegamos acá por
      // un return temprano con terminalStateEmitted=true, no pisamos ese
      // terminal. Si llegamos por una excepción no capturada en el try, o
      // por el flujo feliz, emitimos _LocationChecked con lo que tengamos
      // (posición real, lastKnown, o null). `emit.isDone` protege contra el
      // caso donde el bloc se cerró mid-flight (no pasa hoy — el bloc vive
      // lo que vive el proceso — pero es barato blindarlo).
      if (!terminalStateEmitted && !emit.isDone) {
        emit(_LocationChecked(_locationDM));
      }
    }
  }

  /// Reverse-geocodifica `_latitude,_longitude` y actualiza `_locationDM`
  /// con country/state/city/address/zipCode.
  ///
  /// **Ramificación por flag** (Fase 4, Places Proxy):
  /// - `placesProxyEnabled == true` (default y objetivo post-Fase 5) → va
  ///   al backend proxy vía [PlacesProxyRepo.reverse]. La API key no sale
  ///   del cliente y la respuesta viene parseada como [GeocodingResponseDM].
  /// - `placesProxyEnabled == false` (kill-switch backend) → llama directo
  ///   a Google Places Geocoding con la key del cliente. Path legacy que
  ///   eliminaremos en Fase 6.
  ///
  /// El flag se lee del cache in-memory del [AppFeaturesRepo]
  /// ([`cachedOrDefaults`]) — sin I/O. Si todavía no se fetcheó, el default
  /// es `true` (proxy activo).
  ///
  /// **No tira excepciones.** Cualquier error (timeout, HTTP error, status
  /// distinto de OK) se loggea y `_locationDM` queda sin cambios. El caller
  /// ([determinePosition]) siempre puede emitir `_LocationChecked` con lo
  /// que tengamos gracias al `try/finally` que lo envuelve.
  ///
  /// **No hay fallback-on-failure entre paths.** Si el flag está ON y el
  /// proxy falla, NO caemos al path legacy automáticamente. Razón: Fase 5
  /// va a remover la key cliente de la build, y si acá nos apoyamos en ella
  /// "por si falla el proxy", la key no se puede sacar nunca. Que falle
  /// ruidoso (log + `_locationDM` sin cambios) es preferible a un fallback
  /// silencioso que esconde regresiones del proxy.
  Future<void> getLocationDetailsFromCoordinates() async {
    final useProxy = _appFeaturesRepo.cachedOrDefaults.placesProxyEnabled;
    if (useProxy) {
      await _reverseViaProxy();
    } else {
      await _reverseViaLegacyDirect();
    }
  }

  /// Path nuevo (Fase 4+): backend proxy.
  ///
  /// **Timeouts:** el `PlacesProxyRepo.reverse` aplica `sendTimeout` +
  /// `receiveTimeout` de 6s vía `Options(...)` per-request — Dio cancela
  /// la conexión TCP subyacente cuando vencen y devuelve un
  /// `DioException` que el repo convierte en `ApiResult.failure`. Esto
  /// reemplaza el `Future.any` race que vivía acá antes y es estrictamente
  /// mejor: antes, cuando vencía la race, el Future Dart se cancelaba
  /// pero la request HTTP seguía viva consumiendo batería y una conexión
  /// del pool; ahora Dio cierra todo. Ver docblock de [dio] y del repo
  /// para el contexto del bug 2026-04 que originó los 6s.
  ///
  /// **language:** se pasa el locale del usuario (ISO 639-1 de 2 letras)
  /// para que Google traduzca los `long_name` al idioma de la app. Ver
  /// [_currentLanguageCode] para la justificación de UX.
  ///
  /// **region:** se deja `null` deliberadamente. Google biasea resultados
  /// al TLD del país; con coordenadas concretas, el bias no agrega valor
  /// y pasar un código erróneo (p.ej. `US` por default de `LocationService`
  /// antes de que haya data) podría sesgar nombres de zonas fronterizas.
  Future<void> _reverseViaProxy() async {
    try {
      final result = await _placesProxyRepo.reverse(
        GeocodingReverseRequestDTO(
          lat: _latitude,
          lng: _longitude,
          language: _currentLanguageCode,
        ),
      );

      result.when(
        success: (response) {
          // `zeroResults` es un success sin datos útiles (coords en medio
          // del océano, Antártida sin cobertura, etc.). No es error — no
          // actualizamos el DM y que la UI muestre lo que haya (mismo
          // comportamiento que el path legacy cuando `results` vuelve
          // vacío).
          if (!response.status.isOk) {
            _logger.w('PlacesProxy.reverse status=${response.status.name}');
            return;
          }
          _locationDM = applyReverseGeocodingToLocation(response, _locationDM);
        },
        failure: (error) {
          // Incluye timeouts (DioExceptionType.sendTimeout/receiveTimeout),
          // 429 throttle, 502 upstream, y cualquier error de red. No
          // reintentamos: la red está degradada y un retry solo empeora
          // la latencia percibida. El caller (`determinePosition`) igual
          // emite `_LocationChecked` con lo que tengamos, vía el finally.
          _logger.e('PlacesProxy.reverse failed: ${error.error}');
        },
      );
    } catch (e) {
      // Safety-net por si algún throw inesperado se cuela (el repo ya
      // debería haberlo envuelto en `ApiResult.failure`, pero el contrato
      // de este método es no-throw — ver docblock de
      // [getLocationDetailsFromCoordinates]).
      _logger.e('PlacesProxy.reverse threw: $e');
    }
  }

  /// Path legacy: llamada directa a Google con la key del cliente.
  /// Se mantiene mientras el flag exista (kill-switch). A eliminar en
  /// Fase 6 junto con `nova_places_api`, `BaseConfig.googlePlacesBaseUrl`
  /// y `BaseConfig.googleDefaultApiKey`.
  Future<void> _reverseViaLegacyDirect() async {
    final url = '$_placesBaseUrl$_latitude,$_longitude&key=$_apiKey';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final results = response.data['results'] as List;

        if (results.isNotEmpty) {
          // Google Maps puede retornar múltiples resultados; normalmente, el primero es el más relevante
          final addressComponents = results[0][FoodlyStrings.ADDRESS_COMPONENTS] as List;

          for (final component in addressComponents) {
            final types = component[FoodlyStrings.TYPES] as List;
            if (types.contains(FoodlyStrings.COUNTRY)) {
              _locationDM = _locationDM.copyWith(
                  country: component[FoodlyStrings.LONG_NAME], countryCode: component[FoodlyStrings.SHORT_NAME]);
            }
            if (types.contains(FoodlyStrings.ADMIN_AREA_LEVEL_1)) {
              _locationDM = _locationDM.copyWith(state: component[FoodlyStrings.LONG_NAME]);
            }
            if (types.contains(FoodlyStrings.LOCALITY)) {
              _locationDM = _locationDM.copyWith(city: component[FoodlyStrings.LONG_NAME]);
            }
            if (types.contains(FoodlyStrings.ROUTE)) {
              _locationDM = _locationDM.copyWith(address: component[FoodlyStrings.LONG_NAME]);
            }
            if (types.contains(FoodlyStrings.POSTAL_CODE)) {
              _locationDM = _locationDM.copyWith(zipCode: component[FoodlyStrings.LONG_NAME]);
            }
          }
        }
      }
    } catch (e) {
      _logger.e('Error getting location data: $e');
    }
  }
}

/// Merge de address components del reverse-geocoding sobre el [base].
///
/// Top-level + `@visibleForTesting` — no método privado del bloc — para
/// poder testear el mapping en aislamiento sin instanciar `LocationBloc`
/// (que arrastra Geolocator + Dio + BaseConfig).
///
/// Replica el comportamiento del path legacy pero sobre DMs tipados en
/// lugar de `Map<String, dynamic>`. Campos actualizados cuando aparece el
/// componente con ese tipo:
/// - `country` / `countryCode` ← `country` (long_name + short_name)
/// - `state` ← `administrative_area_level_1`
/// - `city` ← `locality`
/// - `address` ← `route`
/// - `zipCode` ← `postal_code`
///
/// Cualquier componente con tipos fuera de esta lista se ignora. Si
/// `results` viene vacío, devuelve el [base] sin cambios.
///
/// Contrato de preservación: los campos de [LocationDetailsDM] que NO
/// maneja el reverse-geocoding (`position`, `permission`, `serviceEnabled`)
/// se mantienen del [base] — vienen del Geolocator flow, no de Google.
@visibleForTesting
LocationDetailsDM applyReverseGeocodingToLocation(
  GeocodingResponseDM response,
  LocationDetailsDM base,
) {
  if (response.results.isEmpty) return base;
  var updated = base;
  for (final component in response.results.first.addressComponents) {
    final types = component.types;
    if (types.contains('country')) {
      updated = updated.copyWith(
        country: component.longName,
        countryCode: component.shortName,
      );
    }
    if (types.contains('administrative_area_level_1')) {
      updated = updated.copyWith(state: component.longName);
    }
    if (types.contains('locality')) {
      updated = updated.copyWith(city: component.longName);
    }
    if (types.contains('route')) {
      updated = updated.copyWith(address: component.longName);
    }
    if (types.contains('postal_code')) {
      updated = updated.copyWith(zipCode: component.longName);
    }
  }
  return updated;
}
