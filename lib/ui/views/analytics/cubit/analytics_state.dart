part of 'analytics_cubit.dart';

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial(AnalyticsVM vm) = _Initial;
  const factory AnalyticsState.loading(AnalyticsVM vm) = _Loading;
  const factory AnalyticsState.loaded(AnalyticsVM vm) = _Loaded;
  const factory AnalyticsState.error(AnalyticsVM vm, String message) = _Error;
}
