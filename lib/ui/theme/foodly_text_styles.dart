import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui show NeumorphicColors;

class FoodlyTextStyles {
  const FoodlyTextStyles._();

  static final editableAvatarText = GoogleFonts.quicksand(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.accentColor,
  );

  static const errorBodyText = TextStyle(
    color: FoodlyThemes.error,
  );

  static const multiImageItemsLeft = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static final snackBarPrimaryButton = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ui.NeumorphicColors.defaultTextColor,
  );

  static const sectionsTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: FoodlyThemes.primaryFoodly,
  );

  static final homeAppBarMobile = GoogleFonts.quicksand(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(.85),
  );

  static const categoryButtonText = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 10,
    height: 1.1,
  );

  static const promoSubtitle = TextStyle(fontSize: 11);

  static final promoTitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.green[900]?.withOpacity(.85),
  );

  static final promoBusinessName = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(.75),
  );

  static const cardTextButtonBlue = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w600,
  );

  static const captionWhite = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  static const cardSubtitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15,
    height: 1.25,
  );

  static const cardsHeader = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const actionsBody = TextStyle(
    fontSize: 16,
  );

  static const actionsBodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static const hintText = TextStyle(
    color: FoodlyThemes.secondaryFoodly,
    fontSize: 16,
  );

  static const inputTextValue = TextStyle(
    color: Colors.black87,
    fontSize: 16,
  );

  static const disabledText = TextStyle(
    color: ui.NeumorphicColors.disabled,
    fontSize: 16,
  );

  static final signUpSubtitle = GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const confirmationTextPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: FoodlyThemes.primaryFoodly,
  );

  static const snackBarLightBody = TextStyle(
    fontSize: 16,
    color: FoodlyThemes.secondaryFoodly,
  );

  static const loginCTATextButton = TextStyle(
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.primaryFoodly,
  );

  static final loginPrimaryCTA = GoogleFonts.quicksand(
    fontWeight: FontWeight.bold,
  );

  static final secondaryTitle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(.65),
  );

  static final copyrightText = GoogleFonts.quicksand(
    fontSize: 11,
    color: const Color(0xFF3D0218),
  );

  static const primaryBodyBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static final dialogCloseText = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ui.NeumorphicColors.decorationMaxWhiteColor,
  );
}
