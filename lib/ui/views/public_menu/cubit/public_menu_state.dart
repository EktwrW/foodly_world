import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_menu_state.freezed.dart';

@freezed
sealed class PublicMenuState with _$PublicMenuState {
  const factory PublicMenuState.initial() = _Initial;
  const factory PublicMenuState.loading() = _Loading;
  const factory PublicMenuState.loaded({
    required BusinessDM business,
    required MenuDM menu,
  }) = _Loaded;
  const factory PublicMenuState.error(String message) = _Error;
}
