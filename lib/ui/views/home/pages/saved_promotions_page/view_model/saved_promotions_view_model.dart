import 'package:flutter/material.dart' show PageController;
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';

class SavedPromotionsViewVM {
  final PageController? controller;
  final int indexView;
  final List<PromotionDM> currentPromos;
  final List<PromotionDM> upcomingPromos;
  final List<BusinessDM> businesses;

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
    List<PromotionDM>? currentPromos,
    List<PromotionDM>? upcomingPromos,
    List<BusinessDM>? businesses,
  }) {
    return SavedPromotionsViewVM(
      controller: controller ?? this.controller,
      indexView: indexView ?? this.indexView,
      currentPromos: currentPromos ?? this.currentPromos,
      upcomingPromos: upcomingPromos ?? this.upcomingPromos,
      businesses: businesses ?? this.businesses,
    );
  }

  List<BusinessDM> get businessesWithCurrentPromos {
    final List<BusinessDM> businesses = [];

    for (final promo in currentPromos) {
      if (!businesses.any((b) => b.uuid == promo.business?.uuid)) {
        if (promo.business != null) businesses.add(promo.business!);
      }
    }

    return businesses;
  }

  List<BusinessDM> get businessesWithUpcomingPromos {
    final List<BusinessDM> businesses = [];

    for (final promo in upcomingPromos) {
      if (!businesses.any((b) => b.uuid == promo.business?.uuid)) {
        businesses.add(promo.business!);
      }
    }

    return businesses;
  }
}
