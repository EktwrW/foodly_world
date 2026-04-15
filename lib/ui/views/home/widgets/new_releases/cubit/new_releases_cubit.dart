import 'dart:async' show Completer, StreamSubscription;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart' show ImageConfiguration, ImageStreamListener;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/view_model/new_releases_vm.dart';

class NewReleasesCubit extends Cubit<NewReleasesState> {
  final BusinessRepo _businessRepo;
  final LocationService _locationService;

  NewReleasesVM _vm = const NewReleasesVM();

  StreamSubscription<dynamic>? _locationSub;

  static const double _radius = 20.0;
  static const int _limit = 9;

  NewReleasesCubit({
    required BusinessRepo businessRepo,
    required LocationService locationService,
  })  : _businessRepo = businessRepo,
        _locationService = locationService,
        super(const NewReleasesState.initial(NewReleasesVM())) {
    // Auto-retry when location arrives — see NearbyPromotionsCubit for full
    // rationale. Same race condition: load() fires before LocationService
    // resolves, cubit gives up after 3 s, never recovers.
    _locationSub = _locationService.locationChanged.listen((locationDM) {
      if (locationDM.position == null) return;
      final hasData = _vm.businesses.isNotEmpty;
      if (hasData || _vm.isLoading) return;
      load();
    });
  }

  NewReleasesVM get vm => _vm;

  @override
  Future<void> close() {
    _locationSub?.cancel();
    return super.close();
  }

  Future<void> load() async {
    // Location may not be ready yet at startup — retry up to 3 s.
    for (var i = 0; i < 10; i++) {
      if (_locationService.currentLocation.position != null) break;
      await Future.delayed(const Duration(milliseconds: 300));
    }

    final position = _locationService.currentLocation.position;
    if (position == null) {
      _vm = _vm.copyWith(error: 'Location not available');
      emit(NewReleasesState.error(_vm, 'Location not available'));
      return;
    }

    _vm = _vm.copyWith(isLoading: true, error: null);
    emit(NewReleasesState.loading(_vm));

    final result = await _businessRepo.fetchNewReleases(
      latitude: position.latitude,
      longitude: position.longitude,
      radius: _radius,
      limit: _limit,
    );

    await result.when(
      success: (response) async {
        _vm = _vm.copyWith(
          businesses: response.business,
          isLoading: false,
          error: null,
        );
        await _precacheImages(response.business);
        emit(NewReleasesState.loaded(_vm));
      },
      failure: (e) async {
        _vm = _vm.copyWith(isLoading: false, error: e.toString());
        emit(NewReleasesState.error(_vm, e.toString()));
      },
    );
  }

  void clear() {
    _vm = const NewReleasesVM();
    emit(const NewReleasesState.initial(NewReleasesVM()));
  }

  Future<void> _precacheImages(List<BusinessDM> businesses) {
    final futures = <Future<void>>[];
    for (final business in businesses) {
      final f = _precacheUrlFuture(business.logo);
      if (f != null) futures.add(f);
      for (final img in business.coverImages) {
        final f2 = _precacheUrlFuture(img.url);
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
