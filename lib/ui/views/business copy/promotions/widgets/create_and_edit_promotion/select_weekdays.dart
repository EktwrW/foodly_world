part of '../../promotions_page.dart';

class _SelectWeekdaysWdg extends StatelessWidget {
  const _SelectWeekdaysWdg({
    super.key,
    required this.vm,
    required this.cubit,
  });

  final PromotionsVM vm;
  final PromotionsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${S.current.promotionDays} (${S.current.optional})',
          style: FoodlyTextStyles.labelBold,
        ).paddingVertical(5),
        SegmentedButton<Weekday>(
          segments: Weekday.values
              .map((day) => ButtonSegment(
                    value: day,
                    tooltip: day.dayString,
                    label: FittedBox(
                      child: Text(day.dayAbbreviatedString,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5)),
                    ),
                  ))
              .toList(),
          selected: PromotionsHelper.getSelectedDays(vm.newPromo?.promoDays),
          onSelectionChanged: vm.hasInvalidDates
              ? null
              : (days) {
                  cubit.updateEditMode(PromotionEditing.days);
                  cubit.updatePromoDays(days);
                },
          multiSelectionEnabled: true,
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          style: ButtonStyle(
            side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly;
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return FoodlyThemes.primaryFoodly.withValues(alpha: .7);
              }
              return null;
            }),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            visualDensity: VisualDensity.compact,
          ),
        ).paddingSymmetric(horizontal: 1),
      ],
    );
  }
}
