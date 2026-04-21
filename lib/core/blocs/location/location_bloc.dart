import 'dart:async' show TimeoutException;

import 'package:dio/dio.dart';

import 'package:foodly_world/core/core_exports.dart' show BaseConfig, Bloc, Emitter, FoodlyStrings, Logger, S;

import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationDetailsDM _locationDM;

  /// HTTP client usado SOLO para el reverse-geocoding contra Google Places
  /// Geocoding API (ver [getLocationDetailsFromCoordinates]). NO reutilizamos
  /// el Dio de la API de Foodly porque ése tiene interceptors de auth / base
  /// URL que no aplican acá.
  ///
  /// Los timeouts son CRÍTICOS: antes de configurarlos, si el request a
  /// Places quedaba colgado (típicamente por degradación de red: transición
  /// wifi↔4G, DNS lento, operador saturado), el `await dio.get` nunca tiraba
  /// excepción y el bloc se quedaba en `_CheckingLocation` indefinidamente,
  /// dejando el botón de current location atrapado en "Verificando
  /// ubicación..." hasta que el usuario mataba la app. Reproducido en prod
  /// 2026-04 sobre 1.4.x. 6 s es largo para un fallback degradado elegante
  /// (sin ciudad/dirección) y corto para que la UI no se sienta muerta.
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 6),
    sendTimeout: const Duration(seconds: 6),
  ));

  final BaseConfig _baseConfig;
  final Logger _logger;

  String get _placesBaseUrl => _baseConfig.googlePlacesBaseUrl;
  String get _apiKey => _baseConfig.googleDefaultApiKey;
  double get _latitude => _locationDM.position?.latitude ?? 0.0;
  double get _longitude => _locationDM.position?.longitude ?? 0.0;

  LocationBloc(
    BaseConfig baseConfig,
    Logger logger,
  )   : _baseConfig = baseConfig,
        _logger = logger,
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

  Future<void> getLocationDetailsFromCoordinates() async {
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
