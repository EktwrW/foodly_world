import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/foodly_group_dialogs.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Punto de entrada al feature de orden grupal, anclado al pie del menú.
///
/// - Sin orden activa: CTA "Ordenar en grupo" que inicia la orden (requiere
///   sesión; en modo invitado abre el guest-gate).
/// - Con orden activa para ESTE negocio: barra "Ver pedido · N · €X" que
///   navega a la GroupOrderPage, donde el host cierra (lock) y todos pagan.
///
/// Reacciona al [ActiveGroupOrderCubit] (singleton DI), el "carrito de grupo"
/// que también alimenta el botón "+" de cada ítem del menú.
class GroupOrderEntryButton extends StatefulWidget {
  final String businessUuid;
  const GroupOrderEntryButton({super.key, required this.businessUuid});

  @override
  State<GroupOrderEntryButton> createState() => _GroupOrderEntryButtonState();
}

class _GroupOrderEntryButtonState extends State<GroupOrderEntryButton> {
  String get businessUuid => widget.businessUuid;

  @override
  void initState() {
    super.initState();
    // Bug e2e 2026-07-31: adopta la orden activa del servidor para este
    // negocio (mismo usuario en otro dispositivo) antes de ofrecer "crear".
    di<ActiveGroupOrderCubit>().syncForBusiness(businessUuid);
  }

  /// F3a: unirse a la orden de otro. La vía PRINCIPAL es escanear el QR de
  /// la mesa (filosofía Foodly: cero fricción); tipear el código corto queda
  /// como fallback. Si el join funciona, la orden ajena se vuelve el carrito
  /// activo y navegamos a ella.
  Future<void> _openJoinFlow(BuildContext context, ActiveGroupOrderCubit cubit) async {
    var handled = false;

    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.72,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
                child: Text(S.current.groupOrderScanTitle,
                    style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(S.current.groupOrderScanHint, style: FoodlyTextStyles.caption, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: MobileScanner(
                      onDetect: (capture) {
                        if (handled) return;
                        final raw = capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue;
                        if (raw == null) return;
                        // Acepta la URL de invitación (App Link), el
                        // payload legacy FOODLY-GO: o un código pelado.
                        String? code;
                        if (raw.contains('/join/')) {
                          code = raw.split('/join/').last.split(RegExp(r'[/?#]')).first;
                        } else if (raw.startsWith(kGroupOrderInvitePrefix)) {
                          code = raw.substring(kGroupOrderInvitePrefix.length);
                        } else if (raw.length == 6) {
                          code = raw;
                        }
                        code = (code != null && code.length == 6) ? code : null;
                        if (code == null) return;
                        handled = true;
                        Navigator.pop(ctx, code);
                      },
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, '__manual__'),
                child: Text(S.current.groupOrderEnterCodeManually, style: FoodlyTextStyles.captionPurpleBold),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
    if (result == null || !context.mounted) return;

    final code = result == '__manual__' ? await _askJoinCode(context) : result;
    if (code == null || code.trim().isEmpty || !context.mounted) return;

    await _handleJoin(context, cubit, code);
  }

  /// Fallback: tipear el código (QR dañado, luz, o futura web sin cámara).
  /// Dialog Foodly (shell compartido) con el campo en el estilo del código
  /// del sheet de invitación (mayúsculas, espaciado ancho, morado).
  Future<String?> _askJoinCode(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => FoodlyDialogShell(
        title: S.current.groupOrderJoinTitle,
        actions: [
          CustomNeumorphicButton(
            text: S.current.confirm,
            disabled: false,
            margin: EdgeInsets.zero,
            onPressed: () => Navigator.pop(ctx, controller.text),
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
          textCapitalization: TextCapitalization.characters,
          maxLength: 6,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 8,
            color: FoodlyThemes.primaryFoodly,
          ),
          decoration: InputDecoration(
            hintText: S.current.groupOrderJoinHint,
            hintStyle: FoodlyTextStyles.caption,
            counterText: '',
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
  }

  Future<void> _handleJoin(
    BuildContext context,
    ActiveGroupOrderCubit cubit,
    String code,
  ) async {
    final ok = await cubit.joinWithCode(code);
    if (!context.mounted) return;

    if (ok && cubit.state != null) {
      // UX (e2e r4): tras unirse se aterriza en el MENÚ para agregar ítems.
      // Si la orden es de ESTE negocio ya estamos en su menú (la barra pasa
      // a "Ver pedido" sola); si es de otro, navegamos a su menú — con el
      // uuid del MENÚ (business_menu_uuid), que es lo que lleva la ruta.
      final order = cubit.state!;
      final menuUuid = order.businessMenuUuid;
      if (order.businessUuid != businessUuid && menuUuid != null && menuUuid.isNotEmpty) {
        context.goNamed(
          AppRoutes.visitMenu.name,
          pathParameters: {AppRoutes.routeIdParam: menuUuid},
          queryParameters: {if (order.businessUuid?.isNotEmpty ?? false) 'b': order.businessUuid!},
        );
      }
    } else {
      // e2e r5: mostrar la causa real del backend cuando existe.
      FoodlySnackbars.errorGeneric(context, cubit.lastJoinError ?? S.current.groupOrderJoinFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = di<ActiveGroupOrderCubit>();
    return BlocBuilder<ActiveGroupOrderCubit, GroupOrderDM?>(
      bloc: cubit,
      builder: (context, order) {
        final active = order != null && order.businessUuid == businessUuid;

        if (!active) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomNeumorphicButton(
                text: S.current.groupOrderEntryCta,
                disabled: false,
                leading: const Icon(Icons.groups_rounded, color: Colors.white, size: 20),
                onPressed: () {
                  // Crear una orden grupal requiere cuenta (App Store 5.1.1.v).
                  if (!GuestGuard.requireAuth(GuestGateAction.groupOrder)) return;
                  cubit.startForBusiness(businessUuid);
                },
              ),
              // F3a: unirse a la orden de otro con el código de invitación.
              TextButton.icon(
                onPressed: () {
                  if (!GuestGuard.requireAuth(GuestGateAction.groupOrder)) return;
                  _openJoinFlow(context, cubit);
                },
                icon: const Icon(Icons.qr_code_scanner_rounded, size: 16),
                label: Text(S.current.groupOrderJoinCta, style: FoodlyTextStyles.captionPurpleBold),
              ),
            ],
          );
        }

        final count = order.items.fold<int>(0, (acc, i) => acc + i.quantity);
        final label = count == 0
            ? S.current.groupOrderAddFromMenu
            : '${S.current.groupOrderViewOrder} · $count · ${formatMoney(order.subtotal, order.currency)}';

        return CustomNeumorphicButton(
          text: label,
          disabled: false,
          leading: const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 20),
          onPressed: () => context.pushNamed(
            AppRoutes.groupOrder.name,
            pathParameters: {AppRoutes.routeIdParam: order.uuid},
          ),
        );
      },
    );
  }
}
