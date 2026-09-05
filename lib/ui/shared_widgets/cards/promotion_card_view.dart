import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/blocs/favorites_cubit/favorites_cubit.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/glass/foodly_glass.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/share_promotion_helper.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

/// La card grande de una promoción.
///
/// Se ve en tres sitios: la pantalla de Promos de un negocio en modo visita,
/// la misma pantalla en modo dueño, y el sheet de detalle que abre el
/// carrusel de la home. Antes había DOS copias del archivo —
/// `visited_business/.../promotion_card.dart` y
/// `business/.../manage_promotion_card.dart` — idénticas salvo el control de
/// arriba a la derecha. Acá está la card una sola vez y esas dos siguen
/// existiendo como envoltorio, porque son `part` de sus páginas y el nombre
/// `PromotionCard` se usa desde fuera.
///
/// REDISEÑO 2026-09-04 (propuesta A). El contenido es exactamente el mismo
/// de antes — título, subtítulo con megáfono, descripción, fecha de inicio,
/// fecha de fin, días, favorito, compartir y expandir imagen — y lo que
/// cambia es la composición:
///
///  * el título sube a una cinta de vidrio montada sobre el borde de la
///    foto, así que el gancho queda encima de la comida en vez de en blanco
///    debajo de ella;
///  * expandir la imagen era un tap invisible sobre la foto y ahora es un
///    botón; los dos controles flotantes pasan de 28 px a 44;
///  * las dos columnas de fecha se convierten en un riel único;
///  * los días pasan de un `Wrap` que envolvía a una fila fija de siete;
///  * compartir pasa de un círculo gris de 38 px al pie a una barra con
///    etiqueta.
///
/// La foto mantiene `AspectRatio(16 / 9)`: no cambia ni el asset ni el
/// encuadre de ninguna promo ya publicada. La variante en 4:5 quedó
/// documentada aparte para más adelante.
class PromotionCardView extends StatefulWidget {
  final PromotionDM promo;

  /// Lo que va arriba a la derecha de la foto: el corazón en modo visita, el
  /// menú de editar/borrar en modo dueño. Es lo único que cambia entre las
  /// dos pantallas.
  final Widget trailingAction;

  final EdgeInsetsGeometry? margin;

  /// El modo dueño dibuja el placeholder sin escalar. Se mantiene porque
  /// venía así de `manage_promotion_card.dart`.
  final BoxFit placeholderFit;

  const PromotionCardView({
    super.key,
    required this.promo,
    required this.trailingAction,
    this.margin,
    this.placeholderFit = BoxFit.contain,
  });

  @override
  State<PromotionCardView> createState() => _PromotionCardViewState();
}

/// Cuánto baja la cinta de vidrio por debajo de la foto.
///
/// Es fijo a propósito: la cinta se ancla con `bottom: -_ribbonOverflow`, así
/// que sobresale siempre esta cantidad exacta sin importar cuánto ocupen el
/// título y el subtítulo. Por eso el cuerpo puede reservar arriba
/// `_ribbonOverflow + 16` y el hueco bajo la cinta es siempre de 16.
const double _ribbonOverflow = 30;

const double _cardRadius = 24;

class _PromotionCardViewState extends State<PromotionCardView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final promo = widget.promo;

    return Container(
      margin: widget.margin ?? const EdgeInsets.only(left: 12, right: 12, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_cardRadius),
        boxShadow: UIDecorations.CARD_SHADOW,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _MediaWithRibbon(
            promo: promo,
            trailingAction: widget.trailingAction,
            placeholderFit: widget.placeholderFit,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              UIDimens.SCREEN_PADDING_MOB,
              _ribbonOverflow + 16,
              UIDimens.SCREEN_PADDING_MOB,
              18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  promo.description,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.cardDescription,
                ),
                const SizedBox(height: 20),
                _ValidityRail(promo: promo),
                if (promo.promoDays.hasAnyDay) ...[
                  const SizedBox(height: 18),
                  _DaysRow(days: promo.promoDays),
                ],
                const SizedBox(height: 20),
                _ShareBar(promo: promo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// El corazón de favoritos de una promo, sobre el vidrio de la foto.
///
/// DOS INTENTOS, DOS PROBLEMAS DISTINTOS (2026-09-04, los dos vistos en el
/// simulador y ninguno en los tests).
///
/// El primero: vidrio CIRUELA con el fondo propio del botón apagado. El
/// corazón guardado se pinta con `FoodlyThemes.favourites`, que es ese mismo
/// ciruela, así que guardada quedaba ciruela sobre ciruela — una mancha sin
/// forma.
///
/// El segundo: devolverle su fondo al botón. Se leía bien, pero
/// `UIFavoriteWidget` dibuja ese fondo como un CÍRCULO y el vidrio es un
/// cuadrado redondeado: guardada aparecía un círculo blanco metido en un
/// squircle, con las esquinas del vidrio asomando, y al lado del botón de
/// ampliar —que sí es un squircle limpio— se veía descuadrado.
///
/// Lo que funciona es que el estado lo cuente EL VIDRIO, que ya tiene la
/// forma correcta: oscuro cuando no está guardada, claro cuando sí, con el
/// corazón blanco o ciruela encima. Misma silueta en los dos estados, y el
/// color de marca sigue marcando el guardado.
///
/// Por eso hay un `BlocBuilder` acá aunque `FavoriteButton` ya tenga el suyo:
/// el tono del vidrio se decide fuera del botón, así que hace falta el estado
/// antes de construirlo.
class PromoFavoriteButton extends StatelessWidget {
  final PromotionDM promo;

  /// La `Key` del corazón en sí. Va aparte de la del botón porque las
  /// pantallas la usan para distinguir instancias de la misma promo.
  final Key? favoriteKey;

  const PromoFavoriteButton({super.key, required this.promo, this.favoriteKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) => _isSaved(previous) != _isSaved(current),
      builder: (context, state) => PromoFavoriteGlass(
        saved: _isSaved(state),
        child: FavoriteButton.forPromotion(
          key: favoriteKey,
          promotion: promo,
          diameter: 44,
          enableBackground: false,
        ),
      ),
    );
  }

  bool _isSaved(FavoritesState state) =>
      state.maybeWhen(loaded: (vm) => vm.savedPromotionIds.contains(promo.uuid), orElse: () => false);
}

/// El vidrio del corazón: claro cuando la promo está guardada, oscuro cuando
/// no. Ver [PromoFavoriteButton] para el porqué.
///
/// Existe aparte porque el carrusel de la home no puede usar
/// [PromoFavoriteButton]: su modelo es `NearbyPromotionDM` y trae el estado
/// en `isFavorited`, sin pasar por `FavoritesCubit`.
class PromoFavoriteGlass extends StatelessWidget {
  final bool saved;
  final Widget child;

  const PromoFavoriteGlass({super.key, required this.saved, required this.child});

  @override
  Widget build(BuildContext context) {
    return FoodlyGlassButton(
      tone: saved ? FoodlyGlassTone.light : FoodlyGlassTone.dark,
      child: child,
    );
  }
}

class _MediaWithRibbon extends StatelessWidget {
  final PromotionDM promo;
  final Widget trailingAction;
  final BoxFit placeholderFit;

  const _MediaWithRibbon({
    required this.promo,
    required this.trailingAction,
    required this.placeholderFit,
  });

  /// Oscurece los bordes de la foto para que el vidrio y los iconos blancos
  /// se despeguen de ella pase lo que pase con la imagen.
  static const _scrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x57180413), Color(0x00180413), Color(0x00180413), Color(0x85180413)],
    stops: [0, .34, .46, 1],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(_cardRadius)),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                promo.mediaFileUrl.isNotEmpty
                    ? PromoMedia(
                        externalUrl: promo.mediaLink ?? '',
                        promoMedia: promo.mediaFileIsExternalLink ? null : promo.promoMedia.first,
                        title: promo.title,
                      )
                    : Asset(FoodlyAssets.promoPlaceholder, fit: placeholderFit),
                const IgnorePointer(child: DecoratedBox(decoration: BoxDecoration(gradient: _scrim))),
              ],
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          right: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expandir solo tiene sentido con una imagen que exista: el
              // vídeo y el reproductor de YouTube traen su propia pantalla
              // completa, y sin URL el visor abriría en blanco.
              if (promo.mediaFileIsImage && promo.mediaFileUrl.isNotEmpty)
                FoodlyGlassButton(
                  icon: Bootstrap.arrows_fullscreen,
                  tooltip: S.current.expandImage,
                  onPressed: () => ImageViewer.open(context, [promo.mediaFileUrl]),
                )
              else
                const SizedBox.shrink(),
              trailingAction,
            ],
          ),
        ),
        Positioned(
          left: 14,
          right: 14,
          bottom: -_ribbonOverflow,
          child: FoodlyGlassPanel(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 15),
            shadows: const [
              BoxShadow(color: Color(0x80260419), blurRadius: 34, spreadRadius: -14, offset: Offset(0, 14)),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.promoTitleOnGlass,
                ),
                if (promo.subTitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(Bootstrap.megaphone_fill, size: 17, color: FoodlyThemes.tertiaryFoodly),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            promo.subTitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: FoodlyTextStyles.promoSubtitleOnGlass,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Inicio y fin de la promo en un solo bloque.
///
/// Antes eran dos columnas sueltas con la fecha de fin en
/// `FoodlyThemes.error`: rojo de alarma para un dato que no es un error. Acá
/// el inicio va en verde de marca, el fin en ciruela, y la barra entre los
/// dos es lo que dice "esto dura".
class _ValidityRail extends StatelessWidget {
  final PromotionDM promo;

  const _ValidityRail({required this.promo});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x0E79005D), Color(0x0579005D)],
        ),
        border: Border.all(color: const Color(0x1F79005D)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _RailEnd(
                icon: Bootstrap.calendar2_check,
                color: FoodlyThemes.tertiaryFoodly,
                date: promo.startDate,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 9, left: 6, right: 6),
              child: SizedBox(
                width: 28,
                height: 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: LinearGradient(colors: [Color(0x8C14C45D), Color(0x8C79005D)]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _RailEnd(
                icon: Bootstrap.calendar2_minus,
                color: FoodlyThemes.primaryFoodly,
                date: promo.expireDate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RailEnd extends StatelessWidget {
  final IconData icon;
  final Color color;
  final DateTime date;

  const _RailEnd({required this.icon, required this.color, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 5),
        Text(
          toBeginningOfSentenceCase(date.getStringFormat),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: FoodlyTextStyles.promoDate,
        ),
      ],
    );
  }
}

/// Los siete días en una fila fija.
///
/// `Expanded` en cada uno para que repartan el ancho disponible: con siete
/// pastillas iguales la fila no envuelve ni en las pantallas de 320 dp, que
/// es donde el `Wrap` anterior partía los chips en dos filas.
class _DaysRow extends StatelessWidget {
  final PromoDaysDM days;

  const _DaysRow({required this.days});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.current.valid.toUpperCase(), style: FoodlyTextStyles.promoSectionLabel),
        const SizedBox(height: 9),
        Row(
          spacing: 6,
          children: days.allDays.map((day) => Expanded(child: _DayPill(day: day))).toList(),
        ),
      ],
    );
  }
}

class _DayPill extends StatelessWidget {
  final ({String label, bool isActive}) day;

  const _DayPill({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: day.isActive ? FoodlyThemes.primaryFoodly : FoodlyThemes.promoDayOff,
        boxShadow: day.isActive
            ? const [BoxShadow(color: Color(0xD979005D), blurRadius: 10, spreadRadius: -5, offset: Offset(0, 4))]
            : null,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          day.label,
          style: day.isActive ? FoodlyTextStyles.captionWhiteBold : FoodlyTextStyles.promoDayOff,
        ),
      ),
    );
  }
}

/// Compartir es la única acción de conversión de la promo y estaba enterrada
/// en un círculo gris de 38 px al pie de la card, sin etiqueta.
class _ShareBar extends StatelessWidget {
  final PromotionDM promo;

  const _ShareBar({required this.promo});

  static const _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: _radius,
          gradient: UIDecorations.NEUMORPHIC_PURPLE_GRADIENT,
          boxShadow: [BoxShadow(color: Color(0xD979005D), blurRadius: 26, spreadRadius: -12, offset: Offset(0, 12))],
        ),
        child: InkWell(
          borderRadius: _radius,
          onTap: () => SharePromotionHelper.share(promo),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Bootstrap.send_fill, size: 19, color: Colors.white),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  S.current.sharePromotion,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.promoShareLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Resuelve el medio de la promo: enlace externo, vídeo propio o imagen.
///
/// Estaba duplicado palabra por palabra en las dos copias de la card.
class PromoMedia extends StatelessWidget {
  final String externalUrl;
  final PromoMediaDM? promoMedia;
  final String? title;

  const PromoMedia({
    super.key,
    required this.externalUrl,
    required this.promoMedia,
    this.title,
  });

  bool get _mustPlayExternalLink => externalUrl.isNotEmpty;
  bool get _mustPlayVideo => !_mustPlayExternalLink && (promoMedia?.isVideo ?? false);

  @override
  Widget build(BuildContext context) {
    if (_mustPlayExternalLink) {
      return YouTubeVideoPlayer(url: externalUrl, videoTitle: title);
    } else if (_mustPlayVideo) {
      return NetworkVideoPlayer(url: promoMedia?.mediaUrl ?? '');
    } else {
      return FeedMultipleImageView(imageUrls: [promoMedia?.mediaUrl ?? ''], radius: 8);
    }
  }
}
