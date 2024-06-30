import 'package:flutter/material.dart' show Locale;
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';

class FoodlyLocales {
  const FoodlyLocales._();

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
  ];
}
