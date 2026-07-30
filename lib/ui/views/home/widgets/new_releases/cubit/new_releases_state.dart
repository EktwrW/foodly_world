import 'package:foodly_world/ui/views/home/widgets/new_releases/view_model/new_releases_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_releases_state.freezed.dart';

@freezed
sealed class NewReleasesState with _$NewReleasesState {
  const factory NewReleasesState.initial(NewReleasesVM vm) = _Initial;
  const factory NewReleasesState.loading(NewReleasesVM vm) = _Loading;
  const factory NewReleasesState.loaded(NewReleasesVM vm) = _Loaded;
  const factory NewReleasesState.error(NewReleasesVM vm, String message) = _Error;
}
