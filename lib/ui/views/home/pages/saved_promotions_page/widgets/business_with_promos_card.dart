part of '../saved_promotions_page.dart';

class _BusinessWithPromosCard extends StatelessWidget {
  final SavedPromoBusinessDM business;
  final List<NearbyPromotionDM> promos;

  const _BusinessWithPromosCard({
    super.key,
    required this.business,
    required this.promos,
  });

  @override
  Widget build(BuildContext context) {
    // No mostrar la tarjeta de negocio si no tiene promociones
    if (promos.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: AnimatedSize(
        key: ValueKey(business),
        duration: Durations.long1,
        curve: Curves.decelerate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Flexible(child: MyFavoritesBusinessMiniCard(savedPromoBusiness: business)),
            ...promos.map((p) => Flexible(
                key: Key('promo-card-${p.uuid}'), child: SizedBox(height: 400, child: NearbyPromoCard(promo: p)))),
          ],
        ).paddingBottom(8),
      ),
    );
  }
}
