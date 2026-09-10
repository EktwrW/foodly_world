import 'package:flutter/material.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';

/// Un [Dialog] con techo de ancho.
///
/// POR QUÉ EXISTE (2026-09-06). `Dialog` se dimensiona con su hijo, acotado
/// solo por el ancho de pantalla menos el `insetPadding`. Medido: 322 px en un
/// iPhone 16 Pro y **944 en un iPad de 1024**. Los 13 diálogos de Foodly están
/// escritos para el primer número, así que en tablet salían tarjetas de casi un
/// metro con dos botones perdidos en el medio.
///
/// Las hojas inferiores NO tienen este problema: Material 3 ya las acota a 640
/// por defecto (comprobado midiéndolas), así que no hay nada que hacer ahí.
///
/// Por debajo de [UIDimens.DIALOG_MAX_WIDTH] no hace nada, así que en teléfono
/// vertical es transparente: mismo diálogo de siempre.
class FoodlyDialog extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final EdgeInsets? insetPadding;
  final double? elevation;
  final Color? surfaceTintColor;

  const FoodlyDialog({
    super.key,
    required this.child,
    this.backgroundColor,
    this.shape,
    this.insetPadding,
    this.elevation,
    this.surfaceTintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: UIDimens.DIALOG_MAX_WIDTH),
        child: Dialog(
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          elevation: elevation,
          // `Dialog` usa `EdgeInsets.symmetric(horizontal: 40, vertical: 24)`
          // si esto es null; se respeta lo que pase cada sitio.
          insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: child,
        ),
      ),
    );
  }
}
