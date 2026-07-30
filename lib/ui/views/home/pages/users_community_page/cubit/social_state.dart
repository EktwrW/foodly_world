part of 'social_cubit.dart';

@freezed
sealed class SocialState with _$SocialState {
  const factory SocialState.initial(SocialVM vm) = _Initial;
  const factory SocialState.loading(SocialVM vm) = _Loading;
  const factory SocialState.loaded(SocialVM vm) = _Loaded;
  const factory SocialState.error(SocialVM vm, String message) = _Error;
}
