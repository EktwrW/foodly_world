import 'package:flutter/widgets.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';

/// El equivalente de [ContentColumn] para pantallas hechas de slivers.
///
/// POR QUE EXISTE (2026-09-12). `ContentColumn` es un widget de caja: dentro de
/// un `CustomScrollView` no encaja sin meter el contenido en un
/// `SliverToBoxAdapter`, y eso pinta de golpe lo que el sliver pintaba a
/// demanda. Las fichas de negocio son largas —direccion, horarios, servicios,
/// reseñas—, asi que perder esa pereza se nota.
///
/// En vez de envolver, acota **por el padding**: calcula cuanto sobra por
/// encima del techo y lo reparte a los dos lados. El sliver sigue siendo un
/// sliver.
///
/// Debajo del techo devuelve [minimo] tal cual, asi que en telefono es
/// exactamente el `SliverPadding` de siempre. Eso lo fija
/// `paridad_en_telefono_test.dart`.
///
/// Para lo que NO sirve: portadas y cabeceras a sangre —un
/// `SliverAppBar` con imagen— que deben ocupar todo el ancho. Esas van fuera.
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
