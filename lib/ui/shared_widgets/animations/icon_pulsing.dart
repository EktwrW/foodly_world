import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

class PulsingMicIcon extends StatefulWidget {
  final Widget icon;
  final double? dimension;
  final bool animate;

  const PulsingMicIcon({super.key, required this.icon, this.dimension, this.animate = true});

  @override
  State<PulsingMicIcon> createState() => _PulsingMicIconState();
}

class _PulsingMicIconState extends State<PulsingMicIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) return widget.icon;

    return Stack(
      alignment: Alignment.center,
      children: [
        for (var i = 1; i <= 3; i++)
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Transform.scale(
              scale: 1 + (0.3 * i * _controller.value),
              child: SizedBox.square(
                dimension: widget.dimension ?? 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: 1 - (_controller.value * 0.9)),
                  ),
                ),
              ),
            ),
          ),
        widget.icon,
      ],
    );
  }
}
