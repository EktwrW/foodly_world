import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_mocks.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Card(
            color: FoodlyThemes.primaryFoodly,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 3.5,
                    itemSize: 16,
                    minRating: 1,
                    allowHalfRating: true,
                    unratedColor: Colors.white38,
                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellowAccent, size: 10),
                    onRatingUpdate: (rating) {},
                  ).paddingOnly(top: 5),
                ],
              ),
            )),
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                        child: FeedMultipleImageView(
                          imageUrls: FoodlyMocks.REVIEW_PICTURES_1,
                          radius: 4,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Fecha de Publicacion:',
                            style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic)),
                        const Text('25 - 12 - 2023', style: FoodlyTextStyles.captionBold),
                        Text('Visitado el:', style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic))
                            .paddingTop(10),
                        const Text('24 - 12 - 2024', style: FoodlyTextStyles.captionBold)
                      ],
                    ).paddingHorizontal(16),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: AvatarWidget(
                        avatarUrl: 'https://hips.hearstapps.com/hmg-prod/images/gettyimages-150327735-copy.jpg',
                        width: 40,
                      ),
                    ),
                    const Text(
                      'Nombre del Usuario Autor',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: FoodlyTextStyles.cardSubtitle,
                    ).paddingOnly(left: 12),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_outlined, color: FoodlyThemes.primaryFoodly)),
                  ],
                ).paddingOnly(left: 12, right: 10, top: 6),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in.",
                        style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic)),
                  ),
                ],
              ).paddingHorizontal(12),
            ],
          ).paddingBottom(12),
        ).paddingOnly(top: 25),
      ],
    ).paddingTop(10);
  }
}
