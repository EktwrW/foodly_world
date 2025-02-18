import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

class LikeWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool liked;
  final double? iconSize;
  final double? diameter;

  const LikeWidget({
    super.key,
    this.onPressed,
    required this.liked,
    this.iconSize,
    this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedNeumorphicButton(
      diameter: diameter ?? 20,
      depth: 0,
      tooltip: S.current.addToFavorites,
      shape: liked ? ui.NeumoShape.concave : ui.NeumoShape.flat,
      buttonColor: liked ? Colors.white70 : FoodlyThemes.primaryFoodly.withValues(alpha: .7),
      iconData: liked ? FontAwesome.heart_circle_check_solid : FontAwesome.heart_circle_plus_solid,
      iconSize: iconSize ?? 20,
      iconColor: liked ? FoodlyThemes.favourites : FoodlyThemes.alternativeUnselectedLightColor,
      onPressed: onPressed,
      padding: const EdgeInsets.fromLTRB(6, 6, 8, 7),
    );
  }
}

class FoodlyFavButton extends StatelessWidget {
  final bool isFav;
  final void Function()? onPressed;
  final ButtonStyle? style;
  final double? iconSize;

  const FoodlyFavButton({super.key, required this.isFav, this.onPressed, this.style, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: style,
      tooltip: S.current.addToFavorites,
      color: Colors.transparent,
      icon: Icon(
        isFav ? FontAwesome.heart_circle_plus_solid : FontAwesome.heart_circle_check_solid,
        color: isFav ? const Color(0xFFB5B4B4) : FoodlyThemes.primaryFoodly,
        size: iconSize ?? 22,
      ),
    );
  }
}
