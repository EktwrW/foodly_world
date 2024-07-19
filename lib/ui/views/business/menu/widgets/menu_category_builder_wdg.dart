import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;

part 'menu_item_wdg.dart';
part 'adaptive_item_version_selector_wdg.dart';

class MenuCategoryBuilder extends StatelessWidget {
  const MenuCategoryBuilder({
    super.key,
    required this.categoryItems,
    required this.vm,
    required this.menuCategory,
  });

  final List<Category>? categoryItems;
  final MenuVM vm;
  final MenuCategory menuCategory;

  Widget get _subCategoryDivider => Expanded(
      child: const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8).paddingSymmetric(horizontal: 10));
  bool get _canAddNewCategory => categoryItems?.every((i) => i.uuid != FoodlyStrings.NEW_CATEGORY) ?? false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (vm.editMode)
          TextButton(
            onPressed: _canAddNewCategory ? () => cubit.addNewSubCategory(menuCategory) : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  child: ClayText(
                    'Add a new category',
                    textColor: _canAddNewCategory ? FoodlyThemes.primaryFoodly : Colors.grey,
                    style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 14),
                  ).paddingLeft(10),
                ),
                FadeIn(
                  child: IconButton.filled(
                    onPressed: _canAddNewCategory ? () => cubit.addNewSubCategory(menuCategory) : null,
                    tooltip: 'Add a new category',
                    constraints: BoxConstraints.tight(const Size(24, 24)),
                    icon: const Icon(Bootstrap.plus_circle, size: 16, color: Colors.white),
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            ),
          ),
        if (categoryItems?.isNotEmpty ?? false)
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 40),
              itemCount: categoryItems?.length ?? 0,
              itemBuilder: (context, index) {
                final subCategory = categoryItems?[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: AnimatedCrossFade(
                        duration: Durations.medium3,
                        crossFadeState:
                            subCategory?.editingName == true ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        secondChild: FoodlyPrimaryInputText(
                          height: 60,
                          onChanged: (p0) => cubit,
                          enabled: subCategory?.editingName ?? false,
                          showPrefix: false,
                          hintTextSize: 14,
                          hintText: 'Enter a name for this category',
                          inputTextType: FoodlyInputType.generic,
                          autovalidateMode: vm.autovalidateMode,
                          maxLines: 1,
                          suffixIcon: InkWell(
                            onTap: (subCategory?.name.length ?? 0) >= 3 ? () {} : null,
                            child: Icon(
                              Bootstrap.check_circle,
                              size: 22,
                              color: (subCategory?.name.length ?? 0) >= 3 ? FoodlyThemes.primaryFoodly : Colors.grey,
                            ),
                          ),
                          maxLength: 33,
                        ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: 20),
                        firstChild: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _subCategoryDivider,
                            Expanded(
                              flex: subCategory?.editingName == true ? 4 : 2,
                              child: Center(
                                child: ClayText(subCategory?.name ?? '',
                                    textColor: FoodlyThemes.primaryFoodly, style: FoodlyTextStyles.sectionsTitle),
                              ),
                            ),
                            _subCategoryDivider,
                          ],
                        ).paddingOnly(top: 40, bottom: 30, right: 10, left: 10),
                      ),
                    ),
                    if (subCategory?.items.isNotEmpty ?? false)
                      ...subCategory!.items.map(
                        (e) => MenuItemWdg(
                          subCategory: subCategory,
                          menuCategory: menuCategory,
                          vm: vm,
                          item: e,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
