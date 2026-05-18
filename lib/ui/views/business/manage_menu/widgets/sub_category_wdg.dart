part of 'menu_category_builder_wdg.dart';

class SubCategoryWdg extends StatelessWidget {
  final CategoryDM? subCategory;
  final MenuCategory menuCategory;
  final ManageMenuCubit cubit;
  final bool isLastSubCategory;
  final int categoryIndex;
  final int totalCategories;

  const SubCategoryWdg({
    super.key,
    this.subCategory,
    required this.menuCategory,
    required this.cubit,
    required this.isLastSubCategory,
    required this.categoryIndex,
    required this.totalCategories,
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
        // Row of subcategory-level buttons (edit name / delete / move). Hidden
        // entirely for combos — they don't have user-managed subcategories, so
        // this Row would render empty.
        if (vm.editMode &&
            menuCategory != MenuCategory.combos &&
            subCategory?.uuid != FoodlyStrings.NEW_CATEGORY &&
            subCategory?.editingName == false)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              if (menuCategory != MenuCategory.combos && totalCategories > 1) ...[
                const SizedBox(width: 6),
                _CategoryEditButtons(
                  key: const Key('move-category-up'),
                  editMode: true,
                  canAdd: vm.enableEditCategoryBtns && categoryIndex > 0,
                  onPressed: () => cubit.moveCategoryByOne(menuCategory, subCategory?.uuid ?? '', -1),
                  text: S.current.moveUp,
                  iconData: Bootstrap.arrow_up_circle,
                  isSubCategory: true,
                ),
                _CategoryEditButtons(
                  key: const Key('move-category-down'),
                  editMode: true,
                  canAdd: vm.enableEditCategoryBtns && categoryIndex < totalCategories - 1,
                  onPressed: () => cubit.moveCategoryByOne(menuCategory, subCategory?.uuid ?? '', 1),
                  text: S.current.moveDown,
                  iconData: Bootstrap.arrow_down_circle,
                  isSubCategory: true,
                ),
              ],
            ],
          ).paddingBottom(20)
        else
          const SizedBox(height: 30),
        if (subCategory?.items.isNotEmpty ?? false)
          if (vm.editMode && vm.enableEditCategoryBtns && (subCategory!.items.length) > 1)
            // **Wrapper Stateful con ScrollController propio** — el
            // ReorderableListView sin controller propio registra su
            // Scrollable interno con el `_NestedScrollCoordinator` del
            // `NestedScrollView` padre (manage_menu_screen.dart:149).
            // Cuando se monta por primera vez (al entrar edit mode con
            // una categoría que tiene >1 items, ej. "Peixes" de Platos),
            // el coordinator pide `position.minScrollExtent` durante el
            // ballistic handler antes de que el inner haya completado su
            // primer layout → `_minScrollExtent!` es null → crash en
            // gestos de scroll. Bug 2026-05-18.
            //
            // Dar al ReorderableListView un controller propio lo desacopla
            // del coordinator del NestedScrollView. Como `physics:
            // NeverScrollableScrollPhysics`, el controller no se usa
            // realmente para scrollear, solo para evitar el registro
            // automático con el primary controller del NestedScrollView.
            _ReorderableSubCategoryItems(
              key: ValueKey('reorder_${subCategory!.uuid}'),
              items: subCategory!.items,
              subCategory: subCategory!,
              menuCategory: menuCategory,
              vm: vm,
              cubit: cubit,
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
        // "Add item" button placed AFTER the items list so adding several
        // items in a row doesn't require scrolling back up after each save.
        // Same visibility rules as the row of edit/delete/move buttons above.
        if (vm.editMode && subCategory?.uuid != FoodlyStrings.NEW_CATEGORY && subCategory?.editingName == false)
          _CategoryEditButtons(
            key: const Key('add-new-item'),
            editMode: true,
            canAdd: vm.enableEditCategoryBtns,
            onPressed: () {
              cubit.addNewItem(subCategory!, menuCategory);
              ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
            },
            text: S.current.addNewItem,
            iconData: Bootstrap.plus_circle_fill,
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
                  isUnderlineStyle: true,
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

// ─────────────────────────────────────────────────────────────────────────
// Reorderable items wrapper — Stateful para `ScrollController` lifecycle
// ─────────────────────────────────────────────────────────────────────────

/// Envuelve `ReorderableListView.builder` con un `ScrollController` propio
/// (no compartido con el `NestedScrollView` padre del manage_menu_screen).
///
/// **Por qué Stateful (2026-05-18):** sin esto, `ReorderableListView`
/// usaba el `PrimaryScrollController` heredado del `NestedScrollView` y se
/// registraba con su `_NestedScrollCoordinator`. Cuando se montaba por
/// primera vez (al activar edit mode con una subcategoría que tiene >1
/// items, ej. "Peixes" → 38 platos importados), el coordinator pedía
/// `position.minScrollExtent` antes de que el inner completara su primer
/// layout → `Null check operator used on a null value` en
/// `ScrollPosition.minScrollExtent` (frame:
/// `_NestedScrollCoordinator._getMetrics`). Síntoma observable: cada
/// gesto de scroll en esa categoría tira excepciones en consola y el
/// scroll falla intermitente.
///
/// Como tenemos `physics: NeverScrollableScrollPhysics`, el controller
/// propio nunca se va a usar para scrollear realmente — su único rol es
/// **prevenir que el ReorderableListView se conecte al coordinator del
/// NestedScrollView**. Cualquier dispose() del controller es no-op
/// efectivo pero lo hacemos por higiene de lifecycle.
class _ReorderableSubCategoryItems extends StatefulWidget {
  final List<ItemDM> items;
  final CategoryDM subCategory;
  final MenuCategory menuCategory;
  final ManageMenuVM vm;
  final ManageMenuCubit cubit;

  const _ReorderableSubCategoryItems({
    super.key,
    required this.items,
    required this.subCategory,
    required this.menuCategory,
    required this.vm,
    required this.cubit,
  });

  @override
  State<_ReorderableSubCategoryItems> createState() => _ReorderableSubCategoryItemsState();
}

class _ReorderableSubCategoryItemsState extends State<_ReorderableSubCategoryItems> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      // ⬇️ Crítico: controller propio para desacoplarse del coordinator
      // del NestedScrollView padre. Ver doc del widget arriba.
      scrollController: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      // Remove the default white Material elevation on the dragged item.
      proxyDecorator: (child, index, animation) => child,
      itemCount: widget.items.length,
      onReorder: (oldIndex, newIndex) {
        widget.cubit.reorderItems(widget.subCategory, widget.menuCategory, oldIndex, newIndex);
      },
      itemBuilder: (context, i) {
        final item = widget.items[i];
        // BlocProvider.value re-scopes the cubit for the drag overlay,
        // which renders outside the original BlocProvider tree.
        return BlocProvider.value(
          key: Key(item.uuid),
          value: widget.cubit,
          child: MenuItemWdg(
            subCategory: widget.subCategory,
            menuCategory: widget.menuCategory,
            vm: widget.vm,
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
    );
  }
}
