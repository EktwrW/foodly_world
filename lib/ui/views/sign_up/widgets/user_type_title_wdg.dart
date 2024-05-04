import 'package:animate_do/animate_do.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class SelectUserTitleWdg extends StatelessWidget {
  const SelectUserTitleWdg({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClayText(
          S.current.selectUserType,
          color: FoodlyThemes.primaryFoodly,
          spread: 0.5,
          style: FoodlyTextStyles.signUpSubtitle,
        ),
        InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Swing(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 1600),
            child: Flash(
              delay: const Duration(milliseconds: 600),
              child: NeumorphicIcon(
                Bootstrap.info_circle,
                size: 22,
                style: const NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
              ),
            ),
          ),
        ).paddingOnly(left: 12)
      ],
    ).paddingOnly(bottom: 30);
  }
}
