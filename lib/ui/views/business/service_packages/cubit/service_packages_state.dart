part of 'service_packages_cubit.dart';

@freezed
sealed class ServicePackagesState with _$ServicePackagesState {
  const factory ServicePackagesState.initial(ServicePackagesVM vm) = _Initial;
  const factory ServicePackagesState.loading(ServicePackagesVM vm) = _Loading;
  const factory ServicePackagesState.loaded(ServicePackagesVM vm) = _Loaded;
  const factory ServicePackagesState.saving(ServicePackagesVM vm) = _Saving;
  const factory ServicePackagesState.saved(ServicePackagesVM vm, String message) = _Saved;
  const factory ServicePackagesState.deleted(ServicePackagesVM vm, String message) = _Deleted;
  const factory ServicePackagesState.error(ServicePackagesVM vm, String message) = _Error;
}
