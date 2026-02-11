part of 'notifications_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial(NotificationsVM vm) = _Initial;
  const factory NotificationsState.loading(NotificationsVM vm) = _Loading;
  const factory NotificationsState.loaded(NotificationsVM vm) = _Loaded;
  const factory NotificationsState.error(NotificationsVM vm, String message) = _Error;
}
