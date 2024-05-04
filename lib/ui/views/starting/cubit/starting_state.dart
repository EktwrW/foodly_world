part of 'starting_cubit.dart';

@freezed
class StartingState with _$StartingState {
  const factory StartingState.initial() = _Initial;
  const factory StartingState.loading(StartingVM vm) = _Loading;
  const factory StartingState.welcome(StartingVM vm) = _Welcome;
  const factory StartingState.isNewUser(StartingVM vm) = _IsNewUser;
  const factory StartingState.userAuthenticated(StartingVM vm) = _UserAuthenticated;
  const factory StartingState.error(String msg, StartingVM vm) = _Error;
}
