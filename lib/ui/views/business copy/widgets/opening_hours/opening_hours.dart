import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/opening_hours/current_opening_hours_wdg.dart';
import 'package:foodly_world/ui/views/business/widgets/opening_hours/edit_opening_hours_wdg.dart';

class OpeningHoursWdg extends StatelessWidget {
  final BusinessVM vm;

  const OpeningHoursWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
            firstText: '${S.current.dashboardOpeningHoursText1} ',
            secondText: S.current.dashboardOpeningHoursText2,
            onPressed: !vm.loggedUserCanEdit || vm.isEditingOpeningHours
                ? null
                : () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.openingHours))),
        Visibility(
          visible: vm.isEditingOpeningHours,
          replacement: CurrentOpeningHoursWdg(vm: vm),
          child: EditOpeningHoursWdg(vm: vm),
        ),
      ],
    );
  }
}
