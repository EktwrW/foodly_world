import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/service_packages/service_package_repo.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_service_packages_state.dart';
part 'visit_service_packages_cubit.freezed.dart';

class VisitServicePackagesCubit extends Cubit<VisitServicePackagesState> {
  final ServicePackageRepo _repo;
  final String businessUuid;

  VisitServicePackagesCubit(this._repo, {required this.businessUuid})
      : super(const VisitServicePackagesState.initial()) {
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
      emit(VisitServicePackagesState.loaded(profile: profile, packages: packages));
    }
  }
}
