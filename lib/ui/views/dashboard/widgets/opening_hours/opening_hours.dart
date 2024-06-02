import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardSectionsTitle(
          firstText: '${S.current.dashboardOpeningHoursText1} ',
          secondText: S.current.dashboardOpeningHoursText2,
        ),
        Visibility(
          visible: vm.isEditingOpeningHours,
          replacement: TextButton(
            onPressed: () {
              bloc.add(const DashboardEvent.updateEditing(DashboardEditing.openingHours));
            },
            child: Row(
              children: [
                Expanded(
                  child: FadeIn(
                    child: Text(
                      S.current.addOpeningHours,
                      style: (vm.currentBusiness?.openingHours != null)
                          ? FoodlyTextStyles.actionsBody
                          : FoodlyTextStyles.profileSectionTextButton,
                    ),
                  ),
                )
              ],
            ),
          ),
          child: Form(
            key: vm.openingHoursFormKey,
            autovalidateMode: vm.autovalidateMode,
            child: DashboardSaveAndCancelButtons(
              showSaveButton: false,
              onCancelPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none)),
            ),
          ),
        ),
      ],
    );
  }
}
