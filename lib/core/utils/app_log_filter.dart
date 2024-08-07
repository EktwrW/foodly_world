import 'package:foodly_world/core/core_exports.dart' show BaseConfig;
import 'package:logger/logger.dart';

class AppLogFilter extends LogFilter {
  final BaseConfig config;
  AppLogFilter({required this.config});

  @override
  bool shouldLog(LogEvent event) => config.logLevel == Level.all || config.logLevel.value <= event.level.value;
}
