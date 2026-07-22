import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, AuthSessionService, di;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/network/moderation/moderation_repo.dart' show ReportableType;
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/moderation/moderation_menu_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class ReviewCard extends StatelessWidget {
  final ReviewDM review;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ReviewCard({
    super.key,
    required this.review,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final loggedUserIsAuthor = review.userUuid == di<AuthSessionService>().userSessionDM?.user.uuid;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.09),
            blurRadius: 6,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Card(
              elevation: 0,
              color: FoodlyThemes.primaryFoodly,
              child: SizedBox(
                height: 46,
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
                      ignoreGestures: true,
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellowAccent, size: 10),
                      onRatingUpdate: (_) {},
                    ).paddingOnly(top: 5),
                  ],
                ),
              )),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 103,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (review.photoUrls.isNotEmpty)
                        Flexible(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            child: FeedMultipleImageView(
                              imageUrls: review.photoUrls,
                              radius: 4,
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AvatarWidget(
                                  avatarUrl: review.userPhoto,
                                ).paddingTop(loggedUserIsAuthor ? 6 : 3),
                                Expanded(
                                  child: Text(
                                    review.userName ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: FoodlyTextStyles.labelBold,
                                  ).paddingOnly(left: 6),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(review.createdAt?.timeAgo ?? '',
                                        style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11))
                                    .paddingOnly(top: 3),
                                if (loggedUserIsAuthor)
                                  PopupMenuButton<String>(
                                    elevation: 3,
                                    icon: const Icon(Bootstrap.pencil_square,
                                        color: FoodlyThemes.primaryFoodly, size: 16),
                                    constraints: const BoxConstraints(maxWidth: 120),
                                    color: Colors.white.withValues(alpha: 0.9),
                                    style: const ButtonStyle(
                                      fixedSize: WidgetStatePropertyAll(Size(24, 24)),
                                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                      iconSize: WidgetStatePropertyAll(16),
                                    ),
                                    padding: EdgeInsets.zero,
                                    onSelected: (value) {
                                      switch (value) {
                                        case 'edit':
                                          onEdit?.call();
                                          break;
                                        case 'delete':
                                          onDelete?.call();
                                          break;
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        height: 36,
                                        value: 'edit',
                                        child: Row(
                                          children: [
                                            const Icon(Bootstrap.pencil_square,
                                                size: 16, color: FoodlyThemes.primaryFoodly),
                                            Text(
                                              S.current.edit,
                                              style: const TextStyle(color: FoodlyThemes.primaryFoodly),
                                            ).paddingLeft(8),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        height: 36,
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            const Icon(Bootstrap.trash3, size: 16, color: FoodlyThemes.primaryFoodly),
                                            Text(
                                              S.current.delete,
                                              style: const TextStyle(color: FoodlyThemes.primaryFoodly),
                                            ).paddingLeft(8),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: 3)
                                else
                                  ModerationMenuButton(
                                    type: ReportableType.review,
                                    contentUuid: review.reviewUuid ?? '',
                                    authorUuid: review.userUuid ?? '',
                                    authorName: review.userName ?? '',
                                  ).paddingOnly(left: 3),
                              ],
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(S.current.visitedOn(review.businessVisitedAt?.getShortFormat ?? '-'),
                                  style: const TextStyle(fontSize: 11)),
                            ),
                          ],
                        ).paddingOnly(left: 10, right: 6),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            review.comment ?? '',
                            style: FoodlyTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 12, right: 12, bottom: 13, top: 9),
                ),
              ],
            ),
          ).paddingOnly(top: 25),
        ],
      ),
    ).paddingSymmetric(vertical: 13);
  }
}
