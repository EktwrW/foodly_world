import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodly_world/core/blocs/cubit/local_auth_cubit.dart';
import 'package:foodly_world/core/blocs/custom_bloc_observer.dart';
import 'package:foodly_world/core/blocs/location/location_bloc.dart';
import 'package:foodly_world/core/blocs/root/root_bloc.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/consts/foodly_locales.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/app_scroll_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async => runApp(await buildFoodlyApp());

Future<Widget> buildFoodlyApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final config = BaseConfig.initConfig();
  DependencyInjectionService.registerDependencies(config);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory());

  final rootBloc = RootBloc(authSessionService: di());

  di.registerLazySingleton(() => AppRouter(rootBloc: rootBloc));

  if (di<BaseConfig>().isLoggingEnabled) {
    Bloc.observer = AppBlocObserver(config: config);
  }

  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => rootBloc),
      BlocProvider(create: (context) => StartingCubit()),
      BlocProvider(create: (context) => LocalAuthCubit()),
      BlocProvider(create: (context) => LocationBloc()),
    ],
    child: MaterialApp.router(
      title: 'Foodly App',
      debugShowCheckedModeBanner: false,
      routerConfig: di<AppRouter>().appRouter,
      supportedLocales: FoodlyLocales.SUPPORTED_LOCALES,
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

        return const Locale('en', 'US');
      },
      scrollBehavior: AppScrollBehavior(),
      theme: FoodlyThemes.lightTheme(),
      darkTheme: FoodlyThemes.darkTheme(),
      themeMode: ThemeMode.light,
      builder: (context, childWidget) => ResponsiveBreakpoints.builder(
        child: childWidget ?? const StartingPage369(),
        breakpoints: DeviceSize.breakpoints,
      ),
    ),
  );
}
