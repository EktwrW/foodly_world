import 'package:animate_do/animate_do.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

enum SnackBarType { success, info, warning, error, action }

class SnackBarWdg {
  final VoidCallback? onPressed;
  final Widget content;
  final SnackBarType type;
  final String? buttonText;
  final Duration? duration;
  final double topBtnPadding;
  final Widget Function(VoidCallback handleDismiss)? buttonBuilder;
  final VoidCallback? onDismiss;

  /// Pisa el icono que le tocaría al [type]. Para avisos con identidad
  /// propia —invitar a la mesa, por ejemplo— donde el ícono ES el mensaje.
  /// null = el del tipo, que es lo que hacían todos hasta ahora.
  final IconData? icon;

  const SnackBarWdg({
    required this.content,
    this.onPressed,
    this.type = SnackBarType.info,
    this.buttonText,
    this.duration,
    this.topBtnPadding = 10,
    this.buttonBuilder,
    this.onDismiss,
    this.icon,
  });

  Color get _getColor => switch (type) {
        SnackBarType.success => FoodlyThemes.tertiaryFoodly,
        SnackBarType.error => FoodlyThemes.error,
        SnackBarType.warning => FoodlyThemes.warning,
        _ => FoodlyThemes.primaryFoodly,
      };

  IconData get _getIcon =>
      icon ??
      switch (type) {
        SnackBarType.success => FontAwesome.circle_check_solid,
        SnackBarType.error => Clarity.error_line,
        SnackBarType.warning => Clarity.warning_standard_solid,
        _ => Bootstrap.info_circle_fill,
      };

  String get _buttonText => buttonText ?? S.current.close;

  SnackBar getSnackBar(BuildContext context) {
    late AnimationController fadeOutController;

    // El messenger se resuelve ACÁ, con el contexto todavía vivo, y NO después
    // del `await` de abajo.
    //
    // Antes esto hacía `ScaffoldMessenger.of(context)` tras esperar 446 ms de
    // animación, detrás de un `if (context.mounted)`. Y el contexto que llega
    // acá suele ser el del widget que MOSTRÓ el aviso, que perfectamente puede
    // haberse desmontado mientras tanto: el botón del FAB del menú, por
    // ejemplo, se desmonta a sí mismo (`_closeFAB()`) en el mismo `onPressed`
    // en el que muestra el aviso.
    //
    // Cuando eso pasaba, el `hide` NO se llamaba nunca y el snackbar se quedaba
    // montado, invisible tras la animación de salida, **comiéndose los taps**
    // hasta agotar su duración. Medido en el dispositivo: pulsar «cerrar» a los
    // 1301 ms y el chip de la orden sin responder hasta los 8153 ms — o sea los
    // 7 s de duración cumpliéndose enteros. El síntoma que lo delató es que
    // cerrarlo ARRASTRÁNDOLO sí funcionaba: eso lo retira Flutter y no pasa por
    // acá.
    //
    // `ScaffoldMessengerState` vive en la raíz de la app, así que sobrevive a
    // cualquier pantalla; el `mounted` sólo cubre el desmontaje de la app.
    final messenger = ScaffoldMessenger.of(context);

    void handleDismiss() async {
      await fadeOutController.forward();
      if (messenger.mounted) {
        messenger.hideCurrentSnackBar();
        onDismiss?.call();
      }
    }

    return SnackBar(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      shape: UIDecorations.SNACKBAR_ROUNDED_BORDER,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: FadeInUp(
        duration: Durations.long4,
        curve: Curves.easeOutCubic,
        child: FadeOutDown(
          controller: (controller) => fadeOutController = controller,
          manualTrigger: true,
          duration: Durations.long1,
          curve: Curves.easeOutCubic,
          child: Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: UIDecorations.SNACKBAR_ROUNDED_BORDER.borderRadius,
                  color: _getColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: .5,
                      blurRadius: 6,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: UIDecorations.SNACKBAR_ROUNDED_BORDER.borderRadius,
                    color: ui.NeumorphicColors.background,
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB, vertical: 20),
                  child: Builder(builder: (ctx) {
                    final mq = MediaQuery.of(ctx);

                    // Techo de altura para la tarjeta. Sin esto, un contenido
                    // alto -el formulario de reserva- crece hasta pasarse de la
                    // pantalla y empuja el boton de accion fuera del viewport,
                    // donde no se puede tocar. Apple lo rechazo por eso el
                    // 2026-09-04 (Guideline 4), revisando en un iPad Air: una
                    // app solo-iPhone corre ahi en modo compatibilidad, y ese
                    // viewport es MAS BAJO que el de los iPhone altos para los
                    // que se ajusto el layout. No es un bug de iPad: pasa igual
                    // en un iPhone SE, con texto grande accesible o con el
                    // teclado abierto.
                    // Sin `clamp`: `num.clamp` devuelve `num`, no `double`,
                    // y `BoxConstraints.maxHeight` exige `double`.
                    final available = mq.size.height - mq.padding.top - mq.padding.bottom - mq.viewInsets.bottom - 96;
                    final maxCardHeight = available < 240 ? 240.0 : available;

                    return ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: maxCardHeight),
                      child: Column(
                        // `min` es obligatorio junto al techo de arriba: con `max`
                        // cualquier aviso corto se estiraria hasta ocupar la
                        // pantalla entera.
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            // `action` no lleva icono por diseño, pero pedir uno
                            // explícito es decir "este sí" — si no, el parámetro
                            // se ignoraría en silencio justo donde más se usa.
                            visible: type != SnackBarType.action || icon != null,
                            child: Icon(_getIcon, size: 34, color: _getColor),
                          ),
                          // El contenido scrollea; el boton queda FUERA del
                          // scroll para que siempre este visible y alcanzable.
                          Flexible(
                            child: SingleChildScrollView(
                              child: content.paddingSymmetric(vertical: 20),
                            ),
                          ),
                          (buttonBuilder?.call(handleDismiss) ??
                                  SizedBox(
                                    height: 46,
                                    child: ui.NeumorphicButton(
                                      onPressed: () {
                                        if (onPressed != null) onPressed!();
                                        handleDismiss();
                                      },
                                      style: ui.NeumorphicStyle(
                                        shape: ui.NeumorphicShape.convex,
                                        boxShape: ui.NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                                        depth: 3,
                                        lightSource: ui.LightSource.topRight,
                                        intensity: 1.2,
                                        surfaceIntensity: .3,
                                        color: ui.NeumorphicColors.embossMaxWhiteColor,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ClayText(
                                            _buttonText,
                                            color: FoodlyThemes.primaryFoodly,
                                            spread: 0,
                                            style: FoodlyTextStyles.snackBarPrimaryButton,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .paddingOnly(bottom: 5, top: topBtnPadding),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ui.NeumorphicColors.background,
                  ),
                  margin: const EdgeInsets.only(top: 8),
                ),
              ),
            ],
          ),
        ),
      ),
      duration: duration ?? const Duration(days: 1),
    );
  }
}
