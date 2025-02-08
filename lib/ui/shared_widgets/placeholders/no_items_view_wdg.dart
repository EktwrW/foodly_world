import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:google_fonts/google_fonts.dart';

class NoItemsViewWdg extends StatelessWidget {
  final String? text;
  final Widget? asset;

  const NoItemsViewWdg({super.key, this.text, this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (asset ?? const Asset(FoodlyAssets.emptyMenu, height: 70)).paddingBottom(20),
        ui.NeumoText(
          text ?? S.current.noItemsYet,
          style: const ui.NeumoStyle(color: FoodlyThemes.primaryFoodly),
          textStyle: ui.NeumoTextStyle(
            fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).paddingHorizontal(16),
      ],
    );
  }
}
