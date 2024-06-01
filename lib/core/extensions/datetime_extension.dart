import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get dateStringUS => DateFormat('MMMM d, yyyy').format(toLocal());

  String get dateStringLAT => DateFormat('d \'de\' MMMM \'de\' yyyy', FoodlyStrings.ES).format(toLocal());

  String get dateStringES => DateFormat('d \'de\' MMMM \'de\' yyyy', 'es_ES').format(toLocal());

  String get dateStringPT => DateFormat('d \'de\' MMMM \'de\' yyyy', 'pt_PT').format(toLocal());

  String get getStringFormat {
    final countryCode = di<LocationService>().currentCountryCode;
    final lang = Intl.getCurrentLocale();

    if (countryCode == 'ES') return dateStringES;

    if (countryCode == 'PT') return dateStringPT;

    if (lang == FoodlyStrings.ES) return dateStringLAT;

    return dateStringUS;
  }
}
