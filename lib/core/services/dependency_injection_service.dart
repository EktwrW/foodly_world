import 'package:flutter/foundation.dart';
import 'package:foodly_world/core/core_exports.dart';

import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final GetIt di = GetIt.instance;

class DependencyInjectionService {
  DependencyInjectionService._();

  static void registerDependencies(BaseConfig config) {
    /// Register Lazy Singletons
    di
      ..registerLazySingleton(() => config)
      ..registerLazySingleton(() => FoodlyApiProvider(config))
      ..registerLazySingleton(() => Logger(
            level: config.logLevel,
            filter: AppLogFilter(config: config),
            printer: PrettyPrinter(methodCount: kReleaseMode ? 0 : 1, errorMethodCount: kReleaseMode ? 0 : 10),
          ));

    /// Register Singletons
    di
      ..registerLazySingleton(() => LocationService())
      ..registerSingleton<DialogService>(DialogService());

    /// Register network clients
    di
      ..registerLazySingleton(() => MeClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => BusinessClient(di<FoodlyApiProvider>().dio));

    /// Register singleton repositories
    di
      ..registerLazySingleton(() => MeRepo(meClient: di()))
      ..registerLazySingleton(() => BusinessRepo(businessClient: di()));

    /// Register services
    di.registerLazySingleton(
      () => AuthSessionService(config: config, localStorageService: di(), appApiProvider: di(), meRepo: di()),
    );

    di.registerLazySingleton(() => LocalStorageService());
  }
}
