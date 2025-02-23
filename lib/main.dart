import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodly_world/core/core_exports.dart';

import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/cubit/main_drawer_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/drawer/main_drawer.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:foodly_world/ui/views/home/widgets/voice_search/cubit/voice_search_cubit.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
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
    storageDirectory:
        kIsWeb ? HydratedStorageDirectory.web : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  final rootBloc = RootBloc(authSessionService: di());

  di.registerLazySingleton(() => AppRouter(rootBloc: rootBloc));

  if (di<BaseConfig>().isLoggingEnabled) {
    Bloc.observer = AppBlocObserver(config: config);
  }

  OpenAI.apiKey = di<BaseConfig>().openaiApiKey;

  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => rootBloc),
      BlocProvider(create: (context) => StartingCubit()),
      BlocProvider(create: (context) => LocalAuthCubit()),
      BlocProvider(create: (context) => LocationBloc()),
      BlocProvider(create: (context) => BusinessBloc()),
      BlocProvider(create: (context) => MainDrawerCubit()),
      BlocProvider(create: (context) => VoiceSearchCubit()),
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
                  child: FoodlyWrapper(
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
    return Scaffold(
      key: _scaffoldKey,
      drawer: const FoodlyDrawer(),
      body: child,
    );
  }
}
