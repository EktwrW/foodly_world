part of '../user_profile_page.dart';

class _BirthdayDate extends StatelessWidget {
  final String birthdayDate;

  const _BirthdayDate({super.key, required this.birthdayDate});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        children: [
          const Icon(Bootstrap.cake, color: FoodlyThemes.primaryFoodly, size: 22),
          Text(birthdayDate, style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12),
        ],
      ).paddingOnly(left: 26, top: 16, bottom: 8),
    );
  }
}
