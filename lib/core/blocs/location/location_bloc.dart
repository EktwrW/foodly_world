import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationDetailsDM _locationDM;
  final dio = Dio();
  final _baseConfig = di<BaseConfig>();

  String get _placesBaseUrl => _baseConfig.googlePlacesBaseUrl;
  String get _apiKey => _baseConfig.googleDefaultApiKey;
  double get _latitude => _locationDM.position?.latitude ?? 0.0;
  double get _longitude => _locationDM.position?.longitude ?? 0.0;

  LocationBloc()
      : _locationDM = const LocationDetailsDM(),
        super(const _Initial()) {
    on<LocationEvent>((event, emit) async {
      await event
          .map(
            checkLocation: (event) async => await determinePosition(emit),
          )
          .then((value) => emit(_LocationChecked(_locationDM)));
    });
  }

  Future<void> checkLocationServiceEnabled() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    _locationDM = _locationDM.copyWith(serviceEnabled: isEnabled);
  }

  Future<void> determinePosition(Emitter<LocationState> emit) async {
    emit(const _CheckingLocation());

    await checkLocationServiceEnabled();

    // TODO: VERY IMPORTANT TO HANDLE THIS CASE:
    if (!_locationDM.serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    final permission = await Geolocator.checkPermission();
    _locationDM = _locationDM.copyWith(permission: permission);

    if (_locationDM.permission == LocationPermission.denied) {
      final newPermission = await Geolocator.requestPermission();

      _locationDM = _locationDM.copyWith(permission: newPermission);

      // TODO: VERY IMPORTANT TO HANDLE THIS CASE:
      if (_locationDM.permission == LocationPermission.denied) {
        // Los permisos están denegados, siguiente código.
        return Future.error('Los permisos de ubicación están denegados');
      }
    }

    // TODO: VERY IMPORTANT TO HANDLE THIS CASE:
    if (_locationDM.permission == LocationPermission.deniedForever) {
      // Los permisos están denegados para siempre, manejar apropiadamente.
      return Future.error('Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.');
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    _locationDM = _locationDM.copyWith(position: currentPosition);

    if (_locationDM.position != null) await getLocationDetailsFromCoordinates();
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
      di<Logger>().e('Error getting location data: $e');
    }
  }
}
