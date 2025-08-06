import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/view_model/promotions_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotions_cubit.freezed.dart';
part 'promotions_state.dart';

/// Cubit para mostrar las promociones de un negocio en modo solo lectura
/// para los clientes que visitan el negocio
class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsVM _vm;
  final Logger _logger;
  final BusinessRepo _businessRepo;

  PromotionsCubit(
    String businessUuid,
    BusinessDM? business,
    BusinessRepo businessRepo,
    Logger logger,
  )   : _vm = PromotionsVM(
          promotions: [],
          businessDM: business,
          businessUuid: businessUuid,
          controller: PageController(),
          activePromosScrollController: ScrollController(debugLabel: 'active'),
          upcomingPromosScrollController: ScrollController(debugLabel: 'upcoming'),
        ),
        _logger = logger,
        _businessRepo = businessRepo,
        super(const _Initial(PromotionsVM())) {
    _loadPromos();
  }

  /// Carga las promociones del negocio
  void _loadPromos() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    if (_vm.businessDM == null) {
      await _businessRepo.fetchBusinessById(_vm.businessUuid).then(
            (response) => response.when(
                success: (data) => _vm = _vm.copyWith(businessDM: data), failure: (e) => _handleError(e.errorMsg)),
          );
    }

    emit(_Loaded(_vm = _vm.copyWith(promotions: _vm.businessDM?.promotions ?? [])));
  }

  /// Actualiza la vista actual (activas o próximas)
  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));

  /// Maneja los errores que puedan ocurrir durante la carga de promociones
  void _handleError(Object e) {
    _logger.e(e);
    emit(_Error(e.toString(), _vm));
  }
}
