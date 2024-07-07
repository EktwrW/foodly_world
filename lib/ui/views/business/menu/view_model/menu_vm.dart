import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_vm.freezed.dart';

@freezed
class MenuVM with _$MenuVM {
  const MenuVM._();

  const factory MenuVM({
    MenuDM? menuDM,
    MenuDM? menuEditionDM,
  }) = _MenuVM;
}
