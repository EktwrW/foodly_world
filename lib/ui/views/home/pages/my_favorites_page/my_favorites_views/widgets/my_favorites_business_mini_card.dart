import 'package:clay_containers/widgets/clay_container.dart' show ClayContainer;
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart'
    show BusinessDaysExtension, BusinessStatus, BusinessStatusExtension;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/data_models/business/business_dm.dart' show BusinessDM, Day;
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart' show AvatarStyle, AvatarWidget;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;

class MyFavoritesBusinessMiniCard extends StatelessWidget {
  final Day? currentDay;
  final BusinessDM? business;

  const MyFavoritesBusinessMiniCard({super.key, this.currentDay, this.business});

  Day? get _currentDay => currentDay ?? business?.businessDays.currentDaySchedule;

  Widget _buildStatusBadge(BusinessStatus status) {
    final (text, color) = switch (status) {
      BusinessStatus.open => ('Open', FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => ('Closed', FoodlyThemes.error),
      BusinessStatus.openingSoon => ('Open Soon', FoodlyThemes.warning),
    };

    return DecoratedBox(
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: FoodlyTextStyles.labelBoldMini.copyWith(color: color, fontSize: 9.5)).paddingSymmetric(
        horizontal: 8,
        vertical: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      spread: 2,
      borderRadius: 6,
      child: Row(
        children: [
          AvatarWidget(
            avatarUrl: business?.logo,
            avatarStyle: AvatarStyle.square,
            height: 46,
            width: 46,
          ),
          Expanded(
            flex: 3,
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  business?.name ?? '-',
                  style: FoodlyTextStyles.actionsBodyBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (_currentDay != null)
                  Row(
                    spacing: 8,
                    children: [
                      _buildStatusBadge(_currentDay!.currentStatus),
                      Text(
                        _currentDay!.formattedHours,
                        style: FoodlyTextStyles.labelBoldMini,
                      ),
                    ],
                  ),
              ],
            ).paddingLeft(8),
          ),
          const Spacer(),
          if (business != null)
            SizedBox.square(
              dimension: 28,
              child: business?.categoryAvatar ?? const SizedBox.shrink(),
            ),
        ],
      ).paddingAll(6),
    ).paddingAll(8);
  }
}
