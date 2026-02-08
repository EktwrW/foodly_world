import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_api_provider.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_client.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_repo.dart';

import 'package:get_it/get_it.dart';

export 'package:foodly_world/core/core_exports.dart';

final GetIt di = GetIt.instance;

class DependencyInjectionService {
  const DependencyInjectionService._();

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
      ..registerSingleton<DialogService>(DialogService())
      ..registerLazySingleton(() => LocalStorageService());

    /// Register network clients
    di
      ..registerLazySingleton(() => MeClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => BusinessClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => NlpApiProvider())
      ..registerLazySingleton(() => NlpSearchClient(di<NlpApiProvider>().dio))
      ..registerLazySingleton(() => ReplicateService())
      ..registerLazySingleton(() => AIPromoService(di()));

    /// Register singleton repositories
    di
      ..registerLazySingleton(() => MeRepo(meClient: di()))
      ..registerLazySingleton(() => BusinessRepo(businessClient: di()))
      ..registerLazySingleton(() => NlpSearchRepo(nlpSearchClient: di()));

    /// Register services
    final authService = AuthSessionService(
      config: config,
      meRepo: di(),
      localStorageService: di(),
      appApiProvider: di(),
    );

    di.registerLazySingleton(() => authService);

    final favoritesCubit = FavoritesCubit(
      businessRepo: di(),
      logger: di(),
      authService: authService,
    );

    di.registerLazySingleton(() => favoritesCubit);

    authService.setFavoritesCubit(favoritesCubit);
  }
}
