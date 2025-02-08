import 'package:flutter/material.dart';

class AnimatedTextLoadingDots extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration animationDuration;
  final MainAxisAlignment alignment;

  const AnimatedTextLoadingDots({
    super.key,
    required this.text,
    this.textStyle,
    this.animationDuration = Durations.medium2,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  AnimatedTextLoadingDotsState createState() => AnimatedTextLoadingDotsState();
}

class AnimatedTextLoadingDotsState extends State<AnimatedTextLoadingDots> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<int> _dotsAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration * 3,
    )..repeat();

    _dotsAnimation = IntTween(begin: 0, end: 3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotsAnimation,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.alignment,
          children: [
            Flexible(
              child: Text(
                widget.text,
                style: widget.textStyle,
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(
              width: 12,
              child: Text(
                '.'.padRight(_dotsAnimation.value, '.'),
                style: widget.textStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
