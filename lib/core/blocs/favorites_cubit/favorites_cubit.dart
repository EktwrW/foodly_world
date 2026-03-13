import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/favorites_vm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_transfer_objects/favorites/set_favorite_body_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesVM _vm;
  final BusinessRepo _businessRepo;
  final Logger _logger;
  final AuthSessionService _authService;

  FavoritesCubit({
    required BusinessRepo businessRepo,
    required Logger logger,
    required AuthSessionService authService,
  })  : _businessRepo = businessRepo,
        _logger = logger,
        _authService = authService,
        _vm = FavoritesVM.fromUserDM(authService.userSessionDM?.user),
        super(FavoritesState.initial(FavoritesVM.fromUserDM(authService.userSessionDM?.user)));

  /// Inicializa o actualiza el estado de favoritos desde el UserDM actual
  void initFromUserDM() {
    final user = _authService.userSessionDM?.user;
    if (user != null) {
      _vm = FavoritesVM.fromUserDM(user);
    }
  }

  /// Inicializa el controlador de página para la navegación entre vistas de favoritos
  void initPageController() {
    if (_vm.controller != null && _vm.indexView == _vm.controller?.initialPage) return;

    final controller = PageController(initialPage: _vm.indexView);
    _vm = _vm.copyWith(controller: controller, isInitializing: false);
    emit(FavoritesState.loaded(_vm));
  }

  /// Cambia la vista actual de favoritos
  void changeView(int index) async {
    if (_vm.indexView == index) return;

    _vm = _vm.copyWith(indexView: index);

    emit(FavoritesState.loaded(_vm));
  }

  /// Alterna entre vista de cuadrícula y lista para negocios
  void toggleViewMode() {
    _vm = _vm.copyWith(isGridView: !_vm.isGridView);
    emit(FavoritesState.loaded(_vm));
  }

  /// Cambia el tipo de ordenamiento de negocios favoritos
  void changeSortType(BusinessSortType sortType) {
    if (_vm.businessSortType == sortType) return;

    _vm = _vm.copyWith(businessSortType: sortType);
    emit(FavoritesState.loaded(_vm));
  }

  /// Cambia el orden ascendente/descendente del ordenamiento de negocios
  void toggleBusinessSortDirection() {
    _vm = _vm.copyWith(isBusinessSortAscending: !_vm.isBusinessSortAscending);
    emit(FavoritesState.loaded(_vm));
  }

  /// Carga las entidades completas de favoritos (complementa los IDs con objetos)
  Future<void> loadFavoriteObjects() async {
    if (!_authService.isLoggedIn || _authService.authHeader == null) {
      _logger.i('Skipping favorite objects loading: user not fully authenticated');
      return;
    }

    emit(FavoritesState.loading(_vm));

    try {
      if (_vm.favoriteBusinessIds.isNotEmpty) await _getMyFavoriteBusinesses();
      if (_vm.favoriteMenuIds.isNotEmpty) await _getMyFavoriteMenus();

      await Future.wait([
        if (_vm.favoriteItemIds.isNotEmpty) ...[
          _getMyFavoriteFoodItems(),
          _getMyFavoriteDrinkItems(),
          _getMyFavoriteComboItems(),
        ],
        if (_vm.savedPromotionIds.isNotEmpty) _getMyFavoritePromotions(),
      ]);

      // Agrupar los items favoritos por negocio después de cargarlos
      if (_vm.favoriteItemIds.isNotEmpty) {
        await _populateFavoriteItems();
      }

      emit(FavoritesState.loaded(_vm));
    } catch (e) {
      _logger.e('Error loading favorite objects: $e');
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  Future<void> _getMyFavoritePromotions() async => await _businessRepo.getMyFavoritePromotions().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(
            favoritePromotions: data.data,
            favoritePromoBusinesses: data.businesses,
          ),
          failure: (error) => _logger.e('Error loading promotions: $error'),
        ),
      );

  Future<void> _getMyFavoriteComboItems() async => await _businessRepo.getMyFavoriteComboItems().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteComboItems: data.favoriteCombos),
          failure: (error) => _logger.e('Error loading combo items: $error'),
        ),
      );

  Future<void> _getMyFavoriteDrinkItems() async => await _businessRepo.getMyFavoriteDrinkItems().then(
        (drinkResult) => drinkResult.when(
          success: (data) => _vm = _vm.copyWith(favoriteDrinkItems: data.favoriteDrinkItems),
          failure: (error) => _logger.e('Error loading drink items: $error'),
        ),
      );

  Future<void> _getMyFavoriteFoodItems() async => await _businessRepo.getMyFavoriteFoodItems().then(
        (foodResult) => foodResult.when(
          success: (data) => _vm = _vm.copyWith(favoriteFoodItems: data.favoriteFoodItems),
          failure: (error) => _logger.e('Error loading food items: $error'),
        ),
      );

  Future<void> _getMyFavoriteMenus() async {
    final result = await _businessRepo.getMyFavoriteMenus();

    result.when(
      success: (data) async {
        final menus = List<MenuDM>.from(data.favoriteMenus);
        final updatedMenus = <MenuDM>[];

        // Para cada menú, intentamos asociar su negocio correspondiente
        for (final menu in menus) {
          // Primero buscamos si tenemos el negocio en los favoritos
          final matchingBusiness = _vm.favoriteBusinesses.firstWhere(
            (business) => business.uuid == menu.businessUuid,
            orElse: () => const BusinessDM(),
          );

          if (matchingBusiness.uuid.isNotEmpty) {
            updatedMenus.add(menu.copyWith(business: matchingBusiness));
          } else {
            await _businessRepo.fetchBusinessById(menu.businessUuid).then(
                  (businessResult) => businessResult.when(
                    success: (business) => updatedMenus.add(menu.copyWith(business: business)),
                    failure: (error) {
                      _logger.e('Error fetching business for menu: $error');
                      updatedMenus.add(menu);
                    },
                  ),
                );
          }
        }

        _vm = _vm.copyWith(favoriteMenus: updatedMenus);
      },
      failure: (error) => _handleError('Error loading favorite menus: $error'),
    );
  }

  Future<void> _getMyFavoriteBusinesses() async => await _businessRepo.getMyFavoriteBusinesses().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteBusinesses: data.favoriteBusinesses),
          failure: (error) => _logger.e('Error loading businesses: $error'),
        ),
      );

  Future<void> _populateFavoriteItems() async {
    try {
      // Paso 1: Crear un mapa de businessUuid a FavoriteItemDM usando agrupación funcional
      final Map<String, FavoriteItemDM> itemsByBusiness = {};

      // Función auxiliar para agregar elementos a la colección mapeada
      void addItemToBusinessMap(ItemDM item, String itemType) {
        final businessUuid = item.businessUuid ?? '';
        if (businessUuid.isEmpty) return;

        // Si el negocio ya existe en el mapa, actualizamos su entrada
        // Si no, creamos una nueva entrada
        itemsByBusiness.update(
          businessUuid,
          (existing) {
            // Agregamos el item al tipo correspondiente
            return switch (itemType) {
              'food' => existing.copyWith(
                  favoriteFoodItems: [...existing.favoriteFoodItems, item],
                ),
              'drink' => existing.copyWith(
                  favoriteDrinkItems: [...existing.favoriteDrinkItems, item],
                ),
              'combo' => existing.copyWith(
                  favoriteComboItems: [...existing.favoriteComboItems, item],
                ),
              _ => existing
            };
          },
          // Si no existe, creamos una nueva entrada según el tipo
          ifAbsent: () {
            return switch (itemType) {
              'food' => FavoriteItemDM(
                  businessUuid: businessUuid,
                  favoriteFoodItems: [item],
                ),
              'drink' => FavoriteItemDM(
                  businessUuid: businessUuid,
                  favoriteDrinkItems: [item],
                ),
              'combo' => FavoriteItemDM(
                  businessUuid: businessUuid,
                  favoriteComboItems: [item],
                ),
              _ => FavoriteItemDM(businessUuid: businessUuid)
            };
          },
        );
      }

      // Agregar todos los items a sus correspondientes grupos de negocio
      for (final item in _vm.favoriteFoodItems) {
        addItemToBusinessMap(item, 'food');
      }

      for (final item in _vm.favoriteDrinkItems) {
        addItemToBusinessMap(item, 'drink');
      }

      for (final item in _vm.favoriteComboItems) {
        addItemToBusinessMap(item, 'combo');
      }

      // Paso 2: Asociar cada FavoriteItemDM con su correspondiente BusinessDM
      final favoriteItems = await Future.wait(
        itemsByBusiness.entries.map((entry) async {
          final businessUuid = entry.key;
          var favoriteItem = entry.value;

          // Buscar primero en los negocios favoritos
          final business = _vm.favoriteBusinesses.firstWhereOrNull(
            (b) => b.uuid == businessUuid,
          );

          if (business != null) {
            return favoriteItem.copyWith(business: business);
          }

          // Buscar en los negocios de menús favoritos
          final menuWithBusiness = _vm.favoriteMenus.firstWhereOrNull(
            (m) => m.businessUuid == businessUuid && m.business != null,
          );

          if (menuWithBusiness?.business != null) {
            return favoriteItem.copyWith(business: menuWithBusiness!.business);
          }

          // Si no encontramos el negocio, hacer una petición para obtenerlo
          try {
            final response = await _businessRepo.fetchBusinessById(businessUuid);
            return response.when(
              success: (data) => favoriteItem.copyWith(business: data),
              failure: (error) {
                _logger.e('Error fetching business for items: ${error.errorMsg}');
                return favoriteItem;
              },
            );
          } catch (e) {
            _logger.e('Exception fetching business: $e');
            return favoriteItem;
          }
        }),
      );

      // Actualizar el ViewModel con los items agrupados
      _vm = _vm.copyWith(favoriteItems: favoriteItems);
    } catch (e) {
      _logger.e('Error populating favorite items: $e');
    }
  }

  // Business favorites
  Future<void> toggleBusinessFavorite(BusinessDM business) async {
    if (!_authService.isLoggedIn || business.uuid.isEmpty) return;

    final isFavorite = isBusinessFavorite(business.uuid);
    final newValue = !isFavorite;
    final uuid = business.uuid;

    // Optimistic update - Update IDs
    List<String> updatedIds;
    List<BusinessDM> updatedBusinesses;

    if (newValue) {
      // Add to favorites
      updatedIds = List<String>.from(_vm.favoriteBusinessIds)..add(uuid);
      updatedBusinesses = List<BusinessDM>.from(_vm.favoriteBusinesses);
      if (!updatedBusinesses.any((b) => b.uuid == uuid)) {
        updatedBusinesses.add(business);
      }
    } else {
      // Remove from favorites
      updatedIds = List<String>.from(_vm.favoriteBusinessIds)..remove(uuid);
      updatedBusinesses = List<BusinessDM>.from(_vm.favoriteBusinesses)..removeWhere((b) => b.uuid == uuid);
    }

    _vm = _vm
        .copyWith(
          favoriteBusinessIds: updatedIds,
          favoriteBusinesses: updatedBusinesses,
        )
        .withToggledItem(uuid);

    emit(FavoritesState.loaded(_vm));

    try {
      final result = await _businessRepo.setFavoriteBusiness(
        uuid,
        SetFavoriteBodyDTO(isFavorite: newValue),
      );

      result.when(
        success: (_) {
          _updateUserFavoriteBusinesses(updatedIds);
        },
        failure: (error) {
          _logger.e('Error toggling business favorite: $error');
          // Revertir cambios en caso de error
          _revertBusinessFavorite(business, !newValue);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling business favorite: $e');
      // Revertir cambios en caso de error
      _revertBusinessFavorite(business, !newValue);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertBusinessFavorite(BusinessDM business, bool newValue) {
    if (business.uuid.isEmpty) return;

    final uuid = business.uuid;
    List<String> updatedIds;
    List<BusinessDM> updatedBusinesses;

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteBusinessIds)..add(uuid);
      updatedBusinesses = List<BusinessDM>.from(_vm.favoriteBusinesses);
      if (!updatedBusinesses.any((b) => b.uuid == uuid)) {
        updatedBusinesses.add(business);
      }
    } else {
      updatedIds = List<String>.from(_vm.favoriteBusinessIds)..remove(uuid);
      updatedBusinesses = List<BusinessDM>.from(_vm.favoriteBusinesses)..removeWhere((b) => b.uuid == uuid);
    }

    _vm = _vm.copyWith(
      favoriteBusinessIds: updatedIds,
      favoriteBusinesses: updatedBusinesses,
    );
  }

  // Menu favorites
  Future<void> toggleMenuFavorite(MenuDM menu) async {
    if (!_authService.isLoggedIn || menu.uuid.isEmpty) return;

    final isFavorite = isMenuFavorite(menu.uuid);
    final newValue = !isFavorite;
    final uuid = menu.uuid;

    // Optimistic update
    List<String> updatedIds;
    List<MenuDM> updatedMenus;

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteMenuIds)..add(uuid);
      updatedMenus = List<MenuDM>.from(_vm.favoriteMenus);
      if (!updatedMenus.any((m) => m.uuid == uuid)) {
        updatedMenus.add(menu);
      }
    } else {
      updatedIds = List<String>.from(_vm.favoriteMenuIds)..remove(uuid);
      updatedMenus = List<MenuDM>.from(_vm.favoriteMenus)..removeWhere((m) => m.uuid == uuid);
    }

    _vm = _vm
        .copyWith(
          favoriteMenuIds: updatedIds,
          favoriteMenus: updatedMenus,
        )
        .withToggledItem(uuid);

    emit(FavoritesState.loaded(_vm));

    try {
      final result = await _businessRepo.setFavoriteMenu(
        uuid,
        SetFavoriteBodyDTO(isFavorite: newValue),
      );

      result.when(
        success: (_) {
          _updateUserFavoriteMenus(updatedIds);
        },
        failure: (error) {
          _logger.e('Error toggling menu favorite: $error');
          _revertMenuFavorite(menu, !newValue);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling menu favorite: $e');
      _revertMenuFavorite(menu, !newValue);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertMenuFavorite(MenuDM menu, bool newValue) {
    if (menu.uuid.isEmpty) return;

    final uuid = menu.uuid;
    List<String> updatedIds;
    List<MenuDM> updatedMenus;

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteMenuIds)..add(uuid);
      updatedMenus = List<MenuDM>.from(_vm.favoriteMenus);
      if (!updatedMenus.any((m) => m.uuid == uuid)) {
        updatedMenus.add(menu);
      }
    } else {
      updatedIds = List<String>.from(_vm.favoriteMenuIds)..remove(uuid);
      updatedMenus = List<MenuDM>.from(_vm.favoriteMenus)..removeWhere((m) => m.uuid == uuid);
    }

    _vm = _vm.copyWith(
      favoriteMenuIds: updatedIds,
      favoriteMenus: updatedMenus,
    );
  }

  // Food item favorites
  Future<void> toggleFoodItemFavorite(ItemDM item) async => await _toggleItemFavorite(item, false, false);

  // Drink item favorites
  Future<void> toggleDrinkItemFavorite(ItemDM item) async => await _toggleItemFavorite(item, true, false);

  // Combo item favorites
  Future<void> toggleComboItemFavorite(ItemDM item) async => await _toggleItemFavorite(item, false, true);

  // Item favorites (works for food, drink and combo items)
  Future<void> _toggleItemFavorite(ItemDM item, bool isDrink, bool isCombo) async {
    if (!_authService.isLoggedIn || item.uuid.isEmpty) return;

    final isFavorite = _vm.favoriteItemIds.contains(item.uuid);
    final newValue = !isFavorite;
    final uuid = item.uuid;
    final businessUuid = item.businessUuid ?? '';

    // Optimistic update
    List<String> updatedIds;
    final List<ItemDM> updatedFoodItems = List<ItemDM>.from(_vm.favoriteFoodItems);
    final List<ItemDM> updatedDrinkItems = List<ItemDM>.from(_vm.favoriteDrinkItems);
    final List<ItemDM> updatedComboItems = List<ItemDM>.from(_vm.favoriteComboItems);

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..add(uuid);

      if (isCombo) {
        if (!updatedComboItems.any((i) => i.uuid == uuid)) {
          updatedComboItems.add(item);
        }
      } else if (isDrink) {
        if (!updatedDrinkItems.any((i) => i.uuid == uuid)) {
          updatedDrinkItems.add(item);
        }
      } else {
        if (!updatedFoodItems.any((i) => i.uuid == uuid)) {
          updatedFoodItems.add(item);
        }
      }
    } else {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..remove(uuid);

      if (isCombo) {
        updatedComboItems.removeWhere((i) => i.uuid == uuid);
      } else if (isDrink) {
        updatedDrinkItems.removeWhere((i) => i.uuid == uuid);
      } else {
        updatedFoodItems.removeWhere((i) => i.uuid == uuid);
      }
    }

    // Actualizar la lista de favoriteItems cuando se quita un item
    final List<FavoriteItemDM> updatedFavoriteItems = List<FavoriteItemDM>.from(_vm.favoriteItems);
    if (!newValue && businessUuid.isNotEmpty) {
      // Primero, encontramos el índice del negocio al que pertenece el ítem
      final int businessIndex = updatedFavoriteItems.indexWhere((fi) => fi.businessUuid == businessUuid);

      if (businessIndex >= 0) {
        final FavoriteItemDM existingItem = updatedFavoriteItems[businessIndex];

        // Crear una versión actualizada del FavoriteItemDM sin el ítem eliminado
        FavoriteItemDM updatedItem;
        if (isCombo) {
          updatedItem = existingItem.copyWith(
            favoriteComboItems: existingItem.favoriteComboItems.where((i) => i.uuid != uuid).toList(),
          );
        } else if (isDrink) {
          updatedItem = existingItem.copyWith(
            favoriteDrinkItems: existingItem.favoriteDrinkItems.where((i) => i.uuid != uuid).toList(),
          );
        } else {
          updatedItem = existingItem.copyWith(
            favoriteFoodItems: existingItem.favoriteFoodItems.where((i) => i.uuid != uuid).toList(),
          );
        }

        // Si no quedan ítems de ningún tipo, eliminamos todo el negocio de la lista
        if (updatedItem.favoriteComboItems.isEmpty &&
            updatedItem.favoriteDrinkItems.isEmpty &&
            updatedItem.favoriteFoodItems.isEmpty) {
          updatedFavoriteItems.removeAt(businessIndex);
        } else {
          // Si aún quedan ítems, actualizamos el elemento existente
          updatedFavoriteItems[businessIndex] = updatedItem;
        }
      }
    }

    _vm = _vm
        .copyWith(
          favoriteItemIds: updatedIds,
          favoriteFoodItems: updatedFoodItems,
          favoriteDrinkItems: updatedDrinkItems,
          favoriteComboItems: updatedComboItems,
          favoriteItems: updatedFavoriteItems,
        )
        .withToggledItem(uuid);

    emit(FavoritesState.loaded(_vm));

    try {
      final result = isCombo
          ? await _businessRepo.setFavoriteComboItem(uuid, SetFavoriteBodyDTO(isFavorite: newValue))
          : isDrink
              ? await _businessRepo.setFavoriteDrinkItem(uuid, SetFavoriteBodyDTO(isFavorite: newValue))
              : await _businessRepo.setFavoriteFoodItem(uuid, SetFavoriteBodyDTO(isFavorite: newValue));

      result.when(
        success: (_) {
          // Actualizar el UserDM en AuthSessionService
          _updateUserFavoriteItems(updatedIds);

          // Si se agregó un nuevo ítem como favorito, actualizamos la lista agrupada
          if (newValue && businessUuid.isNotEmpty) {
            _populateFavoriteItems();
          }
        },
        failure: (error) {
          _logger.e('Error toggling item favorite: $error');
          _revertItemFavorite(item, !newValue, isDrink, isCombo);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling item favorite: $e');
      _revertItemFavorite(item, !newValue, isDrink, isCombo);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertItemFavorite(ItemDM item, bool newValue, bool isDrink, bool isCombo) {
    if (item.uuid.isEmpty) return;

    final uuid = item.uuid;
    List<String> updatedIds;
    final List<ItemDM> updatedFoodItems = List<ItemDM>.from(_vm.favoriteFoodItems);
    final List<ItemDM> updatedDrinkItems = List<ItemDM>.from(_vm.favoriteDrinkItems);
    final List<ItemDM> updatedComboItems = List<ItemDM>.from(_vm.favoriteComboItems);

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..add(uuid);

      if (isCombo) {
        if (!updatedComboItems.any((i) => i.uuid == uuid)) {
          updatedComboItems.add(item);
        }
      } else if (isDrink) {
        if (!updatedDrinkItems.any((i) => i.uuid == uuid)) {
          updatedDrinkItems.add(item);
        }
      } else {
        if (!updatedFoodItems.any((i) => i.uuid == uuid)) {
          updatedFoodItems.add(item);
        }
      }
    } else {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..remove(uuid);

      if (isCombo) {
        updatedComboItems.removeWhere((i) => i.uuid == uuid);
      } else if (isDrink) {
        updatedDrinkItems.removeWhere((i) => i.uuid == uuid);
      } else {
        updatedFoodItems.removeWhere((i) => i.uuid == uuid);
      }
    }

    // Revertir también la lista de favoriteItems
    final List<FavoriteItemDM> originalFavoriteItems = [];
    for (var item in _vm.favoriteItems) {
      originalFavoriteItems.add(item);
    }

    _vm = _vm.copyWith(
      favoriteItemIds: updatedIds,
      favoriteFoodItems: updatedFoodItems,
      favoriteDrinkItems: updatedDrinkItems,
      favoriteComboItems: updatedComboItems,
      favoriteItems: originalFavoriteItems,
    );
  }

  // Promotion favorites

  /// Called by [NearbyPromotionsCubit] after a confirmed 200 from the server.
  void addNearbyPromoFavorite(NearbyPromotionDM promo) {
    if (_vm.favoritePromotions.any((p) => p.uuid == promo.uuid)) return;
    final updatedIds = List<String>.from(_vm.savedPromotionIds)..add(promo.uuid);
    _vm = _vm.copyWith(
      savedPromotionIds: updatedIds,
      favoritePromotions: [..._vm.favoritePromotions, promo.copyWith(isFavorited: true)],
    );
    emit(FavoritesState.loaded(_vm));
    _updateUserSavedPromotions(updatedIds);
    // Background refresh to populate business info
    _getMyFavoritePromotions().then((_) => emit(FavoritesState.loaded(_vm)));
  }

  /// Called by [NearbyPromotionsCubit] after a confirmed 200 from the server.
  void removePromoFavoriteByUuid(String uuid) {
    final updatedIds = List<String>.from(_vm.savedPromotionIds)..remove(uuid);
    _vm = _vm.copyWith(
      savedPromotionIds: updatedIds,
      favoritePromotions: _vm.favoritePromotions.where((p) => p.uuid != uuid).toList(),
    );
    emit(FavoritesState.loaded(_vm));
    _updateUserSavedPromotions(updatedIds);
  }

  /// Toggles a promotion favorited from a full [PromotionDM] (e.g. VisitedBusiness page).
  Future<void> togglePromotionFavorite(PromotionDM promotion) async {
    if (!_authService.isLoggedIn || promotion.uuid.isEmpty) return;

    final isFavorite = isPromotionFavorite(promotion.uuid);
    final newValue = !isFavorite;
    final uuid = promotion.uuid;

    // Convert PromotionDM → NearbyPromotionDM for local list
    final nearbyPromo = NearbyPromotionDM(
      uuid: promotion.uuid,
      title: promotion.title,
      subTitle: promotion.subTitle,
      mediaLink: promotion.mediaLink,
      promoMedia: promotion.promoMedia.isNotEmpty
          ? PromoMediaLiteDM(
              uuid: promotion.promoMedia.first.uuid,
              mediaUrl: promotion.promoMedia.first.mediaUrl,
              mediaType: promotion.promoMedia.first.isVideo ? 'video' : 'image',
            )
          : null,
      businessUuid: promotion.business?.uuid ?? '',
      businessName: promotion.business?.name ?? '',
      businessLogo: promotion.business?.logo,
      isFavorited: newValue,
      startDate: promotion.startDate,
      expireDate: promotion.expireDate,
    );

    // Optimistic update
    List<String> updatedIds;
    List<NearbyPromotionDM> updatedPromotions;

    if (newValue) {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..add(uuid);
      updatedPromotions = List<NearbyPromotionDM>.from(_vm.favoritePromotions);
      if (!updatedPromotions.any((p) => p.uuid == uuid)) {
        updatedPromotions.add(nearbyPromo);
      }
    } else {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..remove(uuid);
      updatedPromotions = List<NearbyPromotionDM>.from(_vm.favoritePromotions)..removeWhere((p) => p.uuid == uuid);
    }

    _vm = _vm
        .copyWith(
          savedPromotionIds: updatedIds,
          favoritePromotions: updatedPromotions,
        )
        .withToggledItem(uuid);

    emit(FavoritesState.loaded(_vm));

    // API call
    try {
      final result = await _businessRepo.setFavoritePromotion(
        uuid,
        SetFavoriteBodyDTO(isFavorite: newValue),
      );

      result.when(
        success: (_) {
          _updateUserSavedPromotions(updatedIds);
          // Refresh businesses companion in background
          if (newValue) {
            _getMyFavoritePromotions().then((_) => emit(FavoritesState.loaded(_vm)));
          }
        },
        failure: (error) {
          _logger.e('Error toggling promotion favorite: $error');
          _revertPromotionFavorite(nearbyPromo, !newValue);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling promotion favorite: $e');
      _revertPromotionFavorite(nearbyPromo, !newValue);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertPromotionFavorite(NearbyPromotionDM promo, bool newValue) {
    if (promo.uuid.isEmpty) return;

    final uuid = promo.uuid;
    List<String> updatedIds;
    List<NearbyPromotionDM> updatedPromotions;

    if (newValue) {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..add(uuid);
      updatedPromotions = List<NearbyPromotionDM>.from(_vm.favoritePromotions);
      if (!updatedPromotions.any((p) => p.uuid == uuid)) {
        updatedPromotions.add(promo);
      }
    } else {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..remove(uuid);
      updatedPromotions = List<NearbyPromotionDM>.from(_vm.favoritePromotions)..removeWhere((p) => p.uuid == uuid);
    }

    _vm = _vm.copyWith(
      savedPromotionIds: updatedIds,
      favoritePromotions: updatedPromotions,
    );
  }

  // Actualizar el UserDM en AuthSessionService
  void _updateUserFavoriteBusinesses(List<String> businesses) {
    if (_authService.userSessionDM?.user == null) return;

    final updatedUser = _authService.userSessionDM!.user.copyWith(
      favoriteBusiness: businesses,
    );

    _authService.setSession(_authService.userSessionDM!.copyWith(
      user: updatedUser,
    ));
  }

  void _updateUserFavoriteMenus(List<String> menus) {
    if (_authService.userSessionDM?.user == null) return;

    final updatedUser = _authService.userSessionDM!.user.copyWith(
      favoriteMenus: menus,
    );

    _authService.setSession(_authService.userSessionDM!.copyWith(
      user: updatedUser,
    ));
  }

  void _updateUserFavoriteItems(List<String> items) {
    if (_authService.userSessionDM?.user == null) return;

    final updatedUser = _authService.userSessionDM!.user.copyWith(
      favoriteItems: items,
    );

    _authService.setSession(_authService.userSessionDM!.copyWith(
      user: updatedUser,
    ));
  }

  void _updateUserSavedPromotions(List<String> promotions) {
    if (_authService.userSessionDM?.user == null) return;

    final updatedUser = _authService.userSessionDM!.user.copyWith(
      savedPromotions: promotions,
    );

    _authService.setSession(_authService.userSessionDM!.copyWith(
      user: updatedUser,
    ));
  }

  // Public methods for checking favorites status
  bool isBusinessFavorite(String? uuid) => uuid != null && _vm.favoriteBusinessIds.contains(uuid);
  bool isMenuFavorite(String? uuid) => uuid != null && _vm.favoriteMenuIds.contains(uuid);
  bool isPromotionFavorite(String? uuid) => uuid != null && _vm.savedPromotionIds.contains(uuid);

  void clearAllFavorites() {
    _vm = const FavoritesVM();
    emit(FavoritesState.initial(_vm));
  }

  void _handleError(String errorMessage) {
    _logger.e(errorMessage);
    emit(_Error(_vm, errorMessage));
  }

  @override
  Future<void> close() {
    _vm.controller?.dispose();
    return super.close();
  }
}
