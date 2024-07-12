import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/business_save_and_cancel_buttons.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class EditOpeningHoursWdg extends StatelessWidget {
  const EditOpeningHoursWdg({
    super.key,
    required this.vm,
  });

  final DashboardVM vm;

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

class EditHoursWdg extends StatelessWidget {
  final DashboardVM vm;
  final int i;
  final Day? day;

  const EditHoursWdg({
    super.key,
    required this.vm,
    required this.i,
    required this.day,
  });

  bool get _enableAddPeriodBtn =>
      (day?.canSaveOrAddSecondPeriod ?? false) &&
      (day?.limitPeriodsReached != true) &&
      (day?.showSecondPeriod == false) &&
      (day?.closeAIsNextDay != true);

  InputDecoration get _dropdownDecoration => const InputDecoration(
        border: InputBorder.none,
        errorStyle: TextStyle(fontSize: 0),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: FoodlyThemes.error)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: FoodlyThemes.error)),
      );

  Widget _buildDropdownButton({
    required String key,
    required bool enabled,
    required String? value,
    required ValueChanged<Hour?> onChanged,
    required String? Function(Hour?)? validator,
    required String hintText,
  }) {
    return FoodlyDropdownButtonFormField<Hour>(
      key: Key(key),
      height: 48,
      width: 54,
      primaryIcon: const SizedBox.shrink(),
      enabled: enabled,
      decoration: _dropdownDecoration,
      onChanged: (hour) async {
        onChanged(hour);
        await Future.delayed(Durations.short4);
        vm.openingHoursFormKey?.currentState?.validate(); // Validate the form to update the error state
      },
      items: Hour.values
          .map((h) => DropdownMenuItem<Hour>(
                value: h,
                child: Text(h.value, style: FoodlyTextStyles.label),
              ))
          .toList(),
      value: Hour.values.firstWhereOrNull((h) => h.value == value),
      validator: validator,
      hint: Text(
        hintText,
        overflow: TextOverflow.ellipsis,
        style: FoodlyTextStyles.hintText.copyWith(fontSize: 13),
      ),
    );
  }

  Widget _buildDeleteButton({required void Function()? onPressed}) => IconButton.filledTonal(
        onPressed: onPressed,
        constraints: BoxConstraints.tight(const Size(26, 26)),
        tooltip: S.current.removeThisTimePeriod,
        icon: const Icon(Bootstrap.trash3, size: 16),
        padding: const EdgeInsets.all(4),
      );

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  _buildDropdownButton(
                    key: 'openA - Day: $i',
                    enabled: true,
                    value: day?.openA,
                    onChanged: (hour) =>
                        bloc.add(BusinessEvent.setOpeningHoursDay(i, day?.copyWith(openA: hour?.value) ?? const Day())),
                    validator: (p0) => (day?.closeA != null && p0 == null) || (day?.openAAndCloseBHaveConflict ?? false)
                        ? 'Error'
                        : null,
                    hintText: S.current.start,
                  ),
                  const Text('→', style: FoodlyTextStyles.captionPurpleBold).paddingOnly(right: 12, bottom: 3),
                  _buildDropdownButton(
                    key: 'closeA - Day: $i',
                    enabled: day?.openA != null,
                    value: day?.closeA,
                    onChanged: (hour) => bloc
                        .add(BusinessEvent.setOpeningHoursDay(i, day?.copyWith(closeA: hour?.value) ?? const Day())),
                    validator: (p0) => (day?.openA != null && p0 == null) || (day?.closeAAndOpenBHaveConflict ?? false)
                        ? 'Error'
                        : null,
                    hintText: S.current.end,
                  ),
                  _buildDeleteButton(
                    onPressed: day?.openA != null || day?.closeA != null
                        ? () => bloc.add(BusinessEvent.setOpeningHoursDay(
                            i,
                            day!.copyWith(
                              showSecondPeriod: false,
                              openA: day?.openB,
                              closeA: day?.closeB,
                              openB: null,
                              closeB: null,
                            )))
                        : null,
                  ),
                ],
              ),
              if ((day?.showSecondPeriod ?? false) || (day?.limitPeriodsReached ?? false))
                FadeIn(
                  child: Row(
                    children: [
                      _buildDropdownButton(
                        key: 'openB - Day: $i',
                        enabled: true,
                        value: day?.openB,
                        onChanged: (hour) => bloc
                            .add(BusinessEvent.setOpeningHoursDay(i, day?.copyWith(openB: hour?.value) ?? const Day())),
                        validator: (p0) =>
                            (day?.closeB != null && p0 == null) || (day?.closeAAndOpenBHaveConflict ?? false)
                                ? 'Error'
                                : null,
                        hintText: S.current.start,
                      ),
                      const Text('→', style: FoodlyTextStyles.captionPurpleBold).paddingOnly(right: 12, bottom: 3),
                      _buildDropdownButton(
                        key: 'closeB - Day: $i',
                        enabled: day?.openB != null,
                        value: day?.closeB,
                        onChanged: (hour) => bloc.add(
                            BusinessEvent.setOpeningHoursDay(i, day?.copyWith(closeB: hour?.value) ?? const Day())),
                        validator: (p0) =>
                            (day?.openB != null && p0 == null) || (day?.openAAndCloseBHaveConflict ?? false)
                                ? 'Error'
                                : null,
                        hintText: S.current.end,
                      ),
                      _buildDeleteButton(
                        onPressed: day != null
                            ? () => bloc.add(BusinessEvent.setOpeningHoursDay(
                                i,
                                day!.copyWith(
                                  showSecondPeriod: false,
                                  openB: null,
                                  closeB: null,
                                )))
                            : null,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          FadeIn(
            child: IconButton.filled(
              onPressed: _enableAddPeriodBtn
                  ? () => bloc
                      .add(BusinessEvent.setOpeningHoursDay(i, day?.copyWith(showSecondPeriod: true) ?? const Day()))
                  : null,
              constraints: BoxConstraints.tight(const Size(22, 22)),
              tooltip: S.current.addANewTimePeriod,
              icon: const Icon(Bootstrap.plus_circle, size: 16),
              padding: const EdgeInsets.all(3),
            ),
          ),
        ],
      ),
    );
  }
}
