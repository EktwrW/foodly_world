part of 'menu_category_builder_wdg.dart';

class SubCategoryWdg extends StatelessWidget {
  final CategoryDM? subCategory;
  final MenuCategory menuCategory;
  final MenuCubit cubit;
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
            firstChild: _buildEditingView(vm),
            secondChild: _buildDisplayView(),
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
          ...subCategory!.items.mapIndexed(
            (i, item) => MenuItemWdg(
              key: ObjectKey(item.uuid),
              subCategory: subCategory!,
              menuCategory: menuCategory,
              vm: vm,
              item: item,
              isLastScreenItem: isLastSubCategory && ((subCategory!.items.length - 1) == i),
            ),
          ),
      ],
    );
  }

  Widget _buildEditingView(MenuVM vm) {
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
                  hintTextSize: 14,
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

  Widget _buildDisplayView() {
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
      ).paddingOnly(top: 40, right: 12, left: 12),
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
