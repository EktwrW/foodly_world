import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/service_packages/service_package_repo.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/views/business/service_packages/cubit/service_packages_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'service_packages_cubit.freezed.dart';
part 'service_packages_state.dart';

class ServicePackagesCubit extends Cubit<ServicePackagesState> {
  final ServicePackageRepo _repo;
  final Logger _logger;
  ServicePackagesVM _vm;

  ServicePackagesCubit({
    required ServicePackageRepo repo,
    required Logger logger,
    required String businessUuid,
  })  : _repo = repo,
        _logger = logger,
        _vm = ServicePackagesVM(businessUuid: businessUuid),
        super(ServicePackagesState.initial(ServicePackagesVM(businessUuid: businessUuid))) {
    fetchAll();
  }

  // ── Fetch all data ─────────────────────────────────────────

  Future<void> fetchAll() async {
    if (_vm.businessUuid == null) return;
    emit(ServicePackagesState.loading(_vm));

    // Fetch profile and packages in parallel
    final results = await Future.wait([
      _repo.getProfile(_vm.businessUuid!),
      _repo.getPackages(_vm.businessUuid!),
    ]);

    final profileResult = results[0];
    final packagesResult = results[1];

    profileResult.when(
      success: (response) {
        final r = response as ProfessionalProfileResponseDM;
        _vm = _vm.copyWith(profile: r.professionalProfile);
      },
      failure: (error) {
        // Profile might not exist yet — that's OK
        _logger.w('Profile not found or error: $error');
      },
    );

    packagesResult.when(
      success: (response) {
        final r = response as ServicePackagesResponseDM;
        _vm = _vm.copyWith(packages: r.servicePackages);
      },
      failure: (error) {
        _logger.e(error);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return;
      },
    );

    emit(ServicePackagesState.loaded(_vm));
  }

  // ── Professional Profile ───────────────────────────────────

  Future<bool> saveProfile(Map<String, dynamic> data) async {
    _vm = _vm.copyWith(isSavingProfile: true);
    emit(ServicePackagesState.saving(_vm));

    data['business_uuid'] = _vm.businessUuid;
    final result = await _repo.createOrUpdateProfile(data);

    return result.when(
      success: (response) {
        _vm = _vm.copyWith(
          profile: response.professionalProfile,
          isSavingProfile: false,
        );
        emit(ServicePackagesState.saved(_vm, response.message));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSavingProfile: false);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return false;
      },
    );
  }

  // ── Service Packages ───────────────────────────────────────

  /// Creates a package and returns the created [ServicePackageDM] on success,
  /// or `null` on failure. Returning the DM (instead of a bool) lets callers
  /// chain a photo upload — [createPackageWithPhotos] uses this to grab the
  /// fresh UUID and hand it to [uploadPhotos] in a single user-visible
  /// "save" step.
  Future<ServicePackageDM?> createPackage(Map<String, dynamic> data) async {
    _vm = _vm.copyWith(isSavingPackage: true);
    emit(ServicePackagesState.saving(_vm));

    data['business_uuid'] = _vm.businessUuid;
    final result = await _repo.createPackage(data);

    return result.when(
      success: (response) {
        final newPackage = response.servicePackage;
        if (newPackage != null) {
          _vm = _vm.copyWith(
            packages: [..._vm.packages, newPackage],
            isSavingPackage: false,
          );
        }
        emit(ServicePackagesState.saved(_vm, response.message));
        return newPackage;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSavingPackage: false);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return null;
      },
    );
  }

  /// Updates an existing package and returns the updated [ServicePackageDM]
  /// on success, or `null` on failure. Symmetry with [createPackage] so the
  /// form can treat both as "returned DM or error".
  Future<ServicePackageDM?> updatePackage(String uuid, Map<String, dynamic> data) async {
    _vm = _vm.copyWith(isSavingPackage: true);
    emit(ServicePackagesState.saving(_vm));

    final result = await _repo.updatePackage(uuid, data);

    return result.when(
      success: (response) {
        final updated = response.servicePackage;
        if (updated != null) {
          final list = _vm.packages
              .map((p) => p.uuid == uuid ? updated : p)
              .toList();
          _vm = _vm.copyWith(packages: list, isSavingPackage: false);
        }
        emit(ServicePackagesState.saved(_vm, response.message));
        return updated;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isSavingPackage: false);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return null;
      },
    );
  }

  /// Create a package and, if [photos] is non-empty, chain the upload in a
  /// single "save" operation from the user's perspective. Returns `true`
  /// only when both steps succeed.
  ///
  /// Partial-failure policy: if the package was created but the photo
  /// upload failed, the package STAYS (the user can retry the upload
  /// from edit mode). We surface the failure so the form can toast an
  /// error, but we don't roll back the create — that would be worse UX
  /// than a half-done save the user can finish.
  Future<bool> createPackageWithPhotos(
    Map<String, dynamic> data,
    List<MultipartFile> photos,
  ) async {
    final created = await createPackage(data);
    if (created == null) return false;
    if (photos.isEmpty) return true;
    if (created.uuid == null) return true; // Nothing to attach to.
    return uploadPhotos(created.uuid!, photos);
  }

  Future<bool> deletePackage(String uuid) async {
    emit(ServicePackagesState.loading(_vm));

    final result = await _repo.deletePackage(uuid);

    return result.when(
      success: (response) {
        _vm = _vm.copyWith(
          packages: _vm.packages.where((p) => p.uuid != uuid).toList(),
        );
        emit(ServicePackagesState.deleted(_vm, response.message));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return false;
      },
    );
  }

  Future<bool> reorderPackages(List<String> uuidOrder) async {
    if (_vm.businessUuid == null) return false;

    _vm = _vm.copyWith(isReordering: true);
    emit(ServicePackagesState.loaded(_vm));

    // Optimistic reorder in local state
    final reordered = <ServicePackageDM>[];
    for (final uuid in uuidOrder) {
      final pkg = _vm.packages.where((p) => p.uuid == uuid).firstOrNull;
      if (pkg != null) reordered.add(pkg);
    }
    _vm = _vm.copyWith(packages: reordered);
    emit(ServicePackagesState.loaded(_vm));

    final result = await _repo.reorderPackages({
      'business_uuid': _vm.businessUuid,
      'order': uuidOrder,
    });

    return result.when(
      success: (_) {
        _vm = _vm.copyWith(isReordering: false);
        emit(ServicePackagesState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        _vm = _vm.copyWith(isReordering: false);
        // Revert — re-fetch from server
        fetchAll();
        return false;
      },
    );
  }

  // ── Photos ─────────────────────────────────────────────────

  Future<bool> uploadPhotos(String packageUuid, List<MultipartFile> photos) async {
    emit(ServicePackagesState.saving(_vm));

    final result = await _repo.uploadPhotos(
      servicePackageUuid: packageUuid,
      photos: photos,
    );

    return result.when(
      success: (_) {
        // Re-fetch to get updated photo list
        fetchAll();
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return false;
      },
    );
  }

  Future<bool> deletePhoto(String photoUuid) async {
    final result = await _repo.deletePhoto(photoUuid);

    return result.when(
      success: (_) {
        // Remove photo from local state optimistically
        final updatedPackages = _vm.packages.map((pkg) {
          final filteredPhotos = pkg.photos.where((p) => p.uuid != photoUuid).toList();
          return pkg.copyWith(photos: filteredPhotos);
        }).toList();
        _vm = _vm.copyWith(packages: updatedPackages);
        emit(ServicePackagesState.loaded(_vm));
        return true;
      },
      failure: (error) {
        _logger.e(error);
        emit(ServicePackagesState.error(_vm, error.toString()));
        return false;
      },
    );
  }
}
