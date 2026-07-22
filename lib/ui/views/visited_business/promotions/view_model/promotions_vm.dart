import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/data_models/promotions/promotion_dm.dart';

part 'promotions_vm.freezed.dart';

/// Estados de una promoción para su visualización
enum PromotionStatus {
  active,
  next;

  String get text => switch (this) {
        PromotionStatus.active => S.current.promoTabActive,
        PromotionStatus.next => S.current.promoTabUpcoming,
      };
}

@freezed
abstract class PromotionsVM with _$PromotionsVM {
  const PromotionsVM._();

  const factory PromotionsVM({
    @Default([]) List<PromotionDM> promotions,
    @Default('') String businessUuid,
    BusinessDM? businessDM,
    @Default(0) int indexView,
    PageController? controller,
    ScrollController? activePromosScrollController,
    ScrollController? upcomingPromosScrollController,
  }) = _PromotionsVM;

  /// URL del logo del negocio
  String get businessLogo => businessDM?.logo ?? '';

  /// Obtiene las promociones según el estado seleccionado
  List<PromotionDM> promotionsForRender(PromotionStatus status) {
    return switch (status) {
      PromotionStatus.next => upcomingPromotions,
      PromotionStatus.active => activePromotions,
    };
  }

  /// Promociones que aún no han comenzado
  List<PromotionDM> get upcomingPromotions {
    final now = DateTime.now();
    return sortedPromotions.where((promo) => promo.startDate.isAfter(now)).toList();
  }

  /// Promociones que están activas actualmente
  List<PromotionDM> get activePromotions {
    final now = DateTime.now();
    return sortedPromotions.where((promo) => promo.startDate.isBefore(now) && promo.expireDate.isAfter(now)).toList();
  }

  /// Promociones ordenadas por fecha de inicio (más recientes primero)
  List<PromotionDM> get sortedPromotions {
    return List<PromotionDM>.from(promotions)..sort((a, b) => b.startDate.compareTo(a.startDate));
  }

  /// Próxima promoción que va a comenzar
  PromotionDM? get nextUpcomingPromotion {
    return upcomingPromotions.isEmpty
        ? null
        : upcomingPromotions.reduce((a, b) => a.startDate.isBefore(b.startDate) ? a : b);
  }
}
