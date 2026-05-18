import 'dart:async';
import 'dart:developer' show log;
import 'dart:ui' as dart_ui show ImageFilter;

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape, NeumorphicColors;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;
import 'package:video_player/video_player.dart';

class NewReleasesCard extends StatefulWidget {
  const NewReleasesCard({super.key});

  @override
  State<NewReleasesCard> createState() => _NewReleasesCardState();
}

class _NewReleasesCardState extends State<NewReleasesCard> {
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<NewReleasesCubit>().load();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final businesses = context.read<NewReleasesCubit>().vm.businesses;
      if (businesses.length > 1) {
        setState(() => _currentIndex = (_currentIndex + 1) % businesses.length);
      }
    });
  }

  void _navigate(int delta, int total) {
    setState(() => _currentIndex = (_currentIndex + delta + total) % total);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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

        return BlocBuilder<NewReleasesCubit, NewReleasesState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => isCheckingLocation ? const NewReleaseShimmer() : const SizedBox.shrink(),
              loading: (_) => const NewReleaseShimmer(),
              loaded: (s) {
                if (s.vm.businesses.isEmpty) {
                  return _EmptyNewReleasesWidget(
                    isError: false,
                    onRetry: () => context.read<NewReleasesCubit>().load(),
                  );
                }

                final total = s.vm.businesses.length;
                final idx = _currentIndex.clamp(0, total - 1);
                final business = s.vm.businesses[idx];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: Durations.long2,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: _NewReleasesCardContent(
                        key: ValueKey(business.uuid),
                        business: business,
                      ),
                    ),
                    if (total > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          CustomRoundedNeumorphicButton(
                            onPressed: () => _navigate(-1, total),
                            iconData: Bootstrap.chevron_left,
                            diameter: 20,
                            iconSize: 20,
                            shape: ui.NeumorphicShape.concave,
                          ),
                          ...List.generate(
                            total,
                            (i) => AnimatedContainer(
                              duration: Durations.short3,
                              width: i == idx ? 18 : 7,
                              height: 7,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: i == idx
                                    ? FoodlyThemes.primaryFoodly
                                    : FoodlyThemes.primaryFoodly.withValues(alpha: .25),
                              ),
                            ),
                          ),
                          CustomRoundedNeumorphicButton(
                            onPressed: () => _navigate(1, total),
                            iconData: Bootstrap.chevron_right,
                            diameter: 20,
                            iconSize: 20,
                            shape: ui.NeumorphicShape.concave,
                          ),
                        ],
                      ).paddingSymmetric(vertical: 10),
                  ],
                );
              },
              error: (_) => isCheckingLocation
                  ? const NewReleaseShimmer()
                  : _EmptyNewReleasesWidget(
                      isError: true,
                      onRetry: () => context.read<NewReleasesCubit>().load(),
                    ),
            );
          },
        );
      },
    );
  }
}

class _NewReleasesCardContent extends StatelessWidget {
  final BusinessDM business;

  const _NewReleasesCardContent({required this.business, super.key});

  Widget get _placeholderImage => (business.categoryId?.isDrinkHouse == true)
      ? const Asset(FoodlyAssets.newBarPlaceholder, fit: BoxFit.cover)
      : const Asset(FoodlyAssets.newBusinessPlaceholder, fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    final imageUrls =
        business.coverImages.map((c) => c.url).whereType<String>().where((url) => url.isNotEmpty).toList();
    final description = (business.introMessage?.trim().isNotEmpty ?? false) ? business.introMessage : business.aboutUs;

    final category = business.categoryId;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Header badge
        Card(
          color: FoodlyThemes.primaryFoodly,
          child: SizedBox(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 3,
                  children: [
                    Text(
                      business.name ?? '',
                      style: FoodlyTextStyles.cardsHeader,
                      overflow: TextOverflow.ellipsis,
                    ).paddingOnly(top: 7.3),
                    RatingBar.builder(
                      initialRating: business.rating ?? 0.0,
                      itemSize: 12,
                      minRating: 1,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber, size: 10),
                      unratedColor: FoodlyThemes.secondaryFoodly,
                      glowColor: FoodlyThemes.warning,
                      onRatingUpdate: (_) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Main card
        GestureDetector(
          onTap: () => di<AppRouter>().appRouter.goNamed(
                AppRoutes.visitBusiness.name,
                pathParameters: {AppRoutes.routeIdParam: business.uuid},
                extra: business,
              ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      // Cover photos
                      SizedBox(
                        height: 270,
                        width: context.screenWidth - 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageUrls.isNotEmpty
                              ? FeedMultipleImageView(imageUrls: imageUrls, radius: 12)
                              : _placeholderImage,
                        ).paddingAll(.9),
                      ),
                      // Logo + name overlay
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AvatarWidget(
                              avatarUrl: business.logo,
                              width: 100,
                              height: 100,
                              avatarType: AvatarType.business,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom info row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                description ?? '\n \n',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              if (category != null) SizedBox.square(dimension: 30, child: category.avatar),
                              Card(
                                color: FoodlyThemes.tertiaryFoodly,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 4),
                                    Text(
                                      [
                                        business.city,
                                        business.country?.value,
                                      ].whereType<String>().join(', '),
                                      style: FoodlyTextStyles.captionWhite,
                                    ),
                                    const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
                                  ],
                                ).paddingAll(3),
                              ).paddingOnly(left: 4),
                              const Spacer(),
                              Text.rich(
                                TextSpan(
                                  text: S.current.moreInfo,
                                  style: FoodlyTextStyles.cardTextButtonBlue,
                                ),
                              ).paddingOnly(right: 10),
                            ],
                          ).paddingOnly(top: 4),
                        ],
                      ),
                    ),
                  ],
                ).paddingAll(12),
              ],
            ),
          ).paddingOnly(top: 55),
        ),
      ],
    );
  }
}

/// Empty/error placeholder para `NewReleasesCard` cuando NO hay negocios
/// nuevos cerca del usuario o falló la carga.
///
/// Diseño (refactor 2026-05-11): el placeholder anterior era un icono +
/// texto plano + botón retry — efectivo pero plano, daba sensación de
/// "app vacía / pueblo sin nada". La nueva versión espeja exactamente el
/// patrón visual de `_EmptyOffersWidget` (placeholder de promos): card
/// neumórfica con `business.mp4` reproduciéndose en loop muteado de fondo
/// y un backdrop blur encima con título + subtítulo. Botón Reintentar
/// abajo, igual que antes.
///
/// **Por qué espejar exactamente TopOffers:** consistencia visual en la
/// home. El usuario que ve dos secciones consecutivas (Promociones cerca
/// + Nuevos negocios cerca) sin contenido no ve dos vacíos distintos sino
/// el mismo idioma visual repetido — comunica "todavía no, pero pronto"
/// de forma coherente.
///
/// **Por qué `VideoPlayer` puro y no `FlickVideoPlayer`:** Flick siempre
/// dibuja controles (play/pause/progress) que serían distractores acá.
/// Para detalles del trade-off, ver el docblock de `_EmptyOffersWidget`
/// en `main_top_offers_widget.dart`.
///
/// **Por qué el header morado decorativo (90px con nombre/rating) NO se
/// renderiza acá:** ese header pertenece a la card real porque muestra
/// info del business. En empty state no hay business detrás, así que
/// poner un header vacío sería ruido visual. El card placeholder ocupa
/// toda la altura disponible y se ve "limpio".
class _EmptyNewReleasesWidget extends StatefulWidget {
  final bool isError;
  final VoidCallback onRetry;

  const _EmptyNewReleasesWidget({required this.isError, required this.onRetry});

  @override
  State<_EmptyNewReleasesWidget> createState() => _EmptyNewReleasesWidgetState();
}

class _EmptyNewReleasesWidgetState extends State<_EmptyNewReleasesWidget> {
  static const _videoAsset = 'assets/videos/business.mp4';

  VideoPlayerController? _controller;
  bool _videoReady = false;
  bool _videoFailed = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    // **`videoPlayerOptions: mixWithOthers: true` es CRÍTICO** cuando hay
    // 2+ VideoPlayer simultáneos en pantalla (este placeholder + el de
    // `TopOffersWidget` con `promos.mp4`). Sin esta option, en iOS el
    // plugin configura `AVAudioSession` como exclusiva ("playback")
    // durante `initialize()` y el segundo controller que llama `.play()`
    // **pisa el primero**: solo uno reproduce, el otro queda congelado
    // en el primer frame. En Android es menos frecuente pero también
    // puede pasar con ExoPlayer si la audio focus se acapara.
    //
    // **Por qué al constructor y NO `controller.setMixWithOthers()`
    // post-init:** el método setter existe pero llega tarde —
    // `initialize()` ya creó la AVAudioSession en modo exclusivo y
    // cambiar la category después no rescata el routing. La forma
    // confiable es pasar `VideoPlayerOptions(mixWithOthers: true)` al
    // constructor para que la session se cree directamente en modo
    // mixable. Aunque acá los videos están con `volume=0`, sigue siendo
    // necesario porque la sesión se reserva al `.play()`
    // independientemente del volumen.
    //
    // El mismo fix idéntico está en `_EmptyOffersWidgetState._initVideo`.
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
    } catch (e) {
      log('$e');
      // Asset roto, codec no soportado en este device, o disposed mid-init.
      // Caemos a fallback visual sin video — el blur message y el retry
      // siguen funcionando, igual que en `_EmptyOffersWidget`.
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
    final title = widget.isError ? s.newReleasesEmptyErrorTitle : s.newReleasesEmptyTitle;
    final subtitle = widget.isError ? s.newReleasesEmptyErrorSubtitle : s.newReleasesEmptySubtitle;

    return SizedBox(
      // Mantiene aproximadamente la altura del card real con su contenido
      // (320 stack + 55 paddingTop + botón retry abajo). Evita layout
      // shift cuando aparezcan negocios nuevos y se reemplace este widget
      // por el `_NewReleasesCardContent` real.
      height: 430,
      child: Column(
        children: [
          // Card con video + blur backdrop overlay — mismo shape que la
          // `Card` interna de `_NewReleasesCardContent` (ver ese widget
          // arriba en este archivo), garantizando que la transición
          // empty → real no se sienta como un cambio de layout.
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            color: ui.NeumorphicColors.decorationMaxWhiteColor,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: _buildVideo(),
                  ),
                ),
                Column(
                  children: [
                    _BackdropEmptyMessage(title: title, subtitle: subtitle),
                    SizedBox(
                      width: 239,
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
      ),
    ).paddingOnly(top: 16);
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
/// Réplica del `_BackdropEmptyMessage` de `main_top_offers_widget.dart`.
/// Existe como clase privada acá (en vez de compartir una sola desde un
/// shared widget) por simetría con TopOffers — ambos widgets son
/// auto-contenidos y mantienen su placeholder local. Si en el futuro
/// sumamos un 3er empty state con la misma técnica, vale la pena
/// extraerlo a `shared_widgets/empty_state/empty_video_card.dart`.
class _BackdropEmptyMessage extends StatelessWidget {
  final String title;
  final String subtitle;

  const _BackdropEmptyMessage({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
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
