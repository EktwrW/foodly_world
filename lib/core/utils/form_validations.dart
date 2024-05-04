import 'package:foodly_world/core/consts/foodly_regex.dart';

class FormValidations {
  FormValidations._();

  static bool isUserNameValid(String value) => RegExp(FoodlyRegex.userNamePattern as String).hasMatch(value);

  static bool isNameValid(String value) => RegExp(FoodlyRegex.onlyLettersPattern as String).hasMatch(value);

  static bool isEmailValid(String value) => RegExp(FoodlyRegex.emailPattern as String).hasMatch(value);

  static bool isPasswordValid(String? password) =>
      password == null ? false : RegExp(FoodlyRegex.passwordPattern as String).hasMatch(password);

  static bool validateFormWithCountryCode(
    String phoneNumber,
    String countryCode,
    Map<String, String> mapRegex,
  ) {
    if (mapRegex.containsKey(countryCode)) {
      final pattern = mapRegex[countryCode] as String;
      final regex = RegExp(pattern);

      return regex.hasMatch(phoneNumber);
    }

    return false;
  }
}
