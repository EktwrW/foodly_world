part of '../menu_category_builder_wdg.dart';

class MenuItemWdg extends StatelessWidget {
  const MenuItemWdg({
    super.key,
    required this.subCategory,
    required this.menuCategory,
    required this.vm,
    required this.item,
    required this.isLastScreenItem,
  });

  final CategoryDM subCategory;
  final MenuCategory menuCategory;
  final MenuVM vm;
  final ItemDM item;
  final bool isLastScreenItem;

  static const _itemHeight = 164.0;
  static const _editingItemHeight = 294.0;

  Widget get _currencyWidget => Text('${vm.currency}:', style: FoodlyTextStyles.label);
  bool get _itemNotAvailable => !item.available && !vm.editMode;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();

    return Opacity(
      opacity: _itemNotAvailable ? .5 : 1,
      child: Column(
        children: [
          AnimatedSize(
            duration: Durations.medium4,
            child: SizedBox(
              height: item.isEditing ? _editingItemHeight : _itemHeight,
              child: Card(
                elevation: 2,
                color: ui.NeumorphicColors.decorationMaxWhiteColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.only(right: 5, left: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItemPictureWdg(
                          isEditing: item.isEditing,
                          item: item,
                          menuCategory: menuCategory,
                          subCategory: subCategory,
                        ),
                        Expanded(
                          flex: 9,
                          child: ItemNameAndDescriptionWdg(
                            item: item,
                            cubit: cubit,
                            menuCategory: menuCategory,
                            subCategory: subCategory,
                          ),
                        ),
                        FavAndEditItemBtns(subCategory: subCategory, item: item, menuCategory: menuCategory)
                            .paddingAll(2),
                      ],
                    ),
                    if (item.isEditing)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox.fromSize(
                                size: const Size(124, 104),
                                child: ToggleButtons(
                                  onPressed: (index) async {
                                    final version = Version.values[index];
                                    cubit.toggleItemVersion(item, menuCategory, subCategory.uuid, version);
                                    await Future.delayed(Durations.short3);
                                    version.focusNode.requestFocus();
                                  },
                                  isSelected: Version.values.map((v) => item.sortedVersions.contains(v)).toList(),
                                  direction: Axis.vertical,
                                  constraints: const BoxConstraints.expand(height: 34, width: 84),
                                  borderRadius: BorderRadius.circular(4.0),
                                  fillColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
                                  borderWidth: 0,
                                  borderColor: FoodlyThemes.secondaryFoodly,
                                  selectedColor: FoodlyThemes.primaryFoodly,
                                  color: Colors.black,
                                  children: [
                                    ...Version.values.map((v) => Text(
                                          v.text,
                                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                        ).paddingHorizontal(4)),
                                  ],
                                ),
                              ),
                              SizedBox.fromSize(
                                size: const Size(124, 104),
                                child: Column(
                                  children: [
                                    ...Version.values.mapIndexed(
                                      (i, v) {
                                        return Stack(
                                          children: [
                                            FoodlyPrimaryInputText(
                                              key: ValueKey(v),
                                              onChanged: (newPrice) {
                                                final price = double.tryParse(newPrice);

                                                if (price != null) {
                                                  cubit.updateItemVersionPrice(
                                                      item, menuCategory, subCategory.uuid, v, price);
                                                }
                                              },
                                              onFieldSubmitted: (p0) {
                                                if (i < 2) {
                                                  final nextVersion = item.sortedVersions.elementAtOrNull(i + 1);
                                                  if (nextVersion != null && nextVersion.focusNode.canRequestFocus) {
                                                    nextVersion.focusNode.requestFocus();
                                                  } else {
                                                    v.focusNode.unfocus();
                                                  }
                                                }

                                                if (i == 2) {
                                                  v.focusNode.unfocus();
                                                }
                                              },
                                              maxLines: 1,
                                              maxLength: 12,
                                              counter: const SizedBox.shrink(),
                                              prefixIconConstraints:
                                                  const BoxConstraints.tightFor(width: 28, height: 32),
                                              enabled: item.sortedVersions.contains(v),
                                              initialValue: '${item.getVersionPrice(v)}',
                                              inputTextType: FoodlyInputType.prices,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              height: 32,
                                              leading: _currencyWidget.paddingTop(10),
                                              contentPadding: EdgeInsetsDirectional.zero,
                                              focusNode: v.focusNode,
                                              hintText: S.current.price,
                                              style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(
                                                fontSize: 16.5,
                                                color: !item.sortedVersions.contains(v)
                                                    ? FoodlyThemes.secondaryFoodly
                                                    : item.sortedVersions.contains(v) &&
                                                            !item.checkIfVersionCanBeSaved(v)
                                                        ? FoodlyThemes.error
                                                        : FoodlyThemes.tertiaryFoodly,
                                              ),
                                            ).paddingOnly(bottom: 2, right: 24),
                                            if (item.showAddPriceWarning(v))
                                              FadeIn(
                                                child: Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: Tooltip(
                                                    showDuration: const Duration(seconds: 3),
                                                    triggerMode: TooltipTriggerMode.tap,
                                                    message: S.current.priceValidation,
                                                    child: const Icon(Icons.error_outline_outlined,
                                                            size: 20, color: FoodlyThemes.error)
                                                        .paddingTop(8),
                                                  ),
                                                ),
                                              )
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).paddingBottom(6),
                          Row(
                            children: [
                              ui.NeumorphicCheckbox(
                                value: item.available,
                                onChanged: (available) =>
                                    cubit.toggleItemAvailability(item, menuCategory, subCategory.uuid),
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.all(10),
                                style: ui.NeumorphicCheckboxStyle(
                                  selectedColor: FoodlyThemes.primaryFoodly.withValues(alpha: item.available ? 1 : .25),
                                  unselectedDepth: 0,
                                  boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(4)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => cubit.toggleItemAvailability(item, menuCategory, subCategory.uuid),
                                child: Stack(
                                  children: [
                                    AnimatedOpacity(
                                      duration: Durations.medium4,
                                      opacity: item.available ? 1 : 0,
                                      child: Text(S.current.itemAvailable, style: FoodlyTextStyles.captionBold),
                                    ),
                                    AnimatedOpacity(
                                      duration: Durations.medium4,
                                      opacity: !item.available ? 1 : 0,
                                      child: Text(S.current.itemUnavailable, style: FoodlyTextStyles.captionBold),
                                    ),
                                  ],
                                ).paddingLeft(2),
                              )
                            ],
                          ),
                        ],
                      )
                    else
                      Row(
                        mainAxisAlignment: !item.available ? MainAxisAlignment.center : MainAxisAlignment.start,
                        children: [
                          AdaptiveItemVersionSelector(
                            item: item,
                            menuCategory: menuCategory,
                            subCategoryUuid: subCategory.uuid,
                          ).paddingOnly(left: 10, right: 6),
                          if (item.available) const Spacer(),
                          if (item.available) _currencyWidget.paddingHorizontal(4),
                          if (item.available)
                            SizedBox(
                              width: 110,
                              height: 36,
                              child: Card.filled(
                                elevation: 3,
                                color: FoodlyThemes.tertiaryFoodly,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Text(
                                    _itemNotAvailable ? '-' : '${item.currentPrice}',
                                    style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16.5),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ).paddingBottom(6),
                  ],
                ).paddingRight(2),
              ),
            ).paddingOnly(left: 6, right: 6, bottom: 20),
          ),
          if (item.isEditing)
            SaveAndCancelButtons(
              showSaveButton: item.canBeSaved,
              onCancelPressed: () => cubit.cancelEditItemOrSubCategory(
                  itemRecord: item.photosRemovedDuringEdition ? (item, menuCategory, subCategory.uuid) : null),
              onSavePressed: () => cubit.storeItem(item, menuCategory, subCategory),
            ).paddingOnly(right: UIDimens.SCREEN_PADDING_MOB, bottom: subCategory.items.isEmpty ? 0 : 32),
          if (isLastScreenItem && !vm.editMode) const MenuDisclaimerWdg(),
          if (isLastScreenItem && vm.editMode) const SizedBox(height: 100),
        ],
      ),
    );
  }
}
