import 'dart:async';

import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nova_places_api/nova_places_api.dart';

class LocationService {
  LocationDetailsDM _locationDM = const LocationDetailsDM();
  bool _hasBeenInitialized = false;

  final _locationChangedController = StreamController<LocationDetailsDM>.broadcast();

  /// Fires every time location is updated (GPS grant, manual change, or saved address).
  Stream<LocationDetailsDM> get locationChanged => _locationChangedController.stream;

  void dispose() => _locationChangedController.close();

  LocationDetailsDM get currentLocation => _locationDM;
  bool get mustFetchLocation => !_hasBeenInitialized;
  bool get hasLocationData => _locationDM.position != null;

  String get currentCountryCode => _locationDM.countryCode ?? FoodlyCountries.USA.countryCode;
  String get currentCountry => _locationDM.country ?? '';
  String get currentState => _locationDM.state ?? '';
  String get currentCity => _locationDM.city ?? '';
  String get currentAddress => _locationDM.address ?? '';
  String get currentZipCode => _locationDM.zipCode ?? '';

  void updateLocation(LocationDetailsDM newValue) {
    _locationDM = newValue;
    _hasBeenInitialized = true;
    _locationChangedController.add(newValue);
  }

  void updateLocationFromPlace(Place place) {
    final newLocation = LocationDetailsDM(
      position: Position(
        latitude: place.geometry?.location.lat ?? 0.0,
        longitude: place.geometry?.location.lng ?? 0.0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      ),
      address: place.formattedAddress ?? place.name,
      countryCode: place.addressComponents
          ?.firstWhereOrNull(
            (component) => component.types.contains('country'),
          )
          ?.shortName,
      country: place.addressComponents
          ?.firstWhereOrNull(
            (component) => component.types.contains('country'),
          )
          ?.longName,
      state: place.addressComponents
          ?.firstWhereOrNull(
            (component) => component.types.contains('administrative_area_level_1'),
          )
          ?.longName,
      city: place.addressComponents
          ?.firstWhereOrNull(
            (component) => component.types.contains('locality'),
          )
          ?.longName,
      zipCode: place.addressComponents
          ?.firstWhereOrNull(
            (component) => component.types.contains('postal_code'),
          )
          ?.longName,
      serviceEnabled: true,
      permission: _locationDM.permission,
    );

    updateLocation(newLocation);
  }

  void updateLocationUserDM(UserDM userDM) {
    final newLocation = LocationDetailsDM(
      position: Position(
        latitude: userDM.principalAddress?.latitude ?? 0.0,
        longitude: userDM.principalAddress?.longitude ?? 0.0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      ),
      address: userDM.principalAddress?.address,
      countryCode: userDM.principalAddress?.country?.countryCode,
      country: userDM.principalAddress?.country?.name,
      city: userDM.principalAddress?.city,
      zipCode: userDM.principalAddress?.zipCode,
      serviceEnabled: true,
      permission: _locationDM.permission,
    );

    updateLocation(newLocation);
  }
}
