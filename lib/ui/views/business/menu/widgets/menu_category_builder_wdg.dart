import 'dart:io';

import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_snackbars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, EvaIcons, FontAwesome;

part 'adaptive_item_version_selector_wdg.dart';
part 'menu_item_wdgs/fav_and_edit_item_btns.dart';
part 'menu_item_wdgs/item_name_and_description_wdg.dart';
part 'menu_item_wdgs/menu_disclaimer_wdg.dart';
part 'menu_item_wdgs/menu_item_picture_wdg.dart';
part 'menu_item_wdgs/menu_item_wdg.dart';
part 'sub_category_wdg.dart';

class MenuCategoryBuilder extends StatelessWidget {
  const MenuCategoryBuilder({
    super.key,
    required this.categories,
    required this.vm,
    required this.menuCategory,
  });

  final List<CategoryDM>? categories;
  final MenuVM vm;
  final MenuCategory menuCategory;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();

    return Column(
      children: [
        if (menuCategory != MenuCategory.combos)
          _CategoryEditButtons(
            key: const Key('add-new-sub-category'),
            editMode: vm.editMode,
            canAdd: !vm.menuIsEditing,
            onPressed: () {
              cubit.addNewSubCategory(menuCategory);
              ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
            },
            iconData: Bootstrap.plus_circle,
            text: S.current.addNewCategory,
          ),
        if ((categories?.isEmpty ?? false) && !vm.editMode) Expanded(child: const NoItemsViewWdg().paddingBottom(80)),
        if (categories?.isNotEmpty ?? false)
          Expanded(
            child: CustomScrollView(
              key: PageStorageKey('menu_category_${menuCategory.name}'),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final subCategory = categories?[index];
                      final isLastSubCategory = index == ((categories?.length ?? 1000) - 1);

                      return SubCategoryWdg(
                        key: ObjectKey(subCategory?.uuid),
                        menuCategory: menuCategory,
                        cubit: cubit,
                        subCategory: subCategory,
                        isLastSubCategory: isLastSubCategory,
                      );
                    },
                    childCount: categories?.length ?? 0,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _CategoryEditButtons extends StatelessWidget {
  const _CategoryEditButtons({
    super.key,
    required this.editMode,
    required this.canAdd,
    required this.onPressed,
    required this.text,
    required this.iconData,
    this.isSubCategory = false,
  });

  final bool editMode;
  final bool canAdd;
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;
  final bool isSubCategory;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Durations.medium4,
      child: AnimatedOpacity(
        duration: Durations.long2,
        opacity: editMode ? 1 : 0.0,
        child: SizedBox(
          height: editMode ? null : 0,
          child: TextButton(
            onPressed: canAdd ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isSubCategory)
                  ClayText(
                    text,
                    textColor: canAdd ? FoodlyThemes.primaryFoodly : Colors.grey,
                    style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 15),
                  ).paddingLeft(10),
                if (isSubCategory)
                  IconButton.outlined(
                    onPressed: canAdd ? onPressed : null,
                    tooltip: text,
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.secondaryFoodly)),
                    ),
                    color: FoodlyThemes.primaryFoodly,
                    constraints: BoxConstraints.tight(const Size(30, 30)),
                    icon: Icon(iconData, size: 18),
                    padding: EdgeInsets.zero,
                  )
                else
                  IconButton.filled(
                    onPressed: canAdd ? onPressed : null,
                    tooltip: text,
                    constraints: BoxConstraints.tight(const Size(24, 24)),
                    icon: Icon(iconData, size: 16, color: Colors.white),
                    padding: EdgeInsets.zero,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
