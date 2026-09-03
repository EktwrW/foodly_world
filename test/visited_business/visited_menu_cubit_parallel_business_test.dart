import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';

/// Cuando el caller no trae el `BusinessDM` pero sí su uuid (`?b=`), el
/// negocio se pide A LA VEZ que el menú, no después. Antes eran dos viajes en
/// serie de ~0,7 s cada uno (2026-09-03).
void main() {
  final menu = MenuDM(uuid: 'menu-uuid', businessUuid: 'business-uuid');

  test('con ?b=, el negocio se pide mientras el menú todavía está en vuelo', () async {
    final repo = _RepoQueRegistra(menu);
    final cubit = VisitedMenuCubit(repo, uuid: 'menu-uuid', businessDM: null, businessUuid: 'business-uuid');

    final estado = await cubit.stream.firstWhere((s) => s.isLoaded).timeout(const Duration(seconds: 3));

    expect(repo.businessPedidoAntesDeQueLlegaraElMenu, isTrue,
        reason: 'fetchBusinessById tiene que salir antes de que getMenu resuelva');
    expect(repo.fetchBusinessCalls, 1, reason: 'una sola vez: la respuesta en vuelo se reutiliza');
    expect(estado.vm.menuDM?.business?.name, 'The Pizzeria Restaurant');
    await cubit.close();
  });

  test('sin ?b=, se sigue pidiendo después del menú, una sola vez', () async {
    final repo = _RepoQueRegistra(menu);
    final cubit = VisitedMenuCubit(repo, uuid: 'menu-uuid', businessDM: null);

    final estado = await cubit.stream.firstWhere((s) => s.isLoaded).timeout(const Duration(seconds: 3));

    expect(repo.businessPedidoAntesDeQueLlegaraElMenu, isFalse);
    expect(repo.fetchBusinessCalls, 1);
    expect(estado.vm.menuDM?.business?.name, 'The Pizzeria Restaurant');
    await cubit.close();
  });

  test('si el ?b= no coincide con el negocio del menú, se pide el correcto', () async {
    final repo = _RepoQueRegistra(menu);
    final cubit = VisitedMenuCubit(repo, uuid: 'menu-uuid', businessDM: null, businessUuid: 'otro-negocio');

    await cubit.stream.firstWhere((s) => s.isLoaded).timeout(const Duration(seconds: 3));

    expect(repo.uuidsPedidos, ['otro-negocio', 'business-uuid']);
    await cubit.close();
  });

  test('con BusinessDM en mano, el ?b= no dispara ninguna petición de negocio', () async {
    final repo = _RepoQueRegistra(menu);
    final cubit = VisitedMenuCubit(
      repo,
      uuid: 'menu-uuid',
      businessDM: const BusinessDM(intId: 14, uuid: 'business-uuid', name: 'The Pizzeria Restaurant'),
      businessUuid: 'business-uuid',
    );

    await cubit.stream.firstWhere((s) => s.isLoaded).timeout(const Duration(seconds: 3));

    expect(repo.fetchBusinessCalls, 0);
    await cubit.close();
  });
}

/// `getMenu` tarda un rato a propósito para poder observar si el negocio se
/// pidió durante esa espera o después.
class _RepoQueRegistra implements BusinessRepo {
  _RepoQueRegistra(this.menu);

  final MenuDM menu;
  bool menuResuelto = false;
  bool businessPedidoAntesDeQueLlegaraElMenu = false;
  int fetchBusinessCalls = 0;
  final List<String> uuidsPedidos = [];

  @override
  Future<ApiResult<MenuDM>> getMenu(String uuid) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    menuResuelto = true;
    return ApiResult.success(menu);
  }

  @override
  Future<ApiResult<BusinessDM>> fetchBusinessById(String uuid) async {
    fetchBusinessCalls++;
    uuidsPedidos.add(uuid);
    if (!menuResuelto) businessPedidoAntesDeQueLlegaraElMenu = true;
    await Future<void>.delayed(const Duration(milliseconds: 60));
    return const ApiResult.success(BusinessDM(intId: 14, uuid: 'business-uuid', name: 'The Pizzeria Restaurant'));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
