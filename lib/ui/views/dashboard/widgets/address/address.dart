import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/helpers/dashboard_helpers.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Clarity;
import 'package:logger/logger.dart';

part 'edit_address_dialog.dart';

class AddressWdg extends StatelessWidget {
  const AddressWdg({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return InkWell(
      onTap: () => bloc.add(const DashboardEvent.editLocationDialog()),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: FoodlyThemes.tertiaryFoodly,
        child: Row(
          children: [
            const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
            Expanded(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) => Text(
                  state.vm.currentBusiness?.fullAddress ?? '',
                  maxLines: 5,
                  style: FoodlyTextStyles.bodyWhiteSemibold,
                ),
              ).paddingLeft(8),
            ),
          ],
        ).paddingAll(6),
      ),
    );
  }
}
