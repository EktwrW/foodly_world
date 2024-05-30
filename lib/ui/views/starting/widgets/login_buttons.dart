import 'package:clay_containers/widgets/clay_text.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

enum LoginButtonType { primary, secondary }

class FoodlyLoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? verticalMargin;
  final bool disabled;
  final LoginButtonType? type;
  final NeumorphicShape? shape;
  final double? fontSize;

  const FoodlyLoginButton({
    super.key,
    this.onPressed,
    required this.text,
    this.padding,
    this.margin,
    required this.disabled,
    this.type = LoginButtonType.primary,
    this.verticalMargin,
    this.shape,
    this.fontSize,
  });

  NeumorphicShape get getShape => shape ?? NeumorphicShape.convex;
  TextStyle get getBaseTextStyle => FoodlyTextStyles.loginPrimaryCTA.copyWith(fontSize: fontSize ?? 18);

  @override
  Widget build(BuildContext context) {
    if (type == LoginButtonType.secondary) {
      return NeumorphicButton(
        onPressed: !disabled ? onPressed : null,
        margin: margin ?? EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: verticalMargin ?? 18),
        style: NeumorphicStyle(
          shape: getShape,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 3,
          intensity: 1.2,
          surfaceIntensity: .3,
          color: !disabled ? NeumorphicColors.embossMaxWhiteColor : Colors.grey[200],
        ),
        padding: padding ?? const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClayText(
              text,
              color: !disabled ? FoodlyThemes.primaryFoodly : Colors.grey,
              spread: 0.5,
              style: getBaseTextStyle,
            ),
          ],
        ),
      );
    }
    return NeumorphicButton(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      onPressed: !disabled ? onPressed : null,
      style: NeumorphicStyle(
        shape: getShape,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 3,
        intensity: 1.2,
        color: FoodlyThemes.primaryFoodly,
        surfaceIntensity: .8,
      ),
      padding: padding ?? const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClayText(
            text,
            color: NeumorphicColors.decorationMaxWhiteColor,
            spread: 0.5,
            style: getBaseTextStyle,
          ),
        ],
      ),
    );
  }
}
