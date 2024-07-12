import 'package:flutter/material.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

class LikeWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool like;

  const LikeWidget({
    super.key,
    this.onPressed,
    required this.like,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButtonMobileFoodly(
      diameter: 20,
      depth: .5,
      shape: ui.NeumorphicShape.concave,
      buttonColor: like ? Colors.black38 : Colors.white60,
      iconData: like ? FontAwesome.heart_circle_check_solid : FontAwesome.heart_circle_plus_solid,
      iconSize: 20,
      iconColor: like ? const Color(0xFFFC1908) : Colors.white70,
      onPressed: onPressed,
    );
  }
}
