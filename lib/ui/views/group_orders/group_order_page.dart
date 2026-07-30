import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di, LoadingWidgetFoodlyLogo;
import 'package:foodly_world/core/services/stripe_payment_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
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

  /// Flujo de pago con PaymentSheet. Sin [coverUuids] paga MI parte; con
  /// ellos cubre la parte de esos participantes ("yo invito", F2b §A.2).
  /// Antes de crear el intent se ofrece la propina (F2c §B.2).
  Future<void> _onPay(BuildContext context, {List<String>? coverUuids}) async {
    final cubit = context.read<GroupOrderCubit>();
    final order = cubit.vm.order;
    final uuid = order?.uuid;

    // Base del pago (solo para mostrar los % de propina; el cobro real lo
    // calcula SIEMPRE el backend).
    final double base = coverUuids == null
        ? cubit.vm.myShare
        : (order?.participants
                .where((p) => coverUuids.contains(p.uuid))
                .fold<double>(0, (acc, p) => acc + p.remainingDue) ??
            0);

    final tip = await _askTip(
      context,
      base,
      order?.currency ?? 'EUR',
      serviceFee: order?.payerFixedFee ?? 0,
    );
    if (tip == null || !context.mounted) return; // canceló el selector

    final intent = await cubit.createPayIntent(
      coverParticipantUuids: coverUuids,
      tipAmount: tip > 0 ? tip : null,
    );
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

  /// Host: cierra el pedido (congela precios) y sincroniza el carrito del
  /// menú. F2c §B.1: primero elige cómo dividir la cuenta.
  Future<void> _onLock(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();

    final mode = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
              child: Text(S.current.groupOrderSplitModeTitle, style: FoodlyTextStyles.sectionsTitle),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_rounded, color: FoodlyThemes.primaryFoodly),
              title: Text(S.current.groupOrderSplitByItems, style: FoodlyTextStyles.labelBold),
              subtitle: Text(S.current.groupOrderSplitByItemsDesc, style: FoodlyTextStyles.caption),
              onTap: () => Navigator.pop(ctx, 'by_items'),
            ),
            ListTile(
              leading: const Icon(Icons.balance_rounded, color: FoodlyThemes.primaryFoodly),
              title: Text(S.current.groupOrderSplitEqual, style: FoodlyTextStyles.labelBold),
              subtitle: Text(S.current.groupOrderSplitEqualDesc, style: FoodlyTextStyles.caption),
              onTap: () => Navigator.pop(ctx, 'equal_split'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (mode == null || !context.mounted) return;

    await cubit.lock(splitMode: mode);
    await di<ActiveGroupOrderCubit>().refresh();
  }

  /// Selector de propina (F2c §B.2): 0% / 5% / 10% / monto libre.
  /// Muestra el desglose del pago (parte + tarifa fija del comensal) para
  /// transparencia total. Devuelve null si el usuario cancela (aborta el pago).
  Future<double?> _askTip(
    BuildContext context,
    double base,
    String currency, {
    double serviceFee = 0,
  }) async {
    double pct(double p) => double.parse((base * p).toStringAsFixed(2));

    final choice = await showModalBottomSheet<Object>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 2),
              child: Text(S.current.groupOrderTipTitle, style: FoodlyTextStyles.sectionsTitle),
            ),
            // Desglose transparente: parte + tarifa de la plataforma de pagos.
            if (serviceFee > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
                child: Text(
                  S.current.groupOrderTipBaseSummary(
                    formatMoney(base, currency),
                    formatMoney(serviceFee, currency),
                  ),
                  style: FoodlyTextStyles.caption,
                ),
              ),
            ListTile(
              leading: const Icon(Icons.money_off_rounded, color: FoodlyThemes.secondaryFoodly),
              title: Text(S.current.groupOrderTipNone, style: FoodlyTextStyles.labelBold),
              onTap: () => Navigator.pop(ctx, 0.0),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_outline_rounded, color: FoodlyThemes.primaryFoodly),
              title: Text('5% · ${formatMoney(pct(0.05), currency)}', style: FoodlyTextStyles.labelBold),
              onTap: () => Navigator.pop(ctx, pct(0.05)),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_rounded, color: FoodlyThemes.primaryFoodly),
              title: Text('10% · ${formatMoney(pct(0.10), currency)}', style: FoodlyTextStyles.labelBold),
              onTap: () => Navigator.pop(ctx, pct(0.10)),
            ),
            ListTile(
              leading: const Icon(Icons.edit_rounded, color: FoodlyThemes.primaryFoodly),
              title: Text(S.current.groupOrderTipCustom, style: FoodlyTextStyles.labelBold),
              onTap: () => Navigator.pop(ctx, 'custom'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (choice == null || !context.mounted) return null;
    if (choice is double) return choice;

    // Monto libre.
    final controller = TextEditingController();
    final custom = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.current.groupOrderTipCustom),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(prefixText: '€ '),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(S.current.cancel)),
          TextButton(
            onPressed: () {
              final v = double.tryParse(controller.text.replaceAll(',', '.'));
              Navigator.pop(ctx, (v == null || v < 0) ? 0.0 : v);
            },
            child: Text(S.current.confirm),
          ),
        ],
      ),
    );
    return custom;
  }

  Future<bool> _confirm(BuildContext context, String message) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(S.current.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(S.current.confirm)),
        ],
      ),
    );
    return ok ?? false;
  }

  /// "Cubrir su parte" de UN participante (F2b §A.2).
  Future<void> _onCover(
    BuildContext context,
    GroupOrderDM order,
    GroupOrderParticipantDM p,
  ) async {
    final msg = S.current.groupOrderCoverConfirm(
      p.displayName,
      formatMoney(p.remainingDue, order.currency),
    );
    if (await _confirm(context, msg) && context.mounted) {
      await _onPay(context, coverUuids: [p.uuid]);
    }
  }

  /// "Pagar todo lo pendiente" de la orden (F2b §A.2).
  Future<void> _onPayAll(BuildContext context, GroupOrderDM order) async {
    final uuids = order.coverableParticipants.map((p) => p.uuid).toList();
    if (uuids.isEmpty) return;
    final msg = S.current.groupOrderPayAllConfirm(
      formatMoney(order.totalRemaining, order.currency),
    );
    if (await _confirm(context, msg) && context.mounted) {
      await _onPay(context, coverUuids: uuids);
    }
  }

  /// Host: reabre la orden cerrada sin pagos (F2b §C.1).
  Future<void> _onUnlock(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    if (await _confirm(context, S.current.groupOrderUnlockConfirm) && context.mounted) {
      await cubit.unlock();
      await di<ActiveGroupOrderCubit>().refresh();
    }
  }

  /// Host: transfiere la titularidad (F2b §A.1). Bottom sheet con los
  /// participantes elegibles + confirmación.
  Future<void> _onTransferHost(
    BuildContext context,
    GroupOrderDM order,
    String? myUuid,
  ) async {
    final cubit = context.read<GroupOrderCubit>();
    final candidates = order.participants.where((p) => p.uuid != myUuid).toList();
    if (candidates.isEmpty) return;

    final chosen = await showModalBottomSheet<GroupOrderParticipantDM>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
              child: Text(S.current.groupOrderTransferHost, style: FoodlyTextStyles.sectionsTitle),
            ),
            for (final p in candidates)
              ListTile(
                leading: AvatarWidget(
                  avatarUrl: p.avatarUrl,
                  width: 38,
                  height: 38,
                  avatarType: AvatarType.user,
                ),
                title: Text(p.displayName, style: FoodlyTextStyles.labelBold),
                onTap: () => Navigator.pop(ctx, p),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (chosen == null || !context.mounted) return;

    if (await _confirm(context, S.current.groupOrderTransferHostConfirm(chosen.displayName)) &&
        context.mounted) {
      await cubit.transferHost(chosen.uuid);
    }
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

        // Operación en curso: deshabilita los CTAs del footer para evitar
        // dobles taps (lock/unlock/transfer emiten loading; el pago, isPaying).
        final isBusy = vm.isPaying || state.maybeWhen(loading: (_) => true, orElse: () => false);

        return Scaffold(
          appBar: _buildAppBar(context, vm),
          body: SafeArea(
            top: false,
            child: order == null
                ? const Center(child: LoadingWidgetFoodlyLogo())
                : _Content(
                    vm: vm,
                    order: order,
                    isBusy: isBusy,
                    onPay: () => _onPay(context),
                    onLock: () => _onLock(context),
                    onCover: (p) => _onCover(context, order, p),
                    onPayAll: () => _onPayAll(context, order),
                  ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, GroupOrderVM vm) {
    final order = vm.order;

    // Menú del host (F2b): transferir titularidad y/o reabrir la orden.
    final isHost = order != null && _iAmHostOf(vm, order);
    final canTransfer = isHost && order.participants.length > 1;
    final canUnlock = isHost && order.isLocked && order.totalPaid <= 0;

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
      actions: [
        if (canTransfer || canUnlock)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'transfer':
                  _onTransferHost(context, order, vm.myParticipantUuid);
                case 'unlock':
                  _onUnlock(context);
              }
            },
            itemBuilder: (_) => [
              if (canTransfer)
                PopupMenuItem(value: 'transfer', child: Text(S.current.groupOrderTransferHost)),
              if (canUnlock)
                PopupMenuItem(value: 'unlock', child: Text(S.current.groupOrderUnlockCta)),
            ],
          ),
      ],
    );
  }
}

/// ¿El usuario actual es el host de la orden?
bool _iAmHostOf(GroupOrderVM vm, GroupOrderDM order) {
  final me = vm.myParticipantUuid;
  if (me == null) return false;
  final mine = order.participants.where((p) => p.uuid == me);
  return mine.isNotEmpty && mine.first.isHost;
}

class _Content extends StatelessWidget {
  final GroupOrderVM vm;
  final GroupOrderDM order;
  final bool isBusy;
  final VoidCallback onPay;
  final VoidCallback onLock;
  final void Function(GroupOrderParticipantDM p) onCover;
  final VoidCallback onPayAll;

  const _Content({
    required this.vm,
    required this.order,
    required this.isBusy,
    required this.onPay,
    required this.onLock,
    required this.onCover,
    required this.onPayAll,
  });

  /// ¿El usuario actual es el host de la orden? (puede cerrar el pedido y
  /// eliminar ítems de cualquiera).
  bool get _iAmHost => _iAmHostOf(vm, order);

  /// Regla de borrado (spec v2 §F): solo con la orden OPEN; cada quien borra
  /// SUS ítems; el host puede borrar los de cualquiera.
  bool _canRemoveItemsOf(GroupOrderParticipantDM p) =>
      order.isOpen && (_iAmHost || p.uuid == vm.myParticipantUuid);

  /// "Cubrir su parte" (F2b §A.2): pendiente, sin pago en curso y no soy yo
  /// (mi parte se paga con el CTA principal).
  bool _canCover(GroupOrderParticipantDM p) =>
      order.isPayable && p.uuid != vm.myParticipantUuid && p.remainingDue > 0 && !p.isProcessing;

  /// Nombre de quien cubrió la parte de [p] ("Pagado por X"); null si nadie.
  String? _paidByNameFor(GroupOrderParticipantDM p) {
    final byUuid = p.paidByParticipantUuid;
    if (byUuid == null) return null;
    for (final other in order.participants) {
      if (other.uuid == byUuid) return other.displayName;
    }
    return null;
  }

  /// "Pagar todo lo pendiente": con saldo global y al menos un cubrible que
  /// no sea solo yo (si solo quedo yo, equivale al CTA principal).
  bool get _showPayAll {
    if (!order.isPayable || order.totalRemaining <= 0) return false;
    final coverables = order.coverableParticipants;
    if (coverables.isEmpty) return false;
    return !(coverables.length == 1 && coverables.first.uuid == vm.myParticipantUuid);
  }

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
                  // F2c: misma regla que el borrado (OPEN + dueño/host).
                  onToggleSharedItem: (_canRemoveItemsOf(p) && !isBusy)
                      ? (item) => context.read<GroupOrderCubit>().setItemShared(item.uuid, !item.shared)
                      : null,
                  onCover: (_canCover(p) && !isBusy) ? () => onCover(p) : null,
                  paidByName: _paidByNameFor(p),
                ),
              ),
            ],
          ),
        ),
        GroupOrderTotalsFooter(
          order: order,
          myShare: vm.myShare,
          isBusy: isBusy,
          onPay: vm.canPay ? onPay : null,
          onLock: (order.isOpen && _iAmHost) ? onLock : null,
          onPayAll: _showPayAll ? onPayAll : null,
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
