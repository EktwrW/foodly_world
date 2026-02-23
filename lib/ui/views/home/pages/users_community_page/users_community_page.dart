import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/view_model/users_community_vm.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart' show CurrentLocationButton;
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:toggle_switch/toggle_switch.dart' show ToggleSwitch;

class UsersCommunityPage extends StatelessWidget {
  const UsersCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryMainAppBar(
        key: Key('community-app-bar'),
        actionText: 'Social Community',
      ),
      body: Column(
        children: [
          const CurrentLocationButton().paddingSymmetric(horizontal: 12, vertical: 24),
          ToggleSwitch(
            labels: UsersCommunityViews.values.map((e) => e.title).toList(),
            initialLabelIndex: 0,
            animate: true,
            animationDuration: 500,
            minHeight: 30,
            minWidth: (context.screenWidth - 44) / 2,
            cornerRadius: 6.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            totalSwitches: UsersCommunityViews.values.length,
            customTextStyles: const [
              TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ],
            borderColor: const [
              FoodlyThemes.tertiaryFoodly,
              FoodlyThemes.secondaryFoodly,
              FoodlyThemes.primaryFoodly,
            ],
            dividerColor: FoodlyThemes.secondaryFoodly,
            activeBgColors: const [
              [FoodlyThemes.primaryFoodly],
              [FoodlyThemes.primaryFoodly],
            ],
          ),
        ],
      ),
    );
  }
}
