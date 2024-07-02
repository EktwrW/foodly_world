import 'package:animate_do/animate_do.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;

class CurrentOpeningHoursWdg extends StatelessWidget {
  const CurrentOpeningHoursWdg({
    super.key,
    required this.vm,
  });

  final DashboardVM vm;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return TextButton(
      onPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.openingHours)),
      child: Visibility(
        visible: vm.currentBusiness?.businessDays.allDaysAreDayOff ?? true,
        replacement: FadeIn(
          child: Column(
            children: [
              const Divider(color: FoodlyThemes.secondaryFoodly, height: 24),
              ...Weekday.values.indexed.map(
                (w) {
                  final day = vm.currentBusiness?.businessDays.weekdaysData[w.$2];
                  final isOpenNow = DateTime.now().day == w.$1 && (day?.isInOpeningHoursRange ?? false);

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
        ),
        child: FadeIn(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.current.addOpeningHours,
                  style: FoodlyTextStyles.profileSectionTextButton,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
