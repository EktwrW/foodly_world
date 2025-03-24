import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/favorites_vm.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
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
      emit(FavoritesState.loaded(_vm));
    }
  }

  /// Carga las entidades completas de favoritos (complementa los IDs con objetos)
  Future<void> loadFavoriteObjects() async {
    if (!_authService.isLoggedIn || _authService.authHeader == null) {
      _logger.i('Skipping favorite objects loading: user not fully authenticated');
      return;
    }

    emit(FavoritesState.loading(_vm));

    try {
      await Future.wait([
        if (_vm.favoriteBusinessIds.isNotEmpty) _getMyFavoriteBusinesses(),
        if (_vm.favoriteMenuIds.isNotEmpty) _getMyFavoriteMenus(),
        if (_vm.favoriteItemIds.isNotEmpty) _getMyFavoriteFoodItems(),
        if (_vm.favoriteItemIds.isNotEmpty) _getMyFavoriteDrinkItems(),
        if (_vm.savedPromotionIds.isNotEmpty) _getMyFavoritePromotions(),
      ]);

      emit(FavoritesState.loaded(_vm));
    } catch (e) {
      _logger.e('Error loading favorite objects: $e');
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  Future<void> _getMyFavoritePromotions() async => await _businessRepo.getMyFavoritePromotions().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoritePromotions: data.savedPromotions),
          failure: (error) => _logger.e('Error loading promotions: $error'),
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

  Future<void> _getMyFavoriteMenus() async => await _businessRepo.getMyFavoriteMenus().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteMenus: data.favoriteMenus),
          failure: (error) => _logger.e('Error loading menus: $error'),
        ),
      );

  Future<void> _getMyFavoriteBusinesses() async => await _businessRepo.getMyFavoriteBusinesses().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteBusinesses: data.favoriteBusinesses),
          failure: (error) => _logger.e('Error loading businesses: $error'),
        ),
      );

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

    _vm = _vm.copyWith(
      favoriteBusinessIds: updatedIds,
      favoriteBusinesses: updatedBusinesses,
    );
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

    _vm = _vm.copyWith(
      favoriteMenuIds: updatedIds,
      favoriteMenus: updatedMenus,
    );
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
  Future<void> toggleFoodItemFavorite(ItemDM item) async => await _toggleItemFavorite(item, false);

  // Drink item favorites
  Future<void> toggleDrinkItemFavorite(ItemDM item) async => await _toggleItemFavorite(item, true);

  // Item favorites (works for both food and drink)
  Future<void> _toggleItemFavorite(ItemDM item, bool isDrink) async {
    if (!_authService.isLoggedIn || item.uuid.isEmpty) return;

    final isFavorite = _vm.favoriteItemIds.contains(item.uuid);
    final newValue = !isFavorite;
    final uuid = item.uuid;

    // Optimistic update
    List<String> updatedIds;
    final List<ItemDM> updatedFoodItems = List<ItemDM>.from(_vm.favoriteFoodItems);
    final List<ItemDM> updatedDrinkItems = List<ItemDM>.from(_vm.favoriteDrinkItems);

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..add(uuid);

      if (isDrink) {
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

      if (isDrink) {
        updatedDrinkItems.removeWhere((i) => i.uuid == uuid);
      } else {
        updatedFoodItems.removeWhere((i) => i.uuid == uuid);
      }
    }

    _vm = _vm.copyWith(
      favoriteItemIds: updatedIds,
      favoriteFoodItems: updatedFoodItems,
      favoriteDrinkItems: updatedDrinkItems,
    );
    emit(FavoritesState.loaded(_vm));

    try {
      final result = isDrink
          ? await _businessRepo.setFavoriteDrinkItem(uuid, SetFavoriteBodyDTO(isFavorite: newValue))
          : await _businessRepo.setFavoriteFoodItem(uuid, SetFavoriteBodyDTO(isFavorite: newValue));

      result.when(
        success: (_) {
          // Actualizar el UserDM en AuthSessionService
          _updateUserFavoriteItems(updatedIds);
        },
        failure: (error) {
          _logger.e('Error toggling item favorite: $error');
          _revertItemFavorite(item, !newValue, isDrink);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling item favorite: $e');
      _revertItemFavorite(item, !newValue, isDrink);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertItemFavorite(ItemDM item, bool newValue, bool isDrink) {
    if (item.uuid.isEmpty) return;

    final uuid = item.uuid;
    List<String> updatedIds;
    final List<ItemDM> updatedFoodItems = List<ItemDM>.from(_vm.favoriteFoodItems);
    final List<ItemDM> updatedDrinkItems = List<ItemDM>.from(_vm.favoriteDrinkItems);

    if (newValue) {
      updatedIds = List<String>.from(_vm.favoriteItemIds)..add(uuid);

      if (isDrink) {
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

      if (isDrink) {
        updatedDrinkItems.removeWhere((i) => i.uuid == uuid);
      } else {
        updatedFoodItems.removeWhere((i) => i.uuid == uuid);
      }
    }

    _vm = _vm.copyWith(
      favoriteItemIds: updatedIds,
      favoriteFoodItems: updatedFoodItems,
      favoriteDrinkItems: updatedDrinkItems,
    );
  }

  // Promotion favorites
  Future<void> togglePromotionFavorite(PromotionDM promotion) async {
    if (!_authService.isLoggedIn || promotion.uuid.isEmpty) return;

    final isFavorite = isPromotionFavorite(promotion.uuid);
    final newValue = !isFavorite;
    final uuid = promotion.uuid;

    // Optimistic update
    List<String> updatedIds;
    List<PromotionDM> updatedPromotions;

    if (newValue) {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..add(uuid);
      updatedPromotions = List<PromotionDM>.from(_vm.favoritePromotions);
      if (!updatedPromotions.any((p) => p.uuid == uuid)) {
        updatedPromotions.add(promotion);
      }
    } else {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..remove(uuid);
      updatedPromotions = List<PromotionDM>.from(_vm.favoritePromotions)..removeWhere((p) => p.uuid == uuid);
    }

    _vm = _vm.copyWith(
      savedPromotionIds: updatedIds,
      favoritePromotions: updatedPromotions,
    );
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
        },
        failure: (error) {
          _logger.e('Error toggling promotion favorite: $error');
          _revertPromotionFavorite(promotion, !newValue);
          emit(FavoritesState.error(_vm, error.toString()));
        },
      );
    } catch (e) {
      _logger.e('Exception toggling promotion favorite: $e');
      _revertPromotionFavorite(promotion, !newValue);
      emit(FavoritesState.error(_vm, e.toString()));
    }
  }

  void _revertPromotionFavorite(PromotionDM promotion, bool newValue) {
    if (promotion.uuid.isEmpty) return;

    final uuid = promotion.uuid;
    List<String> updatedIds;
    List<PromotionDM> updatedPromotions;

    if (newValue) {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..add(uuid);
      updatedPromotions = List<PromotionDM>.from(_vm.favoritePromotions);
      if (!updatedPromotions.any((p) => p.uuid == uuid)) {
        updatedPromotions.add(promotion);
      }
    } else {
      updatedIds = List<String>.from(_vm.savedPromotionIds)..remove(uuid);
      updatedPromotions = List<PromotionDM>.from(_vm.favoritePromotions)..removeWhere((p) => p.uuid == uuid);
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
  bool isFoodItemFavorite(String? uuid) => uuid != null && _vm.favoriteItemIds.contains(uuid);
  bool isDrinkItemFavorite(String? uuid) => uuid != null && _vm.favoriteItemIds.contains(uuid);
  bool isPromotionFavorite(String? uuid) => uuid != null && _vm.savedPromotionIds.contains(uuid);

  void clearAllFavorites() {
    _vm = const FavoritesVM();
    emit(FavoritesState.initial(_vm));
  }
}
