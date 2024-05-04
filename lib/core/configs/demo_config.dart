import 'package:foodly_world/core/configs/base_config.dart';
import 'package:logger/logger.dart';

class DemoConfig extends BaseConfig {
  final String envBaseUrl;
  final String envAppRoot;
  final String envApiVersion;
  final String envMain369ApiKey;
  final Level envLogLevel;
  final String envGooglePlacesBaseUrl;
  final String envGoogleDefaultPublicToken;

  DemoConfig({
    required this.envLogLevel,
    required this.envBaseUrl,
    required this.envAppRoot,
    required this.envApiVersion,
    required this.envMain369ApiKey,
    required this.envGooglePlacesBaseUrl,
    required this.envGoogleDefaultPublicToken,
  });

  @override
  String get foodlyBaseUrl => envBaseUrl;

  @override
  String get foodlyAppRoot => envAppRoot;

  @override
  String get foodlyApiVersion => envApiVersion;

  @override
  String get foodlyApiKey => envMain369ApiKey;

  @override
  Level get logLevel => envLogLevel;

  @override
  String get googlePlacesBaseUrl => envGooglePlacesBaseUrl;

  @override
  String get googleDefaultApiKey => envGoogleDefaultPublicToken;
}
