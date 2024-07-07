import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu/cubit/menu_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:toggle_switch/toggle_switch.dart';

part 'widgets/category_container.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                centerTitle: true,
                toolbarHeight: 62,
                leadingWidth: 76,
                expandedHeight: 100,
                collapsedHeight: 80,
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
                title: Text(
                  'Nombre del Comercio',
                  style: FoodlyTextStyles.secondaryTitle,
                ),
                actions: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AvatarWidget(
                          avatarUrl: '',
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
                  expandedTitleScale: 1.8,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text(S.current.menu, style: FoodlyTextStyles.menuTitle)],
                  ),
                ),
              ),
              SliverAppBar(
                primary: false,
                pinned: true,
                shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
                title: ToggleSwitch(
                  initialLabelIndex: 0,
                  onToggle: (i) {},
                  animate: true,
                  animationDuration: 500,
                  minHeight: 32,
                  labels: ['Food', 'Drinks', 'Combos'],
                  minWidth: context.screenWidth,
                  cornerRadius: 6.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  totalSwitches: 3,
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
                ).paddingVertical(8),
              )
            ],
            body: SafeArea(
              top: false,
              child: Column(
                children: [CategoryContainer(child: Placeholder())],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(0, 10)
      ..lineTo(0, size.height - 10)
      ..lineTo(10, size.height)
      ..moveTo(size.width - 10, size.height)
      ..lineTo(size.width, size.height - 10)
      ..lineTo(size.width, 10)
      ..lineTo(size.width - 10, 0)
      ..moveTo(10, 0)
      ..lineTo(size.width - 10, 0)
      ..moveTo(0, 10)
      ..lineTo(0, size.height - 10)
      ..moveTo(size.width, 10)
      ..lineTo(size.width, size.height - 10)
      ..moveTo(10, size.height)
      ..lineTo(size.width - 10, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
