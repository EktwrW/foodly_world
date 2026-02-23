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

  bool isBetween(DateTime start, DateTime end) => isAfter(start.toLocal()) && isBefore(end.toLocal());

  bool get isBeforeNow => DateTime.now().isBefore(toLocal());

  bool get isAfterNow => DateTime.now().isAfter(toLocal());

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

extension BusinessStatusExtension on Day {
  BusinessStatus get currentStatus {
    if (isDayOff) return BusinessStatus.closed;
    if (isInOpeningHoursRange) return BusinessStatus.open;

    final now = DateTime.now();
    final dateFormat = DateFormat('HH:mm');

    // Check first period
    if (openA != null) {
      final openTime = dateFormat.parse(openA!);
      var openDateTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);

      // If opening time is in the past today, check if it might be tomorrow's opening time
      if (openDateTime.isBefore(now)) {
        final closeTime = closeA != null ? dateFormat.parse(closeA!) : null;
        if (closeTime != null) {
          final closeDateTime = DateTime(now.year, now.month, now.day, closeTime.hour, closeTime.minute);
          // If closing time is before opening time, it crosses midnight
          if (closeDateTime.isBefore(openDateTime)) {
            // Check tomorrow's opening time
            openDateTime = openDateTime.add(const Duration(days: 1));
          }
        }
      }

      final difference = openDateTime.difference(now);
      if (difference.inHours <= 1 && difference.inHours >= 0) {
        return BusinessStatus.openingSoon;
      }
    }

    // Check second period
    if (openB != null) {
      final openTime = dateFormat.parse(openB!);
      var openDateTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);

      // If opening time is in the past today, check if it might be tomorrow's opening time
      if (openDateTime.isBefore(now)) {
        final closeTime = closeB != null ? dateFormat.parse(closeB!) : null;
        if (closeTime != null) {
          final closeDateTime = DateTime(now.year, now.month, now.day, closeTime.hour, closeTime.minute);
          // If closing time is before opening time, it crosses midnight
          if (closeDateTime.isBefore(openDateTime)) {
            // Check tomorrow's opening time
            openDateTime = openDateTime.add(const Duration(days: 1));
          }
        }
      }

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
    final now = DateTime.now();
    final currentWeekday = now.weekday % 7; // 0-6, where 0 is Sunday

    // Map DateTime weekday to our Weekday enum
    // DateTime: 1-7 (Monday-Sunday)
    // Our enum: 0-6 (Sunday-Saturday)
    // To convert: (weekday % 7) gives us 1-6,0 which matches our enum order if we shift
    return switch (currentWeekday) {
      0 => weekdaysData[Weekday.sunday]!, // Sunday
      1 => weekdaysData[Weekday.monday]!, // Monday
      2 => weekdaysData[Weekday.tuesday]!,
      3 => weekdaysData[Weekday.wednesday]!,
      4 => weekdaysData[Weekday.thursday]!,
      5 => weekdaysData[Weekday.friday]!,
      6 => weekdaysData[Weekday.saturday]!,
      _ => throw ArgumentError('Invalid weekday: $currentWeekday')
    };
  }
}

enum BusinessStatus { open, closed, openingSoon }
