import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get _dateStringUS => DateFormat('MMMM d, yyyy').format(toLocal());
  String get _dateStringLAT => DateFormat('d \'de\' MMMM \'de\' yyyy', FoodlyStrings.ES).format(toLocal());
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

  String get _birthdayStringPT {
    final day = this.day;
    return '$dayº de ${DateFormat('MMMM', 'pt_PT').format(toLocal())}';
  }

  String get getStringFormat {
    final lang = Intl.getCurrentLocale();

    if (lang.startsWith(FoodlyStrings.ES)) return _dateStringLAT;
    if (lang.startsWith(FoodlyStrings.PT)) return _dateStringPT;
    return _dateStringUS;
  }

  /// El orden de dia y mes es convencion REGIONAL, no del idioma: solo
  /// Estados Unidos escribe el mes primero. Ver CLAUDE.md (2026-09-07).
  String get getShortFormat {
    final esEstadosUnidos = di<LocationService>().currentCountryCode == FoodlyCountries.USA.countryCode;

    return DateFormat(esEstadosUnidos ? 'MM/dd/yyyy' : 'dd/MM/yyyy').format(toLocal());
  }

  /// Cumpleaños en el idioma de la app. Mismo criterio que [getStringFormat]:
  /// el nombre del mes sigue al idioma, nunca al pais del GPS.
  String get getBirthdayFormat {
    final lang = Intl.getCurrentLocale();

    if (lang.startsWith(FoodlyStrings.ES)) return _birthdayStringLAT;
    if (lang.startsWith(FoodlyStrings.PT)) return _birthdayStringPT;
    return _birthdayStringUS;
  }

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
