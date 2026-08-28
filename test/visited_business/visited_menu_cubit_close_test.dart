import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';

/// Irse del menú MIENTRAS carga no puede reventar.
///
/// EL CRASH (Crashlytics, 2026-08-28). Un comensal abrió el menú de The
/// Pizzeria desde el home; a mitad de la carga el backend invalidó la sesión
/// —otra sesión del mismo usuario había rotado los tokens—, el router lo mandó
/// a /login y el cubit murió con la página. Cuando la carga terminó:
///
///   Bad state: Cannot emit new states after calling close
///   #1  VisitedMenuCubit._loadMenu (visited_menu_cubit.dart:89)
///
/// El logout fue el disparador de ESE día, pero no hace falta: `_loadMenu`
/// tiene dos awaits —la red y el precache de imágenes— y basta con tocar
/// "atrás" durante cualquiera de los dos. Es un crash a un gesto de distancia.
///
/// POR QUÉ CIERRA ANTES DE RESPONDER. Es el orden que importa: el cubit se
/// cierra con la petición EN VUELO y la respuesta llega después. Al revés
/// —responder y luego cerrar— el emit ya ocurrió y no prueba nada.
void main() {
  late _RepoQueTarda repo;

  setUp(() => repo = _RepoQueTarda());

  VisitedMenuCubit abrirMenu() => VisitedMenuCubit(
        repo,
        uuid: 'menu-uuid',
        businessDM: const BusinessDM(intId: 14, uuid: 'business-uuid', name: 'The Pizzeria Restaurant'),
      );

  test('la página se va mientras el menú carga', () async {
    final cubit = abrirMenu();
    await Future<void>.delayed(Duration.zero); // corre el microtask del loading

    await cubit.close();
    repo.responder(ApiResult.success(MenuDM(uuid: 'menu-uuid', businessUuid: 'business-uuid')));
    await Future<void>.delayed(Duration.zero);
  });

  /// La misma carrera por el otro lado: la red falla justo después de que la
  /// página se fue. Ese `emit(_Error(...))` está en un callback y se guarda
  /// distinto que el del camino feliz, así que se prueba aparte.
  test('la petición falla después de que la página se fue', () async {
    final cubit = abrirMenu();
    await Future<void>.delayed(Duration.zero);

    await cubit.close();
    repo.responder(const ApiResult.failure(AppRequestException(error: 'sin conexión')));
    await Future<void>.delayed(Duration.zero);
  });

  /// Y el caso normal sigue funcionando: sin el `emit` final el menú no
  /// cargaría nunca, y un guard de más lo apagaría sin que ningún test chille.
  test('con la página viva, el menú carga', () async {
    final cubit = abrirMenu();
    await Future<void>.delayed(Duration.zero);

    repo.responder(ApiResult.success(MenuDM(uuid: 'menu-uuid', businessUuid: 'business-uuid')));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state, isA<VisitedMenuState>());
    expect(cubit.state.toString(), contains('loaded'));
    await cubit.close();
  });
}

/// Repo cuya respuesta la decide el test, no el reloj.
class _RepoQueTarda implements BusinessRepo {
  final _completer = Completer<ApiResult<MenuDM>>();

  void responder(ApiResult<MenuDM> resultado) => _completer.complete(resultado);

  @override
  Future<ApiResult<MenuDM>> getMenu(String uuid) => _completer.future;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
