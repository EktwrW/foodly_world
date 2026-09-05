import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:google_fonts/google_fonts.dart';

class FoodlyThemes {
  const FoodlyThemes._();

  static final VisualDensity _visualDensity = VisualDensity.standard;

  //Foodly colors:
  static const primaryFoodly = Color(0xFF79005D);
  static const secondaryFoodly = Color(0xFFAF8B96);

  /// `secondaryFoodly` para TEXTO: mismo tono (342°) y misma saturación (18%),
  /// bajado de 62% a 44% de luz.
  ///
  /// POR QUÉ EXISTE. `secondaryFoodly` sobre blanco da 2.76:1 y no llega al
  /// mínimo de 4.5:1 que la WCAG pide para texto por debajo de ~18px — con
  /// alpha encima, 2.49:1. No es un tecnicismo: la pantalla de sesiones salió
  /// así y no se podía leer (2026-08-28). Este tono da 5.63:1 sobre blanco y
  /// 5.14:1 sobre el gris de fondo, con margen para no quedar al filo.
  ///
  /// Se usa para TEXTO. Para bordes, iconos decorativos y fondos teñidos sigue
  /// valiendo `secondaryFoodly`: ahí no hay nada que leer.
  static const secondaryFoodlyText = Color(0xFF855C68);
  static const tertiaryFoodly = Color(0xFF14C45D);
  /// `secondaryFoodlyText` no alcanza sobre fondos teñidos: sobre el extremo
  /// oscuro del degradado del appbar (#E6CBE0) da 3,75:1, por debajo del 4,5:1
  /// que pide la WCAG a 13px. Este es el mismo tono, más oscuro: 5,0:1 ahí y
  /// 7,5:1 sobre blanco. Ver [secondaryFoodlyText] para el caso sobre blanco.
  static const secondaryFoodlyTextOnTint = Color(0xFF6E4A55);

  static final accentColor = const Color(0xFF79005D).lighten(20);

  //Some dark colors:
  static const backgroundDarkFoodly = Color(0xFF1B1015);
  static const secondaryDarkFoodly = Color(0xFFB9A6BD);

  //Other colors:
  static const error = Color(0xFFF31708);
  static const warning = Color(0xFFCFCC06);
  static const success = tertiaryFoodly;

  //Promos (rediseño de la card, 2026-09-04):
  /// Ciruela profundo para el título sobre la cinta de vidrio: lo usan la
  /// card de promo y la de negocio.
  ///
  /// `primaryFoodly` a 23px sobre vidrio blanco al 74% se lee lavado. Este
  /// tono conserva el matiz de marca y baja la luz: 15.6:1 sobre blanco y
  /// 8.3:1 en el peor caso (vidrio claro sobre una foto negra, que queda en
  /// #BDBDBD). Es lo que hace que el gancho pese más que el cuerpo.
  static const titleOnGlass = Color(0xFF4A0039);

  /// Subtítulo sobre la misma cinta. 4.7:1 contra ese mismo peor caso, que
  /// es el mínimo AA para 13.5px.
  static const promoSubtitleOnGlass = Color(0xFF53464F);

  /// Tinta del cuerpo de la promo: casi negro con una punta de ciruela para
  /// que no choque con el morado de marca. 14.9:1 sobre blanco.
  static const promoBody = Color(0xFF2E2430);

  /// Fondo del día en el que la promo NO aplica.
  static const promoDayOff = Color(0xFFEDE3EA);

  /// Texto del día inactivo sobre `promoDayOff` (5:1).
  static const promoDayOffText = Color(0xFF7A5766);

  //Variances:
  static const alternativeUnselectedLightColor = Color(0xFFF1EAEF);
  static final primaryLighten73 = primaryFoodly.lighten(73);
  static const favourites = primaryFoodly;

  //Themes:
  /// Tooltip Foodly (refinamiento pre-F4a): burbuja plum redondeada con
  /// Poppins blanco — reemplaza el gris genérico de Material en TODA la app.
  static TooltipThemeData get _tooltipTheme => TooltipThemeData(
        decoration: BoxDecoration(
          color: primaryFoodly,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primaryFoodly.withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        textStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        preferBelow: false,
      );

  static ThemeData lightTheme() {
    return FlexThemeData.light(
      visualDensity: _visualDensity,
      surface: Colors.white,
      useMaterial3ErrorColors: true,
      scaffoldBackground: ui.NeumorphicColors.background,
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
      tooltipTheme: _tooltipTheme,
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
      progressIndicatorTheme: const ProgressIndicatorThemeData(strokeCap: StrokeCap.round),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: primaryFoodly),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: error),
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
      tooltipTheme: _tooltipTheme,
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
      progressIndicatorTheme: const ProgressIndicatorThemeData(strokeCap: StrokeCap.round),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: primaryFoodly),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: error),
        ),
      ),
    );
  }
}
