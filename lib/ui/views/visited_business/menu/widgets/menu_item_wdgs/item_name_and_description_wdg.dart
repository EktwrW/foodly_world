part of '../visited_menu_category_builder_wdg.dart';

class VisitedItemNameAndDescriptionWdg extends ui.StatelessWidget {
  const VisitedItemNameAndDescriptionWdg({
    super.key,
    required this.item,
  });

  final ItemDM item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.labelPurpleBold.copyWith(
                  letterSpacing: .75,
                  fontSize: 13,
                ),
              ).paddingTop(12),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Tooltip(
                message: item.isEditing ? '' : item.description,
                child: Text(
                  item.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.caption
                      .copyWith(fontStyle: item.description.isEmpty && item.isEditing ? FontStyle.italic : null),
                ).paddingVertical(5),
              ),
            ),
          ],
        ),
      ],
    ).paddingHorizontal(10);
  }
}
