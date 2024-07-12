import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:foodly_world/ui/views/business/menu/widgets/menu_app_bar_wdg.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:toggle_switch/toggle_switch.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const itemHeight = 140.0;

  Widget get _subCategoryDivider => Expanded(
      child: const Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8).paddingSymmetric(horizontal: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (vm) => _buildMenuWdg(context, vm),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildMenuWdg(BuildContext context, MenuVM vm) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) => [const PrimaryMenuSliverAppBar(), const SecondaryMenuSliverAppBar()],
      body: PageView.builder(
        itemCount: MenuCategory.values.length,
        itemBuilder: (context, i) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 40),
          itemCount: vm.menuEditionDM?.menu.foodCategories?.length ?? 0,
          itemBuilder: (context, index) {
            final subCategory = vm.menuEditionDM?.menu.foodCategories?[index];

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
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 2,
                          margin: const EdgeInsets.only(left: 6, right: 6),
                          color: FoodlyThemes.primaryFoodly,
                          child: const SizedBox(width: double.infinity, height: itemHeight + .25),
                        ),
                        SizedBox(
                          height: itemHeight,
                          child: Card(
                            elevation: 0,
                            color: ui.NeumorphicColors.decorationMaxWhiteColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: ClayText(e.name,
                                                textColor: FoodlyThemes.primaryFoodly,
                                                style: FoodlyTextStyles.labelPurpleBold),
                                          ).paddingTop(8),
                                          Text(
                                            e.description + ' ' + e.description + ' ' + e.description,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: FoodlyTextStyles.caption,
                                          ).paddingSymmetric(vertical: 4, horizontal: 10),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 114,
                                      height: 84,
                                      margin: const EdgeInsets.only(top: 8, right: 4),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                      clipBehavior: Clip.hardEdge,
                                      child: CachedNetworkImage(
                                        imageUrl: e.referencePhotos.first,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ToggleSwitch(
                                      onToggle: (i) {},
                                      animate: true,
                                      animationDuration: 350,
                                      minHeight: 22,
                                      radiusStyle: true,
                                      labels: e.versions.map((c) => c.text).toList(),
                                      cornerRadius: 3.0,
                                      activeFgColor: FoodlyThemes.primaryFoodly,
                                      inactiveBgColor: Colors.white,
                                      totalSwitches: e.versions.length,
                                      customTextStyles: e.versions
                                          .map((v) => const TextStyle(fontWeight: FontWeight.w600, fontSize: 10))
                                          .toList(),
                                      borderWidth: .0,
                                      dividerColor: FoodlyThemes.secondaryFoodly,
                                      activeBgColors:
                                          e.versions.map((v) => [FoodlyThemes.primaryFoodly.withOpacity(.1)]).toList(),
                                    ).paddingOnly(left: 6, right: 8),
                                    const Spacer(),
                                    Text(
                                      '${vm.currency}:',
                                      style: FoodlyTextStyles.label,
                                    ).paddingHorizontal(4),
                                    SizedBox(
                                      width: 122,
                                      height: 36,
                                      child: Card.filled(
                                        elevation: 3,
                                        color: FoodlyThemes.tertiaryFoodly,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                        child: Center(
                                          child: Text(
                                            '${e.currentPrice}',
                                            style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ).paddingBottom(4),
                              ],
                            ).paddingRight(2),
                          ),
                        ).paddingOnly(left: 6, right: 6),
                      ],
                    ).paddingBottom(10),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
