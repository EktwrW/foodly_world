import 'dart:async' show unawaited;
import 'dart:developer' show log;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_stripe/flutter_stripe.dart' show Stripe;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/services/first_launch_service.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/firebase_options.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';

void main() async {
  usePathUrlStrategy();
  runApp(await buildFoodlyApp());
}

Future<Widget> buildFoodlyApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // Catch Flutter framework errors and send to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // Catch async errors that escape the Flutter framework (e.g. platform errors).
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (_) {}
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final config = BaseConfig.initConfig();
  DependencyInjectionService.registerDependencies(config);

  // Stripe (Group Orders & Split Payments). La publishable key se inyecta por
  // --dart-define (mismo patrón que el resto de config) — NUNCA hardcodeada.
  // Test mode: --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_...
  // El guard evita romper runs de dev que no pasan la key.
  const stripeKey = String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
  if (stripeKey.isNotEmpty) {
    Stripe.publishableKey = stripeKey;
    await Stripe.instance.applySettings();
    log('Stripe inicializado (…${stripeKey.substring(stripeKey.length - 4)})', name: 'main');
  } else {
    // Fail-visible: sin key, cualquier PaymentSheet lanzará StripeConfigException.
    log('STRIPE_PUBLISHABLE_KEY vacía — los pagos NO funcionarán en este run', name: 'main');
  }

  // Initialize FCM push notifications once DI is wired. The service itself
  // is silent-failure-by-design — if credentials are missing or permissions
  // denied, it logs and moves on without blocking startup.
  unawaited(di<PushNotificationService>().initialize());

  // Bug F (2026-05-06): borrar memoria + desinstalar + reinstalar dejaba
  // un modal de "sesión expirada" arriba de la welcome screen. Causa
  // raíz — iOS Keychain sobrevive al uninstall por defecto, así que
  // SecureTokenService leía tokens viejos en el primer arranque
  // post-reinstalación. FirstLaunchService detecta ese caso vía
  // SharedPreferences (que SÍ se borra al uninstall) y limpia el Keychain
  // antes de que cualquier consumidor intente restaurar la sesión.
  //
  // Awaitamos a propósito: tiene que terminar ANTES de
  // HydratedBloc.storage.build, porque el primer instante en que se
  // construye RootBloc dispara fromJson → restoreTokensFromSecureStorage.
  // Si no esperamos, perdemos la carrera y volvemos a leer tokens
  // residuales antes de borrarlos.
  await di<FirstLaunchService>().ensureCleanInstall();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorageDirectory.web : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  final baseConfig = di<BaseConfig>();
  final rootBloc = RootBloc(authSessionService: di());

  // Cableamos RootBloc en AuthSessionService para que el teardown de sesión
  // (logout) pueda limpiar el estado persistido de HydratedBloc sin depender
  // de un BuildContext. Ver AuthSessionService._tearDownSession.
  di<AuthSessionService>().setRootBloc(rootBloc);

  di.registerLazySingleton(() => AppRouter(rootBloc: rootBloc));

  if (baseConfig.isLoggingEnabled) {
    Bloc.observer = AppBlocObserver(config: config);
  }

  OpenAI.apiKey = baseConfig.openaiApiKey;

  final isMenuSubdomain =
      const bool.fromEnvironment('IS_MENU_SUBDOMAIN') || Uri.base.host.startsWith('menu.') || Uri.base.port == 8889;

  if (isMenuSubdomain) FlutterNativeSplash.remove();

  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => rootBloc),
      if (!isMenuSubdomain) ...[
        BlocProvider(create: (context) {
          // Cableamos el StartingCubit en AuthSessionService para que el
          // teardown de sesión (clearInvalidSession) pueda devolver la
          // starting page a un estado renderable sin un BuildContext.
          final startingCubit = StartingCubit(di(), di(), di());
          di<AuthSessionService>().setStartingCubit(startingCubit);
          return startingCubit;
        }),
        BlocProvider(create: (context) => LocalAuthCubit(di(), di(), di())),
        // LocationBloc: (BaseConfig, Logger, PlacesProxyRepo, AppFeaturesRepo)
        // Los 2 últimos se agregaron en Fase 4 del Places Proxy — el bloc
        // elige path nuevo (proxy) o legacy (direct) según el flag runtime
        // `placesProxyEnabled` del AppFeaturesRepo.
        BlocProvider(create: (context) => LocationBloc(di(), di(), di(), di())),
        BlocProvider(create: (context) => MainDrawerCubit(di(), di())),
        BlocProvider(create: (context) => SmartSearchCubit(di(), di())),
        BlocProvider(create: (context) => di<FavoritesCubit>()),
        BlocProvider(create: (context) => di<NotificationsCubit>()),
        BlocProvider(create: (context) => di<SocialCubit>()),
        BlocProvider(create: (context) => di<NearbyPromotionsCubit>()),
        BlocProvider(create: (context) => di<NewReleasesCubit>()),
      ],
    ],
    child: MaterialApp.router(
      title: 'Foodly App',
      debugShowCheckedModeBanner: false,
      routerConfig: di<AppRouter>().appRouter,
      supportedLocales: FoodlyLocales.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }

        return Locale(FoodlyStrings.EN, FoodlyCountries.USA.countryCode);
      },
      scrollBehavior: AppScrollBehavior(),
      theme: FoodlyThemes.lightTheme(),
      darkTheme: FoodlyThemes.darkTheme(),
      themeMode: ThemeMode.light,
      builder: (context, childWidget) {
        // Public menu subdomain: render directly, skip auth/location wrappers.
        final isPublicMenu = const bool.fromEnvironment('IS_MENU_SUBDOMAIN') ||
            Uri.base.host.startsWith('menu.') ||
            Uri.base.port == 8889;

        final mediaQuery = MediaQuery.of(context);
        final width = mediaQuery.size.width;

        final baseScale = width < 360
            ? 0.85
            : width < 400
                ? 0.9
                : width < 600
                    ? 1.0
                    : 1.1;

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(
              minScaleFactor: baseScale * 0.9,
              maxScaleFactor: baseScale * 1.2,
            ),
          ),
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => ResponsiveBreakpoints.builder(
                  child: isPublicMenu
                      ? childWidget ?? const SizedBox.shrink()
                      : FoodlyWrapper(
                          child: FoodlyMainScaffold(child: childWidget),
                        ),
                  breakpoints: DeviceSize.breakpoints,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class FoodlyMainScaffold extends StatelessWidget {
  final Widget? child;
  const FoodlyMainScaffold({super.key, required this.child});
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      buildWhen: (prev, curr) =>
          prev.maybeWhen(cachedState: (_) => true, orElse: () => false) !=
          curr.maybeWhen(cachedState: (_) => true, orElse: () => false),
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: const FoodlyDrawer(),
          body: child,
        );
      },
    );
  }
}
