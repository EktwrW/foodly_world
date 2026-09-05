import 'dart:async';
import 'dart:developer' show log;

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicColors;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/glass/foodly_glass.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, Clarity;
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
                    // LO QUE RECORTABA LA SOMBRA (2026-09-05). El
                    // `layoutBuilder` por defecto de `AnimatedSwitcher` es un
                    // `Stack`, y `Stack` recorta (`Clip.hardEdge`) a la caja de
                    // la tarjeta; `SizeTransition`, que estuvo un rato acá,
                    // recortaba además por su `ClipRect` interno. Por eso la
                    // transición es un fundido y el `Stack` va con `Clip.none`:
                    // ninguno de los dos necesita recortar nada.
                    LayoutBuilder(
                      builder: (context, constraints) {
                        // La portada de la tarjeta es 4:3 y ocupa todo el
                        // ancho, así que su centro vertical es calculable sin
                        // medir nada. Es donde se anclan las flechas.
                        final coverCenter = constraints.maxWidth * 3 / 4 / 2;

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Ya no hace falta `AnimatedSize`: todas las
                            // tarjetas miden lo mismo por construcción — el
                            // nombre va a una línea y el hueco de la
                            // descripción se reserva siempre. Animar el alto
                            // era tratar el síntoma; lo que molestaba no era
                            // que el cambio fuera brusco, sino que hubiera
                            // cambio.
                            AnimatedSwitcher(
                              duration: Durations.long2,
                              switchOutCurve: const Threshold(0),
                              layoutBuilder: (currentChild, previousChildren) => Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [...previousChildren, if (currentChild != null) currentChild],
                              ),
                              transitionBuilder: (child, animation) => FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                              child: NewReleaseBusinessCard(
                                key: ValueKey(business.uuid),
                                business: business,
                              ),
                            ),
                            if (total > 1) ...[
                              Positioned(
                                left: 10,
                                top: coverCenter - _NavArrow.size / 2,
                                child: _NavArrow(
                                  icon: Bootstrap.chevron_left,
                                  onPressed: () => _navigate(-1, total),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: coverCenter - _NavArrow.size / 2,
                                child: _NavArrow(
                                  icon: Bootstrap.chevron_right,
                                  onPressed: () => _navigate(1, total),
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                    if (total > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
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

/// La tarjeta de un negocio nuevo, en la home.
///
/// REDISEÑO 2026-09-04 (propuesta A). El contenido es el mismo de antes —
/// nombre, valoración, portada, logo, descripción, categoría, ciudad y país,
/// y "+ info" — y lo que cambia es cómo está armado. Lo anterior tenía tres
/// cosas rotas y varias de andamiaje:
///
///  * **El nombre podía desbordar.** Vivía en un `Text` dentro de un `Column`
///    dentro de un `Row`, sin `Expanded` ni `Flexible`: un nombre largo se
///    salía de la tarjeta con las rayas de overflow. Ahora va en un
///    `Expanded` a dos líneas.
///  * **Tocar la foto no abría el negocio.** La portada usaba
///    `FeedMultipleImageView`, que trae su propio `GestureDetector` y abre el
///    visor de imágenes; el gesto que navega es el de fuera, así que solo
///    respondía tocando *fuera* de la foto — justo la zona más grande de la
///    tarjeta hacía otra cosa. Ahora se dibuja `MultipleImageView`, que es el
///    mismo collage SIN gesto, y toda la tarjeta navega.
///  * **La pastilla verde no se leía.** Blanco sobre `tertiaryFoodly` da
///    2,3:1, la mitad del mínimo de la WCAG. Pasa a tinte ciruela.
///  * La cabecera morada eran **dos `Card` apiladas**: una de 90 px detrás y
///    la principal con `paddingOnly(top: 55)` encima. Ahora es una sola
///    tarjeta y la identidad del negocio sube a una cinta de vidrio sobre la
///    foto, como el título en la card de promo.
///  * El logo pasa de 100 px flotando en 50 px de zona muerta a 52 px al lado
///    del nombre, y la descripción deja de vivir en un `SizedBox(60)` cuyo
///    fallback era la cadena `'\n \n'`.
///
/// Alto total: ~434 px contra los ~489 de antes.
class NewReleaseBusinessCard extends StatelessWidget {
  final BusinessDM business;

  const NewReleaseBusinessCard({required this.business, super.key});

  /// Igual que en la card de promo: la cinta sobresale SIEMPRE esta cantidad
  /// exacta por debajo de la portada, ocupe lo que ocupe el nombre, y por eso
  /// el cuerpo puede reservar arriba `_ribbonOverflow + 14`.
  static const double _ribbonOverflow = 26;

  static const double _cardRadius = 24;

  static const _scrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x4D180413), Color(0x00180413), Color(0x00180413), Color(0x8C180413)],
    stops: [0, .30, .44, 1],
  );

  Widget get _placeholderImage => (business.categoryId?.isDrinkHouse == true)
      ? const Asset(FoodlyAssets.newBarPlaceholder, fit: BoxFit.cover)
      : const Asset(FoodlyAssets.newBusinessPlaceholder, fit: BoxFit.cover);

  void _open() => di<AppRouter>().appRouter.goNamed(
        AppRoutes.visitBusiness.name,
        pathParameters: {AppRoutes.routeIdParam: business.uuid},
        extra: business,
      );

  @override
  Widget build(BuildContext context) {
    final imageUrls =
        business.coverImages.map((c) => c.url).whereType<String>().where((url) => url.isNotEmpty).toList();
    final description = (business.introMessage?.trim().isNotEmpty ?? false) ? business.introMessage : business.aboutUs;
    final category = business.categoryId;
    final location = [business.city, business.country?.value].whereType<String>().join(', ');

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_cardRadius),
        boxShadow: UIDecorations.CARD_SHADOW,
      ),
      child: Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(_cardRadius),
        child: InkWell(
          onTap: _open,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // `MultipleImageView` y no `FeedMultipleImageView`: el
                        // mismo collage, sin el gesto que se comía el tap.
                        imageUrls.isNotEmpty ? MultipleImageView(imageUrls: imageUrls, radius: 0) : _placeholderImage,
                        const IgnorePointer(child: DecoratedBox(decoration: BoxDecoration(gradient: _scrim))),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 14,
                    right: 14,
                    bottom: -_ribbonOverflow,
                    child: FoodlyGlassPanel(
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      shadows: const [
                        BoxShadow(color: Color(0x80260419), blurRadius: 34, spreadRadius: -14, offset: Offset(0, 14)),
                      ],
                      child: Row(
                        children: [
                          _BusinessLogo(logo: business.logo),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  business.name ?? '',
                                  // Una línea a propósito: con dos, un nombre
                                  // largo hacía la tarjeta más alta que las
                                  // demás y el carrusel movía la página.
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: FoodlyTextStyles.businessNameOnGlass,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: RatingBar.builder(
                                    initialRating: business.rating ?? 0.0,
                                    itemSize: 12,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber, size: 12),
                                    unratedColor: FoodlyThemes.secondaryFoodly,
                                    glowColor: FoodlyThemes.warning,
                                    onRatingUpdate: (_) {},
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, _ribbonOverflow + 14, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // EL HUECO SE RESERVA SIEMPRE, TENGA TEXTO O NO.
                    //
                    // No es estético, es de comportamiento: esta sección rota
                    // sola cada 4 segundos dentro de un scroll. Si las
                    // tarjetas miden distinto, cada rotación mueve todo lo que
                    // hay debajo — sin que el usuario haya tocado nada, y
                    // pudiendo desplazar lo que estaba a punto de tocar.
                    //
                    // El alto sale de la métrica del propio estilo y del ajuste
                    // de texto del sistema, no de un número clavado: con un
                    // `SizedBox(height: 60)` fijo, subir el tamaño de letra en
                    // Ajustes recorta el texto.
                    SizedBox(
                      height: _reservedLines(context, FoodlyTextStyles.cardDescription, 2),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.cardDescription,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        if (category != null) ...[
                          SizedBox.square(dimension: 34, child: category.avatar),
                          const SizedBox(width: 8),
                        ],
                        if (location.isNotEmpty) ...[
                          Expanded(child: _LocationChip(location: location)),
                          const SizedBox(width: 8),
                        ] else
                          const Spacer(),
                        _MoreInfoButton(onPressed: _open),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Alto de [lines] líneas de [style], respetando el ajuste de tamaño de texto
/// del sistema.
///
/// Es lo que mantiene todas las tarjetas del mismo alto sin clavar un número:
/// cuando un `TextStyle` trae `height`, cada línea mide exactamente
/// `fontSize * height`.
double _reservedLines(BuildContext context, TextStyle style, int lines) =>
    MediaQuery.textScalerOf(context).scale(style.fontSize!) * (style.height ?? 1) * lines;

class _BusinessLogo extends StatelessWidget {
  final String? logo;

  const _BusinessLogo({required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: .95), width: 2),
        boxShadow: const [BoxShadow(color: Color(0x80260419), blurRadius: 12, spreadRadius: -4, offset: Offset(0, 4))],
      ),
      child: AvatarWidget(
        avatarUrl: logo,
        width: 52,
        height: 52,
        avatarType: AvatarType.business,
      ),
    );
  }
}

/// La ubicación del negocio.
///
/// Antes era una `Card` verde (`tertiaryFoodly`) con texto blanco: 2,3:1, muy
/// por debajo del 4,5:1 de la WCAG, y además el verde de "éxito" no significa
/// nada para una ciudad.
class _LocationChip extends StatelessWidget {
  final String location;

  const _LocationChip({required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: FoodlyThemes.primaryFoodly.withValues(alpha: .06),
        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: .12)),
      ),
      child: Row(
        children: [
          const Icon(Clarity.map_marker_solid, color: FoodlyThemes.primaryFoodly, size: 15),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.chipLabel,
            ),
          ),
        ],
      ),
    );
  }
}

/// "+ info" era un texto azul (#2196F3), el único azul de la pantalla y sin
/// nada que dijera que se podía tocar. Ahora es un botón, con el mismo texto.
class _MoreInfoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _MoreInfoButton({required this.onPressed});

  static const _radius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 34,
        decoration: const BoxDecoration(
          borderRadius: _radius,
          gradient: UIDecorations.NEUMORPHIC_PURPLE_GRADIENT,
          boxShadow: [BoxShadow(color: Color(0xD979005D), blurRadius: 18, spreadRadius: -8, offset: Offset(0, 8))],
        ),
        child: InkWell(
          borderRadius: _radius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.current.moreInfo, style: FoodlyTextStyles.cardActionLabel),
                const SizedBox(width: 5),
                const Icon(Bootstrap.chevron_right, color: Colors.white, size: 13),
              ],
            ),
          ),
        ),
      ),
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
      // Mantiene aproximadamente la altura de la card real (portada 4:3 +
      // cuerpo + botón retry abajo). Evita layout shift cuando aparezcan
      // negocios nuevos y se reemplace este widget por el
      // `NewReleaseBusinessCard` real.
      height: 430,
      child: Column(
        children: [
          // Card con video + blur backdrop overlay — mismo shape que la
          // `Card` interna de `NewReleaseBusinessCard` (ver ese widget
          // arriba en este archivo), garantizando que la transición
          // empty → real no se sienta como un cambio de layout.
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            color: ui.NeumorphicColors.decorationMaxWhiteColor,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
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
/// Réplica del `_BackdropEmptyMessage` de `main_top_offers_widget.dart`, con
/// el mismo `FoodlyGlassPanel` que usan las dos cards reales.
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

/// Las flechas para pasar de un negocio al siguiente.
///
/// Estaban abajo, flanqueando los puntos, a 20 px de diámetro y en neumórfico:
/// lejos del contenido que mueven y por debajo del mínimo táctil. Ahora van
/// sobre la portada, a los costados, en el mismo vidrio oscuro que los
/// controles flotantes de las cards de promo — que es el sitio donde el
/// usuario ya espera encontrar algo que se toca sobre una foto.
///
/// Los puntos se quedan abajo: siguen contando cuántos hay y en cuál estás,
/// que es lo que las flechas no dicen.
class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _NavArrow({required this.icon, required this.onPressed});

  static const double size = 44;

  @override
  Widget build(BuildContext context) {
    return FoodlyGlassButton(icon: icon, onPressed: onPressed, iconSize: 20);
  }
}
