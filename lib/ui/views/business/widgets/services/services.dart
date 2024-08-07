import 'package:animate_do/animate_do.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/business_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/business/widgets/business_titles_rich_text.dart';

class ServicesWdg extends StatelessWidget {
  final BusinessVM vm;
  const ServicesWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return Form(
      key: vm.servicesFormKey,
      autovalidateMode: vm.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardSectionsTitle(
            firstText: '${S.current.dashboardServicesAtText1} ',
            secondText: S.current.dashboardServicesAtText2,
          ),
          Visibility(
            visible: vm.isEditingServices,
            replacement: TextButton(
              onPressed: () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.services)),
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
            DashboardSaveAndCancelButtons(
              onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
              onCancelPressed: () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none)),
              showSaveButton: !listEquals(vm.currentBusinessServices, vm.currentBusiness?.businessServices) &&
                  vm.currentBusinessServices.isNotEmpty,
            ).paddingTop(4),
        ],
      ),
    );
  }

  Widget buildChoiceContent(
    BuildContext context,
    BusinessServices e,
    bool selected,
    BusinessBloc bloc,
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
        onSelected: (bool selected) => bloc.add(BusinessEvent.setService(e)),
      ),
    );
  }
}
