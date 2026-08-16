import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gal/gal.dart';
import 'package:logger/logger.dart';

bool _hasRealLogo(String? url) => url != null && url.isNotEmpty && url != FoodlyStrings.LOGO_PLACEHOLDER;

/// Resuelve un [ImageProvider] a un [ui.Image] ya decodificado. Devuelve `null`
/// si la imagen no se puede decodificar (formato no soportado, URL que devolvió
/// HTML/SVG, error de red, etc.) en lugar de propagar la excepción al árbol.
Future<ui.Image?> _resolveImage(ImageProvider provider) {
  final completer = Completer<ui.Image?>();
  final stream = provider.resolve(const ImageConfiguration());
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (info, _) {
      if (!completer.isCompleted) completer.complete(info.image);
      stream.removeListener(listener);
    },
    onError: (_, __) {
      if (!completer.isCompleted) completer.complete(null);
      stream.removeListener(listener);
    },
  );
  stream.addListener(listener);
  return completer.future;
}

/// Genera el "póster" del menú (logo + nombre del negocio, QR y firma de
/// Foodly) y lo **guarda como PNG en la galería/Fotos** del dispositivo.
///
/// El póster NO se muestra en pantalla: se renderiza fuera de cuadro mediante
/// un [OverlayEntry] (posicionado en -10000, pero igualmente pintado, por lo
/// que el [RepaintBoundary] sí lo captura) y se descarta apenas se captura.
/// Se usa `gal` para escribir el PNG en Fotos directamente (no comparte).
Future<void> downloadMenuQrPng(
  BuildContext context, {
  required String menuUrl,
  required String businessName,
  String? logoUrl,
}) async {
  final overlay = Overlay.of(context, rootOverlay: true);
  final repaintKey = GlobalKey();

  // Pre-decodifica el logo del negocio ANTES de capturar: así se pinta de forma
  // síncrona (RawImage, sin fade) y, si los bytes no decodifican, simplemente se
  // omite sin propagar la excepción "Invalid image data" al árbol.
  if (context.mounted) {
    try {
      await precacheImage(AssetImage(FoodlyAssets.logo.assetPath), context);
    } catch (_) {
      // El logo de Foodly es un asset local; si fallara seguimos igual.
    }
  }
  final ui.Image? logoImage = _hasRealLogo(logoUrl) ? await _resolveImage(CachedNetworkImageProvider(logoUrl!)) : null;

  final entry = OverlayEntry(
    builder: (_) => Positioned(
      left: -10000,
      top: 0,
      child: Material(
        type: MaterialType.transparency,
        child: RepaintBoundary(
          key: repaintKey,
          child: MenuQrPoster(menuUrl: menuUrl, businessName: businessName, logoImage: logoImage),
        ),
      ),
    ),
  );
  overlay.insert(entry);

  try {
    // Dos frames para garantizar que el póster (QR + imágenes) esté pintado.
    await WidgetsBinding.instance.endOfFrame;
    await WidgetsBinding.instance.endOfFrame;

    final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) throw StateError('Poster RenderRepaintBoundary not found');

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) throw StateError('Failed to encode PNG');
    final bytes = byteData.buffer.asUint8List();

    final safe = businessName.replaceAll(RegExp(r'[^\w\s-]'), '').trim().replaceAll(RegExp(r'\s+'), '_');
    final fileName = 'menu_qr_${safe.isEmpty ? 'foodly' : safe.toLowerCase()}';

    await Gal.putImageBytes(bytes, name: fileName);

    if (context.mounted) {
      // Cierra el snackbar del QR para que el de éxito aparezca de inmediato
      // (si no, queda encolado hasta que el usuario cierre el del QR a mano).
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // Snackbar de éxito con acción "Ver": abre la app de galería nativa
      // (Fotos en iOS / galería en Android), donde queda el QR recién guardado.
      final saved = SnackBarWdg(
        type: SnackBarType.success,
        content: Text(
          S.current.qrSavedToGallery,
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.snackBarLightBody,
        ),
        buttonText: S.current.view,
        onPressed: () => unawaited(Gal.open()),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context).showSnackBar(saved.getSnackBar(context));
    }
  } catch (e) {
    di<Logger>().e('Error saving menu QR PNG: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      FoodlySnackbars.errorGeneric(context, S.current.shareMenuError);
    }
  } finally {
    entry.remove();
  }
}

/// Botón (estilo *outlined*) que dispara la descarga del PNG del QR. Maneja su
/// propio estado de carga. Pensado para vivir dentro del snackbar del QR, solo
/// visible para el manager dueño.
class MenuQrDownloadButton extends StatefulWidget {
  const MenuQrDownloadButton({
    super.key,
    required this.menuUrl,
    required this.businessName,
    this.logoUrl,
  });

  final String menuUrl;
  final String businessName;
  final String? logoUrl;

  @override
  State<MenuQrDownloadButton> createState() => _MenuQrDownloadButtonState();
}

class _MenuQrDownloadButtonState extends State<MenuQrDownloadButton> {
  bool _busy = false;

  Future<void> _onPressed() async {
    if (_busy) return;
    setState(() => _busy = true);
    await downloadMenuQrPng(
      context,
      menuUrl: widget.menuUrl,
      businessName: widget.businessName,
      logoUrl: widget.logoUrl,
    );
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomNeumorphicButton(
      onPressed: _busy ? null : _onPressed,
      disabled: _busy,
      type: CustomNeumorphicBtnType.outlined,
      text: _busy ? S.current.generatingQr : S.current.downloadQrImage,
      margin: EdgeInsets.zero,
      fontSize: 14,
      leading: _busy
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
            )
          : const Icon(Icons.download_rounded, color: FoodlyThemes.primaryFoodly, size: 18),
    );
  }
}

/// El "póster" descargable: header (logo + nombre), QR central y footer con la
/// firma "Powered by" de Foodly (en el idioma actual de la app).
class MenuQrPoster extends StatelessWidget {
  const MenuQrPoster({
    super.key,
    required this.menuUrl,
    required this.businessName,
    required this.logoImage,
  });

  final String menuUrl;
  final String businessName;
  final ui.Image? logoImage;

  static const _purple = FoodlyThemes.primaryFoodly;

  @override
  Widget build(BuildContext context) {
    final showLogo = logoImage != null;

    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.fromLTRB(24, 26, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header: logo (si tiene) + nombre del negocio ──
          if (showLogo) ...[
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _purple.withValues(alpha: 0.18), width: 2),
              ),
              child: ClipOval(
                child: RawImage(
                  image: logoImage,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            businessName.isEmpty ? 'Foodly' : businessName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.secondaryTitle.copyWith(
              color: _purple,
              fontSize: 21,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 18),

          // ── QR del menú ──
          FoodlyQrCard(data: menuUrl, size: 208),
          const SizedBox(height: 10),
          Text(
            S.current.scanForMenu,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.label.copyWith(
              fontSize: 12,
              color: Colors.black.withValues(alpha: 0.55),
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          Divider(height: 1, thickness: 1, color: _purple.withValues(alpha: 0.10)),
          const SizedBox(height: 8),

          // ── Footer: "Powered by" (idioma actual) + logo Foodly, abajo-derecha ──
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                S.current.poweredBy,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.black.withValues(alpha: 0.42),
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(width: 6),
              const Asset(FoodlyAssets.logo, height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
