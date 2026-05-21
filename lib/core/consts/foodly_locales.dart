import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';

class FoodlyLocales {
  const FoodlyLocales._();

  /// Tag de locale del dispositivo tomado del OS vía `PlatformDispatcher`
  /// (`es`, `pt-PT`, `en-US`, …). Fuente ÚNICA para reportarle al backend en
  /// qué idioma está el dispositivo — la usan el registro del DeviceToken
  /// (`PushNotificationService`) y el fetch de notificaciones in-app
  /// (`NotificationsCubit`).
  ///
  /// Por qué NO `Intl.getCurrentLocale()`: ese getter devuelve
  /// `Intl.defaultLocale`, y si todavía es null cae al hardcodeado
  /// `Intl.systemLocale` == 'en_US'. `Intl.defaultLocale` sólo se setea
  /// cuando corre `S.load()` (al construir el primer frame de MaterialApp),
  /// y hay callers — registro del token por `onTokenRefresh`, restauración
  /// de sesión — que corren antes de eso en un arranque en frío. En esa
  /// ventana `Intl.getCurrentLocale()` devolvía 'en_US' aunque el OS
  /// estuviera en español/portugués, y el idioma incorrecto se propagaba al
  /// backend. `PlatformDispatcher.locale` viene directo del embedder y es
  /// correcto desde el arranque, sin depender de ningún paso de init.
  ///
  /// El backend acepta el tag con o sin región y normaliza a los 2 primeros
  /// caracteres (ver `Notification::normalizeLocale`), así que mandar
  /// 'pt-PT' o 'pt' es indistinto.
  static String get deviceLocaleTag {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final country = locale.countryCode;
    return (country != null && country.isNotEmpty)
        ? '${locale.languageCode}-$country'
        : locale.languageCode;
  }

  static final supportedLocales = [
    Locale(FoodlyStrings.EN, FoodlyCountries.USA.countryCode),
    Locale(FoodlyStrings.ES, FoodlyCountries.USA.countryCode),
    Locale(FoodlyStrings.ES, FoodlyCountries.ARGENTINA.countryCode),
    Locale(FoodlyStrings.EN, FoodlyCountries.ARGENTINA.countryCode),
    Locale(FoodlyStrings.ES, FoodlyCountries.VENEZUELA.countryCode),
    Locale(FoodlyStrings.EN, FoodlyCountries.VENEZUELA.countryCode),
    // Locale(FoodlyStrings.ES, FoodlyCountries.EL_SALVADOR.countryCode),
    // Locale(FoodlyStrings.EN, FoodlyCountries.EL_SALVADOR.countryCode),
    Locale(FoodlyStrings.ES, FoodlyCountries.SPAIN.countryCode),
    Locale(FoodlyStrings.EN, FoodlyCountries.SPAIN.countryCode),
    Locale(FoodlyStrings.PT, FoodlyCountries.PORTUGAL.countryCode),
    Locale(FoodlyStrings.EN, FoodlyCountries.PORTUGAL.countryCode),
    Locale(FoodlyStrings.ES, FoodlyCountries.PORTUGAL.countryCode),
    // Locale(FoodlyStrings.ES, FoodlyCountries.ECUADOR.countryCode),
    // Locale(FoodlyStrings.EN, FoodlyCountries.ECUADOR.countryCode),
  ];
}
