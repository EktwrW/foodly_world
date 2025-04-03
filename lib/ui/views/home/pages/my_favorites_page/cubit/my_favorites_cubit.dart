import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/view_model/my_favorites_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/ui/views/home/pages/my_favorites_page/view_model/my_favorites_vm.dart';

part 'my_favorites_state.dart';
part 'my_favorites_cubit.freezed.dart';

class MyFavoritesCubit extends Cubit<MyFavoritesState> {
  MyFavoritesVM _vm;
  final BusinessRepo _businessRepo;
  final Logger _logger;
  final AuthSessionService _authService;

  MyFavoritesCubit({
    required BusinessRepo businessRepo,
    required Logger logger,
    required AuthSessionService authService,
  })  : _businessRepo = businessRepo,
        _logger = logger,
        _authService = authService,
        _vm = const MyFavoritesVM(),
        super(const MyFavoritesState.initial(MyFavoritesVM())) {
    _initializeMyFavorites();
  }

  void _initializeMyFavorites() async {
    _initPageController();
    await _loadAllFavorites();
    _vm = _vm.copyWith(isInitializing: false);
    emit(_Loaded(_vm));
  }

  /// Inicializa el controlador de página para la navegación entre vistas de favoritos
  void _initPageController() {
    if (_vm.controller != null) return;

    final controller = PageController(initialPage: _vm.indexView);
    _vm = _vm.copyWith(controller: controller);
  }

  /// Cambia la vista actual de favoritos
  void changeView(int index) {
    if (_vm.indexView == index) return;

    _vm = _vm.copyWith(indexView: index);
    _vm.controller?.animateToPage(
      index,
      duration: Durations.long2,
      curve: Curves.decelerate,
    );

    emit(_Loaded(_vm));
  }

  void toggleViewMode() {
    _vm = _vm.copyWith(isGridView: !_vm.isGridView);
    emit(_Loaded(_vm));
  }
  
  /// Cambia el tipo de ordenamiento de negocios favoritos
  void changeSortType(BusinessSortType sortType) {
    if (_vm.businessSortType == sortType) return;
    
    _vm = _vm.copyWith(businessSortType: sortType);
    emit(_Loaded(_vm));
  }
  
  /// Cambia el orden ascendente/descendente del ordenamiento de negocios
  void toggleBusinessSortDirection() {
    _vm = _vm.copyWith(isBusinessSortAscending: !_vm.isBusinessSortAscending);
    emit(_Loaded(_vm));
  }

  /// Carga todos los favoritos del usuario
  Future<void> _loadAllFavorites() async {
    if (!_authService.isLoggedIn || _authService.authHeader == null) {
      _handleError('Skipping favorites loading: user not fully authenticated');
      return;
    }

    emit(_Loading(_vm));

    await Future.wait([
      _loadFavoriteBusinesses(),
      _loadFavoriteMenus(),
      _loadFavoriteFoodItems(),
      _loadFavoriteDrinkItems(),
      _loadFavoritePromotions(),
    ]);
  }

  /// Carga los negocios favoritos del usuario
  Future<void> _loadFavoriteBusinesses() => _businessRepo.getMyFavoriteBusinesses().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteBusinesses: data.favoriteBusinesses),
          failure: (error) => _handleError('Error loading favorite businesses: $error'),
        ),
      );

  /// Carga los menús favoritos del usuario
  Future<void> _loadFavoriteMenus() => _businessRepo.getMyFavoriteMenus().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteMenus: data.favoriteMenus),
          failure: (error) => _handleError('Error loading favorite menus: $error'),
        ),
      );

  /// Carga los alimentos favoritos del usuario
  Future<void> _loadFavoriteFoodItems() => _businessRepo.getMyFavoriteFoodItems().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteFoodItems: data.favoriteFoodItems),
          failure: (error) => _handleError('Error loading favorite food items: $error'),
        ),
      );

  /// Carga las bebidas favoritas del usuario
  Future<void> _loadFavoriteDrinkItems() => _businessRepo.getMyFavoriteDrinkItems().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoriteDrinkItems: data.favoriteDrinkItems),
          failure: (error) => _handleError('Error loading favorite drink items: $error'),
        ),
      );

  /// Carga las promociones favoritas del usuario
  Future<void> _loadFavoritePromotions() => _businessRepo.getMyFavoritePromotions().then(
        (result) => result.when(
          success: (data) => _vm = _vm.copyWith(favoritePromos: data.savedPromotions),
          failure: (error) => _handleError('Error loading favorite promotions: $error'),
        ),
      );

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
