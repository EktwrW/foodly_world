import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/service_packages/service_package_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/service_events_tracker.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_service_packages_state.dart';
part 'visit_service_packages_cubit.freezed.dart';

/// Cubit for the visitor-facing "Service Packages" page.
///
/// Receives an optional [business] piggy-backed via GoRouter's `state.extra`
/// so the page can surface UX state that isn't returned by the public
/// endpoints — specifically the `allow_reservations` flag that controls
/// whether the "Request service" CTA is enabled. When this page is reached
/// via a deep link (no extra), we default to `allowReservations=true` and
/// rely on the BE guard (`ReservationController::storeServiceBooking`) to
/// reject the request if the manager has actually disabled it.
class VisitServicePackagesCubit extends Cubit<VisitServicePackagesState> {
  final ServicePackageRepo _repo;
  final String businessUuid;
  final BusinessDM? _business;

  VisitServicePackagesCubit(this._repo, {required this.businessUuid, BusinessDM? business})
      : _business = business,
        super(const VisitServicePackagesState.initial()) {
    _fetchAll();
  }

  Future<void> _fetchAll() async {
    emit(const VisitServicePackagesState.loading());

    ProfessionalProfileDM? profile;
    List<ServicePackageDM> packages = [];
    bool hasError = false;

    final profileResult = await _repo.getPublicProfile(businessUuid);
    profileResult.when(
      success: (data) => profile = data.professionalProfile,
      failure: (_) {
        // Profile might not exist yet — that's OK for catering businesses just starting
      },
    );

    final packagesResult = await _repo.getPublicPackages(businessUuid);
    packagesResult.when(
      success: (data) => packages = data.servicePackages,
      failure: (error) {
        hasError = true;
        emit(VisitServicePackagesState.error(error.toString()));
      },
    );

    if (!hasError) {
      emit(VisitServicePackagesState.loaded(
        profile: profile,
        packages: packages,
        // Fail-open when no BusinessDM was threaded through (deep link case).
        allowReservations: _business?.allowReservations ?? true,
      ));

      // service.profile_view — fired once per page open, after the data is
      // ready. Tracking from the cubit (not the widget) makes the event
      // independent of widget rebuilds: navigating away and back reinstantiates
      // the cubit, so we get exactly one event per logical "profile open".
      di<ServiceEventsTracker>().profileView(
        businessUuid: businessUuid,
        sourceModule: 'VisitServicePackagesCubit',
      );
    }
  }
}
