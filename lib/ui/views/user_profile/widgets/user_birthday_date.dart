part of '../user_profile_page.dart';

class _BirthdayDate extends StatelessWidget {
  final String birthdayDate;

  const _BirthdayDate({super.key, required this.birthdayDate});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        spacing: 10,
        children: [
          const Icon(Bootstrap.cake, color: FoodlyThemes.primaryFoodly, size: 18),
          Text(birthdayDate, style: FoodlyTextStyles.primaryBodySemiBold),
        ],
      ).paddingOnly(left: 26, top: 16, bottom: 8),
    );
  }
}
