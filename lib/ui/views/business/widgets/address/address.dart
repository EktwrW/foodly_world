import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/helpers/dashboard_helpers.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity;

part 'edit_address_dialog.dart';

class AddressWdg extends StatelessWidget {
  const AddressWdg({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return InkWell(
      onTap: () => bloc.add(const BusinessEvent.editLocationDialog()),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: FoodlyThemes.tertiaryFoodly,
        child: Row(
          children: [
            const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
            Expanded(
              child: BlocSelector<BusinessBloc, BusinessState, String>(
                selector: (state) => state.vm.currentBusiness?.fullAddress ?? '',
                builder: (context, fullAddress) => Text(
                  fullAddress,
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
