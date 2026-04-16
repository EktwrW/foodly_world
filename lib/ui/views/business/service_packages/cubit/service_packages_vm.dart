import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_packages_vm.freezed.dart';

@freezed
class ServicePackagesVM with _$ServicePackagesVM {
  const factory ServicePackagesVM({
    String? businessUuid,
    ProfessionalProfileDM? profile,
    @Default([]) List<ServicePackageDM> packages,
    @Default(false) bool isSavingProfile,
    @Default(false) bool isSavingPackage,
    @Default(false) bool isReordering,
  }) = _ServicePackagesVM;
}
