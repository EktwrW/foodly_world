import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:toggle_switch/toggle_switch.dart';

class SecondaryMenuSliverAppBar extends StatelessWidget {
  const SecondaryMenuSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final vm = state.vm;

        return SliverAppBar(
          primary: false,
          pinned: true,
          expandedHeight: 66,
          collapsedHeight: 66,
          automaticallyImplyLeading: false,
          shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                initialLabelIndex: vm.initialIndex,
                onToggle: (i) {},
                animate: true,
                animationDuration: 500,
                minHeight: 32,
                labels: MenuCategory.values.map((c) => c.text).toList(),
                minWidth: context.screenWidth,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: MenuCategory.values.length,
                customTextStyles: const [
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ],
                borderWidth: 1.5,
                borderColor: const [
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.tertiaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                ],
                dividerColor: FoodlyThemes.secondaryFoodly,
                activeBgColors: const [
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PrimaryMenuSliverAppBar extends StatelessWidget {
  const PrimaryMenuSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final vm = state.vm;

        return SliverAppBar(
          centerTitle: true,
          toolbarHeight: 62,
          leadingWidth: 76,
          expandedHeight: 100,
          collapsedHeight: 64,
          floating: true,
          pinned: true,
          leading: RoundedButtonMobileFoodly(
            shape: ui.NeumorphicShape.concave,
            iconSize: 26,
            depth: 2,
            diameter: 30,
            iconData: Bootstrap.caret_left_fill,
            onPressed: () {
              if (context.canPop()) {
                di<AppRouter>().removeLastRouteHistory();
                context.pop();
              } else {
                di<AppRouter>().goBackToLastRoute(context);
              }
            },
          ).paddingSymmetric(vertical: 8, horizontal: 15),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AvatarWidget(
                    avatarUrl: vm.businessLogo ?? '',
                    height: 45,
                    width: 45,
                  ),
                ),
              ],
            ).paddingRight(15),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            expandedTitleScale: 1.6,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  vm.businessName ?? '',
                  style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 14),
                ).paddingBottom(10),
                Text(S.current.menu, style: FoodlyTextStyles.menuTitle),
              ],
            ),
          ),
        );
      },
    );
  }
}
