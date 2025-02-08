import 'package:flutter/material.dart';

class FoodlyAnimatedOpacity extends StatelessWidget {
  final bool visible;
  final Widget child;
  final Duration duration;

  const FoodlyAnimatedOpacity({
    super.key,
    required this.visible,
    required this.child,
    this.duration = Durations.medium3,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: duration,
      child: child,
    );
  }
}
