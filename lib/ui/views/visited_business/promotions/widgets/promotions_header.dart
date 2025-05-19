part of '../promotions_page.dart';

class _PromotionsHeader extends StatelessWidget {
  const _PromotionsHeader({
    super.key,
    required this.vm,
  });

  final PromotionsVM vm;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PromotionsCubit>();

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 120,
              width: context.screenWidth,
              decoration: BoxDecoration(
                gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  S.current.promotions,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 22),
                ).paddingTop(30),
              ),
            ),
          ],
        ),
        Positioned(
          top: 54,
          left: 14,
          child: CustomRoundedNeumorphicButton(
            shape: ui.NeumoShape.concave,
            iconSize: 26,
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
          ),
        ),
        Positioned(
          right: 12,
          top: 52,
          child: AvatarWidget(
            avatarUrl: vm.businessLogo,
            height: 50,
            width: 50,
            avatarType: AvatarType.business,
          ),
        ),
        Positioned(
          top: 126,
          child: SizedBox(
            width: context.screenWidth,
            child: Center(
              child: ToggleSwitch(
                initialLabelIndex: vm.indexView,
                onToggle: (i) {
                  vm.controller?.animateToPage(i ?? 0, duration: Durations.short4, curve: Curves.decelerate);
                  cubit.updateView(i ?? 0);
                },
                animate: true,
                animationDuration: 500,
                minHeight: 32,
                labels: PromotionStatus.values.map((c) => c.text).toList(),
                minWidth: context.screenWidth,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: PromotionStatus.values.length,
                borderWidth: 1.5,
                borderColor: const [
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                ],
                dividerColor: FoodlyThemes.secondaryFoodly,
                activeBgColors: const [
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                ],
                customTextStyles: [
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
