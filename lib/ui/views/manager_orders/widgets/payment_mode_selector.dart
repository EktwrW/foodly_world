import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// F4b-2 — "¿Cómo cobra tu negocio?" (maqueta D1 aprobada): elección
/// EXPLÍCITA del dueño, sin default por categoría. Aparece al activar pagos
/// y vive como setting editable en el panel.
///
/// Widget PURO: recibe el modo actual y devuelve el elegido — el caller
/// decide si es onboarding (diálogo) o edición (bottom sheet).
/// Lo que el dueño decidió: cómo cobra y, opcionalmente, desde qué monto
/// acepta pagos en la app. [minMinor] en céntimos; null = sin mínimo.
typedef PaymentSettings = ({GroupPaymentMode mode, int? minMinor});

class PaymentModeSelector extends StatefulWidget {
  final GroupPaymentMode? initial;

  /// Mínimo actual en céntimos, para abrir con el valor puesto. null = sin mínimo.
  final int? initialMinMinor;
  final ValueChanged<PaymentSettings> onConfirm;

  const PaymentModeSelector({
    super.key,
    this.initial,
    this.initialMinMinor,
    required this.onConfirm,
  });

  /// Abre el selector como diálogo Foodly y devuelve el modo elegido (o null
  /// si el dueño lo cerró sin decidir).
  static Future<PaymentSettings?> show(
    BuildContext context, {
    GroupPaymentMode? initial,
    int? initialMinMinor,
  }) {
    return showDialog<PaymentSettings>(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.all(UIDimens.SCREEN_PADDING_MOB),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 16),
          child: PaymentModeSelector(
            initial: initial,
            initialMinMinor: initialMinMinor,
            onConfirm: (settings) => Navigator.pop(ctx, settings),
          ),
        ),
      ),
    );
  }

  @override
  State<PaymentModeSelector> createState() => _PaymentModeSelectorState();
}

class _PaymentModeSelectorState extends State<PaymentModeSelector> {
  /// Montos que cubren casi todos los casos reales (Portugal: 5 o 10). El
  /// campo libre existe para el resto, no al revés: obligar a teclear un
  /// importe que el 90% resuelve con un toque es fricción pura.
  static const _presets = [500, 1000, 1500];

  GroupPaymentMode? _selected;
  bool _minEnabled = false;
  int? _minMinor;
  bool _custom = false;
  late final TextEditingController _customCtrl;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
    _minMinor = widget.initialMinMinor;
    _minEnabled = _minMinor != null;
    // Un mínimo que no es preset abre directo en "Otro", con su valor puesto.
    _custom = _minMinor != null && !_presets.contains(_minMinor);
    _customCtrl = TextEditingController(
      text: _custom ? (_minMinor! / 100).toStringAsFixed(2).replaceAll('.', ',') : '',
    );
  }

  @override
  void dispose() {
    _customCtrl.dispose();
    super.dispose();
  }

  /// "7,5" y "7.50" son lo mismo para quien escribe. Devuelve céntimos, o null
  /// si lo tecleado todavía no es un importe utilizable.
  int? _parseCustom(String raw) {
    final v = double.tryParse(raw.trim().replaceAll(',', '.'));
    if (v == null) return null;
    final minor = (v * 100).round();
    // Mismo piso que valida el backend: por debajo de 0,50 € no hay pago
    // posible ni con MB WAY ni con Bizum, así que un mínimo menor es inútil.
    return minor < 50 ? null : minor;
  }

  String _fmt(int minor) => '${(minor / 100).toStringAsFixed(2).replaceAll('.', ',')} €';

  bool get _minReady => !_minEnabled || _minMinor != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.paymentModeTitle,
          style: FoodlyTextStyles.sectionsTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          S.current.paymentModeSubtitle,
          style: FoodlyTextStyles.caption,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        _ModeCard(
          mode: GroupPaymentMode.openTab,
          icon: Icons.restaurant_rounded,
          title: S.current.paymentModeOpenTabTitle,
          body: S.current.paymentModeOpenTabBody,
          flow: S.current.paymentModeOpenTabFlow,
          selected: _selected == GroupPaymentMode.openTab,
          onTap: () => setState(() => _selected = GroupPaymentMode.openTab),
        ),
        const SizedBox(height: 10),
        _ModeCard(
          mode: GroupPaymentMode.perRound,
          icon: Icons.bolt_rounded,
          title: S.current.paymentModePerRoundTitle,
          body: S.current.paymentModePerRoundBody,
          flow: S.current.paymentModePerRoundFlow,
          selected: _selected == GroupPaymentMode.perRound,
          onTap: () => setState(() => _selected = GroupPaymentMode.perRound),
        ),
        const SizedBox(height: 16),
        _MinimumSection(
          enabled: _minEnabled,
          minMinor: _minMinor,
          custom: _custom,
          customCtrl: _customCtrl,
          presets: _presets,
          format: _fmt,
          onToggle: (on) => setState(() {
            _minEnabled = on;
            // Apagarlo limpia el monto: si no, volver a encenderlo resucitaría
            // en silencio un valor que el dueño ya había descartado.
            if (!on) {
              _minMinor = null;
              _custom = false;
              _customCtrl.clear();
            }
          }),
          onPreset: (minor) => setState(() {
            _custom = false;
            _minMinor = minor;
          }),
          onCustomTap: () => setState(() {
            _custom = true;
            _minMinor = _parseCustom(_customCtrl.text);
          }),
          onCustomChanged: (raw) => setState(() => _minMinor = _parseCustom(raw)),
        ),
        const SizedBox(height: 16),
        CustomNeumorphicButton(
          text: S.current.confirm,
          disabled: _selected == null || !_minReady,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(12),
          onPressed: _selected == null || !_minReady
              ? null
              : () => widget.onConfirm((mode: _selected!, minMinor: _minEnabled ? _minMinor : null)),
        ),
      ],
    );
  }
}

/// Tarjeta de opción con radio (maqueta D1): lenguaje de dueño de negocio,
/// no de developer — el chip resume el flujo real de la mesa.
class _ModeCard extends StatelessWidget {
  final GroupPaymentMode mode;
  final IconData icon;
  final String title;
  final String body;
  final String flow;
  final bool selected;
  final VoidCallback onTap;

  const _ModeCard({
    required this.mode,
    required this.icon,
    required this.title,
    required this.body,
    required this.flow,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: FoodlyThemes.primaryFoodly),
                const SizedBox(width: 8),
                Expanded(child: Text(title, style: FoodlyTextStyles.labelPurpleBold)),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              color: FoodlyThemes.primaryFoodly,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(body, style: FoodlyTextStyles.caption.copyWith(fontSize: 11.5)),
            const SizedBox(height: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                flow,
                style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// El mínimo para pagar en la app, como bloque SECUNDARIO bajo las dos
/// tarjetas de modo: no es un tercer modo y no debe competir con la decisión
/// principal.
///
/// Divulgación progresiva: apagado —el estado por defecto de todo negocio— son
/// una línea y ninguna decisión. El detalle aparece solo si se enciende.
class _MinimumSection extends StatelessWidget {
  const _MinimumSection({
    required this.enabled,
    required this.minMinor,
    required this.custom,
    required this.customCtrl,
    required this.presets,
    required this.format,
    required this.onToggle,
    required this.onPreset,
    required this.onCustomTap,
    required this.onCustomChanged,
  });

  final bool enabled;
  final int? minMinor;
  final bool custom;
  final TextEditingController customCtrl;
  final List<int> presets;
  final String Function(int minor) format;
  final ValueChanged<bool> onToggle;
  final ValueChanged<int> onPreset;
  final VoidCallback onCustomTap;
  final ValueChanged<String> onCustomChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 26, color: FoodlyThemes.primaryFoodly.withValues(alpha: .12)),
        Row(
          spacing: 14,
          children: [
            ui.NeumorphicSwitch(
              value: enabled,
              duration: Durations.medium2,
              curve: Curves.decelerate,
              onChanged: onToggle,
              height: 28,
              style: ui.NeumorphicSwitchStyle(
                activeTrackColor: FoodlyThemes.primaryFoodly.withValues(alpha: .73),
                inactiveTrackColor: Colors.black12,
                activeThumbColor: FoodlyThemes.success,
                inactiveThumbColor: FoodlyThemes.secondaryFoodly,
                thumbShape: ui.NeumorphicShape.convex,
                lightSource: ui.LightSource.topRight,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.current.paymentModeMinTitle, style: FoodlyTextStyles.actionsBody),
                  if (!enabled) ...[
                    const SizedBox(height: 2),
                    Text(S.current.paymentModeMinOff, style: FoodlyTextStyles.caption),
                  ],
                ],
              ),
            ),
          ],
        ),
        // Sin `enabled` no se dibuja nada: el diálogo queda como estaba y el
        // dueño que no necesita mínimo no paga ninguna complejidad.
        if (enabled) ...[
          const SizedBox(height: 12),
          Row(
            spacing: 6,
            children: [
              for (final p in presets)
                Expanded(child: _Chip(label: format(p), selected: !custom && minMinor == p, onTap: () => onPreset(p))),
              Expanded(child: _Chip(label: S.current.paymentModeMinCustom, selected: custom, onTap: onCustomTap)),
            ],
          ),
          if (custom) ...[
            const SizedBox(height: 8),
            TextField(
              controller: customCtrl,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
              onChanged: onCustomChanged,
              decoration: const InputDecoration(suffixText: '€', isDense: true),
            ),
          ],
          const SizedBox(height: 10),
          // La CONSECUENCIA, no el ajuste: "mínimo 5 €" solo repite lo que
          // acaba de tocar; esto le dice qué va a pasar en su mesa.
          Text(
            minMinor == null
                ? S.current.paymentModeMinPrompt
                : S.current.paymentModeMinConsequence(format(minMinor!)),
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption.copyWith(
              color: minMinor == null ? FoodlyThemes.error : null,
            ),
          ),
        ],
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected ? FoodlyThemes.primaryFoodly : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: selected ? 1 : .25)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.caption.copyWith(
            color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
          ),
        ),
      ),
    );
  }
}
