import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';

class OpeningHoursWdg extends StatelessWidget {
  final DashboardVM vm;

  const OpeningHoursWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardSectionsTitle(
      firstText: '${S.current.dashboardOpeningHoursText1} ',
      secondText: S.current.dashboardOpeningHoursText2,
    );
  }
}
