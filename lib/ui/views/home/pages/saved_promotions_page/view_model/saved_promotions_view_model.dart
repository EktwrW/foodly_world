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

  List<SavedPromoBusinessDM> get businessesWithCurrentPromos {
    final result = <SavedPromoBusinessDM>[];
    for (final promo in currentPromos) {
      if (!result.any((b) => b.uuid == promo.businessUuid)) {
        final matches = businesses.where((b) => b.uuid == promo.businessUuid);
        if (matches.isNotEmpty) result.add(matches.first);
      }
    }
    return result;
  }

  List<SavedPromoBusinessDM> get businessesWithUpcomingPromos {
    final result = <SavedPromoBusinessDM>[];
    for (final promo in upcomingPromos) {
      if (!result.any((b) => b.uuid == promo.businessUuid)) {
        final matches = businesses.where((b) => b.uuid == promo.businessUuid);
        if (matches.isNotEmpty) result.add(matches.first);
      }
    }
    return result;
  }
}
