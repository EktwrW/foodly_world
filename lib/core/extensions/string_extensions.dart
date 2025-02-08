import 'package:foodly_world/core/consts/foodly_unicode_maps.dart';
import 'package:logger/logger.dart';

extension StringExtension on String {
  String get formattedPin => replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ');

  Level toLogLevel() {
    switch (toLowerCase()) {
      case 'all':
        return Level.all;
      case 'trace':
        return Level.trace;
      case 'debug':
        return Level.debug;
      case 'info':
        return Level.info;
      case 'warning':
        return Level.warning;
      case 'error':
        return Level.error;
      case 'fatal':
        return Level.fatal;
      default:
        return Level.off;
    }
  }

  String toBold() => split('').map((char) => FoodlyUnicodeMaps.bold[char] ?? char).join();
}
