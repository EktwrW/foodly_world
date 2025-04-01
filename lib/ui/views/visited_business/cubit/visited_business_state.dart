part of 'visited_business_cubit.dart';

@freezed
class VisitBusinessState with _$VisitBusinessState {
  const factory VisitBusinessState.initial(VisitBusinessVM vm) = _Initial;
  const factory VisitBusinessState.loading(VisitBusinessVM vm) = _Loading;
  const factory VisitBusinessState.loaded(VisitBusinessVM vm) = _Loaded;
  const factory VisitBusinessState.error(String msg, VisitBusinessVM vm) = _Error;
}
