import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/opening_hours/current_opening_hours_wdg.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/opening_hours/edit_opening_hours_wdg.dart';

class OpeningHoursWdg extends StatelessWidget {
  final DashboardVM vm;

  const OpeningHoursWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
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
          child: EditOpeningHoursWdg(vm: vm),
        ),
      ],
    );
  }
}
