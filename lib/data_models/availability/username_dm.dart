import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_dm.g.dart';
part 'username_dm.freezed.dart';

@freezed
abstract class UsernameDM with _$UsernameDM {
  const UsernameDM._();

  const factory UsernameDM({
    required String username,
  }) = _UsernameDM;

  factory UsernameDM.fromJson(Map<String, dynamic> json) => _$UsernameDMFromJson(json);

  bool get isAvailable => username == 'available';
}
