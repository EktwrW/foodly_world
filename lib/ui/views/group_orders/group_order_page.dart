import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di, LoadingWidgetFoodlyLogo;
import 'package:foodly_world/core/services/stripe_payment_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_expansible_tile.dart';

/// Pantalla de detalle de una orden grupal (split payments).
/// Compone los widgets de la rebanada 1 con el GroupOrderCubit y el
/// PaymentSheet de Stripe. Ver docs/group-orders-design-spec.md §13.
class GroupOrderPage extends StatelessWidget {
  final String orderUuid;
  const GroupOrderPage({super.key, required this.orderUuid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupOrderCubit(repo: di(), logger: di())..load(orderUuid),
      child: const _GroupOrderView(),
    );
  }
}

class _GroupOrderView extends StatelessWidget {
  const _GroupOrderView();

  Future<void> _onPay(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    final uuid = cubit.vm.order?.uuid;

    final intent = await cubit.createPayIntent();
    if (!context.mounted) return;

    final secret = intent?.clientSecret;
    if (secret == null) {
      // intent == null → el cubit ya emitió el error. intent sin secret →
      // respuesta anómala del backend: avisa en vez de fallar en silencio.
      if (intent != null) FoodlySnackbars.errorGeneric(context, S.current.groupOrderPaymentFailed);
      return;
    }

    final result = await di<StripePaymentService>().presentPaymentSheet(clientSecret: secret);
    if (!context.mounted) return;

    switch (result) {
      case StripePaymentResult.completed:
        FoodlySnackbars.successGeneric(context, S.current.groupOrderPaymentSucceeded);
        di<ActiveGroupOrderCubit>().end(); // resetea el carrito del menú
        if (uuid != null) cubit.load(uuid); // refetch — el webhook sella el estado
      case StripePaymentResult.canceled:
        FoodlySnackbars.infoGeneric(context, S.current.groupOrderPaymentCanceled);
      case StripePaymentResult.failed:
        FoodlySnackbars.errorGeneric(context, S.current.groupOrderPaymentFailed);
    }
  }

  /// Host: cierra el pedido (congela precios) y sincroniza el carrito del menú.
  Future<void> _onLock(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    await cubit.lock();
    await di<ActiveGroupOrderCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupOrderCubit, GroupOrderState>(
      listener: (context, state) {
        final msg = state.whenOrNull(error: (vm, message) => message);
        if (msg != null) FoodlySnackbars.errorGeneric(context, msg);
      },
      builder: (context, state) {
        final vm = state.when(
          initial: (vm) => vm,
          loading: (vm) => vm,
          loaded: (vm) => vm,
          error: (vm, _) => vm,
        );
        final order = vm.order;

        return Scaffold(
          appBar: _buildAppBar(context, order),
          body: SafeArea(
            top: false,
            child: order == null
                ? const Center(child: LoadingWidgetFoodlyLogo())
                : _Content(
                    vm: vm,
                    order: order,
                    onPay: () => _onPay(context),
                    onLock: () => _onLock(context),
                  ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, GroupOrderDM? order) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 60,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      title: Text(
        order?.businessName.isNotEmpty == true ? order!.businessName : S.current.groupOrderTitle,
        style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
    );
  }
}

class _Content extends StatelessWidget {
  final GroupOrderVM vm;
  final GroupOrderDM order;
  final VoidCallback onPay;
  final VoidCallback onLock;

  const _Content({required this.vm, required this.order, required this.onPay, required this.onLock});

  /// ¿El usuario actual es el host de la orden? (puede cerrar el pedido y
  /// eliminar ítems de cualquiera).
  bool get _iAmHost {
    final me = vm.myParticipantUuid;
    if (me == null) return false;
    final mine = order.participants.where((p) => p.uuid == me);
    return mine.isNotEmpty && mine.first.isHost;
  }

  /// Regla de borrado (spec v2 §F): solo con la orden OPEN; cada quien borra
  /// SUS ítems; el host puede borrar los de cualquiera.
  bool _canRemoveItemsOf(GroupOrderParticipantDM p) =>
      order.isOpen && (_iAmHost || p.uuid == vm.myParticipantUuid);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
            children: [
              _SectionTitle(S.current.groupOrderParticipants),
              const SizedBox(height: 8),
              // Ítems agrupados por participante (Expansible). Mi grupo abre
              // expandido; el estado de expansión sobrevive a refreshes del
              // cubit gracias a la key estable por uuid.
              ...order.participants.map(
                (p) => ParticipantExpansibleTile(
                  key: ValueKey(p.uuid),
                  order: order,
                  participant: p,
                  initiallyExpanded: p.uuid == vm.myParticipantUuid,
                  onRemoveItem: _canRemoveItemsOf(p)
                      ? (item) => context.read<GroupOrderCubit>().removeItem(item.uuid)
                      : null,
                ),
              ),
            ],
          ),
        ),
        GroupOrderTotalsFooter(
          order: order,
          myShare: vm.myShare,
          onPay: vm.canPay ? onPay : null,
          onLock: (order.isOpen && _iAmHost) ? onLock : null,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: FoodlyTextStyles.sectionsTitle);
  }
}
