import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_menu_dm.freezed.dart';
part 'public_menu_dm.g.dart';

@freezed
abstract class PublicMenuResponseDM with _$PublicMenuResponseDM {
  factory PublicMenuResponseDM({
    required BusinessDM business,
    required MenuDM menu,
  }) = _PublicMenuResponseDM;

  factory PublicMenuResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PublicMenuResponseDMFromJson(json);
}
