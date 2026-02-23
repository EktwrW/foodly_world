import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/manage_promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/view_model/manage_promotions_vm.dart';

class PromotionsHelper {
  const PromotionsHelper._();

  static void showDatePickerDialog(
    BuildContext context,
    ManagePromotionsCubit cubit,
    ManagePromotionsVM vm, {
    required DateTime initialDate,
    required bool isStartDate,
  }) {
    final initialDateToUse = isStartDate
        ? initialDate
        : vm.newPromo?.expireDate != null && vm.newPromo?.startDate != null
            ? (vm.newPromo!.expireDate.isBefore(vm.newPromo!.startDate)
                ? vm.newPromo!.expireDate
                : vm.newPromo!.startDate)
            : vm.newPromo?.expireDate ?? vm.newPromo?.startDate ?? DateTime.now();

    showDatePicker(
      context: context,
      initialDate: (vm.newPromo?.isExpired == true) ? DateTime.now() : initialDateToUse,
      firstDate: isStartDate || (vm.newPromo?.isExpired == true) ? DateTime.now() : initialDateToUse,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((date) {
      if (date != null) {
        cubit.updatePromoDate(date, isStartDate: isStartDate);
      }
    });
  }

  static String getDayName(int index) {
    return switch (index) {
      0 => S.current.weekday1,
      1 => S.current.weekday2,
      2 => S.current.weekday3,
      3 => S.current.weekday4,
      4 => S.current.weekday5,
      5 => S.current.weekday6,
      6 => S.current.weekday7,
      _ => '',
    };
  }

  static List<DateTime> getAvailableDates({
    required bool isStartDate,
    DateTime? startDate,
  }) {
    final now = DateTime.now();
    final dates = <DateTime>[];

    if (isStartDate) {
      // Para fecha de inicio: desde hoy hasta 6 meses adelante
      for (var i = 0; i < 180; i++) {
        dates.add(now.add(Duration(days: i)));
      }
    } else {
      // Para fecha de fin: desde startDate+1 hasta 6 meses después del startDate
      final start = startDate ?? now;
      for (var i = 1; i <= 180; i++) {
        dates.add(start.add(Duration(days: i)));
      }
    }

    return dates;
  }

  static Set<Weekday> getSelectedDays(PromoDaysDM? days) {
    if (days == null) return {};
    return {
      if (days.sunday) Weekday.sunday,
      if (days.monday) Weekday.monday,
      if (days.tuesday) Weekday.tuesday,
      if (days.wednesday) Weekday.wednesday,
      if (days.thursday) Weekday.thursday,
      if (days.friday) Weekday.friday,
      if (days.saturday) Weekday.saturday,
    };
  }
}
