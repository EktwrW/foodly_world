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

  // ignore: non_constant_identifier_names
  static final GLASSMORPHIC_PURPLE_GRADIENT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF8F006F).withValues(alpha: 0.9),
      const Color(0xFF79005D).withValues(alpha: 0.85),
      const Color(0xFF630050).withValues(alpha: 0.8),
    ],
  );

  static const SNACKBAR_ROUNDED_BORDER = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  static const SLIVER_APP_BAR_BOTTOM_SHAPE = ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
  );
}
