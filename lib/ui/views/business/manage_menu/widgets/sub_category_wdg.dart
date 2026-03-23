part of 'menu_category_builder_wdg.dart';

class SubCategoryWdg extends StatelessWidget {
  final CategoryDM? subCategory;
  final MenuCategory menuCategory;
  final ManageMenuCubit cubit;
  final bool isLastSubCategory;

  const SubCategoryWdg({
    super.key,
    this.subCategory,
    required this.menuCategory,
    required this.cubit,
    required this.isLastSubCategory,
  });

  Future<void> _handleSaveCategory(String text) async {
    if (text.length < 3) return;

    cubit.updateSubCategoryName(menuCategory, text, subCategory?.uuid ?? '');

    if (subCategory?.uuid == FoodlyStrings.NEW_CATEGORY) {
      await cubit.editSubCategoryName(menuCategory, false, subCategory?.uuid ?? '');

      if (subCategory!.items.isEmpty) {
        cubit.addNewItem(subCategory!, menuCategory);
      }
    }

    if (subCategory?.id != null) {
      cubit.updateCategoryTitle(subCategory!, menuCategory, text);
    }
  }

  static const _divider = Expanded(child: Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8));

  @override
  Widget build(BuildContext context) {
    final vm = cubit.state.vm;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: AnimatedCrossFade(
            firstChild: _buildTitleEditingView(vm),
            secondChild: _buildTitleDisplayView(),
            crossFadeState: subCategory?.editingName == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Durations.medium3,
          ),
        ),
        if (vm.editMode && subCategory?.uuid != FoodlyStrings.NEW_CATEGORY && subCategory?.editingName == false)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CategoryEditButtons(
                key: const Key('add-new-item'),
                editMode: true,
                canAdd: vm.enableEditCategoryBtns,
                onPressed: () {
                  cubit.addNewItem(subCategory!, menuCategory);
                  ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
                },
                text: S.current.addNewItem,
                iconData: FontAwesome.square_plus,
                isSubCategory: true,
              ),
              if (menuCategory != MenuCategory.combos)
                _CategoryEditButtons(
                  key: const Key('edit-category-name'),
                  editMode: true,
                  canAdd: vm.enableEditCategoryBtns,
                  onPressed: () => cubit.editSubCategoryName(menuCategory, true, subCategory?.uuid ?? ''),
                  text: S.current.editTitle,
                  iconData: EvaIcons.edit_2,
                  isSubCategory: true,
                ),
              if (menuCategory != MenuCategory.combos)
                _CategoryEditButtons(
                  key: const Key('delete-this-category'),
                  editMode: true,
                  canAdd: vm.enableEditCategoryBtns,
                  onPressed: () => subCategory != null
                      ? MenuSnackbars.showDeleteCategorySnackBar(context, cubit, subCategory!, menuCategory)
                      : null,
                  text: S.current.deleteCategory,
                  iconData: Bootstrap.trash3,
                  isSubCategory: true,
                ),
            ],
          ).paddingBottom(20)
        else
          const SizedBox(height: 30),
        if (subCategory?.items.isNotEmpty ?? false)
          if (vm.editMode && vm.enableEditCategoryBtns && (subCategory!.items.length) > 1)
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              buildDefaultDragHandles: false,
              // Remove the default white Material elevation on the dragged item
              proxyDecorator: (child, index, animation) => child,
              itemCount: subCategory!.items.length,
              onReorder: (oldIndex, newIndex) {
                cubit.reorderItems(subCategory!, menuCategory, oldIndex, newIndex);
              },
              itemBuilder: (context, i) {
                final item = subCategory!.items[i];
                // BlocProvider.value re-scopes the cubit for the drag overlay,
                // which renders outside the original BlocProvider tree.
                return BlocProvider.value(
                  key: Key(item.uuid),
                  value: cubit,
                  child: MenuItemWdg(
                    subCategory: subCategory!,
                    menuCategory: menuCategory,
                    vm: vm,
                    item: item,
                    // Never show the bottom spacer while reordering — it
                    // would travel with the dragged item and look broken.
                    isLastScreenItem: false,
                    dragIconWdg: ReorderableDragStartListener(
                      index: i,
                      child: const Icon(Icons.drag_handle, color: FoodlyThemes.primaryFoodly, size: 30),
                    ),
                  ),
                );
              },
            )
          else
            ...subCategory!.items.mapIndexed(
              (i, item) => MenuItemWdg(
                key: Key(item.uuid),
                subCategory: subCategory!,
                menuCategory: menuCategory,
                vm: vm,
                item: item,
                isLastScreenItem: isLastSubCategory && ((subCategory!.items.length - 1) == i),
              ),
            ),
      ],
    ).paddingBottom(20);
  }

  Widget _buildTitleEditingView(ManageMenuVM vm) {
    final controller = TextEditingController(text: subCategory?.name);

    return FadeIn(
      child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, controllerValue, __) {
            return Column(
              children: [
                FoodlyPrimaryInputText(
                  controller: controller,
                  height: 60,
                  onFieldSubmitted: (_) => _handleSaveCategory(controllerValue.text),
                  enabled: subCategory?.editingName ?? false,
                  showLeading: false,
                  autofocus: true,
                  hintText: S.current.enterCategoryName,
                  inputTextType: FoodlyInputType.generic,
                  autovalidateMode: vm.autovalidateMode,
                  maxLines: 1,
                  trailing: _SaveButton(
                    onTap: () => _handleSaveCategory(controllerValue.text),
                    isValid: controllerValue.text.length > 2,
                  ),
                  maxLength: 33,
                ),
                SaveAndCancelButtons(
                  showSaveButton: controllerValue.text.length > 2 && controllerValue.text.trim() != subCategory?.name,
                  onSavePressed: () => _handleSaveCategory(controllerValue.text),
                  onCancelPressedSecondary: () => controller.clear(),
                  onCancelPressed: () => cubit.cancelEditItemOrSubCategory(),
                  saveButtonText: subCategory?.id == null ? 'Ok' : null,
                ).paddingRight(UIDimens.SCREEN_PADDING_MOB)
              ],
            ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: 20);
          }),
    );
  }

  Widget _buildTitleDisplayView() {
    return FadeIn(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _divider,
          Expanded(
            flex: subCategory?.editingName == true ? 4 : 3,
            child: Center(
              child: ui.NeumorphicText(
                subCategory?.name ?? '',
                style: const ui.NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
                textStyle: ui.NeumorphicTextStyle(
                  fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                  fontSize: FoodlyTextStyles.sectionsTitle.fontSize,
                  fontWeight: FoodlyTextStyles.sectionsTitle.fontWeight,
                ),
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          _divider,
        ],
      ).paddingOnly(top: 24, right: 12, left: 12),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.onTap,
    required this.isValid,
  });

  final VoidCallback onTap;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Bootstrap.check_circle,
        size: 22,
        color: isValid ? FoodlyThemes.primaryFoodly : Colors.grey,
      ),
    );
  }
}
