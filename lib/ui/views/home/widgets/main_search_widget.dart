import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/smart_search/widgets/smart_search_snackbars.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity, Iconsax;
import 'package:nova_places_api/models/place.dart';

part 'smart_search/current_location_btn.dart';
part 'smart_search/text_search_btn.dart';
part 'smart_search/voice_search_btn.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 8,
      children: [
        Expanded(child: CurrentLocationButton()),
        TextSmartSearchButton(),
        VoiceSearchButton(),
        Icon(Bootstrap.search, color: FoodlyThemes.primaryFoodly, size: 18),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 6);
  }
}
