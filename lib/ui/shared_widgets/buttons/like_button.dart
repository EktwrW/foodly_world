import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

class LikeButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool liked;
  final double iconSize;
  final double diameter;
  final Color likedBackgroundColor;
  final Color unlikedBackgroundColor;
  final String? tooltip;

  const LikeButton({
    super.key,
    this.onPressed,
    required this.liked,
    this.iconSize = 20,
    this.diameter = 34,
    this.likedBackgroundColor = Colors.white60,
    this.unlikedBackgroundColor = FoodlyThemes.primaryFoodly,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? S.current.addToFavorites,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: diameter,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: liked ? likedBackgroundColor : unlikedBackgroundColor.withValues(alpha: .15),
              )),
            ),
            !liked
                ? FadeIn(
                    child: Icon(
                      FontAwesome.heart_circle_plus_solid,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: FoodlyThemes.primaryFoodly.withValues(alpha: .39),
                            offset: const Offset(1, 2),
                            blurRadius: 4.0),
                      ],
                      size: iconSize,
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      ZoomOut(
                        from: 1.6,
                        child: Icon(
                          FontAwesome.heart_circle_bolt_solid,
                          color: FoodlyThemes.favourites,
                          size: iconSize,
                        ),
                      ),
                      ElasticIn(
                        child: Icon(
                          FontAwesome.heart_circle_check_solid,
                          color: FoodlyThemes.favourites,
                          size: iconSize,
                          shadows: [
                            const Shadow(color: Colors.white30, offset: Offset(1, 2), blurRadius: 4.0),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
