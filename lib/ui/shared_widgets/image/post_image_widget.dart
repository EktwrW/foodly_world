import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class PostImageWidget extends StatelessWidget {
  final String src;
  final BoxFit? fit;
  final bool isPost;
  final double? radius;

  const PostImageWidget(this.src, {super.key, this.fit, this.isPost = false, this.radius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: src,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 40,
              child: CircularProgressIndicator.adaptive(backgroundColor: FoodlyThemes.secondaryFoodly),
            ),
          ],
        );
      },
      errorWidget: (_, e, a) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            e,
            style: FoodlyTextStyles.errorBodyText,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
