part of '../promotions_page.dart';

class _PromotionsHeader extends StatelessWidget {
  const _PromotionsHeader({
    super.key,
    required this.vm,
  });

  final PromotionsVM vm;

  bool get _editingInActivesView => vm.isEditing && (vm.indexView == 0);
  bool get _editingInNextsView => vm.isEditing && (vm.indexView == 1);
  bool get _editingInExpiresView => vm.isEditing && (vm.indexView == 2);

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
          child: Column(
            children: [
              SizedBox(
                width: context.screenWidth,
                child: Center(
                  child: AbsorbPointer(
                    absorbing: vm.isEditing,
                    child: ToggleSwitch(
                      initialLabelIndex: vm.indexView,
                      onToggle: vm.isEditing
                          ? null
                          : (i) {
                              vm.controller?.animateToPage(i ?? 0, duration: Durations.long2, curve: Curves.decelerate);
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
                      icons: [
                        _editingInActivesView ? Icons.lock_outline : null,
                        _editingInNextsView ? Icons.lock_outline : null,
                        _editingInExpiresView ? Icons.lock_outline : null,
                      ],
                      customTextStyles: [
                        FoodlyTextStyles.toogleButtonText.copyWith(
                            color: vm.isEditing && !_editingInActivesView ? FoodlyThemes.secondaryFoodly : null),
                        FoodlyTextStyles.toogleButtonText.copyWith(
                            color: vm.isEditing && !_editingInNextsView ? FoodlyThemes.secondaryFoodly : null),
                        FoodlyTextStyles.toogleButtonText.copyWith(
                            color: vm.isEditing && !_editingInExpiresView ? FoodlyThemes.secondaryFoodly : null),
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
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Durations.medium4,
                opacity: vm.isEditing ? 0 : 1,
                child: TextButton(
                  onPressed: vm.isEditing ? null : () => _addNewPromotion(context, cubit),
                  style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 4, horizontal: 12)),
                      fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 20)),
                      backgroundColor: WidgetStatePropertyAll(ui.NeumoColors.background.withValues(alpha: .6))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClayText(
                        S.current.createNewPromotion,
                        textColor: vm.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                        style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 15),
                      ).paddingLeft(10),
                      IconButton.filled(
                        onPressed: vm.isEditing ? null : () => _addNewPromotion(context, cubit),
                        tooltip: S.current.createNewPromotion,
                        style: const ButtonStyle(
                          side: WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.secondaryFoodly)),
                        ),
                        color: FoodlyThemes.primaryFoodly,
                        constraints: BoxConstraints.tight(const Size(30, 30)),
                        icon: const Icon(Bootstrap.plus_circle, size: 18, color: Colors.white),
                        padding: EdgeInsets.zero,
                      )
                    ],
                  ),
                ).paddingTop(8),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _addNewPromotion(BuildContext context, PromotionsCubit cubit) {
    context.read<PromotionsCubit>()
      ..setControllers()
      ..updateEditMode(PromotionEditing.title);

    if (vm.indexView != 1) {
      vm.controller?.animateToPage(1, duration: Durations.long2, curve: Curves.decelerate);
      cubit.updateView(1);
    }
  }
}
