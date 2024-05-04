import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';

class FoodlyLogoIconBehavior extends StatelessWidget {
  final BoxFit? fit;
  final double? height;
  final FoodlyLogoVersion? version;

  const FoodlyLogoIconBehavior(
      {super.key,
      this.fit,
      this.height,
      this.version = FoodlyLogoVersion.original});

  @override
  Widget build(BuildContext context) => AnimatedCrossFade(
        duration: const Duration(milliseconds: 400),
        crossFadeState: version == FoodlyLogoVersion.original
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: SizedBox(
            height: height ?? 25,
            child: Asset(FoodlyAssets.isoFoodly, fit: fit)),
        secondChild: Opacity(
            opacity: .75,
            child: SizedBox(
                height: height ?? 25,
                child: Asset(FoodlyAssets.isoFoodlyBlack, fit: fit))),
      );
}

enum FoodlyLogoVersion { original, black }
