part of '../user_profile_page.dart';

class _BirthdayDate extends StatelessWidget {
  final String birthdayDate;

  /// Cuando true, [birthdayDate] es un texto-guía (no una fecha real) y se
  /// pinta atenuado. Lo usan los usuarios sin fecha cargada (p.ej. altas
  /// sociales) para invitar a completarla.
  final bool isPlaceholder;

  const _BirthdayDate({super.key, required this.birthdayDate, this.isPlaceholder = false});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        spacing: 10,
        children: [
          const Icon(Bootstrap.cake, color: FoodlyThemes.primaryFoodly, size: 18),
          Text(
            birthdayDate,
            style: isPlaceholder ? FoodlyTextStyles.hintText : FoodlyTextStyles.primaryBodySemiBold,
          ),
        ],
      ).paddingOnly(left: 26, top: 16, bottom: 8),
    );
  }
}
