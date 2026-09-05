import 'package:flutter/material.dart';

class UIDecorations {
  const UIDecorations._();

  static const BACKGROUND_GRADIENT_1 = BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFDEAF6),
      Color(0xFFF1E5EF),
      Color(0xFFFCF6FA),
      Color(0xFFFFFBFE),
    ],
  ));

  static const NEUMORPHIC_PURPLE_GRADIENT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF96006E),
      Color(0xFF79005D),
      Color(0xFF5C0047),
    ],
  );

  static final glassmorphicPurpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFFD604A8).withValues(alpha: 0.9),
      const Color(0xFFA2007F).withValues(alpha: 0.9),
      const Color(0xFF79005D).withValues(alpha: 0.85),
      const Color(0xFF630050).withValues(alpha: 0.8),
    ],
  );

  static final glassmorphicCenterPurpleGradient = RadialGradient(
    colors: [
      const Color(0xFFF80BC5).withValues(alpha: 0.9),
      const Color(0xFFD604A8).withValues(alpha: 0.9),
      const Color(0xFFA2007F).withValues(alpha: 0.9),
      const Color(0xFF79005D).withValues(alpha: 0.85),
      const Color(0xFF630050).withValues(alpha: 0.8),
    ],
  );

  /// Sombra de las tarjetas del rediseño 2026-09-04 (promos y negocios).
  ///
  /// Dos capas a propósito: una de contacto, corta y casi imperceptible, que
  /// asienta la tarjeta, y una larga y muy difusa que la despega del fondo
  /// gris. Una sola capa da o bien un borde duro o bien una nube sin apoyo.
  // ignore: non_constant_identifier_names
  static const CARD_SHADOW = [
    BoxShadow(color: Color(0x123B0A2C), blurRadius: 6, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x573B0A2C), blurRadius: 44, spreadRadius: -18, offset: Offset(0, 22)),
  ];

  /// Fondo del appbar del home (2026-09-05).
  ///
  /// Antes era blanco con `primaryFoodly` al 30% encima, o sea el morado de
  /// marca DILUIDO: #D7B3CE no era un color elegido, era lo que salía. Estos
  /// dos tonos sí se eligieron, y el degradado corto le da al header un poco
  /// de profundidad sin robarle protagonismo a las tarjetas.
  // ignore: non_constant_identifier_names
  static const HOME_APP_BAR_GRADIENT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF6E7F1), Color(0xFFE6CBE0)],
  );

  static const SNACKBAR_ROUNDED_BORDER = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  static const SLIVER_APP_BAR_BOTTOM_SHAPE = ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
  );
}
