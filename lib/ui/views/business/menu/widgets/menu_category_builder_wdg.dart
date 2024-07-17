import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 40),
      itemCount: categoryItems?.length ?? 0,
      itemBuilder: (context, index) {
        final subCategory = categoryItems?[index];

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _subCategoryDivider,
                Expanded(
                    child: Center(
                  child: ClayText(subCategory?.name ?? '',
                      textColor: FoodlyThemes.primaryFoodly, style: FoodlyTextStyles.sectionsTitle),
                )),
                _subCategoryDivider,
              ],
            ).paddingOnly(top: 40, bottom: 30, right: 10, left: 10),
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
    );
  }
}
