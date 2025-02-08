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

  /// Valida si una URL es de YouTube y tiene un formato válido
  static bool isYoutubeUrlValid(String url) {
    try {
      final trimmedUrl = url.trim();

      // Si está vacía no es válida
      if (trimmedUrl.isEmpty) return false;

      // Validar que sea una URL válida
      final uri = Uri.tryParse(trimmedUrl);
      if (uri == null) return false;

      // Formatos válidos:
      // 1. youtube.com/watch?v=VIDEO_ID
      // 2. youtu.be/VIDEO_ID
      // 3. youtube.com/v/VIDEO_ID
      // 4. youtube.com/embed/VIDEO_ID

      final isYoutubeDomain = uri.host.contains('youtube.com') || uri.host.contains('youtu.be');
      if (!isYoutubeDomain) return false;

      String? videoId;

      if (uri.host.contains('youtu.be')) {
        // Formato corto
        videoId = uri.pathSegments.firstOrNull;
      } else {
        // Formatos regulares
        if (uri.path.contains('watch')) {
          videoId = uri.queryParameters['v'];
        } else if (uri.path.contains('embed') || uri.path.contains('v/')) {
          videoId = uri.pathSegments.lastOrNull;
        }
      }

      // El ID de video debe existir y tener entre 11 y 12 caracteres
      return videoId != null && videoId.length >= 11 && videoId.length <= 12;
    } catch (e) {
      return false;
    }
  }
}
