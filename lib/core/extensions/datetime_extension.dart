import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get _dateStringUS => DateFormat('MMMM d, yyyy').format(toLocal());
  String get _dateStringLAT => DateFormat('d \'de\' MMMM \'de\' yyyy', FoodlyStrings.ES).format(toLocal());
  String get _dateStringES => DateFormat('d \'de\' MMMM \'de\' yyyy', 'es_ES').format(toLocal());
  String get _dateStringPT => DateFormat('d \'de\' MMMM \'de\' yyyy', 'pt_PT').format(toLocal());

  String _getEnglishOrdinal(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  /// Formato de fecha con día abreviado y número, adaptado al idioma actual. Ejemplo: "Mon\n5".
  String get getDayNumberAndNameAbreviatedFormat {
    final lang = Intl.getCurrentLocale();
    // The intl package's 'pt' CLDR data returns full day names (e.g. 'segunda-feira')
    // for the EEE (abbreviated) pattern — hardcode PT abbreviations to work around it.
    if (lang.startsWith('pt')) {
      const ptAbbr = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];
      return '${ptAbbr[weekday % 7]}\n$day';
    }
    return DateFormat('EEE\nd', lang).format(this).capitalize;
  }

  /// Formato de mes abreviado, adaptado al idioma actual. Ejemplo: "Jan".
  String get getMonthAbreviatedFormat {
    final lang = Intl.getCurrentLocale();
    return DateFormat('MMM', lang).format(this).capitalize;
  }

  String get _birthdayStringUS {
    final day = this.day;
    final suffix = _getEnglishOrdinal(day);
    return DateFormat('MMMM d\'$suffix\'').format(toLocal());
  }

  String get _birthdayStringLAT => DateFormat('d \'de\' MMMM', FoodlyStrings.ES).format(toLocal());

  String get _birthdayStringES => DateFormat('d \'de\' MMMM', 'es_ES').format(toLocal());

  String get _birthdayStringPT {
    final day = this.day;
    return '$dayº de ${DateFormat('MMMM', 'pt_PT').format(toLocal())}';
  }

  String get getStringFormat {
    final countryCode = di<LocationService>().currentCountryCode;
    final lang = Intl.getCurrentLocale();

    if (countryCode == 'ES') return _dateStringES;
    if (countryCode == 'PT') return _dateStringPT;
    if (lang == FoodlyStrings.ES) return _dateStringLAT;
    return _dateStringUS;
  }

  /// Compact numeric date format adapted to the current locale.
  /// Returns `MM/dd/yyyy` for English/US and `dd/MM/yyyy` for ES, PT and LATAM.
  String get getShortFormat {
    final countryCode = di<LocationService>().currentCountryCode;
    final lang = Intl.getCurrentLocale();

    if (countryCode == 'US' || (lang != FoodlyStrings.ES && countryCode != 'ES' && countryCode != 'PT')) {
      return DateFormat('MM/dd/yyyy').format(toLocal());
    }
    return DateFormat('dd/MM/yyyy').format(toLocal());
  }

  String get getBirthdayFormat {
    final countryCode = di<LocationService>().currentCountryCode;
    final lang = Intl.getCurrentLocale();

    if (countryCode == 'ES') return _birthdayStringES;
    if (countryCode == 'PT') return _birthdayStringPT;
    if (lang == FoodlyStrings.ES) return _birthdayStringLAT;
    return _birthdayStringUS;
  }

  /// Esta fecha sin hora, en local.
  ///
  /// Existe para comparar por DÍA DE CALENDARIO, que es como filtra el
  /// backend: `NearbyPromotionsController` usa `whereDate('expire_date', '>=',
  /// $today)`, o sea que una promo que vence hoy sigue siendo válida todo el
  /// día. Comparando instantes —`expireDate.isAfter(now)`— la promo se caía a
  /// las 00:00 de su último día y desaparecía del front aunque el backend la
  /// siguiera devolviendo.
  DateTime get dateOnly {
    final local = toLocal();

    return DateTime(local.year, local.month, local.day);
  }

  bool isBetween(DateTime start, DateTime end) => isAfter(start.toLocal()) && isBefore(end.toLocal());

  bool get isBeforeNow => DateTime.now().isBefore(toLocal());

  bool get isAfterNow => DateTime.now().isAfter(toLocal());

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    final s = S.current;

    if (difference.inSeconds < 60) {
      return s.timeAgoJustNow;
    } else if (difference.inMinutes < 60) {
      return s.timeAgoMinutes(difference.inMinutes);
    } else if (difference.inHours < 24) {
      return s.timeAgoHours(difference.inHours);
    } else {
      return s.timeAgoDays(difference.inDays);
    }
  }
}

// Business open/closed logic moved server-side. The BE computes `status`
// and `hours_display` per business in its own local timezone (see
// `BusinessStatusHelper.php`), and the FE reads them via
// [BusinessDM.currentStatus] / [BusinessDM.hoursDisplay].
//
// What used to live here:
//   - `BusinessStatusExtension on Day` (currentStatus + formattedHours)
//   - `BusinessDaysExtension on BusinessDays` (currentDaySchedule)
//   - `enum BusinessStatus`
//
// All deleted. The enum moved to `core/enums/business_enums.dart` so
// widgets can import it without pulling the date-formatting extensions
// in this file. Computing it on the device with `DateTime.now()` was the
// root of the "My Pizzeria looks closed" bug — the device clock isn't
// the business's clock for any cross-timezone viewer.
