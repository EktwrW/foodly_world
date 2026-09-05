part of '../../promotions_page.dart';

/// La card de promo en modo visita.
///
/// El diseño vive en [PromotionCardView]; acá solo se decide qué va arriba a
/// la derecha de la foto — el corazón de favoritos — porque es lo único que
/// separa esta pantalla de la del dueño.
///
/// El nombre `PromotionCard` se mantiene porque `main_top_offers_widget.dart`
/// lo usa para el sheet de detalle del carrusel de la home.
class PromotionCard extends StatelessWidget {
  final PromotionDM promo;

  /// Sin usar desde antes del rediseño; ningún llamador lo pasa.
  final Size? size;

  final EdgeInsetsGeometry? margin;

  const PromotionCard({super.key, required this.promo, this.size, this.margin});

  @override
  Widget build(BuildContext context) {
    return PromotionCardView(
      promo: promo,
      margin: margin,
      trailingAction: PromoFavoriteButton(promo: promo, favoriteKey: Key('fav-promo-${promo.uuid}')),
    );
  }
}
