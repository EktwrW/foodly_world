import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gal/gal.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show EvaIcons, Bootstrap;
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

bool _hasRealLogo(String? url) => url != null && url.isNotEmpty && url != FoodlyStrings.LOGO_PLACEHOLDER;

/// Resuelve un [ImageProvider] a un [ui.Image] ya decodificado. Devuelve `null`
/// si la imagen no se puede decodificar (formato no soportado, URL que devolvió
/// HTML/SVG, error de red, etc.) en lugar de propagar la excepción al árbol.
Future<ui.Image?> resolveImage(ImageProvider provider) {
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
  final ui.Image? logoImage = _hasRealLogo(logoUrl) ? await resolveImage(CachedNetworkImageProvider(logoUrl!, cacheManager: FoodlyImageCache.manager)) : null;

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

    // Copia en temporales para poder compartirla. `Gal` guarda en la galería
    // pero no devuelve una ruta, así que no hay archivo que pasarle al share
    // sheet: hay que escribir el PNG aparte.
    //
    // Va en su propio try: si falla (disco lleno, por ejemplo), la imagen YA
    // quedó en la galería y sería mentira reportar un error. Se degrada a
    // mostrar solo "Ver".
    File? shareable;
    try {
      shareable = File('${(await getTemporaryDirectory()).path}/$fileName.png');
      await shareable.writeAsBytes(bytes, flush: true);
    } catch (e) {
      di<Logger>().w('QR saved to gallery but temp copy failed, share disabled: $e');
      shareable = null;
    }

    if (context.mounted) {
      // Cierra el snackbar del QR para que el de éxito aparezca de inmediato
      // (si no, queda encolado hasta que el usuario cierre el del QR a mano).
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // Dos salidas, porque "Ver" sola no alcanzaba: `Gal.open()` abre la app
      // de galería pero NO puede hacer deep-link a la imagen concreta, así que
      // en Android el manager termina buscándola a mano en Colecciones → En
      // este dispositivo. "Compartir" entrega el archivo directo al share
      // sheet, donde ya se ve cuál es y se elige destino (mail, WhatsApp,
      // Drive, imprimir) sin buscar nada.
      final localShareable = shareable;
      final saved = SnackBarWdg(
        type: SnackBarType.success,
        content: Text(
          S.current.qrSavedToGallery,
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.snackBarLightBody,
        ),
        // 8s y no 6: ahora hay que decidir entre dos acciones, y si el
        // snackbar se va antes se pierde la de compartir.
        duration: const Duration(seconds: 8),
        buttonBuilder: (dismiss) => Row(
          spacing: 16,
          children: [
            Expanded(
              child: CustomNeumorphicButton(
                onPressed: () {
                  unawaited(Gal.open());
                  dismiss();
                },
                disabled: false,
                text: S.current.view,
                margin: EdgeInsets.zero,
                fontSize: 14,
              ),
            ),
            if (localShareable != null)
              Expanded(
                child: CustomNeumorphicButton(
                  onPressed: () {
                    unawaited(_shareQrPng(localShareable, businessName));
                    dismiss();
                  },
                  type: CustomNeumorphicBtnType.secondary,
                  disabled: false,
                  text: S.current.share,
                  margin: EdgeInsets.zero,
                  fontSize: 14,
                ),
              ),
          ],
        ),
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

/// Entrega el PNG ya guardado al share sheet nativo. El `subject` solo lo usan
/// las apps de correo; el resto lo ignora.
///
/// Borra la copia temporal al cerrarse la hoja, igual que
/// [SharePromotionHelper]: `shareXFiles` no retorna hasta que termina.
Future<void> _shareQrPng(File file, String businessName) async {
  try {
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'image/png')],
      subject: businessName.isEmpty ? 'Foodly' : businessName,
    );
  } catch (e) {
    di<Logger>().e('Error sharing menu QR PNG: $e');
  } finally {
    if (file.existsSync()) file.deleteSync();
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
      type: CustomNeumorphicBtnType.secondary,
      text: _busy ? S.current.generatingQr : S.current.downloadQrImage,
      margin: EdgeInsets.zero,
      fontSize: 14,
      leading: _busy
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
            )
          : const Icon(EvaIcons.download, color: FoodlyThemes.primaryFoodly, size: 20),
      trailing: const Icon(Bootstrap.qr_code_scan, color: FoodlyThemes.primaryFoodly, size: 18),
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
        borderRadius: BorderRadius.circular(16),
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
