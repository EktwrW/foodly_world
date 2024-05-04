import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Asset(FoodlyAssets.logo, width: 250),
          Text(
            S.current.notFoundPageText,
            style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 28),
            textAlign: TextAlign.center,
          ).paddingVertical(40),
          const Asset(FoodlyAssets.logo369, width: 100),
        ],
      ).paddingHorizontal(UIDimens.SCREEN_PADDING_MOB),
    );
  }
}
