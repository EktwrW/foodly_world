import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_app_bar_wdg.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (vm) => _buildMenuWdg(context, vm),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildMenuWdg(BuildContext context, MenuVM vm) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenuPlus(
          key: vm.floatingButtonKey,
          // Cannot be `Alignment.center`
          ringColor: FoodlyThemes.primaryFoodly.withAlpha(40),
          ringDiameter: 400.0,
          ringWidth: 100.0,
          fabSize: 54,
          fabElevation: 7.0,
          fabIconBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          fabColor: FoodlyThemes.primaryFoodly,
          fabOpenIcon: const Icon(Icons.menu_open_outlined, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close_outlined, color: Colors.white),
          animationDuration: Durations.extralong1,
          onDisplayChange: (isOpen) {
            log('The menu is open: $isOpen');
          },
          children: <Widget>[
            RoundedButtonMobileFoodly(
              onPressed: () {
                log('You pressed 1');
              },
              iconSize: 24,
              depth: 4,
              iconData: FontAwesome.share_from_square_solid,
            ),
            RoundedButtonMobileFoodly(
              onPressed: () {
                log('You pressed 2');
              },
              iconSize: 26,
              depth: 4,
              iconData: Icons.qr_code_2,
            ),
            RoundedButtonMobileFoodly(
              onPressed: () {
                log('You pressed 3');
              },
              iconSize: 25,
              depth: 4,
              iconData: Bootstrap.bookmark_heart_fill,
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          const PrimaryMenuSliverAppBar(),
          const SecondaryMenuSliverAppBar(),
        ],
        body: PageView(
          controller: vm.controller,
          onPageChanged: (i) => context.read<MenuCubit>().updateView(i),
          children: MenuCategory.values
              .mapIndexed(
                (index, category) => MenuCategoryBuilder(
                  key: ValueKey(index),
                  categoryItems: vm.menuScreens[category],
                  vm: vm,
                  menuCategory: category,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

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

  static const itemHeight = 162.0;

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
                (e) => Stack(
                  children: [
                    SizedBox(
                      height: itemHeight,
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
                                Container(
                                  width: 110,
                                  height: 100,
                                  margin: const EdgeInsets.only(top: 10, left: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                  clipBehavior: Clip.hardEdge,
                                  child: CachedNetworkImage(
                                    imageUrl: e.referencePhotos.first,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClayText(e.name,
                                          textColor: FoodlyThemes.primaryFoodly,
                                          style: FoodlyTextStyles.labelPurpleBold.copyWith(
                                            letterSpacing: .75,
                                            fontSize: 14,
                                          )).paddingTop(8),
                                      Text(
                                        e.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: FoodlyTextStyles.caption,
                                      ).paddingVertical(5),
                                    ],
                                  ).paddingHorizontal(10),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  color: Colors.transparent,
                                  icon: Icon(
                                    subCategory.items.indexOf(e).isEven
                                        ? FontAwesome.heart_circle_plus_solid
                                        : FontAwesome.heart_circle_check_solid,
                                    color: subCategory.items.indexOf(e).isEven
                                        ? const Color(0xFFB5B4B4)
                                        : FoodlyThemes.primaryFoodly,
                                    size: 22,
                                  ),
                                ).paddingAll(2),
                              ],
                            ),
                            Row(
                              children: [
                                AdaptiveItemVersionSelector(
                                  item: e,
                                  menuCategory: menuCategory,
                                  subCategoryName: subCategory.name,
                                ).paddingOnly(left: 10, right: 6),
                                const Spacer(),
                                Text(
                                  '${vm.currency}:',
                                  style: FoodlyTextStyles.label,
                                ).paddingHorizontal(4),
                                SizedBox(
                                  width: 110,
                                  height: 36,
                                  child: Card.filled(
                                    elevation: 3,
                                    color: FoodlyThemes.tertiaryFoodly,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: Text(
                                        '${e.currentPrice}',
                                        style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingBottom(context.isSmallWidthPhone ? 6 : 0),
                          ],
                        ).paddingRight(2),
                      ),
                    ).paddingOnly(left: 6, right: 6),
                  ],
                ).paddingBottom(12),
              ),
          ],
        );
      },
    );
  }
}

class AdaptiveItemVersionSelector extends StatelessWidget {
  final ItemDM item;
  final MenuCategory menuCategory;
  final String subCategoryName;

  const AdaptiveItemVersionSelector({
    super.key,
    required this.item,
    required this.menuCategory,
    required this.subCategoryName,
  });

  void _onVersionChanged(BuildContext context, Version? newVersion) {
    if (newVersion != null) {
      final updatedItem = item.copyWith(selectedVersion: newVersion);
      context.read<MenuCubit>().updateItemVersion(updatedItem, menuCategory, subCategoryName);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (context.isSmallWidthPhone) {
      return _buildDropdownButton(context);
    } else {
      return _buildToggleButtons(context);
    }
  }

  Widget _buildToggleButtons(BuildContext context) {
    return ToggleButtons(
      isSelected: item.versions.map((v) => v == item.selectedVersion).toList(),
      onPressed: (index) => _onVersionChanged(context, item.versions[index]),
      constraints: const BoxConstraints.expand(height: 24, width: 70),
      borderRadius: BorderRadius.circular(2.0),
      fillColor: FoodlyThemes.primaryFoodly.withOpacity(0.1),
      borderWidth: 0,
      borderColor: FoodlyThemes.secondaryFoodly,
      selectedColor: FoodlyThemes.primaryFoodly,
      color: Colors.black,
      children: item.versions
          .map((v) => Text(
                v.text,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ).paddingHorizontal(4))
          .toList(),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ColoredBox(
        color: FoodlyThemes.primaryFoodly.withAlpha(15),
        child: SizedBox(
          width: 110,
          height: 28,
          child: DropdownButton<Version>(
            value: item.selectedVersion,
            onChanged: (newVersion) => _onVersionChanged(context, newVersion),
            items: item.versions.map((Version version) {
              return DropdownMenuItem<Version>(
                value: version,
                child: Text(
                  version.text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: version == item.selectedVersion ? FoodlyThemes.primaryFoodly : Colors.black,
                  ),
                ),
              );
            }).toList(),
            padding: const EdgeInsets.only(left: 10, top: 2, right: 4),
            borderRadius: BorderRadius.circular(8),
            icon: const Icon(Icons.arrow_drop_down, color: FoodlyThemes.primaryFoodly),
            isDense: true,
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
