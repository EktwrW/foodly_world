import 'dart:async' show unawaited;

import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/network/buzz/buzz_client.dart';
import 'package:foodly_world/core/network/buzz/buzz_repo.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_api_provider.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_client.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_repo.dart';
import 'package:foodly_world/core/network/posts/post_client.dart';
import 'package:foodly_world/core/network/posts/post_repo.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/network/reviews/review_client.dart';
import 'package:foodly_world/core/network/reviews/review_repo.dart';
import 'package:foodly_world/core/network/users/user_discovery_client.dart';
import 'package:foodly_world/core/network/users/user_discovery_repo.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
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
      ..registerLazySingleton(() => NotificationsClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => ReviewClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => PostClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => UserDiscoveryClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => BuzzClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => ReservationClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => ReplicateService())
      ..registerLazySingleton(() => AIPromoService(di()));

    /// Register singleton repositories
    di
      ..registerLazySingleton(() => MeRepo(meClient: di()))
      ..registerLazySingleton(() => BusinessRepo(businessClient: di()))
      ..registerLazySingleton(() => NlpSearchRepo(nlpSearchClient: di()))
      ..registerLazySingleton(() => NotificationsRepo(notificationsClient: di()))
      ..registerLazySingleton(() => ReviewRepo(reviewClient: di()))
      ..registerLazySingleton(() => PostRepo(postClient: di()))
      ..registerLazySingleton(() => UserDiscoveryRepo(client: di()))
      ..registerLazySingleton(() => BuzzRepo(buzzClient: di()))
      ..registerLazySingleton(() => ReservationRepo(reservationClient: di()));

    /// Register services
    final authService = AuthSessionService(
      config: config,
      meRepo: di(),
      localStorageService: di(),
      appApiProvider: di(),
    );

    di.registerLazySingleton(() => authService);

    // Fire-and-forget: computes platform + device metadata once at startup.
    unawaited(authService.initDeviceMetadata());

    final favoritesCubit = FavoritesCubit(
      businessRepo: di(),
      logger: di(),
      authService: authService,
    );

    di.registerLazySingleton(() => favoritesCubit);

    authService.setFavoritesCubit(favoritesCubit);

    /// Register NotificationsCubit
    final notificationsCubit = NotificationsCubit(
      notificationsRepo: di(),
      authService: authService,
      logger: di(),
    );

    di.registerLazySingleton(() => notificationsCubit);

    authService.setNotificationsCubit(notificationsCubit);

    /// Register SocialCubit
    di.registerLazySingleton(() => SocialCubit(
          postRepo: di(),
          userDiscoveryRepo: di(),
          buzzRepo: di(),
          authService: authService,
          locationService: di(),
          logger: di(),
        ));

    /// Register NearbyPromotionsCubit
    di.registerLazySingleton(() => NearbyPromotionsCubit(
          businessRepo: di(),
          locationService: di(),
          favoritesCubit: favoritesCubit,
          logger: di(),
        ));

    /// Register NewReleasesCubit
    di.registerLazySingleton(() => NewReleasesCubit(
          businessRepo: di(),
          locationService: di(),
        ));
  }
}
