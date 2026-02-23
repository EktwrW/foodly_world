import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, AuthSessionService, di;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class ReviewCard extends StatelessWidget {
  final ReviewDM review;

  const ReviewCard({super.key, required this.review});

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
                    initialRating: review.rating.toDouble(),
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
                height: 120,
                child: Row(
                  children: [
                    if (review.photoUrls.isNotEmpty)
                      Flexible(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                          child: FeedMultipleImageView(
                            imageUrls: review.photoUrls,
                            radius: 4,
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AvatarWidget(
                                avatarUrl: review.userPhoto,
                              ),
                              Expanded(
                                child: Text(
                                  review.userName ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: FoodlyTextStyles.labelBold,
                                ).paddingOnly(left: 6),
                              ),
                              if (review.userUuid == di<AuthSessionService>().userSessionDM?.user.uuid)
                                CustomRoundedNeumorphicButton(
                                  onPressed: () {},
                                  iconData: Icons.more_vert_outlined,
                                  diameter: 20,
                                  iconSize: 22,
                                  padding: const EdgeInsets.all(4),
                                ).paddingOnly(bottom: 16, left: 4),
                            ],
                          ).paddingOnly(top: 6),
                          Text(review.createdAt?.timeAgo ?? '',
                                  style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11))
                              .paddingOnly(top: 8),
                          Text('Visitado el ${review.businessVisitedAt?.getShortFormat ?? '-'}',
                              style: const TextStyle(fontSize: 11.5)),
                        ],
                      ).paddingHorizontal(12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 102,
                  child: SingleChildScrollView(
                    child: Text((review.comment ?? '') * 8,
                        style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic)),
                  ),
                ).paddingAll(12),
              ),
            ],
          ),
        ).paddingOnly(top: 25),
      ],
    ).paddingTop(10);
  }
}
