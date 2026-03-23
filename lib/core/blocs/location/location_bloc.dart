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
  final dio = Dio();
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

  Future<void> determinePosition(Emitter<LocationState> emit) async {
    emit(const _CheckingLocation());

    await checkLocationServiceEnabled();

    if (!_locationDM.serviceEnabled) {
      emit(_ServiceDisabled(S.current.locationServicesDisabled));
      return;
    }

    final permission = await Geolocator.checkPermission();
    _locationDM = _locationDM.copyWith(permission: permission);

    if (_locationDM.permission == LocationPermission.denied) {
      final newPermission = await Geolocator.requestPermission();
      _locationDM = _locationDM.copyWith(permission: newPermission);

      if (_locationDM.permission == LocationPermission.denied) {
        await Future.microtask(() => emit(_PermissionDenied(S.current.locationPermissionDenied)));
        return;
      }
    }

    if (_locationDM.permission == LocationPermission.deniedForever) {
      await Future.microtask(() => emit(_PermissionPermanentlyDenied(S.current.locationPermissionPermanentlyDenied)));
      return;
    }

    final currentPosition = await Geolocator.getCurrentPosition();
    _locationDM = _locationDM.copyWith(position: currentPosition);

    if (_locationDM.position != null) await getLocationDetailsFromCoordinates();

    emit(_LocationChecked(_locationDM));
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
