part of '../dialogs/dialog_service.dart';

class LoadingWidgetFoodlyLogo extends StatefulWidget {
  const LoadingWidgetFoodlyLogo({super.key});

  @override
  LoadingWidgetFoodlyLogoState createState() => LoadingWidgetFoodlyLogoState();
}

class LoadingWidgetFoodlyLogoState extends State<LoadingWidgetFoodlyLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _opacityAnimations;
  static const _numberOfImages = 6;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );

    // Create an opacity animation for each image
    _opacityAnimations = List.generate(_numberOfImages, (index) {
      final start = index / _numberOfImages;
      final end = (index + 1) / _numberOfImages;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(
              _numberOfImages,
              (index) => FadeTransition(
                opacity: _opacityAnimations[index],
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 150),
                  child: UILoading.FOODLY_LOGOS[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
