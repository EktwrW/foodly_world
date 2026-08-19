import 'package:foodly_world/core/configs/base_config.dart';
import 'package:logger/logger.dart';

class DevConfig extends BaseConfig {
  final String envAppRoot;
  final String envBaseUrl;
  final String envApiVersion;

  final String? testUserEmail;
  final String? testUserPassword;
  final bool? regPrefill;
  final Level envLogLevel;
  final String envGooglePlacesBaseUrl;
  final String envGoogleDefaultPublicToken;
  final String envGoogleSignInClientId;

  DevConfig({
    required this.envLogLevel,
    required this.envGooglePlacesBaseUrl,
    required this.envGoogleDefaultPublicToken,
    required this.envAppRoot,
    required this.envBaseUrl,
    required this.envApiVersion,
    this.testUserEmail,
    this.testUserPassword,
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
  bool get shouldPrefillLogin => regPrefill ?? false;

  @override
  Level get logLevel => envLogLevel;

  @override
  String get googlePlacesBaseUrl => envGooglePlacesBaseUrl;

  @override
  String get googleDefaultApiKey => envGoogleDefaultPublicToken;

  @override
  String get googleSignInClientId => envGoogleSignInClientId;

}
