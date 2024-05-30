import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;
import 'package:logger/logger.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

part 'edit_address_dialog.dart';

class AddressWdg extends StatelessWidget {
  const AddressWdg({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (vm) {
            if (vm.isEditingAddress) {
              di<DialogService>().showCustomDialog(const EditAddressDialog(), 2);
            }
          },
        );
      },
      child: InkWell(
        onTap: () {
          bloc.add(const DashboardEvent.updateEditing(DashboardEditing.address));
        },
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: FoodlyThemes.tertiaryFoodly,
          child: Row(
            children: [
              const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
              Expanded(
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return Text(
                      state.vm.currentBusiness?.fullAddress ?? '',
                      maxLines: 5,
                      style: FoodlyTextStyles.bodyWhiteSemibold,
                    );
                  },
                ).paddingLeft(8),
              ),
            ],
          ).paddingAll(6),
        ),
      ),
    );
  }
}
