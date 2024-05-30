import 'dart:developer';

import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: 12),
      style: const NeumorphicStyle(
        shape: NeumorphicShape.convex,
        intensity: .5,
        color: NeumorphicColors.embossMaxWhiteColor,
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          hintText: S.current.searchInCity(di<LocationService>().currentCity),
          prefixIcon: const Icon(Bootstrap.search, color: FoodlyThemes.primaryFoodly),
          suffixIcon: IconButton(
            icon: const Icon(Clarity.map_marker_solid, color: FoodlyThemes.primaryFoodly),
            onPressed: () {
              log('Filtro presionado');
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white30,
        ),
      ),
    );
  }
}
