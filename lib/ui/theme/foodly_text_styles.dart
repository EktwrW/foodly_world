import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicColors;
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodlyTextStyles {
  const FoodlyTextStyles._();

  static const actionsBody = TextStyle(
    fontSize: 14,
  );

  static const actionsBodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static const addressSmallText = TextStyle(fontSize: 11);

  static const bodyWhiteSemibold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const bodyLink = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w600,
  );

  static const cardTextButtonBlue = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w600,
  );

  static const caption = TextStyle(
    fontSize: 12,
  );

  static const captionWhite = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  static const captionWhiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  static const captionBold = TextStyle(
    fontSize: 12,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  static const captionPurple = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 12,
  );

  static const captionPurpleBold = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const cardSubtitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15,
    height: 1.25,
  );

  static const cardsSmallSubtitle = TextStyle(fontSize: 11);

  static const cardsHeader = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const categoryButtonText = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 10,
    height: 1.1,
  );

  static const choiceChipWhiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 11,
  );

  static const choiceChipBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 11,
  );

  static const confirmationTextPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: FoodlyThemes.primaryFoodly,
  );

  static final copyrightText = GoogleFonts.quicksand(
    fontSize: 11,
    color: const Color(0xFF3D0218),
  );

  static final dialogCloseText = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ui.NeumorphicColors.decorationMaxWhiteColor,
  );

  static const disabledText = TextStyle(
    color: ui.NeumorphicColors.disabled,
    fontSize: 14,
  );

  static final editableAvatarText = GoogleFonts.quicksand(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.accentColor,
  );

  static const errorBodyText = TextStyle(
    color: FoodlyThemes.error,
  );

  static const errorInputText = TextStyle(
    color: FoodlyThemes.error,
    fontSize: 10,
    letterSpacing: 0,
  );

  static const footerButtonNormal = TextStyle(
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.primaryFoodly,
  );

  static const footerButtonSmall = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10.5,
    color: FoodlyThemes.primaryFoodly,
  );

  /// El texto de sugerencia de los inputs.
  ///
  /// Usa `secondaryFoodlyText` y no `secondaryFoodly` porque un hint ES texto y
  /// le aplica el 4.5:1 de la WCAG — el de marca da 2.76:1 sobre blanco. Sigue
  /// leyéndose como sugerencia y no como valor escrito: lo tecleado va casi en
  /// negro (16:1), así que la diferencia de peso se mantiene entera.
  static const hintText = TextStyle(
    color: FoodlyThemes.secondaryFoodlyText,
    fontSize: 14,
  );

  /// El saludo del appbar del home.
  ///
  /// Antes era `homeAppBarSmallSubtitle` con `copyWith(fontSize: 24)`: el
  /// saludo y la pregunta de debajo eran LITERALMENTE el mismo estilo a dos
  /// tamaños, así que no había jerarquía, solo escala. Ahora el saludo es
  /// Poppins 800 en el ciruela de los títulos de tarjeta, y la pregunta baja a
  /// voz de apoyo — ver [homeGreetingSubtitle].
  static const homeGreeting = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.44,
    height: 1.2,
    color: FoodlyThemes.titleOnGlass,
  );

  static final homeGreetingSubtitle = GoogleFonts.quicksand(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.secondaryFoodlyTextOnTint,
  );

  static final homeAppBarSmallSubtitle = GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black.withValues(alpha: .85),
  );

  static const inputTextValue = TextStyle(
    color: Colors.black87,
    fontSize: 14,
  );

  static const itemPriceBold = TextStyle(
    fontSize: 11,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  static const itemPricePurpleBold = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );

  static const label = TextStyle(
    color: Colors.black87,
    fontSize: 13,
  );

  static const labelBold = TextStyle(
    fontSize: 13,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  static const labelPurpleBold = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static const labelBoldMini = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static const loginCTATextButton = TextStyle(
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.primaryFoodly,
  );

  static final loginPrimaryCTA = GoogleFonts.quicksand(
    fontWeight: FontWeight.bold,
  );

  static final menuTitle = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static const multiImageItemsLeft = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const primaryBodyBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static const primaryBodySemiBold = TextStyle(
    fontWeight: FontWeight.w500,
    color: FoodlyThemes.primaryFoodly,
  );

  static const primaryBodySemiBoldBlack = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static const profileSectionPrivacyNotes = TextStyle(
    fontSize: 10.5,
  );

  static const profileSectionTextButton = TextStyle(
    fontStyle: FontStyle.italic,
  );

  static const profileSectionTitle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const profileSectionTitleGreen = TextStyle(
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.tertiaryFoodly,
  );

  static const profileSectionTitlePurple = TextStyle(
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.primaryFoodly,
  );

  static const promoBusinessName = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  /// Título de la promo sobre la cinta de vidrio.
  ///
  /// El gancho tiene que ganarle al cuerpo por peso, no por 3px: antes iban
  /// 17/700 contra 14/500 y la card se leía plana.
  static const promoTitleOnGlass = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.35,
    height: 1.16,
    color: FoodlyThemes.titleOnGlass,
  );

  static final promoSubtitleOnGlass = GoogleFonts.quicksand(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    height: 1.45,
    color: FoodlyThemes.promoSubtitleOnGlass,
  );

  static const cardDescription = TextStyle(
    fontSize: 14,
    height: 1.62,
    color: FoodlyThemes.promoBody,
  );

  /// Nombre del negocio sobre la cinta de vidrio. Misma familia que
  /// `promoTitleOnGlass` pero un punto más chico: acá el nombre convive con el
  /// logo y las estrellas, no es el gancho único de la tarjeta.
  static const businessNameOnGlass = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.22,
    height: 1.18,
    color: FoodlyThemes.titleOnGlass,
  );

  /// Texto de las pastillas de la tarjeta (la ubicación del negocio).
  static const chipLabel = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: FoodlyThemes.primaryFoodly,
  );

  /// Etiqueta del botón de la tarjeta ("+ info").
  static const cardActionLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const promoDate = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: FoodlyThemes.primaryFoodly,
  );

  static const promoSectionLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
    color: FoodlyThemes.secondaryFoodlyText,
  );

  static const promoDayOff = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: FoodlyThemes.promoDayOffText,
  );

  static const promoShareLabel = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final promoTitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.green[900]?.withValues(alpha: .85),
  );

  static const sectionsTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: FoodlyThemes.primaryFoodly,
  );

  static final secondaryTitle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black.withValues(alpha: .65),
  );

  static final signUpSubtitle = GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static final snackBarLightBody = TextStyle(
    fontSize: 15,
    color: FoodlyThemes.primaryFoodly.withValues(alpha: .85),
  );

  static final snackBarPrimaryButton = GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ui.NeumorphicColors.defaultTextColor,
  );

  static final subTitleWhite = GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const toogleButtonText = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );

  static const visitBusinessBody = TextStyle(
    color: FoodlyThemes.primaryFoodly,
    fontSize: 14,
  );
}
