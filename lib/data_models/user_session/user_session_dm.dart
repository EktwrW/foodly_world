import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session_dm.freezed.dart';
part 'user_session_dm.g.dart';

@freezed
class UserSessionDM with _$UserSessionDM {
  const factory UserSessionDM({
    @JsonKey(name: 'user') required UserDM user,
    @JsonKey(name: 'message') String? welcomeMessage,
    @JsonKey(name: 'token_created_at') String? tokedCreatedAt,
    @JsonKey(name: 'token') required String? token,
    @JsonKey(name: 'token_type') String? tokenType,
  }) = _UserSessionDM;

  factory UserSessionDM.fromJson(Map<String, dynamic> json) => _$UserSessionDMFromJson(json);
}
