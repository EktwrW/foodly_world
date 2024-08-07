import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;

import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final BaseConfig config;

  AppBlocObserver({required this.config});

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (config.isLoggingEnabled) di<Logger>().i(change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (config.isLoggingEnabled) di<Logger>().e(error);
  }
}
