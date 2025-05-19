import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
import 'package:foodly_world/ui/views/visited_business/menu/view_model/menu_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visited_menu_state.dart';
part 'visited_menu_cubit.freezed.dart';

class VisitedMenuCubit extends Cubit<VisitedMenuState> {
  MenuVM _vm;
  final BusinessRepo _businessRepo;

  VisitedMenuCubit(
    BusinessRepo businessRepo, {
    required String? uuid,
    required BusinessDM? businessDM,
  })  : _vm = MenuVM(
          menuDM: MenuDM(
            uuid: uuid ?? FoodlyStrings.NEW_MENU,
            business: businessDM,
            businessUuid: businessDM?.uuid ?? '',
          ),
          controller: PageController(),
          floatingButtonKey: GlobalKey(),
        ),
        _businessRepo = businessRepo,
        super(const VisitedMenuState.initial(MenuVM())) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    late final MenuDM menuData;

    if (_vm.menuDM?.uuid == FoodlyStrings.NEW_MENU) {
      final body = MenuRegisterDTO(businessId: _vm.menuDM?.business?.intId ?? -1);

      menuData = await _businessRepo.createMenu(body).then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            emit(_Error(e.errorMsg, _vm));
            return _vm.menuDM!;
          },
        );
      });
    } else {
      menuData = await _businessRepo.getMenu(_vm.menuDM?.uuid ?? '').then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            emit(_Error(e.errorMsg, _vm));
            return _vm.menuDM!;
          },
        );
      });
    }

    _vm = _vm.copyWith(
      menuDM: menuData,
      indexView: menuData.business?.category?.id == FoodlyCategories.drinkHouse ? 1 : 0,
    );

    emit(_Loaded(_vm));
  }

  Future<MenuDM> _handleSuccessMenuResponse(MenuDM data) async {
    late final MenuDM menuData;

    if (_vm.menuDM?.business != null) {
      menuData = data.copyWith(business: _vm.menuDM?.business);
    } else {
      await _businessRepo.fetchBusinessById(data.businessUuid).then((result) async {
        result.when(
          success: (business) => menuData = data.copyWith(business: business),
          failure: (e) => emit(_Error(e.errorMsg, _vm)),
        );
      });
    }
    return menuData;
  }

  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));
}
