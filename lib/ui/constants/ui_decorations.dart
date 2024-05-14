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

  static const SNACKBAR_TOP_ROUNDED_BORDER = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  );

  static const SLIVER_APP_BAR_BOTTOM_SHAPE = ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
  );
}
