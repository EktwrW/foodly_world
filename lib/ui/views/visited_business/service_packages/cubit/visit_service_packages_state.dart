part of 'visit_service_packages_cubit.dart';

@freezed
class VisitServicePackagesState with _$VisitServicePackagesState {
  const factory VisitServicePackagesState.initial() = _Initial;
  const factory VisitServicePackagesState.loading() = _Loading;
  const factory VisitServicePackagesState.loaded({
    ProfessionalProfileDM? profile,
    @Default([]) List<ServicePackageDM> packages,
  }) = _Loaded;
  const factory VisitServicePackagesState.error(String message) = _Error;
}
