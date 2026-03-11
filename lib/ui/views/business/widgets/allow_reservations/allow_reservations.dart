import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MaxLengthEnforcement;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' show NeumorphicSwitch, NeumorphicSwitchStyle;
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:icons_plus/icons_plus.dart' show FontAwesome;

class AllowReservations extends StatelessWidget {
  const AllowReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      buildWhen: (prev, curr) =>
          prev.vm.allowReservations != curr.vm.allowReservations ||
          prev.vm.currentBusiness?.reservationsSizeLimit != curr.vm.currentBusiness?.reservationsSizeLimit ||
          prev.vm.loggedUserCanEdit != curr.vm.loggedUserCanEdit,
      builder: (context, state) {
        final bloc = context.read<BusinessBloc>();
        final allowReservations = state.vm.currentBusiness?.allowReservations ?? state.vm.allowReservations;
        final canEdit = state.vm.loggedUserCanEdit;

        return Row(
          spacing: 16,
          children: [
            NeumorphicSwitch(
              value: allowReservations,
              onChanged: canEdit ? (val) => bloc.add(BusinessEvent.toggleAllowReservations(val)) : null,
              height: 32,
              style: const NeumorphicSwitchStyle(
                activeTrackColor: FoodlyThemes.primaryFoodly,
                inactiveTrackColor: Colors.black12,
                activeThumbColor: FoodlyThemes.success,
                inactiveThumbColor: FoodlyThemes.secondaryFoodly,
              ),
            ),
            Text(S.current.allowReservations, style: FoodlyTextStyles.actionsBody),
            const Spacer(),
            SizedBox(
              width: 84,
              height: 38,
              child: TextField(
                controller: state.vm.reservationSizeLimitCtrl?.controller,
                keyboardType: TextInputType.number,
                enabled: canEdit && allowReservations,
                decoration: InputDecoration(
                  labelText: S.current.maxSizeLabel,
                  labelStyle: const TextStyle(fontSize: 12),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                  counter: const SizedBox.shrink(),
                  suffixIcon: const Icon(FontAwesome.people_group_solid, size: 20),
                ),
                maxLength: 3,
                style: FoodlyTextStyles.actionsBody,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onSubmitted: (value) {
                  final parsed = int.tryParse(value);
                  if (parsed != null && parsed > 0) {
                    bloc.add(BusinessEvent.setReservationSizeLimit(parsed));
                  } else {
                    state.vm.reservationSizeLimitCtrl?.controller?.text =
                        '${state.vm.currentBusiness?.reservationsSizeLimit ?? 6}';
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
