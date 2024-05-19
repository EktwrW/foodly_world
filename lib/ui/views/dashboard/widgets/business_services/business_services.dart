import 'package:animate_do/animate_do.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
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

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardTitleRichText(firstText: 'Servicios en el ', secondText: 'Establecimiento'),
        Visibility(
          visible: vm.isEditingServices,
          replacement: TextButton(
            onPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.services)),
            style: TextButton.styleFrom(
              padding: vm.currentBusiness?.services?.isEmpty ?? true ? null : EdgeInsets.zero,
            ),
            child: vm.currentBusiness?.services?.isEmpty ?? true
                ? FadeIn(
                    child: const Text(
                      'Agregar Servicios',
                      style: FoodlyTextStyles.profileSectionTextButton,
                    ),
                  )
                : Center(
                    child: Wrap(
                      spacing: context.screenWidth * .018,
                      runSpacing: 10,
                      children: BusinessServices.values
                          .map(
                            (e) => SizedBox(
                              width: context.screenWidth * .445,
                              child: Row(
                                children: [
                                  Icon(e.iconData, size: 20),
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
                  ),
          ),
          child: Center(
            child: Wrap(
              spacing: context.screenWidth * .018,
              children: BusinessServices.values.mapIndexed(
                (i, e) {
                  final selected = vm.currentBusinessServices.contains(e.name);

                  if (i.isEven) {
                    return FadeInLeft(
                      duration: Durations.medium2,
                      delay: Duration(milliseconds: 50 * i),
                      child: buildChoiceContent(context, e, selected),
                    );
                  }

                  return FadeInRight(
                    duration: Durations.medium2,
                    delay: Duration(milliseconds: 50 * i),
                    child: buildChoiceContent(context, e, selected),
                  );
                },
              ).toList(),
            ).paddingTop(10),
          ),
        ),
        if (vm.isEditingServices)
          DasboardSaveAndCancelButtons(
            onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
            onCancelPressed: () {
              //widget.vm.businessAboutUsCtrl?.controller?.clear();
              bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
            },
          ).paddingTop(4),
      ],
    );
  }

  SizedBox buildChoiceContent(
    BuildContext context,
    BusinessServices e,
    bool selected,
  ) {
    return SizedBox(
      width: context.screenWidth * .445,
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
        onSelected: (bool selected) {},
      ),
    );
  }
}
