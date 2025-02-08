part of 'voice_search_cubit.dart';

@freezed
class VoiceSearchState with _$VoiceSearchState {
  const factory VoiceSearchState.initial(VoiceSearchVM vm) = _Initial;
  const factory VoiceSearchState.listening(VoiceSearchVM vm) = _Listening;
  const factory VoiceSearchState.recognized(VoiceSearchVM vm) = _Recognized;
  const factory VoiceSearchState.searching(VoiceSearchVM vm) = _Searching;
  const factory VoiceSearchState.searchComplete(VoiceSearchVM vm) = _SearchComplete;
  const factory VoiceSearchState.error(String message, VoiceSearchVM vm) = _Error;
}
