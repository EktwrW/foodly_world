part of '../../visit_business_page.dart';

class CurrentOpeningHoursWdg extends StatelessWidget {
  const CurrentOpeningHoursWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, BusinessDays?>(
      selector: (state) => state.vm.currentBusiness?.businessDays,
      builder: (context, businessDays) {
        return Visibility(
          visible: businessDays?.allDaysAreDayOff ?? true,
          replacement: Column(
            children: [
              const Divider(color: FoodlyThemes.secondaryFoodly, height: 24),
              ...Weekday.values.indexed.map(
                (w) {
                  final day = businessDays?.weekdaysData[w.$2];
                  final isOpenNow =
                      DateTime.now().weekday == (w.$2.dateTimeKey) && (day?.isInOpeningHoursRange ?? false);

                  return Column(
                    children: [
                      Row(
                        children: [
                          ClayText(
                            w.$2.dayString,
                            textColor: FoodlyThemes.primaryFoodly,
                            style: FoodlyTextStyles.labelPurpleBold,
                          ),
                          const Spacer(),
                          if (isOpenNow)
                            Row(
                              children: [
                                ui.NeumorphicText(
                                  'Open',
                                  textStyle: ui.NeumorphicTextStyle(fontSize: 11),
                                  style: const ui.NeumorphicStyle(
                                      color: FoodlyThemes.tertiaryFoodly, shape: ui.NeumorphicShape.convex),
                                ),
                                ui.Neumorphic(
                                  padding: const EdgeInsets.all(6),
                                  style: const ui.NeumorphicStyle(
                                      color: FoodlyThemes.tertiaryFoodly, shape: ui.NeumorphicShape.convex),
                                ).paddingOnly(left: 4, right: 10),
                              ],
                            ),
                          Text.rich(
                            (day?.openA?.isNotEmpty ?? false)
                                ? TextSpan(
                                    children: [
                                      TextSpan(text: day!.openA),
                                      const TextSpan(text: '  -  '),
                                      TextSpan(text: day.closeA),
                                    ],
                                  )
                                : TextSpan(text: S.current.closed),
                            style: FoodlyTextStyles.labelBold,
                          )
                        ],
                      ),
                      if (day?.openB != null && day?.closeB != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: day!.openB),
                                  const TextSpan(text: '  -  '),
                                  TextSpan(text: day.closeB),
                                ],
                              ),
                              style: FoodlyTextStyles.labelBold,
                            )
                          ],
                        ).paddingTop(2),
                      const Divider(color: FoodlyThemes.secondaryFoodly, height: 24),
                    ],
                  );
                },
              ),
            ],
          ).paddingAll(6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.current.informationNotYetProvidedByTheBusiness,
                  style: FoodlyTextStyles.visitBusinessBody,
                ).paddingAll(8),
              )
            ],
          ),
        );
      },
    );
  }
}
