part of 'group_order_cubit.dart';

@freezed
sealed class GroupOrderState with _$GroupOrderState {
  const factory GroupOrderState.initial(GroupOrderVM vm) = _Initial;
  const factory GroupOrderState.loading(GroupOrderVM vm) = _Loading;
  const factory GroupOrderState.loaded(GroupOrderVM vm) = _Loaded;
  const factory GroupOrderState.error(GroupOrderVM vm, String message) = _Error;
}
