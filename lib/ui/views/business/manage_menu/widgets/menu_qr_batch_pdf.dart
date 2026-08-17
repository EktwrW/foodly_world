import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:foodly_world/ui/views/business/manage_menu/widgets/qr_dot_matrix.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Construye el PDF del lote: el MISMO cartel que se descarga suelto, con la
/// etiqueta de la mesa agregada, y cuatro por hoja A4.
///
/// **Cuatro por hoja y no uno por página.** Con A6 y una mesa por página, 40
/// mesas son 40 hojas, y para imprimir 4-por-hoja hay que encontrar la opción
/// en el diálogo de impresión. La grilla 2×2 en A4 da el MISMO tamaño físico de
/// cartel —cada celda es un A6— pero son 10 hojas y sale bien sin tocar ninguna
/// configuración. Se dibujan guías de corte tenues entre celdas.
///
/// **El QR se dibuja módulo a módulo.** `BarcodeWidget` solo pinta cuadrados
/// negros, y el QR de Foodly (`FoodlyQrCard`) son puntos redondos morados con
/// ojos circulares. Para que el cartel impreso sea idéntico al que se descarga
/// suelto hay que pintarlo a mano sobre la retícula de [QrDotMatrix]. Sigue
/// siendo vectorial, así que no se emborrona al imprimir.
///
/// **Fuentes**: las estándar del PDF (Helvetica) cubren Latin-1, que alcanza
/// para PT/ES/AR/VE. La puntuación tipográfica no entra ahí y el paquete deja
/// un hueco en silencio, así que se degrada a ASCII en [printable] antes de
/// dibujar. Un alfabeto no latino necesitaría empaquetar una fuente.
abstract final class MenuQrBatchPdf {
  static const _purple = PdfColor.fromInt(0xFF79005D);

  /// Puntuación tipográfica → equivalente ASCII. Ver la nota de la clase: en
  /// pantalla un glifo faltante es un detalle; acá va impreso y pegado a la mesa.
  static const _asciiFallbacks = {
    '—': '-', '–': '-', '‑': '-',
    '“': '"', '”': '"', '„': '"',
    '‘': "'", '’': "'",
    '…': '...', '•': '-', '·': '-',
    ' ': ' ',
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
  /// Flutter ya sabe decodificar todo eso, se le pide el mapa de píxeles y el
  /// problema de formatos desaparece.
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
    required String scanHint,
    required String poweredBy,
    pw.ImageProvider? businessLogo,
    pw.ImageProvider? foodlyLogo,
  }) async {
    final doc = pw.Document(title: businessName.isEmpty ? 'Foodly' : businessName);

    // De a 4: la página se arma como dos filas de dos celdas.
    for (var i = 0; i < labels.length; i += 4) {
      final hoja = labels.skip(i).take(4).toList();

      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.zero,
          build: (_) => pw.Column(
            children: [
              _fila(hoja, 0, businessName, urlForLabel, businessLogo, foodlyLogo, scanHint, poweredBy),
              _guiaHorizontal(),
              _fila(hoja, 2, businessName, urlForLabel, businessLogo, foodlyLogo, scanHint, poweredBy),
            ],
          ),
        ),
      );
    }

    return doc.save();
  }

  /// Una fila de dos celdas. Si la hoja quedó incompleta, el hueco va vacío —
  /// mejor que estirar el último cartel a media página.
  static pw.Widget _fila(
    List<String> hoja,
    int desde,
    String businessName,
    String Function(String) urlForLabel,
    pw.ImageProvider? businessLogo,
    pw.ImageProvider? foodlyLogo,
    String scanHint,
    String poweredBy,
  ) {
    pw.Widget celda(int i) => pw.Expanded(
          child: i < hoja.length
              ? _carta(
                  businessName: businessName,
                  label: hoja[i],
                  url: urlForLabel(hoja[i]),
                  businessLogo: businessLogo,
                  foodlyLogo: foodlyLogo,
                  scanHint: scanHint,
                  poweredBy: poweredBy,
                )
              : pw.SizedBox(),
        );

    return pw.Expanded(
      child: pw.Row(children: [celda(desde), _guiaVertical(), celda(desde + 1)]),
    );
  }

  // Guías de corte: apenas visibles al imprimir, suficientes para la guillotina.
  static pw.Widget _guiaVertical() => pw.Container(width: .4, color: const PdfColor.fromInt(0x22000000));

  static pw.Widget _guiaHorizontal() => pw.Container(height: .4, color: const PdfColor.fromInt(0x22000000));

  /// El cartel, replicando `MenuQrPoster` + `FoodlyQrCard`.
  static pw.Widget _carta({
    required String businessName,
    required String label,
    required String url,
    required pw.ImageProvider? businessLogo,
    required pw.ImageProvider? foodlyLogo,
    required String scanHint,
    required String poweredBy,
  }) {
    final matrix = QrDotMatrix.of(url);

    return pw.Container(
      color: PdfColors.white,
      padding: const pw.EdgeInsets.fromLTRB(18, 16, 18, 10),
      child: pw.Column(
        // Centrado y no `Spacer`: la celda A6 es bastante más alta que el
        // contenido, y empujar el pie al fondo dejaba un vacío en el medio.
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          // ── Logo del negocio, en círculo con anillo morado ──
          if (businessLogo != null) ...[
            pw.Container(
              width: 46,
              height: 46,
              decoration: pw.BoxDecoration(
                shape: pw.BoxShape.circle,
                border: pw.Border.all(color: const PdfColor.fromInt(0x2E79005D), width: 1.6),
              ),
              child: pw.ClipOval(child: pw.Image(businessLogo, fit: pw.BoxFit.cover)),
            ),
            pw.SizedBox(height: 8),
          ],

          pw.Text(
            printable(businessName.isEmpty ? 'Foodly' : businessName),
            textAlign: pw.TextAlign.center,
            maxLines: 2,
            style: pw.TextStyle(color: _purple, fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),

          // ── La mesa: lo único que distingue un cartel de otro ──
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: pw.BoxDecoration(
              color: _purple,
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Text(
              printable(label),
              style: pw.TextStyle(color: PdfColors.white, fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 12),

          // ── El QR, en su tarjeta (mismo borde que FoodlyQrCard) ──
          //
          // SIN la sombra del widget: el PDF no la difumina, la dibuja como un
          // rectángulo gris macizo detrás de la tarjeta. En pantalla suma
          // profundidad; impresa sería un manchón. El borde solo alcanza.
          pw.Container(
            padding: const pw.EdgeInsets.all(11),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              borderRadius: pw.BorderRadius.circular(18),
              border: pw.Border.all(color: const PdfColor.fromInt(0x2679005D), width: .8),
            ),
            child: pw.CustomPaint(
              size: const PdfPoint(160, 160),
              painter: (canvas, size) => _pintarQr(canvas, size, matrix),
            ),
          ),
          pw.SizedBox(height: 8),

          pw.Text(
            printable(scanHint),
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 8.5, color: PdfColor.fromInt(0x8C000000)),
          ),

          pw.SizedBox(height: 12),
          pw.Container(height: .7, color: const PdfColor.fromInt(0x1A79005D)),
          pw.SizedBox(height: 6),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                printable(poweredBy),
                style: const pw.TextStyle(fontSize: 6.5, color: PdfColor.fromInt(0x6B000000)),
              ),
              pw.SizedBox(width: 5),
              if (foodlyLogo != null) pw.SizedBox(height: 12, child: pw.Image(foodlyLogo)),
            ],
          ),
        ],
      ),
    );
  }

  /// Dibuja el QR con puntos redondos y ojos circulares, igual que
  /// `QrDataModuleShape.circle` + `QrEyeShape.circle` del widget.
  ///
  /// El PDF tiene el origen abajo a la izquierda, así que la `y` de la matriz
  /// se invierte: sin eso el QR sale espejado en vertical y no se lee.
  static void _pintarQr(PdfGraphics canvas, PdfPoint size, QrDotMatrix m) {
    final unit = size.x / m.size;
    final r = unit * .45; // algo menor que el módulo: deja ver los puntos sueltos

    canvas.setFillColor(_purple);

    for (var y = 0; y < m.size; y++) {
      for (var x = 0; x < m.size; x++) {
        if (!m.isOn(x, y) || m.isInEye(x, y)) continue;
        canvas.drawEllipse((x + .5) * unit, size.y - (y + .5) * unit, r, r);
      }
    }
    canvas.fillPath();

    for (final o in m.eyeOrigins) {
      final cx = (o.x + 3.5) * unit;
      final cy = size.y - (o.y + 3.5) * unit;

      // Anillo exterior: dos círculos rellenados con even-odd para el hueco.
      canvas.drawEllipse(cx, cy, unit * 3.5, unit * 3.5);
      canvas.drawEllipse(cx, cy, unit * 2.4, unit * 2.4);
      canvas.fillPath(evenOdd: true);

      // Centro macizo.
      canvas.drawEllipse(cx, cy, unit * 1.5, unit * 1.5);
      canvas.fillPath();
    }
  }
}
