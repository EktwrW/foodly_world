import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_releases_vm.freezed.dart';

@freezed
abstract class NewReleasesVM with _$NewReleasesVM {
  const factory NewReleasesVM({
    @Default([]) List<BusinessDM> businesses,
    @Default(false) bool isLoading,
    String? error,
  }) = _NewReleasesVM;
}
