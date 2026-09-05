import 'dart:ui' as dart_ui show ImageFilter;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/blocs/location/location_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart' show LoadingWidgetFoodlyIso, di;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/cards/promotion_card_view.dart'
    show PromoFavoriteButton, PromoFavoriteGlass, PromotionCardView;
import 'package:foodly_world/ui/shared_widgets/glass/foodly_glass.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_state.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, FontAwesome;
import 'package:video_player/video_player.dart';

class TopOffersWidget extends StatefulWidget {
  const TopOffersWidget({super.key});

  @override
  State<TopOffersWidget> createState() => _TopOffersWidgetState();
}

class _TopOffersWidgetState extends State<TopOffersWidget> {
  static final _carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    context.read<NearbyPromotionsCubit>().load();
  }

  void _onPageChanged(int index, List<NearbyPromotionDM> promotions, bool hasMore) {
    // Trigger loadMore when 3 items from the end
    if (hasMore && index >= promotions.length - 3) {
      context.read<NearbyPromotionsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, locationState) {
        final isCheckingLocation = locationState.maybeWhen(
          initial: () => true,
          checkingLocation: () => true,
          orElse: () => false,
        );

        return BlocBuilder<NearbyPromotionsCubit, NearbyPromotionsState>(
          builder: (context, state) {
            final vm = state.vm;
            final promotions = vm.promotions;

            // Show shimmer while location is resolving or while fetching data
            if (isCheckingLocation || (vm.isLoading && promotions.isEmpty)) {
              return const PromoCarouselShimmer();
            }

            // Error / empty state — keep the carousel height to avoid layout jump
            if (promotions.isEmpty) {
              return _EmptyOffersWidget(
                isError: vm.error != null,
                onRetry: () => context.read<NearbyPromotionsCubit>().load(),
              );
            }

            return CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                // `carousel_slider` le pasa esto al PageView, que por defecto
                // recorta (`Clip.hardEdge`) y cortaba en seco la sombra de la
                // card contra el borde de abajo. Darle hueco dentro del item no
                // alcanzaba: con blur 26 la sombra se desvanece a lo largo de
                // ~40 px y eso se comía la card. Lo que sobra fuera del viewport
                // es sombra, así que se deja salir.
                clipBehavior: Clip.none,
                viewportFraction: .83,
                enableInfiniteScroll: promotions.length > 2,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => _onPageChanged(index, promotions, vm.hasMore),
              ),
              items: promotions.map((p) => NearbyPromoCard(promo: p)).toList(),
            );
          },
        );
      },
    );
  }
}

/// La card de promo del carrusel de la home y de Promos guardadas.
///
/// REDISEÑO 2026-09-04 (propuesta A). Mismo contenido que antes — título,
/// negocio, valoración, favorito y expandir — con el lenguaje de vidrio de
/// la card grande: [FoodlyGlassPanel] para la cinta del título y
/// [FoodlyGlassButton] para los dos controles flotantes, que suben de 32 y
/// 34 px a 44. Expandir se va de dentro del panel a la esquina superior
/// izquierda, en el mismo sitio que en la card grande.
class NearbyPromoCard extends StatelessWidget {
  final NearbyPromotionDM promo;
  const NearbyPromoCard({super.key, required this.promo});

  static const _radius = BorderRadius.all(Radius.circular(20));

  /// Mismo degradado que la card grande: despega el vidrio y los iconos
  /// blancos de la foto, sea cual sea la foto.
  static const _scrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x5C180413), Color(0x00180413), Color(0x00180413), Color(0x80180413)],
    stops: [0, .30, .40, 1],
  );

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: _radius,
        boxShadow: [BoxShadow(color: Color(0x7A3B0A2C), blurRadius: 30, spreadRadius: -14, offset: Offset(0, 14))],
      ),
      child: ClipRRect(
        borderRadius: _radius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildMedia(),
            const IgnorePointer(child: DecoratedBox(decoration: BoxDecoration(gradient: _scrim))),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ViewPromoButton(promo: promo),
                  _NearbyFavoriteButton(promo: promo),
                ],
              ),
            ),
            Positioned(left: 10, right: 10, bottom: 10, child: _PromoRibbon(promo: promo)),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia() {
    // YouTube / external URL — show thumbnail in carousel, full player opens via detail sheet
    if (promo.mediaLink?.isNotEmpty == true) {
      return YoutubeThumbnailPreview(url: promo.mediaLink!);
    }

    // GCS video — play muted in carousel
    if (promo.promoMedia?.isVideo == true) {
      return NetworkVideoPlayer(url: promo.promoMedia!.mediaUrl);
    }

    // GCS image
    if (promo.promoMedia != null && promo.promoMedia!.mediaUrl.isNotEmpty) {
      return CachedNetworkImage(
          cacheManager: FoodlyImageCache.manager, imageUrl: promo.promoMedia!.mediaUrl, fit: BoxFit.cover);
    }

    return const ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Asset(FoodlyAssets.promoPlaceholder)),
          ],
        ),
      ),
    );
  }
}

/// El corazón de favoritos del carrusel.
///
/// EL HUECO (venía de antes del rediseño). Esta card usa `UIFavoriteWidget`
/// directo en vez del `FavoriteButton` compartido, porque su modelo es
/// `NearbyPromotionDM` y el estado viaja en `isFavorited`. Al saltarse el
/// botón compartido se saltaba también lo que ESE hace además de dibujar: la
/// animación al pasar a favorito y el aviso de "añadida"/"eliminada". Guardar
/// una promo desde la home no daba ninguna respuesta; la misma promo, desde la
/// vista completa, sí.
///
/// Acá se replica esa parte. Lo que no se replica es el toggle: sigue yendo
/// por `NearbyPromotionsCubit`, que actualiza la lista de forma optimista y
/// después sincroniza `FavoritesCubit`.
class _NearbyFavoriteButton extends StatefulWidget {
  final NearbyPromotionDM promo;

  const _NearbyFavoriteButton({required this.promo});

  @override
  State<_NearbyFavoriteButton> createState() => _NearbyFavoriteButtonState();
}

class _NearbyFavoriteButtonState extends State<_NearbyFavoriteButton> {
  /// Solo se anima al PASAR a favorito: ni al quitar, ni en el primer dibujo.
  /// Mismo criterio que `FavoriteButton`.
  bool _isFirstBuild = true;
  bool _wasFavorite = false;

  static const _avisoDuracion = Duration(seconds: 3);

  void _avisar({required bool agregado}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    agregado
        ? FoodlySnackbars.successGeneric(context, FavoriteItemType.promotion.addedToFavoritesText,
            duration: _avisoDuracion)
        : FoodlySnackbars.infoGeneric(context, FavoriteItemType.promotion.removedFromFavoritesText,
            duration: _avisoDuracion);
  }

  @override
  Widget build(BuildContext context) {
    final saved = widget.promo.isFavorited;
    final shouldAnimate = !_isFirstBuild && saved && !_wasFavorite;

    _wasFavorite = saved;
    _isFirstBuild = false;

    return PromoFavoriteGlass(
      saved: saved,
      child: UIFavoriteWidget(
        liked: saved,
        diameter: 44,
        enableBackground: false,
        shouldAnimate: shouldAnimate,
        addFavoriteIcon: FontAwesome.heart_circle_plus_solid,
        isFavoriteIcon: FontAwesome.heart_circle_check_solid,
        onPressed: () {
          // Modo invitado (5.1.1.v): guardar promos requiere cuenta. El gate va
          // acá explícito porque no pasamos por el FavoriteButton compartido.
          if (!GuestGuard.requireAuth(GuestGateAction.favorite)) return;

          context.read<NearbyPromotionsCubit>().toggleFavorite(widget.promo.uuid);
          _avisar(agregado: !saved);
        },
      ),
    );
  }
}

/// Abre el detalle completo de la promo.
///
/// El estado de carga vivía en un `bool` declarado dentro del `builder` de un
/// `LayoutBuilder` y manejado por un `StatefulBuilder`: se reiniciaba en cada
/// reconstrucción del padre. Al mover el botón fuera del panel, pasa a ser un
/// `State` de verdad.
class _ViewPromoButton extends StatefulWidget {
  final NearbyPromotionDM promo;

  const _ViewPromoButton({required this.promo});

  @override
  State<_ViewPromoButton> createState() => _ViewPromoButtonState();
}

class _ViewPromoButtonState extends State<_ViewPromoButton> {
  bool _isLoading = false;

  Future<void> _open() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    final result = await di<BusinessRepo>().getPromotionByUuid(widget.promo.uuid);
    if (!mounted) return;

    result.when(
      success: (promo) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black45,
        builder: (_) => _PromoDetailSheet(promoDM: promo),
      ),
      failure: (e) => FoodlySnackbars.errorGeneric(context, S.current.failedToLoadPromotionDetails),
    );

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyGlassButton(
      icon: Bootstrap.arrows_fullscreen,
      tooltip: S.current.viewPromotion,
      onPressed: _open,
      child: _isLoading
          ? const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          : null,
    );
  }
}

/// Cinta de vidrio con el título de la promo y el negocio que la publica.
class _PromoRibbon extends StatelessWidget {
  final NearbyPromotionDM promo;

  const _PromoRibbon({required this.promo});

  @override
  Widget build(BuildContext context) {
    return FoodlyGlassPanel(
      borderRadius: BorderRadius.circular(16),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 11),
      shadows: const [
        BoxShadow(color: Color(0x8C260419), blurRadius: 30, spreadRadius: -14, offset: Offset(0, 12)),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            promo.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.promoTitleOnGlass.copyWith(fontSize: 17, letterSpacing: -0.2, height: 1.18),
          ),
          const SizedBox(height: 8),
          Text(
            promo.businessName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.promoBusinessName,
          ),
          const SizedBox(height: 3),
          RatingBar.builder(
            initialRating: promo.ratingAvg,
            itemSize: 13,
            minRating: 1,
            allowHalfRating: true,
            ignoreGestures: true,
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 13),
            onRatingUpdate: (_) {},
          ),
        ],
      ),
    );
  }
}

/// Empty/error placeholder para `TopOffersWidget` cuando la lista de promos
/// cerca del usuario está vacía o falló la carga.
///
/// Diseño (refactor 2026-05-08): el placeholder anterior era un icono +
/// texto plano que daba sensación de "app vacía" y no enganchaba. La nueva
/// versión replica el shape exacto de la PromoCard real (borderRadius 20,
/// AspectRatio 16/9, cinta de vidrio encima con la misma receta que
/// `_PromoRibbon`) pero con un video
/// `assets/videos/promos.mp4` en loop muteado en lugar de la imagen de la
/// promo. Mensaje motivador encima del video ("Pronto, sabores cerca tuyo")
/// + botón Reintentar abajo. Sin controles de play/pause, sin heart, sin
/// business info — claramente un placeholder, pero visualmente continuo
/// con la card real para que cuando aparezcan promos reales la transición
/// no se sienta como un cambio de pantalla.
///
/// Por qué video en vez de imagen: el movimiento mantiene la atención del
/// usuario unos segundos extra (la métrica clave acá es "no se va de la
/// app cuando ve empty state"). Loop infinito asegura que aunque el user
/// se quede mirando, nunca aparezca un final muerto.
///
/// Por qué `VideoPlayer` puro y NO `FlickVideoPlayer` (como
/// `NetworkVideoPlayer` en `video_players.dart`): Flick siempre dibuja
/// controles (play/pause/progress bar) que acá serían distractores. El
/// widget bajo nivel `VideoPlayer` solo renderiza el video sin chrome.
class _EmptyOffersWidget extends StatefulWidget {
  final bool isError;
  final VoidCallback onRetry;

  const _EmptyOffersWidget({required this.isError, required this.onRetry});

  @override
  State<_EmptyOffersWidget> createState() => _EmptyOffersWidgetState();
}

class _EmptyOffersWidgetState extends State<_EmptyOffersWidget> {
  static const _videoAsset = 'assets/videos/promos.mp4';

  VideoPlayerController? _controller;
  bool _videoReady = false;
  bool _videoFailed = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    // CRÍTICO cuando hay 2+ VideoPlayer simultáneos en pantalla (este
    // placeholder + el de `NewReleasesCard` con `business.mp4`). Sin
    // `mixWithOthers: true` en el constructor, en iOS el plugin
    // configura `AVAudioSession` como exclusiva ("playback") durante
    // `initialize()` y el segundo controller que llama `.play()`
    // **pisa el primero**: solo uno reproduce, el otro queda congelado
    // en el primer frame. En Android es menos frecuente pero también
    // puede pasar con ExoPlayer si la audio focus se acapara.
    //
    // **El option va al constructor, NO post-init:** el método
    // `controller.setMixWithOthers(true)` existe pero llega tarde —
    // `initialize()` ya creó la AVAudioSession en modo exclusivo. La
    // forma confiable es pasar `VideoPlayerOptions(mixWithOthers: true)`
    // al constructor para que la session se cree directamente en modo
    // mixable. Aunque acá los videos están con `volume=0`, sigue siendo
    // necesario porque la sesión se reserva al `.play()`
    // independientemente del volumen.
    final controller = VideoPlayerController.asset(
      _videoAsset,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    try {
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      await controller.setLooping(true);
      await controller.setVolume(0);
      await controller.play();
      setState(() {
        _controller = controller;
        _videoReady = true;
      });
    } catch (_) {
      // Asset roto, codec no soportado en este device, o disposed mid-init.
      // Caemos a fallback visual sin video — el blur message y el retry
      // siguen funcionando.
      await controller.dispose();
      if (mounted) setState(() => _videoFailed = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.current;
    final title = widget.isError ? s.promosEmptyErrorTitle : s.promosEmptyTitle;
    final subtitle = widget.isError ? s.promosEmptyErrorSubtitle : s.promosEmptySubtitle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Card con video + blur backdrop overlay — mismo shape que `NearbyPromoCard`
        // para mantener continuidad visual cuando aparezcan promos reales.
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          color: ui.NeumorphicColors.decorationMaxWhiteColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _buildVideo(),
                ),
              ).paddingBottom(96),
              Column(
                spacing: 3,
                children: [
                  _BackdropEmptyMessage(title: title, subtitle: subtitle),
                  SizedBox(
                    width: 236,
                    child: CustomNeumorphicButton(
                      onPressed: widget.onRetry,
                      type: CustomNeumorphicBtnType.tertiary,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      text: s.retry,
                      leading: const Icon(Bootstrap.arrow_clockwise, size: 19, color: FoodlyThemes.primaryFoodly),
                      disabled: false,
                      fontSize: 12.3,
                      bosShapeRadius: 3.9,
                    ),
                  ),
                ],
              ).paddingBottom(11),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideo() {
    // Video listo → renderizar con BoxFit.cover (fill sin deformar).
    if (_videoReady && _controller != null) {
      return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      );
    }

    // Asset roto → fondo purple translúcido sutil. El blur message arriba
    // sigue siendo legible y el retry funciona igual.
    if (_videoFailed) {
      return ColoredBox(color: FoodlyThemes.primaryFoodly.withValues(alpha: .08));
    }

    // Inicializando (primeros ~100-300 ms tras mount). Loading iso oficial
    // para mantener el lenguaje visual del resto de la app.
    return ColoredBox(
      color: FoodlyThemes.primaryFoodly.withValues(alpha: .04),
      child: const Center(child: LoadingWidgetFoodlyIso(height: 46)),
    );
  }
}

/// Backdrop blur con título + subtítulo encima del video del placeholder.
///
/// Mismo `FoodlyGlassPanel` que `_PromoRibbon` (la card de promo real), con
/// el mismo tono claro, para que el placeholder y la card compartan
/// superficie.
///
/// La diferencia es que este NO renderiza business name / rating / icons —
/// es solo el "hero text" porque no hay negocio detrás del placeholder.
class _BackdropEmptyMessage extends StatelessWidget {
  final String title;
  final String subtitle;

  const _BackdropEmptyMessage({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.9),
          child: FoodlyGlassPanel(
            borderRadius: BorderRadius.circular(16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: FoodlyTextStyles.promoTitleOnGlass.copyWith(fontSize: 17, height: 1.18),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: FoodlyTextStyles.homeAppBarSmallSubtitle,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _PromoDetailSheet extends StatelessWidget {
  final PromotionDM promoDM;
  const _PromoDetailSheet({required this.promoDM});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(
        filter: dart_ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 63,
                height: 6,
                margin: const EdgeInsets.only(bottom: 19, top: 9),
                decoration: BoxDecoration(
                  color: FoodlyThemes.primaryFoodly,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: PromotionCardView(
                    promo: promoDM,
                    trailingAction: PromoFavoriteButton(
                      promo: promoDM,
                      favoriteKey: Key('fav-promo-sheet-${promoDM.uuid}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
