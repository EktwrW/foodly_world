import 'package:foodly_world/data_models/places/location_details_dm.dart';

class LocationService {
  LocationDetailsDM _locationDM = const LocationDetailsDM();
  LocationDetailsDM get currentLocation => _locationDM;
  bool get mustFetchLocation => currentZipCode.isEmpty;

  String get currentCountryCode => _locationDM.countryCode ?? 'US';
  String get currentCountry => _locationDM.country ?? '';
  String get currentState => _locationDM.state ?? '';
  String get currentCity => _locationDM.city ?? '';
  String get currentAddress => _locationDM.address ?? '';
  String get currentZipCode => _locationDM.zipCode ?? '';

  void updateLocation(LocationDetailsDM newValue) => _locationDM = newValue;
}
