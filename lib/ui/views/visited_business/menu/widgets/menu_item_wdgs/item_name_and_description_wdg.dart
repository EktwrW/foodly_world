part of '../menu_category_builder_wdg.dart';

class ItemNameAndDescriptionWdg extends StatefulWidget {
  const ItemNameAndDescriptionWdg({
    super.key,
    required this.item,
    required this.menuCategory,
    required this.subCategory,
  });

  final ItemDM item;
  final MenuCategory menuCategory;
  final CategoryDM subCategory;

  @override
  State<ItemNameAndDescriptionWdg> createState() => _ItemNameAndDescriptionWdgState();
}

class _ItemNameAndDescriptionWdgState extends State<ItemNameAndDescriptionWdg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.item.name,
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
                message: widget.item.isEditing ? '' : widget.item.description,
                child: Text(
                  widget.item.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.caption.copyWith(
                      fontStyle: widget.item.description.isEmpty && widget.item.isEditing ? FontStyle.italic : null),
                ).paddingVertical(5),
              ),
            ),
          ],
        ),
      ],
    ).paddingHorizontal(10);
  }
}
