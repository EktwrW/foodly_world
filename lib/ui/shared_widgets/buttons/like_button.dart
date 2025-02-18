import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

class LikeButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool liked;
  final double? iconSize;
  final double? diameter;
  final ButtonStyle? style;

  const LikeButton({
    super.key,
    this.onPressed,
    required this.liked,
    this.iconSize,
    this.diameter,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.white.withValues(alpha: liked ? 0.6 : 0.3),
              ),
              padding: const WidgetStatePropertyAll(EdgeInsets.zero),
              fixedSize: const WidgetStatePropertyAll(Size(20, 20))),
      tooltip: S.current.addToFavorites,
      icon: !liked
          ? FadeIn(
              child: Icon(
                FontAwesome.heart_circle_plus_solid,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    offset: const Offset(1, 2),
                    blurRadius: 4.0,
                  ),
                ],
                size: iconSize ?? 22,
              ),
            )
          : Stack(
              children: [
                ZoomOut(
                  from: 1.3,
                  child: Icon(
                    FontAwesome.heart_circle_check_solid,
                    color: FoodlyThemes.favourites,
                    size: iconSize ?? 22,
                  ),
                ),
                ElasticIn(
                  child: Icon(
                    FontAwesome.heart_circle_check_solid,
                    color: FoodlyThemes.favourites,
                    size: iconSize ?? 22,
                    shadows: [
                      Shadow(
                        color: Colors.white.withValues(alpha: 0.3),
                        offset: const Offset(1, 2),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
