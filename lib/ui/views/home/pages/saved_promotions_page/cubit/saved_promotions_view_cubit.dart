import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show PageController;
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/view_model/saved_promotions_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_promotions_view_state.dart';
part 'saved_promotions_view_cubit.freezed.dart';

class SavedPromotionsViewCubit extends Cubit<SavedPromotionsViewState> {
  SavedPromotionsViewVM _vm;

  SavedPromotionsViewCubit(
    List<NearbyPromotionDM> currentPromos,
    List<NearbyPromotionDM> upcomingPromos,
    List<SavedPromoBusinessDM> businesses,
  )   : _vm = SavedPromotionsViewVM(
          controller: PageController(),
          currentPromos: currentPromos,
          upcomingPromos: upcomingPromos,
          businesses: businesses,
        ),
        super(const SavedPromotionsViewState.initial(SavedPromotionsViewVM())) {
    emit(_ChangeView(_vm));
  }

  /// Actualiza las promociones del cubit cuando cambia la lista de favoritos
  void updatePromotions(
    List<NearbyPromotionDM> currentPromos,
    List<NearbyPromotionDM> upcomingPromos,
    List<SavedPromoBusinessDM> businesses,
  ) {
    _vm = _vm.copyWith(
      currentPromos: currentPromos,
      upcomingPromos: upcomingPromos,
      businesses: businesses,
    );
    emit(_ChangeView(_vm));
  }

  void changeView(int index) async {
    if (_vm.indexView == index) return;

    _vm = _vm.copyWith(indexView: index);

    emit(_ChangeView(_vm));
  }
}
