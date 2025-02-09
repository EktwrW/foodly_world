import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:google_fonts/google_fonts.dart';

class FoodlyThemes {
  const FoodlyThemes._();

  static final VisualDensity _visualDensity =
      kIsWeb ? FlexColorScheme.comfortablePlatformDensity : VisualDensity.adaptivePlatformDensity;

  //Foodly colors:
  static const primaryFoodly = Color(0xFF79005D);
  static const secondaryFoodly = Color(0xFFAF8B96);
  static const tertiaryFoodly = Color(0xFF14C45D);
  static final accentColor = const Color(0xFF79005D).lighten(20);

  //Some dark colors:
  static const backgroundDarkFoodly = Color(0xFF1B1015);
  static const secondaryDarkFoodly = Color(0xFFB9A6BD);

  //Other colors:
  static const error = Color(0xFFF31708);
  static const warning = Color(0xFFCFCC06);
  static const success = tertiaryFoodly;

  //Variances:
  static const alternativeUnselectedLightColor = Color(0xFFF1EAEF);
  static final primaryLighten73 = primaryFoodly.lighten(73);

  //Themes:
  static ThemeData lightTheme() {
    return FlexThemeData.light(
      visualDensity: _visualDensity,
      surface: Colors.white,
      useMaterial3ErrorColors: true,
      scaffoldBackground: ui.NeumoColors.background,
      appBarBackground: Colors.white,
      appBarStyle: FlexAppBarStyle.background,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryFoodly),
      colors: FlexSchemeColor.from(
        primary: primaryFoodly,
        secondary: secondaryFoodly,
        tertiary: tertiaryFoodly,
        appBarColor: primaryFoodly,
        primaryContainer: primaryFoodly,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    ).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.selected) ? primaryFoodly : primaryFoodly.withValues(alpha: 0.2),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: primaryFoodly.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return FlexThemeData.dark(
      visualDensity: _visualDensity,
      surface: backgroundDarkFoodly,
      useMaterial3ErrorColors: true,
      scaffoldBackground: backgroundDarkFoodly,
      appBarBackground: primaryFoodly,
      appBarStyle: FlexAppBarStyle.background,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryFoodly),
      colors: FlexSchemeColor.from(
        primary: primaryFoodly,
        secondary: secondaryDarkFoodly,
        tertiary: tertiaryFoodly,
        appBarColor: primaryFoodly,
        primaryContainer: primaryFoodly,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    ).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.selected) ? primaryFoodly : primaryFoodly.withValues(alpha: 0.2),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: primaryFoodly.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
    );
  }
}
