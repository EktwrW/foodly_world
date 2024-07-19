import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodly_world/core/extensions/padding_extension.dart';

import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/business_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/business/widgets/opening_hours/edit_hours_wdg.dart';

class EditOpeningHoursWdg extends StatelessWidget {
  const EditOpeningHoursWdg({
    super.key,
    required this.vm,
  });

  final BusinessVM vm;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return Form(
      key: vm.openingHoursFormKey,
      autovalidateMode: vm.autovalidateMode,
      child: FadeIn(
        child: Column(
          children: [
            ...Weekday.values.mapIndexed(
              (i, weekday) {
                final day = vm.businessDays.weekdaysData[weekday];

                return AnimatedContainer(
                  duration: Durations.medium2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: const BorderSide(width: .5, color: FoodlyThemes.primaryFoodly),
                      bottom: i == (Weekday.values.length - 1)
                          ? const BorderSide(width: .5, color: FoodlyThemes.primaryFoodly)
                          : BorderSide.none,
                    ),
                  ),
                  height: (day?.showSecondPeriod ?? false) || (day?.limitPeriodsReached ?? false) ? 100 : 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weekday.dayString,
                        style: day?.canSaveOrAddSecondPeriod ?? false
                            ? FoodlyTextStyles.captionPurpleBold
                            : FoodlyTextStyles.captionBold,
                      ).paddingOnly(left: 6, top: 15),
                      const Spacer(),
                      EditHoursWdg(vm: vm, i: i, day: day),
                    ],
                  ),
                );
              },
            ),
            DashboardSaveAndCancelButtons(
              onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
              showSaveButton: vm.businessDays.weekdaysData.entries.any(
                (e) => e.value != vm.currentBusiness?.businessDays.weekdaysData[e.key],
              ),
              onCancelPressed: () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none)),
            ).paddingTop(16)
          ],
        ).paddingTop(16),
      ),
    );
  }
}
