import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/coverage/foodly_coverage_bottom_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/smart_search/widgets/smart_search_snackbars.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:geolocator/geolocator.dart' show Geolocator;
import 'package:icons_plus_pro/icons_plus_pro.dart';
import 'package:nova_places_api/models/place.dart';

import 'new_releases/cubit/new_releases_cubit.dart';

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
        Expanded(child: CurrentLocationButton(style: CurrentLocationStyle.homeAppBar)),
        TextSmartSearchButton(),
        VoiceSearchButton(),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 6);
  }
}
