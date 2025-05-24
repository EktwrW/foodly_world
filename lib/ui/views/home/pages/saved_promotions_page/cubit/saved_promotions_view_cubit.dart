import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show PageController;
import 'package:foodly_world/data_models/promotions/promotion_dm.dart' show PromotionDM;
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/view_model/saved_promotions_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_promotions_view_state.dart';
part 'saved_promotions_view_cubit.freezed.dart';

class SavedPromotionsViewCubit extends Cubit<SavedPromotionsViewState> {
  SavedPromotionsViewVM _vm;

  SavedPromotionsViewCubit(
    List<PromotionDM> currentPromos,
    List<PromotionDM> upcomingPromos,
  )   : _vm = SavedPromotionsViewVM(
          controller: PageController(),
          currentPromos: currentPromos,
          upcomingPromos: upcomingPromos,
        ),
        super(const SavedPromotionsViewState.initial(SavedPromotionsViewVM())) {
    emit(_ChangeView(_vm));
  }
  
  /// Actualiza las promociones del cubit cuando cambia la lista de favoritos
  void updatePromotions(List<PromotionDM> currentPromos, List<PromotionDM> upcomingPromos) {
    // Conservamos el controller y el index view actuales
    _vm = _vm.copyWith(
      currentPromos: currentPromos,
      upcomingPromos: upcomingPromos,
    );
    
    emit(_ChangeView(_vm));
  }

  void changeView(int index) async {
    if (_vm.indexView == index) return;

    _vm = _vm.copyWith(indexView: index);

    emit(_ChangeView(_vm));
  }
}
