import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';

class RatingWdg extends StatelessWidget {
  const RatingWdg({
    super.key,
    required this.vm,
  });

  final BusinessVM vm;

  @override
  Widget build(BuildContext context) {
    return FadeOutRight(
      duration: Durations.medium3,
      animate: vm.isEditingCategory,
      child: FadeInRight(
        duration: Durations.medium3,
        child: FittedBox(
          child: Column(
            children: [
              const Text.rich(TextSpan(children: [
                TextSpan(text: 'Rating Avg:', style: FoodlyTextStyles.caption),
                TextSpan(text: ' 4.3', style: FoodlyTextStyles.captionPurpleBold),
              ])),
              RatingBar.builder(
                initialRating: 4.3,
                itemSize: 18,
                minRating: 1,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 16),
                onRatingUpdate: (rating) {},
              ),
            ],
          ).paddingOnly(top: 10, right: 4),
        ),
      ),
    );
  }
}
