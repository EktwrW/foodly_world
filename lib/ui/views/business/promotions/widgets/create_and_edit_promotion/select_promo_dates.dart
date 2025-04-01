part of '../../manage_promotions_page.dart';

class _StartAndExpiryDatesWdg extends StatelessWidget {
  const _StartAndExpiryDatesWdg({
    super.key,
    required this.cubit,
    required this.vm,
  });

  final ManagePromotionsCubit cubit;
  final ManagePromotionsVM vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(S.current.startDate, style: FoodlyTextStyles.labelBold).paddingBottom(10),
          ],
        ),
        Flexible(
          child: CustomNeumorphicButton(
            disabled: false,
            onPressed: () {
              cubit.updateEditMode(PromotionEditing.start);
              PromotionsHelper.showDatePickerDialog(
                context,
                cubit,
                vm,
                initialDate: vm.newPromo?.startDate ?? DateTime.now(),
                isStartDate: true,
              );
            },
            text: vm.newPromo?.startDate != null
                ? PromotionsHelper.formatDate(vm.newPromo!.startDate)
                : S.current.setDate,
            type: CustomNeumorphicBtnType.outlined,
            shape: ui.NeumoShape.flat,
            leading: const Icon(Bootstrap.calendar2_plus),
            bosShapeRadius: 8,
            foregroundColor: vm.hasInvalidDates ? FoodlyThemes.error : null,
          ),
        ),
        SizedBox(
          height: 30,
          child: AnimatedOpacity(
            key: const Key('invalid-promo-dates'),
            duration: Durations.medium4,
            opacity: vm.hasInvalidDates ? 1 : 0,
            child: Text(
              S.current.invalidPromoDates,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.errorInputText,
            ),
          ).paddingTop(2),
        ),
        Row(
          children: [
            Text(S.current.endDate, style: FoodlyTextStyles.labelBold).paddingBottom(10),
          ],
        ),
        Flexible(
          child: CustomNeumorphicButton(
            disabled: vm.newPromo?.startDate == null,
            onPressed: vm.newPromo?.startDate != null
                ? () {
                    cubit.updateEditMode(PromotionEditing.expiry);
                    PromotionsHelper.showDatePickerDialog(
                      context,
                      cubit,
                      vm,
                      initialDate: vm.newPromo?.expireDate ?? vm.newPromo!.startDate.add(const Duration(days: 1)),
                      isStartDate: false,
                    );
                  }
                : null,
            text: vm.newPromo?.expireDate != null
                ? PromotionsHelper.formatDate(vm.newPromo!.expireDate)
                : S.current.setDate,
            type: CustomNeumorphicBtnType.outlined,
            shape: ui.NeumoShape.flat,
            leading: Icon(Bootstrap.calendar2_range, color: vm.newPromo?.startDate == null ? Colors.grey : null),
            bosShapeRadius: 8,
            foregroundColor: vm.hasInvalidDates ? FoodlyThemes.error : null,
          ),
        ),
      ],
    );
  }
}
