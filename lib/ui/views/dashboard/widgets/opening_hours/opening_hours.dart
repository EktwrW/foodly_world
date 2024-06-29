import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class OpeningHoursWdg extends StatelessWidget {
  final DashboardVM vm;

  const OpeningHoursWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardSectionsTitle(
          firstText: '${S.current.dashboardOpeningHoursText1} ',
          secondText: S.current.dashboardOpeningHoursText2,
        ),
        Visibility(
          visible: vm.isEditingOpeningHours,
          replacement: CurrentOpeningHoursWdg(vm: vm),
          child: Form(
            key: vm.openingHoursFormKey,
            autovalidateMode: vm.autovalidateMode,
            child: FadeIn(
              child: SizedBox(
                height: 430,
                child: ListView.builder(
                  primary: false,
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: Weekday.values.length + 1,
                  itemBuilder: (_, i) {
                    if (i == Weekday.values.length) {
                      return DashboardSaveAndCancelButtons(
                        onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                        showSaveButton:
                            vm.businessDays.weekdaysData.entries.any((wd) => wd.value.canSaveOrAddSecondPeriod),
                        onCancelPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none)),
                      ).paddingTop(16);
                    }

                    final day = vm.businessDays.weekdaysData[Weekday.values[i]];
                    final enableAddPeriodBtn =
                        (day?.canSaveOrAddSecondPeriod ?? false) && !(day?.limitPeriodsReached ?? true);

                    return AnimatedContainer(
                      duration: Durations.medium4,
                      decoration: BoxDecoration(
                        border: Border(
                          top: const BorderSide(width: .5, color: FoodlyThemes.primaryFoodly),
                          bottom: i == (Weekday.values.length - 1)
                              ? const BorderSide(width: .5, color: FoodlyThemes.primaryFoodly)
                              : BorderSide.none,
                        ),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            Weekday.values[i].dayString,
                            style: day?.canSaveOrAddSecondPeriod ?? false
                                ? FoodlyTextStyles.captionPurpleBold
                                : FoodlyTextStyles.captionBold,
                          ).paddingLeft(6),
                          const Spacer(),
                          FoodlyDropdownButtonFormField<Hour>(
                            key: Key('openA - Day: $i'),
                            height: 50,
                            width: 60,
                            enabled: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Select',
                              hintStyle: FoodlyTextStyles.hintText.copyWith(fontSize: 11),
                            ),
                            onChanged: (hour) =>
                                bloc.add(DashboardEvent.setOpeningHoursDay(i, Day(openA: hour?.value))),
                            items: Hour.values
                                .map<DropdownMenuItem<Hour>>(
                                  (h) => DropdownMenuItem<Hour>(
                                    value: h,
                                    child: Text(
                                      h.value,
                                      style: FoodlyTextStyles.caption,
                                    ).paddingTop(2),
                                  ),
                                )
                                .toList(),
                            value: Hour.values.firstWhereOrNull((h) => h.value == day?.openA),
                          ),
                          const Text('-', style: FoodlyTextStyles.captionPurpleBold).paddingHorizontal(10),
                          FoodlyDropdownButtonFormField<Hour>(
                            key: Key('closeA - Day: $i'),
                            height: 50,
                            width: 60,
                            enabled: Hour.values.firstWhereOrNull((h) => h.value == day?.openA) != null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Select',
                              hintStyle: FoodlyTextStyles.hintText.copyWith(fontSize: 12),
                            ),
                            onChanged: (hour) => bloc.add(DashboardEvent.setOpeningHoursDay(
                                i, day?.copyWith(closeA: hour?.value) ?? const Day())),
                            items: Hour.values
                                .map<DropdownMenuItem<Hour>>(
                                  (h) => DropdownMenuItem<Hour>(
                                    value: h,
                                    child: Text(
                                      h.value,
                                      style: FoodlyTextStyles.caption,
                                    ).paddingTop(2),
                                  ),
                                )
                                .toList(),
                            value: Hour.values.firstWhereOrNull((h) => h.value == day?.closeA),
                          ),
                          FadeIn(
                            child: IconButton.filled(
                              onPressed: enableAddPeriodBtn
                                  ? () => bloc.add(DashboardEvent.setOpeningHoursDay(
                                      i, day?.copyWith(showSecondPeriod: true) ?? const Day()))
                                  : null,
                              constraints: BoxConstraints.tight(const Size(22, 22)),
                              tooltip: 'Add a new time',
                              icon: const Icon(Bootstrap.plus_circle, size: 16),
                              padding: const EdgeInsets.all(3),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
        visible: vm.businessDays.allDaysAreDayOff,
        replacement: FadeIn(
          child: Column(
            children: Weekday.values.indexed.map(
              (w) {
                final day = vm.businessDays.weekdaysData[w.$2];
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          w.$2.dayString,
                          style: FoodlyTextStyles.captionPurpleBold,
                        ),
                        const Spacer(),
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
                          style: FoodlyTextStyles.captionBold,
                        )
                      ],
                    ),
                    if (w.$1 != Weekday.values.length - 1)
                      const Divider(color: FoodlyThemes.secondaryFoodly, height: 24),
                  ],
                );
              },
            ).toList(),
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
