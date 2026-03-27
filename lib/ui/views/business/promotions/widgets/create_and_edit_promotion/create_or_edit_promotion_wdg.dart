part of '../../manage_promotions_page.dart';

class CreateOrEditPromotionWdg extends StatelessWidget {
  const CreateOrEditPromotionWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePromotionsCubit, ManagePromotionsState>(
      builder: (context, state) {
        final cubit = context.read<ManagePromotionsCubit>();
        final vm = state.vm;

        return FadeIn(
          key: const Key('create-edit-promotion'),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsetsDirectional.fromSTEB(14, 190, 16, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: vm.newPromo?.uuid.isEmpty ?? true,
                          replacement: const SizedBox(height: 16),
                          child: CustomNeumorphicButton(
                            key: const Key('generate-promo-using-ai-service'),
                            onPressed: () => ManagePromotionsSnackbars.showCreatePromoWithAI(context, cubit, vm),
                            padding: const EdgeInsets.all(10),
                            text: S.current.generateWithAI,
                            shape: ui.NeumorphicShape.convex,
                            disabled: false,
                            type: CustomNeumorphicBtnType.outlined,
                            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                          ),
                        ),
                        Flexible(
                          child: _EditPromoMediaWdg(vm: vm, key: const Key('add-media-promo')).paddingHorizontal(10),
                        ),
                        Flexible(
                          child: FadeIn(
                            key: const Key('create-edit-form'),
                            child: Column(
                              children: [
                                FoodlyPrimaryInputText(
                                  key: const Key('add-promo-title'),
                                  onTap: () {
                                    cubit.updateEditMode(PromotionEditing.title);
                                  },
                                  isUnderlineStyle: true,
                                  enabled: vm.isEditing,
                                  controller: vm.titleCtrl?.controller,
                                  focusNode: vm.titleCtrl?.focusNode,
                                  secondaryFocusNode: vm.subtitleCtrl?.focusNode,
                                  inputTextType: FoodlyInputType.generic,
                                  autovalidateMode: vm.autovalidateMode,
                                  hintText: S.current.addTitle,
                                  maxLength: 36,
                                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 17),
                                ),
                                FoodlyPrimaryInputText(
                                  key: const Key('add-promo-subtitle'),
                                  onTap: () {
                                    cubit.updateEditMode(PromotionEditing.subtitle);
                                  },
                                  isUnderlineStyle: true,
                                  enabled: vm.isEditing,
                                  controller: vm.subtitleCtrl?.controller,
                                  focusNode: vm.subtitleCtrl?.focusNode,
                                  secondaryFocusNode: vm.descriptionCtrl?.focusNode,
                                  inputTextType: FoodlyInputType.generic,
                                  autovalidateMode: vm.autovalidateMode,
                                  hintText: S.current.addTagline,
                                  autofocus: vm.editing.isEditingSubtitle,
                                  maxLength: 99,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                ),
                                FoodlyPrimaryInputText(
                                  key: const Key('add-promo-description'),
                                  onTap: () {
                                    cubit.updateEditMode(PromotionEditing.description);
                                  },
                                  isUnderlineStyle: true,
                                  enabled: vm.isEditing,
                                  controller: vm.descriptionCtrl?.controller,
                                  focusNode: vm.descriptionCtrl?.focusNode,
                                  inputTextType: FoodlyInputType.generic,
                                  autovalidateMode: vm.autovalidateMode,
                                  hintText: S.current.addADescription,
                                  minLines: 5,
                                  maxLines: 5,
                                  minLinesHeightFactorReference: 32,
                                  maxLength: 369,
                                  style: const TextStyle(fontSize: 14.5),
                                ).paddingBottom(20),
                                // Sección de fechas
                                _StartAndExpiryDatesWdg(cubit: cubit, vm: vm, key: const Key('start-expiry-dates'))
                                    .paddingSymmetric(horizontal: 2),
                                _SelectWeekdaysWdg(vm: vm, cubit: cubit, key: const Key('promo-weekdays'))
                                    .paddingVertical(30)
                              ],
                            ).paddingOnly(top: 24, left: 14, right: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SaveAndCancelButtons(
                    showSaveButton: vm.canSavePromotion,
                    onSavePressed: () =>
                        vm.newPromo?.uuid.isNotEmpty ?? false ? cubit.updatePromotion() : cubit.createPromotion(),
                    onCancelPressed: () => cubit.updateEditMode(PromotionEditing.none),
                  ).paddingRight(UIDimens.SCREEN_PADDING_MOB),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
