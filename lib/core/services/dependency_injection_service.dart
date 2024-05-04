import 'package:flutter/foundation.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/network/base/app_api_provider.dart';
import 'package:foodly_world/core/network/business/business_client.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/network/users/me_client.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/local_storage_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/core/utils/app_log_filter.dart';
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
