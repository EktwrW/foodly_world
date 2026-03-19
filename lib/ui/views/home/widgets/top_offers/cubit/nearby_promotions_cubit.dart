import 'dart:async' show Completer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart' show ImageConfiguration, ImageStreamListener;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_transfer_objects/favorites/set_favorite_body_dto.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_state.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/view_model/nearby_promotions_vm.dart';
import 'package:logger/logger.dart';

class NearbyPromotionsCubit extends Cubit<NearbyPromotionsState> {
  final BusinessRepo _businessRepo;
  final LocationService _locationService;
  final FavoritesCubit _favoritesCubit;
  final Logger _logger;

  NearbyPromotionsVM _vm = const NearbyPromotionsVM();

  static const int _perPage = 10;
  static const double _radius = 10.0;

  NearbyPromotionsCubit({
    required BusinessRepo businessRepo,
    required LocationService locationService,
    required FavoritesCubit favoritesCubit,
    required Logger logger,
  })  : _businessRepo = businessRepo,
        _locationService = locationService,
        _favoritesCubit = favoritesCubit,
        _logger = logger,
        super(const NearbyPromotionsState.initial(NearbyPromotionsVM()));

  NearbyPromotionsVM get vm => _vm;

  /// Initial load — always starts at page 1, replaces current list.
  Future<void> load() async {
    // Location may not be ready yet at startup/hot-restart — retry up to 3 s.
    for (var i = 0; i < 10; i++) {
      if (_locationService.currentLocation.position != null) break;
      await Future.delayed(const Duration(milliseconds: 300));
    }

    final position = _locationService.currentLocation.position;
    if (position == null) {
      _vm = _vm.copyWith(error: 'Location not available');
      emit(NearbyPromotionsState.error(_vm, 'Location not available'));
      return;
    }

    _vm = _vm.copyWith(isLoading: true, error: null);
    emit(NearbyPromotionsState.loading(_vm));

    final result = await _businessRepo.fetchNearbyPromotions(
      latitude: position.latitude,
      longitude: position.longitude,
      radius: _radius,
      page: 1,
      perPage: _perPage,
    );

    await result.when(
      success: (response) async {
        _vm = _vm.copyWith(
          promotions: response.data,
          hasMore: response.meta.hasMore,
          currentPage: 1,
          isLoading: false,
          error: null,
        );
        await _precacheImages(response.data);
        emit(NearbyPromotionsState.loaded(_vm));
      },
      failure: (e) async {
        _logger.e('NearbyPromotionsCubit.load error: $e');
        _vm = _vm.copyWith(isLoading: false, error: e.toString());
        emit(NearbyPromotionsState.error(_vm, e.toString()));
      },
    );
  }

  /// Load next page — appends to existing list. Called when carousel nears the end.
  Future<void> loadMore() async {
    if (!_vm.hasMore || _vm.isLoadingMore || _vm.isLoading) return;

    final position = _locationService.currentLocation.position;
    if (position == null) return;

    final nextPage = _vm.currentPage + 1;
    _vm = _vm.copyWith(isLoadingMore: true);
    emit(NearbyPromotionsState.loadingMore(_vm));

    final result = await _businessRepo.fetchNearbyPromotions(
      latitude: position.latitude,
      longitude: position.longitude,
      radius: _radius,
      page: nextPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          promotions: [..._vm.promotions, ...response.data],
          hasMore: response.meta.hasMore,
          currentPage: nextPage,
          isLoadingMore: false,
        );
        emit(NearbyPromotionsState.loaded(_vm));
        _precacheImages(response.data); // fire-and-forget for pagination
      },
      failure: (e) {
        _logger.e('NearbyPromotionsCubit.loadMore error: $e');
        _vm = _vm.copyWith(isLoadingMore: false);
        emit(NearbyPromotionsState.loaded(_vm)); // stay on loaded, just no more items
      },
    );
  }

  /// Optimistic favorite toggle with server sync and revert on failure.
  Future<void> toggleFavorite(String promoUuid) async {
    final idx = _vm.promotions.indexWhere((p) => p.uuid == promoUuid);
    if (idx == -1) return;

    final promo = _vm.promotions[idx];
    final newValue = !promo.isFavorited;

    // Optimistic update
    final updated = List<NearbyPromotionDM>.from(_vm.promotions);
    updated[idx] = promo.copyWith(isFavorited: newValue);
    _vm = _vm.copyWith(promotions: updated);
    emit(NearbyPromotionsState.loaded(_vm));

    final result = await _businessRepo.setFavoritePromotion(
      promoUuid,
      SetFavoriteBodyDTO(isFavorite: newValue),
    );

    result.when(
      success: (_) {
        if (newValue) {
          _favoritesCubit.addNearbyPromoFavorite(updated[idx]);
        } else {
          _favoritesCubit.removePromoFavoriteByUuid(promoUuid);
        }
      },
      failure: (e) {
        _logger.e('NearbyPromotionsCubit.toggleFavorite error: $e');
        // Revert on failure
        final reverted = List<NearbyPromotionDM>.from(_vm.promotions);
        reverted[idx] = promo;
        _vm = _vm.copyWith(promotions: reverted);
        emit(NearbyPromotionsState.loaded(_vm));
      },
    );
  }

  /// Clear state on logout.
  void clear() {
    _vm = const NearbyPromotionsVM();
    emit(const NearbyPromotionsState.initial(NearbyPromotionsVM()));
  }

  Future<void> _precacheImages(List<NearbyPromotionDM> promos) {
    final futures = <Future<void>>[];
    for (final promo in promos) {
      final f1 = _precacheUrlFuture(promo.businessLogo);
      if (f1 != null) futures.add(f1);
      if (promo.promoMedia?.isImage == true) {
        final f2 = _precacheUrlFuture(promo.promoMedia?.mediaUrl);
        if (f2 != null) futures.add(f2);
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
    final stream = CachedNetworkImageProvider(url).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) { if (!completer.isCompleted) completer.complete(); },
      onError: (_, __) { if (!completer.isCompleted) completer.complete(); },
    ));
    return completer.future;
  }
}
