part of '../saved_promotions_page.dart';

class _SavedPromotionsView extends StatelessWidget {
  final List<SavedPromoBusinessDM> businesses;
  final List<NearbyPromotionDM> promos;
  final String title;

  const _SavedPromotionsView({
    super.key,
    required this.businesses,
    required this.promos,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Si no hay negocios o promociones, mostrar mensaje vacío
    if (businesses.isEmpty || promos.isEmpty) {
      return _EmptyListPlaceholder(
        text: S.current.noSavedPromotionsInSection,
        key: const Key('saved-promos-placeholder'),
      );
    }

    // Filtramos los negocios para mostrar solo aquellos que tienen promociones
    final List<SavedPromoBusinessDM> businessesWithPromos = [];
    final Map<String, List<NearbyPromotionDM>> businessPromosMap = {};

    // Agrupamos las promociones por negocio
    for (final business in businesses) {
      final businessPromos = promos.where((p) => p.businessUuid == business.uuid).toList();

      // Solo incluimos negocios que tienen al menos una promoción
      if (businessPromos.isNotEmpty) {
        businessesWithPromos.add(business);
        businessPromosMap[business.uuid] = businessPromos;
      }
    }

    // Si después de filtrar no hay negocios con promociones, mostrar mensaje vacío
    if (businessesWithPromos.isEmpty) {
      return _EmptyListPlaceholder(
        text: S.current.noSavedPromotionsInSection,
        key: const Key('saved-promos-placeholder'),
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
            padding: const EdgeInsets.only(bottom: 160),
            itemBuilder: (_, i) {
              final business = businessesWithPromos[i];
              final businessPromos = businessPromosMap[business.uuid] ?? [];

              return _BusinessWithPromosCard(
                key: Key('business-with-promos-${business.uuid}'),
                business: business,
                promos: businessPromos,
              );
            },
            separatorBuilder: (_, i) => const SizedBox(height: 16),
            itemCount: businessesWithPromos.length,
          ),
        ),
      ],
    );
  }
}
