import 'package:foodly_world/core/enums/foodly_countries.dart';

class FoodlyRegex {
  const FoodlyRegex._();

  static const Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const Pattern passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\W_]).{8,}$';

  static const Pattern userNamePattern = r'^[a-zA-Z0-9_]+ *$';

  static const Pattern onlyLettersPattern = r'^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]+ *$';

  static const Pattern phoneCleanUpCode = r'[()\s-]';

  static final postalCodeRegex = {
    /// United States: 5 digits, optionally followed by a dash and 4 additional digits
    FoodlyCountries.USA.countryCode: r'^\d{5}(-\d{4})?$',

    /// Argentina: optionally one letter at the beginning, exactly 4 digits, optionally up to three letters at the end
    FoodlyCountries.ARGENTINA.countryCode: r'^[A-Z]?\d{4}[A-Z]{0,3}$',

    /// Venezuela: 4 digits
    FoodlyCountries.VENEZUELA.countryCode: r'^\d{4}$',

    /// El Salvador: 4 digits
    //FoodlyCountries.EL_SALVADOR.countryCode: r'^\d{4}$',

    /// Spain: 5 digits
    FoodlyCountries.SPAIN.countryCode: r'^\d{5}$',

    /// Portugal: 4 digits, optionally followed by a dash and 3 additional digits
    FoodlyCountries.PORTUGAL.countryCode: r'^\d{4}(-\d{3})?$',
  };

  static final phoneNumberRegex = {
    /// United States: 3 digits for the area code, followed by 3 digits, then 4 digits, optionally separated by dashes:
    FoodlyCountries.USA.countryCode: r'^\d{3}-?\d{3}-?\d{4}$',

    /// Argentina: Between 2 and 4 digits for the area code, followed by 6 to 8 digits for the local number, with or without a dash:
    FoodlyCountries.ARGENTINA.countryCode: r'^(\d{2,4})-?\d{6,8}$',

    /// Venezuela: 2 or 3 digits for the area code (optionally preceded by 0), followed by 7 digits for the local number, with or without a dash:
    FoodlyCountries.VENEZUELA.countryCode: r'^0?\d{2,3}-?\d{7}$',

    /// El Salvador: 4 digits for the area code, followed by 4 digits for the local number, with or without a dash:
    //FoodlyCountries.EL_SALVADOR.countryCode: r'^\d{4}-?\d{4}$',

    /// Spain: 2 or 3 digits for the area code, followed by 6 or 7 digits for the local number, with or without a dash:
    FoodlyCountries.SPAIN.countryCode: r'^\d{2,3}-?\d{6,7}$',

    /// Portugal: 2 or 3 digits for the area code, followed by 6 or 7 digits for the local number, with or without a dash:
    FoodlyCountries.PORTUGAL.countryCode: r'^\d{2,3}-?\d{6,7}$',
  };
}
