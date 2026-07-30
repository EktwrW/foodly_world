import 'dart:async' show Completer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
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
    final futures = <Future<void>>[];
    for (final category in menu.foodCategories) {
      for (final item in category.items) {
        for (final photo in item.foodPhotos ?? []) {
          final f = _precacheUrlFuture(photo.businessFoodPhotoUrl);
          if (f != null) futures.add(f);
        }
      }
    }
    for (final category in menu.drinkCategories) {
      for (final item in category.items) {
        for (final photo in item.drinkPhotos ?? []) {
          final f = _precacheUrlFuture(photo.businessDrinkPhotoUrl);
          if (f != null) futures.add(f);
        }
      }
    }
    for (final combo in menu.combos) {
      for (final photo in combo.comboPhotos ?? []) {
        final f = _precacheUrlFuture(photo.businessComboPhotoUrl);
        if (f != null) futures.add(f);
      }
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
    ));
    return completer.future;
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
