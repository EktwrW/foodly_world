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

  /// Set to `true` before calling `Geolocator.openAppSettings()`.
  /// FoodlyLocationWrapper re-checks location on resume ONLY when this is true.
  bool awaitingSettingsReturn = false;

  LocationDetailsDM get currentLocation => _locationDM;

  /// ¿La posición nueva está lo bastante lejos de la anterior como para que
  /// merezca recargar lo que depende de ella (cercanos, promos, novedades)?
  /// El bloc emite dos veces —última conocida y fix preciso— y casi siempre
  /// son el mismo sitio con distinta precisión: recargar dos veces sería
  /// gastar red para pintar lo mismo. Con radios de 15-20 km, 1 km no cambia
  /// nada de lo que se ve. Sin posición anterior, siempre sí.
  static bool movedSignificantly(Position? before, Position? after, {double meters = 1000}) {
    if (after == null) return false;
    if (before == null) return true;
    return Geolocator.distanceBetween(before.latitude, before.longitude, after.latitude, after.longitude) >= meters;
  }
  bool get mustFetchLocation => !_hasBeenInitialized;
  bool get hasLocationData => _locationDM.position != null;

  /// Mark that a location check was attempted (even if denied).
  /// Prevents re-triggering checkLocation() on widget recreation.
  void markInitialized() => _hasBeenInitialized = true;

  String get currentCountryCode => _locationDM.countryCode ?? FoodlyCountries.USA.countryCode;
  String get currentCountry => _locationDM.country ?? '';
  String get currentState => _locationDM.state ?? '';
  String get currentCity => _locationDM.city ?? '';
  String get currentAddress => _locationDM.address ?? '';
  String get currentZipCode => _locationDM.zipCode ?? '';

  /// Une las partes de una dirección para mostrarlas, saltándose las que no
  /// vienen.
  ///
  /// EL BUG (2026-09-05). El texto se armaba concatenando a mano
  /// (`'$currentAddress, $currentCity.'`), así que en cuanto una parte llegaba
  /// vacía quedaban los separadores sueltos: `"Rua Irmãos Bonina, ."` en el
  /// chip del appbar y `"Rua X, , , ."` en su tooltip. Había un parche para
  /// UNA de las combinaciones —la de ciudad vacía en el tooltip— y el resto
  /// seguían rotas, que es lo que pasa cuando se arregla el caso en vez de la
  /// clase.
  ///
  /// Acá se resuelve la clase entera:
  ///
  ///  * cada parte se limpia de espacios y de separadores pegados, así que da
  ///    igual si el geocoding devuelve `"Covilhã,"` o `" Covilhã "`;
  ///  * las vacías se caen, y con ellas su separador;
  ///  * las repetidas seguidas también — el geocoding a veces devuelve la
  ///    misma cadena como dirección y como ciudad;
  ///  * el punto final solo se pone si quedó algo que puntuar.
  ///
  /// Devuelve cadena vacía cuando no hay nada: el llamador decide qué poner en
  /// su lugar.
  static String formatAddress(Iterable<String?> parts) {
    final pieces = <String>[];

    for (final part in parts) {
      final clean = (part ?? '').trim().replaceAll(RegExp(r'^[,.\s]+|[,.\s]+$'), '');
      if (clean.isEmpty) continue;
      if (pieces.isNotEmpty && pieces.last.toLowerCase() == clean.toLowerCase()) continue;
      pieces.add(clean);
    }

    return pieces.isEmpty ? '' : '${pieces.join(', ')}.';
  }

  /// Etiqueta corta, para el chip de ubicación: calle y ciudad; o ciudad y
  /// código postal cuando todavía no hay calle (posición provisional, antes
  /// de que resuelva el geocoding).
  String get addressLabel => formatAddress(
        currentAddress.isNotEmpty ? [currentAddress, currentCity] : [currentCity, currentZipCode],
      );

  /// Etiqueta completa, para el tooltip.
  String get addressTooltip => formatAddress([currentAddress, currentCity, currentZipCode, currentCountry]);

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
