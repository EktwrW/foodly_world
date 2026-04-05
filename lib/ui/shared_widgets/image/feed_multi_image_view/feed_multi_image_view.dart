import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart' show rootNavigatorKey;
import 'package:foodly_world/ui/shared_widgets/image/post_image_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

part '../feed_multi_image_view/image_viewer.dart';
part '../feed_multi_image_view/multiple_image_view.dart';

class FeedMultipleImageView extends StatelessWidget {
  final List<String> imageUrls;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final double radius;

  const FeedMultipleImageView({
    super.key,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.radius = 10,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    final ctx = rootNavigatorKey.currentContext;
    if (ctx == null) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, costraints) => GestureDetector(
        child: MultipleImageView(imageUrls: imageUrls, radius: radius),
        onTap: () => Navigator.push(
          ctx,
          PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            barrierColor: Colors.transparent,
            pageBuilder: (_, __, ___) => ImageViewer(imageUrls: imageUrls),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
      ),
    );
  }
}
