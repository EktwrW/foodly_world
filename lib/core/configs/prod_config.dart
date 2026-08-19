import 'package:foodly_world/core/configs/base_config.dart';
import 'package:logger/logger.dart';

class ProdConfig extends BaseConfig {
  final String envBaseUrl;
  final String envAppRoot;
  final String envApiVersion;

  final Level envLogLevel;
  final String envGooglePlacesBaseUrl;
  final String envGoogleDefaultPublicToken;
  final bool? regPrefill;
  final String envGoogleSignInClientId;

  ProdConfig({
    required this.envLogLevel,
    required this.envBaseUrl,
    required this.envAppRoot,
    required this.envApiVersion,
    required this.envGooglePlacesBaseUrl,
    required this.envGoogleDefaultPublicToken,
    this.regPrefill,
    required this.envGoogleSignInClientId,
  });

  @override
  String get foodlyBaseUrl => envBaseUrl;

  @override
  String get foodlyAppRoot => envAppRoot;

  @override
  String get foodlyApiVersion => envApiVersion;

  @override
  Level get logLevel => envLogLevel;

  @override
  String get googlePlacesBaseUrl => envGooglePlacesBaseUrl;

  @override
  String get googleDefaultApiKey => envGoogleDefaultPublicToken;

  @override
  bool get shouldPrefillLogin => regPrefill ?? false;

  @override
  String get googleSignInClientId => envGoogleSignInClientId;

}
