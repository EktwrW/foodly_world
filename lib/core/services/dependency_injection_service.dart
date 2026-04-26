import 'dart:async' show unawaited;

import 'package:dio/dio.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/network/analytics/analytics_api_provider.dart';
import 'package:foodly_world/core/network/analytics/dashboard_client.dart';
import 'package:foodly_world/core/network/analytics/dashboard_repo.dart';
import 'package:foodly_world/core/network/analytics/events_client.dart';
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/network/app_config/config_features_client.dart';
import 'package:foodly_world/core/network/business_availability/business_availability_client.dart';
import 'package:foodly_world/core/network/business_availability/business_availability_repo.dart';
import 'package:foodly_world/core/network/buzz/buzz_client.dart';
import 'package:foodly_world/core/network/buzz/buzz_repo.dart';
import 'package:foodly_world/core/network/device_tokens/device_token_client.dart';
import 'package:foodly_world/core/network/device_tokens/device_token_repo.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_api_provider.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_client.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_repo.dart';
import 'package:foodly_world/core/network/places_proxy/foodly_places_client.dart';
import 'package:foodly_world/core/network/places_proxy/places_proxy_repo.dart';
import 'package:foodly_world/core/network/posts/post_client.dart';
import 'package:foodly_world/core/network/posts/post_repo.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/network/reviews/review_client.dart';
import 'package:foodly_world/core/network/reviews/review_repo.dart';
import 'package:foodly_world/core/network/service_packages/service_package_client.dart';
import 'package:foodly_world/core/network/service_packages/service_package_repo.dart';
import 'package:foodly_world/core/network/users/user_discovery_client.dart';
import 'package:foodly_world/core/network/users/user_discovery_repo.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/core/services/service_events_tracker.dart';
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
      ..registerLazySingleton(() => LocalStorageService())
      ..registerLazySingleton(() => SecureTokenService());

    /// Register Dio instance (shared, same as FoodlyApiProvider.dio)
    di.registerLazySingleton<Dio>(() => di<FoodlyApiProvider>().dio);

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
      ..registerLazySingleton(() => BusinessAvailabilityClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => ServicePackageClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => DeviceTokenClient(di<FoodlyApiProvider>().dio))
      // Places Proxy + Config Features — ambos usan la misma Dio del
      // FoodlyApiProvider (baseUrl = api.foodly.solutions/v1). El
      // interceptor ya tiene whitelisted `/geocoding/reverse` y
      // `/config/features` (endpoints públicos) así que no se les
      // inyecta Bearer ni dispara silent refresh en esos paths.
      ..registerLazySingleton(() => FoodlyPlacesClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => ConfigFeaturesClient(di<FoodlyApiProvider>().dio))
      ..registerLazySingleton(() => AnalyticsApiProvider())
      ..registerLazySingleton(() => EventsClient(di<AnalyticsApiProvider>().dio))
      ..registerLazySingleton(() => DashboardClient(di<AnalyticsApiProvider>().dio))
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
      ..registerLazySingleton(() => ReservationRepo(reservationClient: di()))
      ..registerLazySingleton(() => BusinessAvailabilityRepo(client: di()))
      ..registerLazySingleton(() => ServicePackageRepo(client: di()))
      ..registerLazySingleton(() => DeviceTokenRepo(client: di()))
      ..registerLazySingleton(() => DashboardRepo(dashboardClient: di()))
      // PlacesProxyRepo envuelve Retrofit en ApiResult. La decisión
      // "proxy vs nova_places_api fallback" vive en los callers
      // (AppFeaturesRepo.cachedOrDefaults.placesProxyEnabled), pero la
      // decisión "endpoint authed vs público" la resuelve el repo
      // internamente vía AuthSessionService.isLoggedIn — así evitamos
      // que cada call-site pre-login (sign-up) repita el branching y se
      // olvide alguno, cayendo en 401 → modal de sesión expirada.
      ..registerLazySingleton(
        () => PlacesProxyRepo(client: di(), authSession: di()),
      )
      // AppFeaturesRepo mantiene cache in-memory de 5 min. No es const
      // porque internamente guarda estado (`_cached`, `_cachedAt`).
      ..registerLazySingleton(() => AppFeaturesRepo(client: di()));

    /// Register services
    final authService = AuthSessionService(
      config: config,
      meRepo: di(),
      localStorageService: di(),
      appApiProvider: di(),
      secureTokenService: di(),
    );

    di.registerLazySingleton(() => authService);

    // Fire-and-forget: computes platform + device metadata once at startup.
    unawaited(authService.initDeviceMetadata());

    /// Push notifications (FCM). Service is a singleton — [initialize] is
    /// called in main.dart right after Firebase.initializeApp, and
    /// [registerCurrentToken] / [unregisterCurrentToken] are invoked by
    /// AuthSessionService on login/session-restore and logout respectively.
    final pushService = PushNotificationService(
      deviceTokenRepo: di(),
      logger: di(),
    );
    di.registerSingleton<PushNotificationService>(pushService);
    authService.setPushNotificationService(pushService);

    di.registerLazySingleton(() => EventTrackingService(
          client: di(),
          authService: authService,
          logger: di(),
        ));
    // Typed wrapper for `service.*` events (Catering & Chefs analytics).
    // Lazy because nothing wires it before the first visit-service-packages
    // route opens, which can be many minutes into the session.
    di.registerLazySingleton(() => ServiceEventsTracker(di<EventTrackingService>()));

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
          tracker: di(),
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
