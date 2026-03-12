import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/view_model/new_releases_vm.dart';

class NewReleasesCubit extends Cubit<NewReleasesState> {
  final BusinessRepo _businessRepo;
  final LocationService _locationService;

  NewReleasesVM _vm = const NewReleasesVM();

  static const double _radius = 20.0;
  static const int _limit = 6;

  NewReleasesCubit({
    required BusinessRepo businessRepo,
    required LocationService locationService,
  })  : _businessRepo = businessRepo,
        _locationService = locationService,
        super(const NewReleasesState.initial(NewReleasesVM()));

  NewReleasesVM get vm => _vm;

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

    result.when(
      success: (response) {
        _vm = _vm.copyWith(
          businesses: response.business,
          isLoading: false,
          error: null,
        );
        emit(NewReleasesState.loaded(_vm));
      },
      failure: (e) {
        _vm = _vm.copyWith(isLoading: false, error: e.toString());
        emit(NewReleasesState.error(_vm, e.toString()));
      },
    );
  }

  void clear() {
    _vm = const NewReleasesVM();
    emit(const NewReleasesState.initial(NewReleasesVM()));
  }
}
