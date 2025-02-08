import 'dart:async' show Timer;

import 'package:flutter/material.dart';

class ImageSliderFade extends StatefulWidget {
  const ImageSliderFade({
    super.key,
    required this.imageList,
    this.duration = const Duration(seconds: 4),
    this.fadeDuration = const Duration(seconds: 1),
  });

  final List<Widget> imageList;
  final Duration duration;
  final Duration fadeDuration;

  @override
  State<ImageSliderFade> createState() => _ImageSliderFadeState();
}

class _ImageSliderFadeState extends State<ImageSliderFade> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      widget.duration,
      (timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imageList.length;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.imageList
          .map(
            (e) => AnimatedOpacity(
              opacity: _currentIndex == widget.imageList.indexOf(e) ? 1 : 0,
              duration: widget.fadeDuration,
              curve: Curves.easeInOut,
              child: e,
            ),
          )
          .toList(),
    );
  }
}
