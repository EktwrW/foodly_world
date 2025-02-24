part of 'smart_search_cubit.dart';

@freezed
class SmartSearchState with _$SmartSearchState {
  const factory SmartSearchState.initial(SmartSearchVM vm) = _Initial;
  const factory SmartSearchState.listening(SmartSearchVM vm) = _Listening;
  const factory SmartSearchState.recognized(SmartSearchVM vm) = _Recognized;
  const factory SmartSearchState.searching(SmartSearchVM vm) = _Searching;
  const factory SmartSearchState.searchComplete(SmartSearchVM vm) = _SearchComplete;
  const factory SmartSearchState.error(String message, SmartSearchVM vm) = _Error;
}
