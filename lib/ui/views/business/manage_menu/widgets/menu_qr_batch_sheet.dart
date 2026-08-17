import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_qr_batch_pdf.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_qr_poster.dart' show resolveImage;
import 'package:foodly_world/ui/views/business/manage_menu/widgets/qr_batch_spec.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Genera el lote de QRs por mesa y lo entrega al share sheet.
///
/// **Por qué un PDF y no N imágenes.** Guardar 40 PNGs en la galería es 40
/// veces el problema que ya tenía uno solo: quedan sueltos, cuesta encontrarlos
/// y no es lo que el negocio va a hacer con ellos. Lo que va a hacer es
/// IMPRIMIRLOS, así que sale un único documento listo para imprenta y se pasa
/// al share sheet — de donde puede ir a correo, Drive o directo a imprimir.
Future<void> downloadMenuQrBatch(
  BuildContext context, {
  required String menuUrl,
  required String businessName,
  required List<String> labels,
  String? logoUrl,
}) async {
  if (labels.isEmpty) return;

  try {
    // Los logos se resuelven UNA vez y se reusan en todas las páginas: son la
    // única parte del lote que toca la red.
    final businessLogo = await MenuQrBatchPdf.imageProviderFrom(
      _hasRealLogo(logoUrl) ? await resolveImage(CachedNetworkImageProvider(logoUrl!)) : null,
    );
    final foodlyLogo = await MenuQrBatchPdf.imageProviderFrom(
      await resolveImage(AssetImage(FoodlyAssets.logo.assetPath)),
    );

    final bytes = await MenuQrBatchPdf.build(
      businessName: businessName,
      labels: labels,
      urlForLabel: (label) => QrBatchSpec.urlForTable(menuUrl: menuUrl, label: label),
      businessLogo: businessLogo,
      foodlyLogo: foodlyLogo,
      scanHint: S.current.scanForMenu,
      poweredBy: S.current.poweredBy,
    );

    final safe = businessName.replaceAll(RegExp(r'[^\w\s-]'), '').trim().replaceAll(RegExp(r'\s+'), '_');
    final file = File('${(await getTemporaryDirectory()).path}/qr_${safe.isEmpty ? 'foodly' : safe.toLowerCase()}.pdf');
    await file.writeAsBytes(bytes, flush: true);

    if (context.mounted) ScaffoldMessenger.of(context).removeCurrentSnackBar();

    // Directo al share sheet, sin pasar por la galería: un PDF no pinta ahí, y
    // el share sheet ya muestra qué es y deja elegir destino.
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'application/pdf')],
      subject: businessName.isEmpty ? 'Foodly' : businessName,
    );
    if (file.existsSync()) file.deleteSync();
  } catch (e) {
    di<Logger>().e('Error building menu QR batch: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      FoodlySnackbars.errorGeneric(context, S.current.shareMenuError);
    }
  }
}

bool _hasRealLogo(String? url) => url != null && url.isNotEmpty && url != FoodlyStrings.LOGO_PLACEHOLDER;

/// Hoja donde el manager define el rango de mesas del lote.
///
/// Un rango y no una lista de checkboxes: con 40 mesas, marcarlas una por una
/// sería el trabajo que este feature viene a evitar. El prefijo es libre para
/// los casos que no son "Mesa N" (Terraza, Barra…).
void showMenuQrBatchSheet(
  BuildContext context, {
  required String menuUrl,
  required String businessName,
  String? logoUrl,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBarWdg(
    type: SnackBarType.action,
    content: Column(
      spacing: 8,
      children: [
        Text(
          S.current.qrBatchTitle,
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.actionsBodyBold,
        ),
        Text(
          S.current.qrBatchHint,
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.snackBarLightBody,
        ),
      ],
    ),
    buttonBuilder: (dismiss) => _QrBatchForm(
      menuUrl: menuUrl,
      businessName: businessName,
      logoUrl: logoUrl,
      onDone: dismiss,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
}

class _QrBatchForm extends StatefulWidget {
  const _QrBatchForm({
    required this.menuUrl,
    required this.businessName,
    required this.onDone,
    this.logoUrl,
  });

  final String menuUrl;
  final String businessName;
  final String? logoUrl;
  final VoidCallback onDone;

  @override
  State<_QrBatchForm> createState() => _QrBatchFormState();
}

class _QrBatchFormState extends State<_QrBatchForm> {
  late final TextEditingController _from;
  late final TextEditingController _to;
  late final TextEditingController _prefix;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _from = TextEditingController(text: '1');
    _to = TextEditingController(text: '10');
    _prefix = TextEditingController(text: S.current.qrBatchPrefixDefault);
  }

  @override
  void dispose() {
    _from.dispose();
    _to.dispose();
    _prefix.dispose();
    super.dispose();
  }

  List<String> get _labels => QrBatchSpec.labelsForRange(
        from: int.tryParse(_from.text) ?? 0,
        to: int.tryParse(_to.text) ?? 0,
        prefix: _prefix.text,
      );

  Future<void> _generate() async {
    final labels = _labels;
    if (labels.isEmpty || _busy) return;

    setState(() => _busy = true);
    await downloadMenuQrBatch(
      context,
      menuUrl: widget.menuUrl,
      businessName: widget.businessName,
      labels: labels,
      logoUrl: widget.logoUrl,
    );
    if (mounted) {
      setState(() => _busy = false);
      widget.onDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = _labels;
    final valid = labels.isNotEmpty;

    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 10,
          children: [
            Expanded(child: _NumberField(controller: _from, label: S.current.qrBatchFrom, onChanged: _refresh)),
            Expanded(child: _NumberField(controller: _to, label: S.current.qrBatchTo, onChanged: _refresh)),
            Expanded(
              flex: 2,
              child: _TextField(controller: _prefix, label: S.current.qrBatchPrefix, onChanged: _refresh),
            ),
          ],
        ),
        Text(
          valid
              ? S.current.qrBatchCount(labels.length, labels.first, labels.last)
              : S.current.qrBatchInvalidRange(QrBatchSpec.maxTables),
          textAlign: TextAlign.center,
          style: FoodlyTextStyles.label.copyWith(
            fontSize: 12,
            color: valid ? FoodlyThemes.primaryFoodly : FoodlyThemes.error,
          ),
        ),
        CustomNeumorphicButton(
          onPressed: valid && !_busy ? _generate : null,
          disabled: !valid || _busy,
          text: _busy ? S.current.generatingQr : S.current.qrBatchGenerate,
          margin: EdgeInsets.zero,
          fontSize: 14,
          leading: _busy
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.primaryFoodly),
                )
              : const Icon(Icons.picture_as_pdf_rounded, color: FoodlyThemes.primaryFoodly, size: 18),
        ),
      ],
    );
  }

  void _refresh(String _) => setState(() {});
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.controller, required this.label, required this.onChanged});

  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 3,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, counterText: '', isDense: true),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({required this.controller, required this.label, required this.onChanged});

  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 12,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, counterText: '', isDense: true),
    );
  }
}
