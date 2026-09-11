import 'package:flutter/material.dart' show PageController;
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart' show NearbyPromotionDM;

class SavedPromotionsViewVM {
  final PageController? controller;
  final int indexView;
  final List<NearbyPromotionDM> currentPromos;
  final List<NearbyPromotionDM> upcomingPromos;
  final List<SavedPromoBusinessDM> businesses;

  const SavedPromotionsViewVM({
    this.controller,
    this.indexView = 0,
    this.currentPromos = const [],
    this.upcomingPromos = const [],
    this.businesses = const [],
  });

  SavedPromotionsViewVM copyWith({
    PageController? controller,
    int? indexView,
    List<NearbyPromotionDM>? currentPromos,
    List<NearbyPromotionDM>? upcomingPromos,
    List<SavedPromoBusinessDM>? businesses,
  }) {
    return SavedPromotionsViewVM(
      controller: controller ?? this.controller,
      indexView: indexView ?? this.indexView,
      currentPromos: currentPromos ?? this.currentPromos,
      upcomingPromos: upcomingPromos ?? this.upcomingPromos,
      businesses: businesses ?? this.businesses,
    );
  }

  List<SavedPromoBusinessDM> get businessesWithCurrentPromos => _negociosDe(currentPromos);

  List<SavedPromoBusinessDM> get businessesWithUpcomingPromos => _negociosDe(upcomingPromos);

  /// Negocios con al menos una promoción en [promos], en el orden en que
  /// aparece la primera de cada uno. Se lee dentro de un `build`: el índice por
  /// uuid es para no recorrer `businesses` por cada promo.
  List<SavedPromoBusinessDM> _negociosDe(List<NearbyPromotionDM> promos) {
    final porUuid = {for (final negocio in businesses) negocio.uuid: negocio};
    final vistos = <String>{};
    final resultado = <SavedPromoBusinessDM>[];

    for (final promo in promos) {
      if (!vistos.add(promo.businessUuid)) continue; // `add` es false si ya estaba

      final negocio = porUuid[promo.businessUuid];
      if (negocio != null) resultado.add(negocio);
    }

    return resultado;
  }
}
