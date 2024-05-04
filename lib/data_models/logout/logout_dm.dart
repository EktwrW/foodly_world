import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_dm.freezed.dart';
part 'logout_dm.g.dart';

@freezed
class LogoutDM with _$LogoutDM {
  const factory LogoutDM({
    @JsonKey(name: 'message') String? message,
  }) = _LogoutDM;

  factory LogoutDM.fromJson(Map<String, dynamic> json) => _$LogoutDMFromJson(json);
}
