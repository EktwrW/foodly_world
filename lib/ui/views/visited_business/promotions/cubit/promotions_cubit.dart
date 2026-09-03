import 'dart:async' show Completer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/view_model/promotions_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotions_cubit.freezed.dart';
part 'promotions_state.dart';

/// Cubit para mostrar las promociones de un negocio en modo solo lectura
/// para los clientes que visitan el negocio
class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsVM _vm;
  final Logger _logger;
  final BusinessRepo _businessRepo;

  PromotionsCubit(
    String businessUuid,
    BusinessDM? business,
    BusinessRepo businessRepo,
    Logger logger,
  )   : _vm = PromotionsVM(
          promotions: [],
          businessDM: business,
          businessUuid: businessUuid,
          controller: PageController(),
          activePromosScrollController: ScrollController(debugLabel: 'active'),
          upcomingPromosScrollController: ScrollController(debugLabel: 'upcoming'),
        ),
        _logger = logger,
        _businessRepo = businessRepo,
        super(const _Initial(PromotionsVM())) {
    _loadPromos();
  }

  /// Carga las promociones del negocio
  void _loadPromos() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    if (_vm.businessDM == null) {
      await _businessRepo.fetchBusinessById(_vm.businessUuid).then(
            (response) => response.when(
                success: (data) => _vm = _vm.copyWith(businessDM: data), failure: (e) => _handleError(e.errorMsg)),
          );
    }

    final promos = _vm.businessDM?.promotions ?? [];
    _vm = _vm.copyWith(promotions: promos);
    await _precachePromoImages(promos);
    emit(_Loaded(_vm));
  }

  /// Actualiza la vista actual (activas o próximas)
  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));

  Future<void> _precachePromoImages(List<PromotionDM> promos) {
    final futures = <Future<void>>[];
    for (final promo in promos) {
      for (final media in promo.promoMedia) {
        final f = _precacheUrlFuture(media.mediaUrl);
        if (f != null) futures.add(f);
      }
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url, cacheManager: FoodlyImageCache.manager).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
    ));
    return completer.future;
  }

  /// Maneja los errores que puedan ocurrir durante la carga de promociones
  void _handleError(Object e) {
    _logger.e(e);
    emit(_Error(e.toString(), _vm));
  }
}
