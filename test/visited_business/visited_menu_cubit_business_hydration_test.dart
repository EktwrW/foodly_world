import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart' show BusinessDM;
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';

/// Que falle la hidratación del negocio no puede tumbar el menú.
///
/// EL CRASH. El comensal abre `menu.foodly.solutions/<uuid>` como deep link.
/// Ahí `businessDM` llega NULL al constructor —no hay `extra` que
/// pre-popular—, así que `_handleSuccessMenuResponse` sale a buscarlo con
/// `fetchBusinessById`. Si esa segunda llamada falla —una red inestable
/// alcanza— el `late final MenuDM menuData` se quedaba sin asignar en la rama
/// de error y el `return menuData` explotaba:
///
///   LateInitializationError: Field 'menuData' has not been initialized.
///
/// Ojo con el orden, que es lo que hace al bug tan fácil de pasar por alto:
/// `getMenu` YA HABÍA SALIDO BIEN. El menú entero —platos, bebidas, precios—
/// estaba en la mano; lo que falló fue solo el adorno del negocio.
///
/// POR QUÉ DEVOLVEMOS EL MENÚ SIN HIDRATAR Y NO PROPAGAMOS EL FALLO. La
/// pantalla no tiene vista de error: `visited_menu_screen` monta
/// `_buildMenuWdg` también en `_Error`, y el `_Error` solo dispara un
/// snackbar. Quedarse en error no pintaría un cartel, pintaría el menú VACÍO
/// del constructor. `business` solo aporta logo, nombre, moneda y página
/// inicial, y todos sus consumidores lo null-guardean —de hecho
/// `BusinessMenuResource` lo manda null de fábrica—, así que el menú sin
/// hidratar se ve bien. Mejor eso que una pantalla en blanco.
void main() {
  /// Un menú con contenido de verdad: si el fix devolviera el `_vm.menuDM`
  /// del constructor en vez del `data` que ya vino, la categoría no estaría y
  /// el test lo cazaría.
  final menuDelBackend = MenuDM(
    uuid: 'menu-uuid',
    businessUuid: 'business-uuid',
    businessName: 'The Pizzeria Restaurant',
    foodCategories: [CategoryDM(name: 'Pizzas', uuid: 'cat-1', items: [])],
  );

  /// Deep link: `businessDM` NULL es lo que manda al cubit a `fetchBusinessById`.
  VisitedMenuCubit abrirMenuPorDeepLink(BusinessRepo repo) => VisitedMenuCubit(
        repo,
        uuid: 'menu-uuid',
        businessDM: null,
      );

  test('el menú carga aunque falle la hidratación del negocio', () async {
    final cubit = abrirMenuPorDeepLink(_RepoSinNegocio(menuDelBackend));

    final estado = await cubit.stream.firstWhere((s) => s.isLoaded).timeout(
          const Duration(seconds: 5),
          onTimeout: () => fail('el menú nunca llegó a `loaded` tras fallar `fetchBusinessById`'),
        );

    // El menú que el comensal vino a ver sigue entero...
    final vm = estado.vm;
    expect(vm.menuDM?.uuid, 'menu-uuid');
    expect(vm.menuDM?.foodCategories.single.name, 'Pizzas');

    // ...solo que sin el negocio hidratado, y eso lo aguanta todo el camino:
    // la moneda cae al símbolo por defecto y logo/nombre quedan en null sin
    // que nada reviente.
    expect(vm.menuDM?.business, isNull);
    expect(vm.currency, r'$');
    expect(vm.businessLogo, isNull);

    await cubit.close();
  });

  /// El camino feliz, para que el fix no se coma la hidratación cuando la
  /// llamada SÍ funciona.
  test('con el negocio disponible, el menú queda hidratado', () async {
    final cubit = abrirMenuPorDeepLink(_RepoConNegocio(menuDelBackend));

    final estado = await cubit.stream.firstWhere((s) => s.isLoaded).timeout(
          const Duration(seconds: 5),
          onTimeout: () => fail('el menú nunca llegó a `loaded`'),
        );

    expect(estado.vm.menuDM?.business?.name, 'The Pizzeria Restaurant');
    expect(estado.vm.businessName, 'The Pizzeria Restaurant');

    await cubit.close();
  });
}

/// `getMenu` OK, `fetchBusinessById` KO — el orden exacto del crash.
class _RepoSinNegocio implements BusinessRepo {
  final MenuDM menu;

  _RepoSinNegocio(this.menu);

  @override
  Future<ApiResult<MenuDM>> getMenu(String uuid) async => ApiResult.success(menu);

  @override
  Future<ApiResult<BusinessDM>> fetchBusinessById(String uuid) async =>
      ApiResult.failure(AppRequestException(error: _redCaida));

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Las dos llamadas OK.
class _RepoConNegocio implements BusinessRepo {
  final MenuDM menu;

  _RepoConNegocio(this.menu);

  @override
  Future<ApiResult<MenuDM>> getMenu(String uuid) async => ApiResult.success(menu);

  @override
  Future<ApiResult<BusinessDM>> fetchBusinessById(String uuid) async => const ApiResult.success(
        BusinessDM(intId: 14, uuid: 'business-uuid', name: 'The Pizzeria Restaurant'),
      );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// La red flaqueando: un 503 con cuerpo Laravel. Se usa un `DioException` de
/// verdad —y no un error suelto— porque `AppRequestException.errorMsg` solo
/// resuelve sin `di<BaseConfig>()` cuando el error viene de Dio, y además es
/// la forma exacta que toma el fallo en producción.
final _redCaida = DioException(
  requestOptions: RequestOptions(path: '/businesses/business-uuid'),
  response: Response<Map<String, dynamic>>(
    requestOptions: RequestOptions(path: '/businesses/business-uuid'),
    statusCode: 503,
    data: const {'message': 'Service Unavailable'},
  ),
);
