part of '../saved_promotions_page.dart';

class _SavedPromotionsView extends StatelessWidget {
  final List<BusinessDM> businesses;
  final List<PromotionDM> promos;
  final String title;

  const _SavedPromotionsView({
    super.key,
    required this.businesses,
    required this.promos,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (businesses.isEmpty || promos.isEmpty) {
      return const _EmptyListPlaceholder(
        text: 'Aun no tienes promociones guardadas en esta sección',
        key: Key('saved-promos-placeholder'),
      );
    }

    return Column(
      spacing: 12,
      children: [
        ClayText(
          title,
          textColor: FoodlyThemes.primaryFoodly,
          style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 15),
        ).paddingTop(16),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 12),
            itemBuilder: (_, i) {
              final business = businesses[i];
              final businessPromos = promos.where((p) => p.business?.uuid == business.uuid).toList();

              return _BusinessWithPromosCard(
                key: Key('business-with-promos-${business.uuid}'),
                business: business,
                promos: businessPromos,
              );
            },
            separatorBuilder: (_, i) => const SizedBox(height: 8),
            itemCount: businesses.length,
          ),
        ),
      ],
    );
  }
}
