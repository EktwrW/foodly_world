import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Construye el PDF del lote: una página por mesa, cada una con su QR.
///
/// **Por qué el QR va vectorial y no capturado del widget.** El póster de una
/// sola mesa se renderiza con [RepaintBoundary] y sale PNG, que para mirarlo en
/// el móvil está bien. Este PDF se IMPRIME, y un QR rasterizado se emborrona al
/// escalarlo. `BarcodeWidget` lo dibuja como vectores: nítido a cualquier
/// tamaño, y de paso evita 40 ciclos de overlay + captura + encode.
///
/// El precio es que el diseño del póster queda expresado dos veces, en dos
/// sistemas de widgets distintos. Se asume a conciencia: el entregable de este
/// lote es papel.
///
/// **Tamaño de página: A6** (105×148 mm), que es tamaño de cartelito de mesa.
/// Si el negocio prefiere A4, el diálogo de impresión hace la imposición (4 por
/// hoja) sin que haya que tocar nada acá.
///
/// **Fuentes**: se usan las estándar del PDF (Helvetica), que cubren Latin-1 —
/// suficiente para PT/ES/AR/VE. Un nombre de negocio en alfabeto no latino no
/// se dibujaría; haría falta empaquetar una fuente, que engorda el bundle y hoy
/// no se paga.
abstract final class MenuQrBatchPdf {
  static const _purple = PdfColor.fromInt(0xFF79005D);

  /// Puntuación tipográfica → su equivalente ASCII.
  ///
  /// Las fuentes estándar del PDF cubren Latin-1, así que acentos y ñ salen
  /// bien, pero el guion largo y las comillas curvas NO: el paquete avisa
  /// `Unable to find a font to draw "—" (U+2014)` y deja un hueco. En pantalla
  /// sería un detalle; acá el nombre del negocio va impreso y pegado en la
  /// mesa. Se degrada a ASCII en vez de empaquetar una fuente completa, que
  /// engordaría el bundle por un caso de borde.
  static const _asciiFallbacks = {
    '—': '-', '–': '-', '‑': '-',
    '“': '"', '”': '"', '„': '"',
    '‘': "'", '’': "'",
    '…': '...', '•': '-', '·': '-',
    ' ': ' ',
  };

  /// Visible para tests: es la regla que decide qué se imprime.
  @visibleForTesting
  static String printable(String text) {
    var out = text;
    _asciiFallbacks.forEach((from, to) => out = out.replaceAll(from, to));
    return out;
  }

  /// Pasa una imagen ya decodificada por Flutter al PDF.
  ///
  /// Vía RGBA crudo a propósito: `MemoryImage` solo entiende PNG y JPEG, y el
  /// logo de Foodly es `.webp` — igual que podría serlo el del negocio. Como
  /// Flutter ya sabe decodificar todo eso, se le pide el mapa de píxeles y se
  /// evita el problema de formatos por completo.
  static Future<pw.ImageProvider?> imageProviderFrom(ui.Image? image) async {
    if (image == null) return null;
    // `rawRgba` es el default de toByteData — es justo el que hace falta acá.
    final data = await image.toByteData();
    if (data == null) return null;

    return pw.RawImage(
      bytes: data.buffer.asUint8List(),
      width: image.width,
      height: image.height,
    );
  }

  /// Genera el documento. [urlForLabel] resuelve la URL que codifica cada QR
  /// (inyectado para no acoplar el dibujo a cómo se arma el `?t=`).
  static Future<Uint8List> build({
    required String businessName,
    required List<String> labels,
    required String Function(String label) urlForLabel,
    pw.ImageProvider? businessLogo,
    pw.ImageProvider? foodlyLogo,
    required String scanHint,
    required String poweredBy,
  }) async {
    final doc = pw.Document(title: businessName.isEmpty ? 'Foodly' : businessName);

    for (final label in labels) {
      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a6,
          margin: const pw.EdgeInsets.all(14),
          build: (_) => _page(
            businessName: businessName,
            label: label,
            url: urlForLabel(label),
            businessLogo: businessLogo,
            foodlyLogo: foodlyLogo,
            scanHint: scanHint,
            poweredBy: poweredBy,
          ),
        ),
      );
    }

    return doc.save();
  }

  static pw.Widget _page({
    required String businessName,
    required String label,
    required String url,
    required pw.ImageProvider? businessLogo,
    required pw.ImageProvider? foodlyLogo,
    required String scanHint,
    required String poweredBy,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        borderRadius: pw.BorderRadius.circular(16),
        border: pw.Border.all(color: _purple, width: 1.2),
      ),
      padding: const pw.EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          if (businessLogo != null) ...[
            pw.SizedBox(height: 42, width: 42, child: pw.Image(businessLogo, fit: pw.BoxFit.cover)),
            pw.SizedBox(height: 8),
          ],
          pw.Text(
            printable(businessName.isEmpty ? 'Foodly' : businessName),
            textAlign: pw.TextAlign.center,
            maxLines: 2,
            style: pw.TextStyle(color: _purple, fontSize: 15, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),

          // La mesa es lo que distingue una página de otra: va grande y con
          // fondo, para poder identificar el cartel de un vistazo al repartirlos.
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: pw.BoxDecoration(
              color: _purple,
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Text(
              printable(label),
              style: pw.TextStyle(color: PdfColors.white, fontSize: 17, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 14),

          pw.BarcodeWidget(
            barcode: pw.Barcode.qrCode(),
            data: url,
            width: 132,
            height: 132,
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            printable(scanHint),
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
          ),

          pw.Spacer(),
          pw.Divider(color: _purple, thickness: .5, height: 8),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(printable(poweredBy), style: const pw.TextStyle(fontSize: 6, color: PdfColors.grey600)),
              pw.SizedBox(width: 4),
              if (foodlyLogo != null) pw.SizedBox(height: 10, child: pw.Image(foodlyLogo)),
            ],
          ),
        ],
      ),
    );
  }
}
