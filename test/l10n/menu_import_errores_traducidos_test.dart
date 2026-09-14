import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';

/// Los errores del importador de menús vivieron escritos a mano en español
/// —en rioplatense— y se pintaban igual en inglés y en portugués. Esto fija
/// que estén traducidos de verdad en los tres idiomas.
void main() {
  const claves = [
    'aiMenuImportErrorPicker',
    'aiMenuImportErrorNoPhotos',
    'aiMenuImportErrorUpload',
    'aiMenuImportErrorNoContent',
    'aiMenuImportErrorNothingToImport',
    'aiMenuImportErrorSave',
  ];

  Map<String, dynamic> arb(String idioma) =>
      jsonDecode(File('lib/l10n/intl_$idioma.arb').readAsStringSync()) as Map<String, dynamic>;

  test('las seis claves existen y no están vacías en los tres idiomas', () {
    for (final idioma in ['en', 'es', 'pt']) {
      final textos = arb(idioma);
      for (final clave in claves) {
        expect(textos.containsKey(clave), isTrue, reason: 'falta $clave en intl_$idioma.arb');
        expect((textos[clave] as String).trim(), isNotEmpty, reason: '$clave vacía en intl_$idioma.arb');
      }
    }
  });

  test('están traducidas: ningún idioma repite el texto de otro', () {
    final en = arb('en'), es = arb('es'), pt = arb('pt');

    for (final clave in claves) {
      expect(en[clave], isNot(es[clave]), reason: '$clave sin traducir entre en y es');
      expect(en[clave], isNot(pt[clave]), reason: '$clave sin traducir entre en y pt');
      expect(es[clave], isNot(pt[clave]), reason: '$clave sin traducir entre es y pt');
    }
  });

  test('el español no vuelve al voseo: el resto de la app tutea', () {
    final es = arb('es');
    // Sin \b al final: en Dart la clase \w es ASCII, así que no hay frontera
    // de palabra después de una vocal acentuada y «Seleccioná» no casaba.
    final voseo = RegExp(r'(?:^|[^A-Za-zÀ-ÿ])(Intentá|Seleccioná|Agregá|Probá|Verificá|volvé)');

    for (final clave in claves) {
      expect(voseo.hasMatch(es[clave] as String), isFalse, reason: '$clave usa voseo: ${es[clave]}');
    }
  });

  testWidgets('S resuelve las seis en cada idioma', (tester) async {
    for (final idioma in ['en', 'es', 'pt']) {
      await S.load(Locale(idioma));
      final textos = [
        S.current.aiMenuImportErrorPicker,
        S.current.aiMenuImportErrorNoPhotos,
        S.current.aiMenuImportErrorUpload,
        S.current.aiMenuImportErrorNoContent,
        S.current.aiMenuImportErrorNothingToImport,
        S.current.aiMenuImportErrorSave,
      ];
      for (var i = 0; i < textos.length; i++) {
        expect(textos[i].trim(), isNotEmpty, reason: '${claves[i]} vacía en $idioma');
        expect(textos[i], isNot(claves[i]), reason: '${claves[i]} devolvió la clave en $idioma');
      }
    }
  });
}
