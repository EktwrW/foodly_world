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

  String get getBirthdayFormat {
    final countryCode = di<LocationService>().currentCountryCode;
    final lang = Intl.getCurrentLocale();

    if (countryCode == 'ES') return _birthdayStringES;
    if (countryCode == 'PT') return _birthdayStringPT;
    if (lang == FoodlyStrings.ES) return _birthdayStringLAT;
    return _birthdayStringUS;
  }

  bool isBetween(DateTime start, DateTime end) => isAfter(start.toLocal()) && isBefore(end.toLocal());

  bool get isBeforeNow => DateTime.now().isBefore(toLocal());

  bool get isAfterNow => DateTime.now().isAfter(toLocal());
}

extension BusinessStatusExtension on Day {
  BusinessStatus get currentStatus {
    if (isDayOff) return BusinessStatus.closed;
    if (isInOpeningHoursRange) return BusinessStatus.open;

    final now = DateTime.now();
    if (openA != null) {
      final openTime = DateFormat('HH:mm').parse(openA!);
      final openDateTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);

      final difference = openDateTime.difference(now);
      if (difference.inHours <= 1 && difference.inHours >= 0) {
        return BusinessStatus.openingSoon;
      }
    }

    return BusinessStatus.closed;
  }

  String get formattedHours {
    if (isDayOff) return 'Closed today';

    final firstPeriod = '${openA ?? ''} - ${closeA ?? ''}';
    if (openB == null || closeB == null) return firstPeriod;

    return '$firstPeriod, $openB - $closeB';
  }
}

extension BusinessDaysExtension on BusinessDays {
  Day get currentDaySchedule {
    final currentWeekday = DateTime.now().weekday;
    return weekdaysData[Weekday.values[currentWeekday - 1]]!;
  }
}

enum BusinessStatus { open, closed, openingSoon }
