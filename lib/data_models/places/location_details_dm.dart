import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_details_dm.freezed.dart';

@freezed
class LocationDetailsDM with _$LocationDetailsDM {
  const factory LocationDetailsDM({
    String? countryCode,
    Position? position,
    String? country,
    String? state,
    String? city,
    String? address,
    String? zipCode,
    @Default(false) bool serviceEnabled,
    @Default(LocationPermission.unableToDetermine) LocationPermission permission,
  }) = _LocationDetailsDM;
}
