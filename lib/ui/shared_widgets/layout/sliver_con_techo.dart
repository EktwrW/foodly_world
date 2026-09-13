import 'package:flutter/widgets.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';

/// [ContentColumn] para pantallas de slivers: acota por el padding en vez de
/// envolver, asi el sliver sigue pintando a demanda. Las portadas a sangre van
/// fuera.
class SliverConTecho extends StatelessWidget {
  final Widget sliver;

  /// Techo de ancho del contenido. Por defecto [UIDimens.CONTENT_MAX_WIDTH].
  final double maxWidth;

  /// Padding lateral minimo, el que manda en telefono.
  final double minimo;

  /// Padding vertical, igual que en un `SliverPadding` normal.
  final double top;
  final double bottom;

  const SliverConTecho({
    super.key,
    required this.sliver,
    this.maxWidth = UIDimens.CONTENT_MAX_WIDTH,
    this.minimo = UIDimens.SCREEN_PADDING_MOB,
    this.top = 0,
    this.bottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.sizeOf(context).width;
    final sobra = (ancho - maxWidth) / 2;
    final lateral = sobra > minimo ? sobra : minimo;

    return SliverPadding(
      padding: EdgeInsets.only(left: lateral, right: lateral, top: top, bottom: bottom),
      sliver: sliver,
    );
  }
}
