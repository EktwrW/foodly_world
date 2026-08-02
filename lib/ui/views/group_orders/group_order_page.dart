import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di, LoadingWidgetFoodlyLogo;
import 'package:foodly_world/core/services/stripe_payment_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_expansible_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

/// Pantalla de detalle de una orden grupal (split payments).
/// Compone los widgets de la rebanada 1 con el GroupOrderCubit y el
/// PaymentSheet de Stripe. Ver docs/group-orders-design-spec.md §13.
///
/// Stateful SOLO para marcar su visibilidad en [GroupOrderPageVisibility]
/// (e2e r6): el chip flotante global se oculta mientras esta página viva.
class GroupOrderPage extends StatefulWidget {
  final String orderUuid;
  const GroupOrderPage({super.key, required this.orderUuid});

  @override
  State<GroupOrderPage> createState() => _GroupOrderPageState();
}

class _GroupOrderPageState extends State<GroupOrderPage> {
  @override
  void initState() {
    super.initState();
    GroupOrderPageVisibility.markOpened();
  }

  @override
  void dispose() {
    GroupOrderPageVisibility.markClosed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupOrderCubit(repo: di(), logger: di(), realtime: di())..load(widget.orderUuid),
      child: const _GroupOrderView(),
    );
  }
}

class _GroupOrderView extends StatefulWidget {
  const _GroupOrderView();

  @override
  State<_GroupOrderView> createState() => _GroupOrderViewState();
}

class _GroupOrderViewState extends State<_GroupOrderView> {
  // e2e r7: celebración de la confirmación — una sola vez y solo si vimos
  // la orden viva antes (no al abrir una orden ya confirmada).
  bool _celebrationShown = false;
  bool _sawAliveOrder = false;

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
  /// menú. F2c §B.1: con VARIOS participantes primero elige cómo dividir;
  /// con uno solo no hay nada que dividir y se cierra directo (feedback e2e
  /// 2026-07-31).
  Future<void> _onLock(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    final participants = cubit.vm.order?.participants.length ?? 1;

    String? mode = 'by_items';
    if (participants > 1) {
      mode = await _askSplitMode(context);
      if (mode == null || !context.mounted) return; // canceló
    } else {
      // e2e r7 (lock fantasma): en solitario NO hay diálogo de split, y ese
      // diálogo era la única confirmación — un tap suelto cerraba la orden
      // sin aviso. Confirm explícito SIEMPRE antes de cerrar.
      if (!await _confirm(context, S.current.groupOrderLockConfirmSolo) || !context.mounted) {
        return;
      }
    }

    await cubit.lock(splitMode: mode);
    await di<ActiveGroupOrderCubit>().refresh();
  }

  /// Diálogo de división estilo Foodly: dos opciones tipo tarjeta con radio,
  /// sin selección inicial; el CTA se habilita al elegir.
  Future<String?> _askSplitMode(BuildContext context) {
    String? selected;

    Widget option({
      required StateSetter setState,
      required String value,
      required IconData icon,
      required String title,
      required String subtitle,
    }) {
      final isSelected = selected == value;
      return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => setState(() => selected = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected
                ? FoodlyThemes.primaryFoodly.withValues(alpha: 0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? FoodlyThemes.primaryFoodly
                  : FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: FoodlyThemes.primaryFoodly, size: 26),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: FoodlyTextStyles.labelBold),
                    const SizedBox(height: 2),
                    Text(subtitle, style: FoodlyTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                color: isSelected
                    ? FoodlyThemes.primaryFoodly
                    : FoodlyThemes.secondaryFoodly,
              ),
            ],
          ),
        ),
      );
    }

    return showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(S.current.groupOrderSplitModeTitle,
                    style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                option(
                  setState: setState,
                  value: 'by_items',
                  icon: Icons.receipt_long_rounded,
                  title: S.current.groupOrderSplitByItems,
                  subtitle: S.current.groupOrderSplitByItemsDesc,
                ),
                const SizedBox(height: 10),
                option(
                  setState: setState,
                  value: 'equal_split',
                  icon: Icons.balance_rounded,
                  title: S.current.groupOrderSplitEqual,
                  subtitle: S.current.groupOrderSplitEqualDesc,
                ),
                const SizedBox(height: 16),
                CustomNeumorphicButton(
                  text: S.current.groupOrderLockCta,
                  disabled: selected == null,
                  margin: EdgeInsets.zero,
                  onPressed: selected == null ? null : () => Navigator.pop(ctx, selected),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Selector de propina (F2c §B.2): 0% / 5% / 10% / monto libre.
  /// Tarjeta de opción de propina (mismo lenguaje visual que split/transfer).
  Widget _tipOption(BuildContext ctx, IconData icon, String label, Object value) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.pop(ctx, value),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Icon(icon, color: FoodlyThemes.primaryFoodly, size: 22),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: FoodlyTextStyles.labelBold)),
            const Icon(Icons.chevron_right_rounded,
                size: 20, color: FoodlyThemes.secondaryFoodly),
          ],
        ),
      ),
    );
  }

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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
            // Opciones como tarjetas Foodly (mismo lenguaje que split/transfer);
            // quick-pick: un tap elige y cierra.
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _tipOption(ctx, Icons.money_off_rounded, S.current.groupOrderTipNone, 0.0),
                  const SizedBox(height: 8),
                  _tipOption(ctx, Icons.favorite_outline_rounded,
                      '5% · ${formatMoney(pct(0.05), currency)}', pct(0.05)),
                  const SizedBox(height: 8),
                  _tipOption(ctx, Icons.favorite_rounded,
                      '10% · ${formatMoney(pct(0.10), currency)}', pct(0.10)),
                  const SizedBox(height: 8),
                  _tipOption(ctx, Icons.edit_rounded, S.current.groupOrderTipCustom, 'custom'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if (choice == null || !context.mounted) return null;
    if (choice is double) return choice;

    // Monto libre — dialog Foodly (shell compartido).
    final controller = TextEditingController();
    final custom = await showDialog<double>(
      context: context,
      builder: (ctx) => FoodlyDialogShell(
        title: S.current.groupOrderTipCustom,
        actions: [
          CustomNeumorphicButton(
            text: S.current.confirm,
            disabled: false,
            margin: EdgeInsets.zero,
            onPressed: () {
              final v = double.tryParse(controller.text.replaceAll(',', '.'));
              Navigator.pop(ctx, (v == null || v < 0) ? 0.0 : v);
            },
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
          ),
        ],
        child: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: FoodlyTextStyles.sectionsTitle,
          decoration: InputDecoration(
            prefixText: '€ ',
            prefixStyle: FoodlyTextStyles.sectionsTitle,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.primaryFoodly, width: 2),
            ),
          ),
        ),
      ),
    );
    return custom;
  }

  /// Confirmación estilo Foodly (shell compartido) — refinamiento pre-F4a:
  /// reemplaza al AlertDialog crudo en unlock/cover/pay-all/delete/leave/lock.
  Future<bool> _confirm(BuildContext context, String message) =>
      showFoodlyConfirm(context, message: message);

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

  /// e2e r6: la orden ya no existe / ya no soy parte — cerrar carrito y
  /// navegar DETERMINISTA al menú del negocio (go reemplaza la ubicación:
  /// la página de la orden desaparece sí o sí; nada de depender de pop).
  void _exitOrder(BuildContext context, GroupOrderDM? order) {
    di<ActiveGroupOrderCubit>().end();
    final menuUuid = order?.businessMenuUuid;
    if (menuUuid != null && menuUuid.isNotEmpty) {
      context.goNamed(
        AppRoutes.visitMenu.name,
        pathParameters: {AppRoutes.routeIdParam: menuUuid},
      );
      return;
    }
    // Sin uuid de menú (DM viejo): back jerárquico como salida segura.
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    } else {
      di<AppRouter>().goBackToLastRoute();
    }
  }

  /// e2e r7: sheet de éxito al confirmarse la orden — check animado, total y
  /// nota del recibo; CTA único "Volver al menú" (decisión de producto:
  /// seguís en contexto del restaurante, no al home).
  Future<void> _showPaymentSuccess(BuildContext context, GroupOrderDM order) async {
    HapticFeedback.mediumImpact();
    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutBack,
              builder: (_, scale, child) => Transform.scale(scale: scale, child: child),
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: FoodlyThemes.tertiaryFoodly,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.4),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 44),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              S.current.groupOrderPaymentSuccessTitle,
              style: FoodlyTextStyles.sectionsTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              S.current.groupOrderPaymentSuccessBody(
                formatMoney(order.totalAmount, order.currency),
              ),
              style: FoodlyTextStyles.caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomNeumorphicButton(
              text: S.current.groupOrderBackToMenu,
              disabled: false,
              margin: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(ctx);
                _exitOrder(context, order);
              },
            ),
            // F4a (caso bar): otra ronda en la misma mesa — orden nueva que
            // hereda QR y mesa; el que la abre queda como host.
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _startNextRound(context, order);
              },
              child: Text(S.current.groupOrderNextRound, style: FoodlyTextStyles.captionPurpleBold),
            ),
          ],
        ),
      ),
    );
  }

  /// Abre la ronda siguiente y aterriza en el MENÚ con el carrito nuevo
  /// activo (sin end(): la ronda ES el carrito ahora).
  Future<void> _startNextRound(BuildContext context, GroupOrderDM previous) async {
    final active = di<ActiveGroupOrderCubit>();
    final ok = await active.startNextRound(previous.uuid);
    if (!context.mounted) return;

    if (!ok) {
      FoodlySnackbars.errorGeneric(
          context, active.lastJoinError ?? S.current.groupOrderJoinFailed);
      return;
    }

    final menuUuid = active.state?.businessMenuUuid ?? previous.businessMenuUuid;
    if (menuUuid != null && menuUuid.isNotEmpty) {
      context.goNamed(
        AppRoutes.visitMenu.name,
        pathParameters: {AppRoutes.routeIdParam: menuUuid},
      );
    }
  }

  /// e2e r4: host elimina definitivamente una orden vacía.
  Future<void> _onDelete(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    final order = cubit.vm.order; // capturado ANTES de que la orden muera
    if (await _confirm(context, S.current.groupOrderDeleteConfirm) && context.mounted) {
      if (await cubit.deleteOrder() && context.mounted) _exitOrder(context, order);
    }
  }

  /// e2e r4: miembro sin ítems abandona la orden.
  Future<void> _onLeave(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    final order = cubit.vm.order;
    if (await _confirm(context, S.current.groupOrderLeaveConfirm) && context.mounted) {
      if (await cubit.leaveOrder() && context.mounted) _exitOrder(context, order);
    }
  }

  /// F3a: invita a la mesa — sheet con el código corto y botón de compartir.
  Future<void> _onInvite(BuildContext context) async {
    final cubit = context.read<GroupOrderCubit>();
    final businessName = cubit.vm.order?.businessName ?? 'Foodly';

    final invite = await cubit.createInvitation();
    if (!context.mounted) return;
    final code = invite?.inviteCode ?? invite?.inviteToken;
    if (code == null) {
      FoodlySnackbars.errorGeneric(context, S.current.groupOrderJoinFailed);
      return;
    }

    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(S.current.groupOrderInviteTitle,
                  style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              // El QR es el protagonista (filosofía Foodly: escanear, no
              // tipear); el código corto queda como fallback visible.
              Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
                    boxShadow: [
                      BoxShadow(
                        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: '$kGroupOrderInviteUrlBase$code',
                    size: 190,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle,
                      color: FoodlyThemes.primaryFoodly,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle,
                      color: FoodlyThemes.primaryFoodly,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Fallback: código tipeable (por si el QR falla o para web).
              SelectableText(
                code,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 8,
                  color: FoodlyThemes.primaryFoodly,
                ),
              ),
              const SizedBox(height: 6),
              Text(S.current.groupOrderInviteHint,
                  style: FoodlyTextStyles.caption, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              CustomNeumorphicButton(
                text: S.current.groupOrderInviteShareCta,
                disabled: false,
                margin: EdgeInsets.zero,
                onPressed: () => Share.share(
                  '${S.current.groupOrderInviteShareMsg(businessName, code)}\n$kGroupOrderInviteUrlBase$code',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Host: transfiere la titularidad (F2b §A.1). Mismo lenguaje visual que
  /// el selector de split (refinamiento UI pre-F4a): tarjetas por
  /// participante con avatar + radio animado, sin selección inicial, y CTA
  /// que se habilita al elegir — la selección resaltada ES la confirmación.
  Future<void> _onTransferHost(
    BuildContext context,
    GroupOrderDM order,
    String? myUuid,
  ) async {
    final cubit = context.read<GroupOrderCubit>();
    final candidates = order.participants.where((p) => p.uuid != myUuid).toList();
    if (candidates.isEmpty) return;

    String? selected;

    Widget candidateCard({
      required StateSetter setState,
      required GroupOrderParticipantDM p,
    }) {
      final isSelected = selected == p.uuid;
      return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => setState(() => selected = p.uuid),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? FoodlyThemes.primaryFoodly.withValues(alpha: 0.08) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? FoodlyThemes.primaryFoodly
                  : FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              AvatarWidget(
                avatarUrl: p.avatarUrl,
                width: 38,
                height: 38,
                avatarType: AvatarType.user,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  p.displayName,
                  style: FoodlyTextStyles.labelBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                color: isSelected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
              ),
            ],
          ),
        ),
      );
    }

    final chosenUuid = await showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(S.current.groupOrderTransferHost,
                    style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                // Lista acotada y scrolleable (mesas grandes).
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = 0; i < candidates.length; i++) ...[
                          if (i > 0) const SizedBox(height: 10),
                          candidateCard(setState: setState, p: candidates[i]),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomNeumorphicButton(
                  text: S.current.groupOrderTransferHost,
                  disabled: selected == null,
                  margin: EdgeInsets.zero,
                  onPressed: selected == null ? null : () => Navigator.pop(ctx, selected),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (chosenUuid == null || !context.mounted) return;

    await cubit.transferHost(chosenUuid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupOrderCubit, GroupOrderState>(
      listener: (context, state) {
        final msg = state.whenOrNull(error: (vm, message) => message);
        if (msg != null) FoodlySnackbars.errorGeneric(context, msg);

        // e2e r7: cierre del flujo — al confirmarse la orden (todos pagaron,
        // llega por realtime o refetch) se celebra UNA vez con el sheet de
        // éxito y de ahí se sale al menú del negocio.
        final order = state.when(
          initial: (vm) => vm.order,
          loading: (vm) => vm.order,
          loaded: (vm) => vm.order,
          error: (vm, _) => vm.order,
        );
        if (order != null && !order.isConfirmed) _sawAliveOrder = true;
        if (order != null &&
            shouldCelebrateConfirmation(
              alreadyShown: _celebrationShown,
              sawAliveOrder: _sawAliveOrder,
              isConfirmed: order.isConfirmed,
            )) {
          _celebrationShown = true;
          _showPaymentSuccess(context, order);
        }
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
    // e2e r4: eliminar (host, orden vacía) / abandonar (miembro sin ítems).
    final canDelete = order != null && order.canBeDeletedBy(vm.myParticipantUuid);
    final canLeave = order != null && order.canBeLeftBy(vm.myParticipantUuid);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 60,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
        // Back jerárquico (e2e r4): con stack, pop normal (vuelve al menú
        // preservando su estado); sin stack (deep link, notificación,
        // chip global), goBackToLastRoute reconstruye el menú del negocio
        // vía LAST_VISITED_MENU_UUID — nunca queda atascado.
        onPressed: () {
          final navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          } else {
            di<AppRouter>().goBackToLastRoute();
          }
        },
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
        // F3a: invitar a la mesa (código corto) — mientras la orden esté OPEN.
        if (order != null && order.isOpen)
          IconButton(
            icon: const Icon(Icons.person_add_alt_1_rounded, color: Colors.white),
            tooltip: S.current.groupOrderInviteCta,
            onPressed: () => _onInvite(context),
          ),
        if (canTransfer || canUnlock || canDelete || canLeave)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'transfer':
                  _onTransferHost(context, order, vm.myParticipantUuid);
                case 'unlock':
                  _onUnlock(context);
                case 'delete':
                  _onDelete(context);
                case 'leave':
                  _onLeave(context);
              }
            },
            itemBuilder: (_) => [
              if (canTransfer)
                PopupMenuItem(value: 'transfer', child: Text(S.current.groupOrderTransferHost)),
              if (canUnlock)
                PopupMenuItem(value: 'unlock', child: Text(S.current.groupOrderUnlockCta)),
              // Acciones de salida en rojo, al final del menú (destructivas).
              if (canDelete)
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.delete_outline_rounded, size: 18, color: Colors.redAccent),
                      const SizedBox(width: 8),
                      Text(S.current.groupOrderDeleteCta,
                          style: const TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
              if (canLeave)
                PopupMenuItem(
                  value: 'leave',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.logout_rounded, size: 18, color: Colors.redAccent),
                      const SizedBox(width: 8),
                      Text(S.current.groupOrderLeaveCta,
                          style: const TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
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
          // Pull-to-refresh (audit): re-consulta la orden a demanda — red
          // de seguridad si el socket/polling se perdió algún evento.
          child: RefreshIndicator(
            color: FoodlyThemes.primaryFoodly,
            onRefresh: () => context.read<GroupOrderCubit>().refetch(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                  // F2c: misma regla que el borrado (OPEN + dueño/host), y solo
                  // con VARIOS participantes — compartir "con la mesa" no
                  // significa nada si estás solo (feedback e2e 2026-07-31).
                  onToggleSharedItem: (_canRemoveItemsOf(p) && !isBusy && order.participants.length > 1)
                      ? (item) => context.read<GroupOrderCubit>().setItemShared(item.uuid, !item.shared)
                      : null,
                  onCover: (_canCover(p) && !isBusy) ? () => onCover(p) : null,
                  paidByName: _paidByNameFor(p),
                ),
              ),
              ],
            ),
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
