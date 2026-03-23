import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:toggle_switch/toggle_switch.dart';

class SecondaryMenuSliverAppBar extends StatelessWidget {
  const SecondaryMenuSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitedMenuCubit, VisitedMenuState, (PageController?, int, List<String>)>(
      selector: (state) => (state.vm.controller, state.vm.indexView, state.vm.tabLabels),
      builder: (context, record) {
        final cubit = context.read<VisitedMenuCubit>();

        return SliverAppBar(
          primary: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          expandedHeight: 66,
          collapsedHeight: 66,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleSwitch(
                initialLabelIndex: record.$2,
                onToggle: (i) {
                  record.$1?.animateToPage(i ?? 0, duration: Durations.short4, curve: Curves.decelerate);
                  cubit.updateView(i ?? 0);
                },
                animate: true,
                animationDuration: 500,
                minHeight: 32,
                labels: record.$3,
                minWidth: context.screenWidth,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: MenuCategory.values.length,
                customTextStyles: [
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
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
    return BlocBuilder<VisitedMenuCubit, VisitedMenuState>(
      builder: (context, state) {
        final vm = state.vm;

        return SliverAppBar(
          centerTitle: true,
          toolbarHeight: 62,
          leadingWidth: 76,
          expandedHeight: 110,
          collapsedHeight: 64,
          floating: true,
          pinned: true,
          shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
          leading: CustomRoundedNeumorphicButton(
            shape: ui.NeumorphicShape.concave,
            iconSize: 26,
            diameter: 30,
            iconData: Bootstrap.caret_left_fill,
            onPressed: () {
              if (context.canPop()) {
                di<AppRouter>().removeLastRouteHistory();
                context.pop();
              } else {
                di<AppRouter>().goBackToLastRoute();
              }
            },
          ).paddingSymmetric(vertical: 8, horizontal: 15),
          actions: [
            AvatarWidget(
              avatarUrl: vm.businessLogo,
              height: 45,
              width: 45,
            ).paddingRight(15),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            expandedTitleScale: 1.7,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.current.menu, style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 15)).paddingBottom(6),
                ui.NeumorphicText(
                  vm.businessName ?? '',
                  style: const ui.NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
                  textStyle: ui.NeumorphicTextStyle(
                    fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingBottom(6)
              ],
            ),
          ),
        );
      },
    );
  }
}
