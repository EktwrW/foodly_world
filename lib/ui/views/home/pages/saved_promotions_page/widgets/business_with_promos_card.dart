part of '../saved_promotions_page.dart';

class _BusinessWithPromosCard extends StatelessWidget {
  final BusinessDM business;
  final List<PromotionDM> promos;

  const _BusinessWithPromosCard({
    super.key,
    required this.business,
    required this.promos,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Flexible(child: MyFavoritesBusinessMiniCard(business: business)),
          ...promos.map((p) => Flexible(child: PromotionCard(promo: p, margin: const EdgeInsets.all(8)))),
        ],
      ),
    );
  }
}
