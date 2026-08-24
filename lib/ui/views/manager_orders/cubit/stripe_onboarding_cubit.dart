import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:logger/logger.dart';

/// F4a-6 — estado del onboarding de pagos (maqueta 3, dos estados):
/// sin activar → banner CTA; activo → confirmación compacta.
class StripeOnboardingState {
  final bool loading;

  /// null = aún no se consultó; false = sin activar; true = puede cobrar.
  final bool? chargesEnabled;
  final bool payoutsEnabled;

  /// Ajustes de cobro, que llegan en el MISMO payload del estado Connect: así
  /// el selector abre con lo que el negocio ya tiene, sin una llamada aparte.
  final String? groupPaymentMode;

  /// Mínimo para pagar en la app, en céntimos. null = sin mínimo.
  final int? cardMinAmountMinor;

  /// ¿El negocio sirve EN MESA? Decide si al comensal que no llegó por el QR
  /// de su mesa se le pide antes de que el pedido salga a cocina.
  final bool tableService;

  const StripeOnboardingState({
    this.loading = false,
    this.chargesEnabled,
    this.payoutsEnabled = false,
    this.groupPaymentMode,
    this.cardMinAmountMinor,
    this.tableService = false,
  });

  /// `copyWith` NO sirve para limpiar el mínimo —`??` conserva el viejo—, y no
  /// hace falta que sirva: el estado se reemplaza entero al recargar, que es
  /// como se refleja un mínimo quitado.
  StripeOnboardingState copyWith({
    bool? loading,
    bool? chargesEnabled,
    bool? payoutsEnabled,
    String? groupPaymentMode,
    int? cardMinAmountMinor,
    bool? tableService,
  }) =>
      StripeOnboardingState(
        loading: loading ?? this.loading,
        chargesEnabled: chargesEnabled ?? this.chargesEnabled,
        payoutsEnabled: payoutsEnabled ?? this.payoutsEnabled,
        groupPaymentMode: groupPaymentMode ?? this.groupPaymentMode,
        cardMinAmountMinor: cardMinAmountMinor ?? this.cardMinAmountMinor,
        tableService: tableService ?? this.tableService,
      );
}

/// Consulta y refresca el estado Connect del negocio, y arranca el
/// onboarding Express hosted: devuelve la URL del AccountLink y el WIDGET
/// la abre (url_launcher externo, recomendado por Stripe para Express).
class StripeOnboardingCubit extends Cubit<StripeOnboardingState> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  final String businessUuid;

  StripeOnboardingCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    required this.businessUuid,
  })  : _repo = repo,
        _logger = logger,
        super(const StripeOnboardingState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    final res = await _repo.stripeStatus(businessUuid);
    res.when(
      success: (s) => emit(StripeOnboardingState(
        chargesEnabled: s.chargesEnabled,
        payoutsEnabled: s.payoutsEnabled,
        groupPaymentMode: s.groupPaymentMode,
        cardMinAmountMinor: s.cardMinAmountMinor,
        tableService: s.tableService,
      )),
      failure: (e) {
        _logger.e(e);
        // Sin red no asumimos nada: chargesEnabled queda como estaba.
        emit(state.copyWith(loading: false));
      },
    );
  }

  /// F4b-2: guarda el modo de cobro elegido por el dueño (per_round |
  /// open_tab). true si el backend lo aceptó.
  /// [cardMinAmountMinor] en céntimos; null QUITA el mínimo. La clave viaja
  /// siempre en el body, así que el backend puede distinguir "quitar" de "no
  /// tocar" — ver la nota de `updatePaymentMode` en el cliente.
  Future<bool> setPaymentMode(
    GroupPaymentMode mode, {
    int? cardMinAmountMinor,
    bool? tableService,
  }) async {
    final res = await _repo.updatePaymentMode(
      businessUuid,
      mode: mode == GroupPaymentMode.openTab ? 'open_tab' : 'per_round',
      cardMinAmountMinor: cardMinAmountMinor,
      tableService: tableService,
    );
    return res.when(
      // Se recarga para que el banner y el selector queden con lo que el
      // backend guardó de verdad, y no con lo que creemos haber mandado.
      success: (_) {
        unawaited(load());
        return true;
      },
      failure: (e) {
        _logger.e(e);
        return false;
      },
    );
  }

  /// Crea el AccountLink y devuelve su URL (null si falló). El caller la
  /// abre en el navegador; al volver a la app, [load] refresca el estado.
  Future<String?> startOnboarding() async {
    final res = await _repo.stripeOnboard(businessUuid);
    return res.when(
      success: (r) => r.onboardingUrl,
      failure: (e) {
        _logger.e(e);
        return null;
      },
    );
  }
}
