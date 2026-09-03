import 'dart:async' show Completer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/menu_precache.dart';
import 'package:foodly_world/ui/views/visited_business/menu/view_model/menu_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visited_menu_cubit.freezed.dart';
part 'visited_menu_state.dart';

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
          indexView: businessDM?.menuInitialPageIndex ?? 0,
          controller: PageController(initialPage: businessDM?.menuInitialPageIndex ?? 0),
          floatingButtonKey: GlobalKey(),
        ),
        _businessRepo = businessRepo,
        super(const VisitedMenuState.initial(MenuVM())) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    // Si `businessDM` llegó null al constructor (caso típico del
    // customer entrando por `menu.foodly.solutions/<uuid>` como deep
    // link, sin `extra` pre-populado), el `PageController` se creó con
    // `initialPage: 0` y se hidratará en `_handleSuccessMenuResponse`
    // vía `fetchBusinessById`. Capturamos ese estado ANTES del fetch
    // para decidir más abajo si hay que sincronizar el `PageController`
    // — es el único caso donde el controller puede terminar
    // desalineado con `indexView`.
    final businessWasNull = _vm.menuDM?.business == null;

    late final MenuDM menuData;

    if (_vm.menuDM?.uuid == FoodlyStrings.NEW_MENU) {
      final body = MenuRegisterDTO(businessId: _vm.menuDM?.business?.intId ?? -1);

      menuData = await _businessRepo.createMenu(body).then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            if (!isClosed) emit(_Error(e.errorMsg, _vm));

            return _vm.menuDM!;
          },
        );
      });
    } else {
      menuData = await _businessRepo.getMenu(_vm.menuDM?.uuid ?? '').then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            if (!isClosed) emit(_Error(e.errorMsg, _vm));

            return _vm.menuDM!;
          },
        );
      });
    }

    // `menuInitialPageIndex` centraliza la regla por categoría de negocio
    // (hoy: drinkHouse → 1 bebidas, resto → 0 platos). Mismo getter lo usa
    // `ManageMenuCubit` — ver `BusinessDM.menuInitialPageIndex` en
    // `business_dm.dart` para el porqué.
    final initialPage = menuData.business?.menuInitialPageIndex ?? 0;

    _vm = _vm.copyWith(
      menuDM: menuData,
      indexView: initialPage,
    );

    if (_vm.menuDM != null) await _precacheMenuImages(_vm.menuDM!);

    // Entre el `await` de la red y este emit la página puede haberse ido, y
    // con ella el cubit. Pasó en producción (Crashlytics, 2026-08-28): al
    // abrir el menú de un negocio, el backend invalidó la sesión —otra
    // sesión del mismo usuario había rotado los tokens—, el router mandó a
    // /login y el `emit` de acá reventó con "Cannot emit new states after
    // calling close". No hace falta un logout para provocarlo: basta con
    // volver atrás mientras se precachean las imágenes.
    if (isClosed) return;
    emit(_Loaded(_vm));

    // Sincronizar el `PageController` SOLO en el caso edge:
    //   (1) `businessDM` llegó null al constructor (deep link
    //       `menu.foodly.solutions/<uuid>` es el flujo dominante acá), Y
    //   (2) tras hidratar con `fetchBusinessById`, el business resultó
    //       ser `drinkHouse` (initialPage = 1).
    //
    // Si el customer llegó con `businessDM` en `extra` (navegación
    // interna desde otra vista), el `PageController` ya arrancó en la
    // página correcta desde el constructor — no hay nada que hacer.
    if (businessWasNull && initialPage > 0) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        final controller = _vm.controller;
        if (controller != null && controller.hasClients) {
          controller.jumpToPage(initialPage);
        }
      });
    }
  }

  Future<void> _precacheMenuImages(MenuDM menu) {
    // Solo la primera pantalla (ver menu_precache.dart). Tope de 1,5 s: la
    // pantalla no espera más que eso por ninguna foto.
    // PlatformDispatcher y no WidgetsBinding: no exige binding inicializado,
    // así que los tests del cubit (test() a secas) siguen funcionando. Sin
    // vista —tests, arranque muy temprano— se asume un móvil.
    final view = PlatformDispatcher.instance.views.firstOrNull;
    final urls = menuPhotosToPrecache(
      menu,
      drinksFirst: (menu.business?.menuInitialPageIndex ?? 0) == 1,
      viewportHeight: view == null ? 800 : view.physicalSize.height / view.devicePixelRatio,
    );
    final futures = urls.map(_precacheUrlFuture).whereType<Future<void>>().toList();
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(milliseconds: 1500), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    // Misma clave que las tarjetas (`memCacheWidth`): así lo que decodifica la
    // precarga es lo que ellas pintan. Sin `ResizeImage` se decodificaba el
    // original entero (~5 MB) y, como las tarjetas usan otra clave, no servía
    // de nada en memoria. Y el listener se suelta: un stream con listeners
    // vivos no lo libera ni `ImageCache.clear()` bajo presión de memoria.
    final stream = ResizeImage(
      CachedNetworkImageProvider(url, cacheManager: FoodlyImageCache.manager),
      width: menuCardMemCacheWidth,
    ).resolve(const ImageConfiguration());
    late final ImageStreamListener listener;
    void listo() {
      stream.removeListener(listener);
      if (!completer.isCompleted) completer.complete();
    }

    listener = ImageStreamListener((_, __) => listo(), onError: (_, __) => listo());
    stream.addListener(listener);
    return completer.future;
  }

  Future<MenuDM> _handleSuccessMenuResponse(MenuDM data) async {
    if (_vm.menuDM?.business != null) {
      return data.copyWith(business: _vm.menuDM?.business);
    }

    final result = await _businessRepo.fetchBusinessById(data.businessUuid);

    return result.when(
      success: (business) => data.copyWith(business: business),
      // El menú YA vino completo —el que salió bien fue `getMenu`—; lo único
      // que falló es la hidratación del negocio. `business` solo aporta logo,
      // nombre, símbolo de moneda y página inicial, y todos sus consumidores
      // lo null-guardean (`MenuVM.currency` cae a '$', `businessLogo` y
      // `businessName` son nullable, `menuInitialPageIndex` cae a 0). De
      // hecho `BusinessMenuResource` lo manda null de fábrica — ver el doc de
      // `MenuDM.business`: null acá es la forma NORMAL del payload.
      //
      // Por eso devolvemos el menú sin hidratar en vez de propagar el fallo:
      // la pantalla no tiene vista de error —`visited_menu_screen` monta
      // `_buildMenuWdg` también en `_Error`—, así que quedarse en error no
      // pintaría un cartel, pintaría el menú VACÍO del constructor. Mejor el
      // menú de verdad sin logo que una pantalla en blanco; del fallo avisa
      // el snackbar.
      failure: (e) {
        if (!isClosed) emit(_Error(e.errorMsg, _vm));

        return data;
      },
    );
  }

  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));
}
