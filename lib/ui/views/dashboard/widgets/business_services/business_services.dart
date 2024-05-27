import 'package:animate_do/animate_do.dart';
import 'package:collection/collection.dart' show ListEquality, ListExtensions;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';

class BusinessServicesWdg extends StatelessWidget {
  final DashboardVM vm;
  const BusinessServicesWdg({
    super.key,
    required this.vm,
  });

  static const _equality = ListEquality();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardTitleRichText(
          firstText: '${S.current.dashboardServicesAtText1} ',
          secondText: S.current.dashboardServicesAtText2,
        ),
        Visibility(
          visible: vm.isEditingServices,
          replacement: TextButton(
            onPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.services)),
            style: TextButton.styleFrom(
              padding: vm.currentBusiness?.businessServices.isEmpty ?? true ? null : EdgeInsets.zero,
            ),
            child: vm.currentBusiness?.businessServices.isEmpty ?? true
                ? FadeIn(
                    child: Row(
                      children: [
                        Text(
                          S.current.addServices,
                          style: FoodlyTextStyles.profileSectionTextButton,
                        ),
                      ],
                    ),
                  )
                : FadeIn(
                    child: SizedBox(
                      width: context.screenWidth,
                      child: Wrap(
                        spacing: context.screenWidth * .02,
                        runSpacing: 10,
                        children: vm.currentBusiness!.businessServices
                            .map(
                              (e) => SizedBox(
                                width: context.screenWidth * .405,
                                child: Row(
                                  children: [
                                    Icon(e.iconData, size: 18),
                                    Flexible(
                                        child: Text(
                                      e.text,
                                      style: FoodlyTextStyles.caption,
                                      overflow: TextOverflow.ellipsis,
                                    ).paddingLeft(10)),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ).paddingVertical(10),
                    ).paddingHorizontal(8),
                  ),
          ),
          child: Center(
            child: Wrap(
              spacing: context.screenWidth * .02,
              children: BusinessServices.values.mapIndexed(
                (i, e) {
                  final selected = vm.currentBusinessServices.contains(e);

                  if (i.isEven) {
                    return FadeInLeft(
                      duration: Durations.medium2,
                      delay: Duration(milliseconds: 50 * i),
                      child: buildChoiceContent(context, e, selected, bloc),
                    );
                  }

                  return FadeInRight(
                    duration: Durations.medium2,
                    delay: Duration(milliseconds: 50 * i),
                    child: buildChoiceContent(context, e, selected, bloc),
                  );
                },
              ).toList(),
            ).paddingTop(10),
          ),
        ),
        if (vm.isEditingServices)
          DasboardSaveAndCancelButtons(
            onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
            onCancelPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none)),
            showSaveButton: !_equality.equals(vm.currentBusinessServices, vm.currentBusiness?.businessServices),
          ).paddingTop(4),
      ],
    );
  }

  Widget buildChoiceContent(
    BuildContext context,
    BusinessServices e,
    bool selected,
    DashboardBloc bloc,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.screenWidth * .44),
      child: ChoiceChip.elevated(
        tooltip: e.text,
        label: Row(
          children: [
            Icon(e.iconData, size: 19, color: selected ? Colors.white : null),
            Flexible(
                child: Text(
              e.text,
              overflow: TextOverflow.ellipsis,
            ).paddingLeft(10)),
          ],
        ),
        checkmarkColor: selected ? Colors.white : null,
        selectedColor: FoodlyThemes.primaryFoodly,
        labelStyle: selected ? FoodlyTextStyles.choiceChipWhiteBold : FoodlyTextStyles.choiceChipBold,
        selected: selected,
        onSelected: (bool selected) => bloc.add(DashboardEvent.setService(e)),
      ),
    );
  }
}
