import 'dart:developer';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome, Bootstrap;

class MenuFloatingActionButton extends StatelessWidget {
  const MenuFloatingActionButton({
    super.key,
    required this.floatingButtonKey,
  });

  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FabCircularMenuPlus(
        key: floatingButtonKey,
        // Cannot be `Alignment.center`
        ringColor: FoodlyThemes.primaryFoodly.withAlpha(40),
        ringDiameter: 400.0,
        ringWidth: 100.0,
        fabSize: 54,
        fabElevation: 7.0,
        fabIconBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        fabColor: FoodlyThemes.primaryFoodly,
        fabOpenIcon: const Icon(Icons.menu_open_outlined, color: Colors.white),
        fabCloseIcon: const Icon(Icons.close_outlined, color: Colors.white),
        animationDuration: Durations.extralong1,
        onDisplayChange: (isOpen) {
          log('The menu is open: $isOpen');
        },
        children: <Widget>[
          RoundedButtonMobileFoodly(
            onPressed: () {
              log('You pressed 1');
            },
            iconSize: 24,
            depth: 4,
            iconData: FontAwesome.share_from_square_solid,
          ),
          RoundedButtonMobileFoodly(
            onPressed: () {
              log('You pressed 2');
            },
            iconSize: 26,
            depth: 4,
            iconData: Icons.qr_code_2,
          ),
          RoundedButtonMobileFoodly(
            onPressed: () {
              log('You pressed 3');
            },
            iconSize: 25,
            depth: 4,
            iconData: Bootstrap.bookmark_heart_fill,
          ),
        ],
      ),
    );
  }
}
