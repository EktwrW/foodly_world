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
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_state.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/promotions_page.dart';
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
                viewportFraction: .83,
                enableInfiniteScroll: promotions.length > 2,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => _onPageChanged(index, promotions, vm.hasMore),
              ),
              items: promotions.asMap().entries.map((e) => NearbyPromoCard(promo: e.value)).toList(),
            );
          },
        );
      },
    );
  }
}

class NearbyPromoCard extends StatelessWidget {
  final NearbyPromotionDM promo;
  const NearbyPromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NearbyPromotionsCubit>();

    return Stack(
      children: [
        Column(
          children: [
            // Media (external link, GCS image, or placeholder)
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: _buildMedia(),
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: _BackdropRoundedRectangle(promo),
        ),

        // Favorite button
        Positioned(
          right: 6,
          top: 6,
          child: UIFavoriteWidget(
            liked: promo.isFavorited,
            addFavoriteIcon: FontAwesome.heart_circle_plus_solid,
            isFavoriteIcon: FontAwesome.heart_circle_check_solid,
            onPressed: () {
              // Modo invitado (5.1.1.v): guardar promos requiere cuenta. Esta
              // card usa UIFavoriteWidget directo (no el FavoriteButton compartido),
              // así que el gate va acá explícito.
              if (!GuestGuard.requireAuth(GuestGateAction.favorite)) return;
              cubit.toggleFavorite(promo.uuid);
            },
          ),
        ),
      ],
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
      return CachedNetworkImage(imageUrl: promo.promoMedia!.mediaUrl, fit: BoxFit.cover);
    }

    return const Asset(FoodlyAssets.promoPlaceholder, fit: BoxFit.scaleDown);
  }
}

class _BackdropRoundedRectangle extends StatelessWidget {
  final NearbyPromotionDM promo;

  const _BackdropRoundedRectangle(this.promo);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isLoading = false;

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: dart_ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: ui.NeumorphicColors.embossMaxWhiteColor.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Title + subtitle
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text(
                                promo.title,
                                style: FoodlyTextStyles.secondaryTitle.copyWith(
                                  color: FoodlyThemes.primaryFoodly,
                                  fontSize: 17,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, 1),
                                      blurRadius: 16,
                                    ),
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -1),
                                      blurRadius: 16,
                                    ),
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(1, 0),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (!promo.hasMedia)
                              Flexible(
                                child: Text(
                                  promo.subTitle,
                                  style: FoodlyTextStyles.homeAppBarSmallSubtitle,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            // Business name + rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      promo.businessName,
                                      style: FoodlyTextStyles.promoBusinessName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    RatingBar.builder(
                                      initialRating: promo.ratingAvg,
                                      itemSize: 13,
                                      minRating: 1,
                                      allowHalfRating: true,
                                      ignoreGestures: true,
                                      itemBuilder: (context, _) =>
                                          const Icon(Icons.star, color: Colors.amber, size: 13),
                                      onRatingUpdate: (_) {},
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 6, vertical: 6),
                                Row(
                                  children: [
                                    StatefulBuilder(
                                      builder: (_, setState) {
                                        return CustomRoundedNeumorphicButton(
                                          onPressed: () async {
                                            if (isLoading) return;

                                            await Future.microtask(() => setState(() => isLoading = true));

                                            await di<BusinessRepo>().getPromotionByUuid(promo.uuid).then((result) {
                                              result.when(
                                                success: (promo) => showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.transparent,
                                                  barrierColor: Colors.black45,
                                                  builder: (_) => _PromoDetailSheet(promoDM: promo),
                                                ),
                                                failure: (e) => FoodlySnackbars.errorGeneric(
                                                    context, S.current.failedToLoadPromotionDetails),
                                              );
                                            });

                                            Future.microtask(() => setState(() => isLoading = false));
                                          },
                                          tooltip: S.current.viewPromotion,
                                          iconSize: 16,
                                          diameter: 16,
                                          iconData: Bootstrap.arrows_fullscreen,
                                          child: isLoading
                                              ? const SizedBox.square(
                                                  dimension: 16,
                                                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                                                )
                                              : null,
                                        );
                                      },
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 6),
                              ],
                            ).paddingSymmetric(horizontal: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }).paddingAll(6);
  }
}

/// Empty/error placeholder para `TopOffersWidget` cuando la lista de promos
/// cerca del usuario está vacía o falló la carga.
///
/// Diseño (refactor 2026-05-08): el placeholder anterior era un icono +
/// texto plano que daba sensación de "app vacía" y no enganchaba. La nueva
/// versión replica el shape exacto de la PromoCard real (Card con
/// borderRadius 8, AspectRatio 16/9, blur backdrop encima al estilo del
/// `_BackdropRoundedRectangle` de la card de promo) pero con un video
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
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
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
/// Misma técnica visual que `_BackdropRoundedRectangle` (la card de promo
/// real): `BackdropFilter` con sigma 6 + container semi-translúcido encima
/// del video, texto purple primario con multi-shadow blanco para legibilidad
/// independientemente del frame del video que esté detrás.
///
/// La diferencia con `_BackdropRoundedRectangle` es que este NO renderiza
/// business name / rating / icons — es solo el "hero text" porque no hay
/// negocio detrás del placeholder.
class _BackdropEmptyMessage extends StatelessWidget {
  final String title;
  final String subtitle;

  const _BackdropEmptyMessage({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: dart_ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              decoration: BoxDecoration(
                color: ui.NeumorphicColors.embossMaxWhiteColor.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: FoodlyTextStyles.secondaryTitle.copyWith(
                      color: FoodlyThemes.primaryFoodly,
                      fontSize: 17,
                      shadows: const [
                        Shadow(color: Colors.white, offset: Offset(0, 1), blurRadius: 16),
                        Shadow(color: Colors.white, offset: Offset(0, -1), blurRadius: 16),
                        Shadow(color: Colors.white, offset: Offset(1, 0), blurRadius: 16),
                        Shadow(color: Colors.white, offset: Offset(-1, 0), blurRadius: 16),
                      ],
                    ),
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
                  child: PromotionCard(promo: promoDM),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
