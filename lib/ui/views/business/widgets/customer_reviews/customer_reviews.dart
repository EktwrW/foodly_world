import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/review_card/review_card.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/business_titles_rich_text.dart';

class CustomerReviewsWdg extends StatelessWidget {
  final BusinessVM vm;

  const CustomerReviewsWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardSectionsTitle(
          firstText: '${S.current.dashboardReviewsOfOurCustomersText1} ',
          secondText: S.current.dashboardReviewsOfOurCustomersText2,
        ),
        Visibility(
          visible: vm.currentBusiness?.reviews?.isEmpty ?? true,
          replacement: const ReviewCard(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Asset(FoodlyAssets.noCustomerReviewsYet, width: 40),
                Flexible(
                  child: Text(
                    S.current.thereAreNoCustomerReviewsYet,
                    style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                  ).paddingTop(8),
                ),
              ],
            ).paddingVertical(16),
          ),
        ),
      ],
    );
  }
}
