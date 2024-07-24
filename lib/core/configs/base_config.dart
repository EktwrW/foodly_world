import 'package:foodly_world/core/configs/demo_config.dart';
import 'package:foodly_world/core/configs/dev_config.dart';
import 'package:foodly_world/core/configs/prod_config.dart';
import 'package:foodly_world/core/extensions/string_extensions.dart';
import 'package:logger/logger.dart';

abstract class BaseConfig {
  String get foodlyBaseUrl => '';
  String get foodlyAppRoot => '';
  String get foodlyApiVersion => '';
  String get foodlyApiKey => '';
  bool get shouldPrefillLogin => false;
  (String, String) get testUser => ('', '');
  String get googlePlacesBaseUrl => '';
  String get googleDefaultApiKey => '';
  String get googleSignInClientId => '';

  Environment get environment => this is ProdConfig
      ? Environment.prod
      : (this is DemoConfig)
          ? Environment.demo
          : Environment.dev;

  Level get logLevel => Level.off;
  bool get isLoggingEnabled => logLevel != Level.off && Level.values.contains(logLevel);

  bool get isDev => environment == Environment.dev;
  bool get isProd => environment == Environment.prod;
  bool get isDemo => environment == Environment.demo;

  static BaseConfig initConfig() {
    final env = const String.fromEnvironment('ENV', defaultValue: 'dev').toLowerCase().toEnvironment();
    final baseUrl = const String.fromEnvironment('DOMAIN').toLowerCase();
    final appRoot = const String.fromEnvironment('APP_ROOT').toLowerCase();
    final apiVersion = const String.fromEnvironment('API_VERSION').toLowerCase();
    const apiKey = String.fromEnvironment('API_KEY');
    const testUserEmail = String.fromEnvironment('LOG_EMAIL');
    const testUserPassword = String.fromEnvironment('LOG_PASS');
    const regPrefill = bool.fromEnvironment('REG_PREFILL');
    final logLevel = const String.fromEnvironment('LOGGER_LEVEL').toLogLevel();
    const googlePlacesBaseUrl = String.fromEnvironment('GOOGLE_MAPS_GEOCODING_URL');
    const googleDefaultApiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');
    const googleSignInClientId = String.fromEnvironment('GOOGLE_SIGN_IN_CLIENT_ID');

    late final BaseConfig config;
    switch (env) {
      case Environment.prod:
        config = ProdConfig(
          envBaseUrl: baseUrl,
          envAppRoot: appRoot,
          envApiVersion: apiVersion,
          envMain369ApiKey: apiKey,
          regPrefill: regPrefill,
          envLogLevel: logLevel,
          envGooglePlacesBaseUrl: googlePlacesBaseUrl,
          envGoogleDefaultPublicToken: googleDefaultApiKey,
          envGoogleSignInClientId: googleSignInClientId,
        );
        break;
      case Environment.demo:
        config = DemoConfig(
          envBaseUrl: baseUrl,
          envAppRoot: appRoot,
          envApiVersion: apiVersion,
          envMain369ApiKey: apiKey,
          envLogLevel: logLevel,
          envGooglePlacesBaseUrl: googlePlacesBaseUrl,
          envGoogleDefaultPublicToken: googleDefaultApiKey,
          envGoogleSignInClientId: googleSignInClientId,
        );
        break;
      case Environment.dev:
      default:
        config = DevConfig(
          envBaseUrl: baseUrl,
          envAppRoot: appRoot,
          envApiVersion: apiVersion,
          envMain369ApiKey: apiKey,
          testUserEmail: testUserEmail,
          testUserPassword: testUserPassword,
          regPrefill: regPrefill,
          envLogLevel: logLevel,
          envGooglePlacesBaseUrl: googlePlacesBaseUrl,
          envGoogleDefaultPublicToken: googleDefaultApiKey,
          envGoogleSignInClientId: googleSignInClientId,
        );
    }
    return config;
  }

  @override
  String toString() => 'BaseConfig{environment: $environment}';
}

enum Environment { dev, prod, demo }

extension StringEnvironmentExtension on String {
  Environment toEnvironment() =>
      Environment.values.firstWhere((e) => e.name == toLowerCase(), orElse: () => Environment.dev);
}
