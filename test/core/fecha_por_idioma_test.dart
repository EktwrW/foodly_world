import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// El idioma de las fechas lo manda el IDIOMA, no el país del GPS.
///
/// EL BUG (encontrado el 2026-09-07 preparando las capturas de las tiendas).
/// `getStringFormat` y `getBirthdayFormat` miraban `currentCountryCode` ANTES
/// que el idioma:
///
/// ```dart
/// if (countryCode == 'ES') return _dateStringES;
/// if (countryCode == 'PT') return _dateStringPT;   // ← ganaba este
/// if (lang == 'es')        return _dateStringLAT;
/// return _dateStringUS;
/// ```
///
/// Consecuencia real y publicada: la captura española del slide 4 de App Store
/// y Play dice **«31 de maio de 2026»**, porque se tomó en Portugal con la app
/// en español. El país ganó al idioma.
///
/// Y la comprobación de país no aportaba nada: los tres formatos largos usan el
/// MISMO patrón (`d 'de' MMMM 'de' yyyy`), así que lo único que cambiaba era el
/// nombre del mes — que es precisamente lo que tiene que seguir al idioma.
/// `es` y `es_ES` dan además el mismo nombre, o sea que la rama de España no
/// hacía absolutamente nada.
///
/// Ojo: tampoco había rama de idioma portugués. Un usuario con la app en
/// portugués fuera de Portugal caía al formato inglés.
void main() {
  setUpAll(() async {
    await initializeDateFormatting();
    if (!di.isRegistered<LocationService>()) di.registerSingleton<LocationService>(LocationService());
  });

  /// Pone el idioma de la app y el país del GPS, que es lo que discutían.
  void situarse({required String idioma, required String pais}) {
    Intl.defaultLocale = idioma;
    di<LocationService>().updateLocation(LocationDetailsDM(countryCode: pais));
  }

  tearDownAll(() => Intl.defaultLocale = null);

  final fecha = DateTime(2026, 5, 31);

  group('getStringFormat', () {
    const enEspanol = '31 de mayo de 2026';
    const enPortugues = '31 de maio de 2026';
    const enIngles = 'May 31, 2026';

    /// idioma, país, resultado esperado.
    const casos = <(String, String, String)>[
      ('es', 'ES', enEspanol),
      ('es', 'PT', enEspanol), // el que rompió la captura de la tienda
      ('es', 'US', enEspanol),
      ('es', 'AR', enEspanol),
      ('pt', 'PT', enPortugues),
      ('pt', 'BR', enPortugues), // no había rama de idioma portugués
      ('pt', 'US', enPortugues),
      ('en', 'US', enIngles),
      ('en', 'ES', enIngles), // interfaz en inglés con fecha en español
      ('en', 'PT', enIngles),
    ];

    for (final (idioma, pais, esperado) in casos) {
      test('app en $idioma desde $pais → "$esperado"', () {
        situarse(idioma: idioma, pais: pais);

        expect(fecha.getStringFormat, esperado);
      });
    }

    test('el país no cambia nada: mismo idioma, cinco países, misma cadena', () {
      final resultados = <String>{};
      for (final pais in ['ES', 'PT', 'US', 'BR', 'AR']) {
        situarse(idioma: 'es', pais: pais);
        resultados.add(fecha.getStringFormat);
      }

      expect(resultados, hasLength(1), reason: 'salieron $resultados');
    });
  });

  /// El ORDEN NUMERICO sí es regional: lo manda el país, no el idioma. Pero la
  /// regla estaba al revés — `MM/dd` era el caso por defecto y `dd/MM` la
  /// excepción, cuando en el mundo pasa justo lo contrario: Estados Unidos es
  /// prácticamente el único sitio que escribe el mes primero.
  ///
  /// El resultado era que la app en portugués desde Brasil escribía `05/31`, y
  /// cualquiera fuera de ES/PT sin la app en español también.
  group('getShortFormat: el orden lo manda el país', () {
    const mesPrimero = '05/31/2026';
    const diaPrimero = '31/05/2026';

    const casos = <(String, String, String)>[
      ('en', 'US', mesPrimero),
      ('es', 'US', mesPrimero), // en EE. UU. se escribe como en EE. UU.
      ('pt', 'BR', diaPrimero), // Brasil escribe el día primero
      ('en', 'BR', diaPrimero),
      ('pt', 'PT', diaPrimero),
      ('es', 'ES', diaPrimero),
      ('en', 'ES', diaPrimero),
      ('es', 'AR', diaPrimero),
      ('pt', 'FR', diaPrimero),
      ('en', 'FR', diaPrimero),
      ('en', 'MX', diaPrimero),
      ('es', 'MX', diaPrimero),
    ];

    for (final (idioma, pais, esperado) in casos) {
      test('app en $idioma desde $pais → "$esperado"', () {
        situarse(idioma: idioma, pais: pais);

        expect(fecha.getShortFormat, esperado);
      });
    }

    test('el idioma no cambia el orden: mismo país, tres idiomas, misma cadena', () {
      final resultados = <String>{};
      for (final idioma in ['es', 'pt', 'en']) {
        situarse(idioma: idioma, pais: 'BR');
        resultados.add(fecha.getShortFormat);
      }

      expect(resultados, hasLength(1), reason: 'salieron $resultados');
    });
  });

  /// Justifica haber borrado `_dateStringES` y `_birthdayStringES`, que
  /// formateaban con 'es_ES' en vez de 'es'. Si algun dia dejaran de coincidir,
  /// esto avisa y habria que devolver la distincion.
  test("'es' y 'es_ES' dan el mismo nombre de mes: la rama de España sobraba", () {
    for (var mes = 1; mes <= 12; mes++) {
      final d = DateTime(2026, mes, 15);
      expect(
        DateFormat("d 'de' MMMM 'de' yyyy", 'es').format(d),
        DateFormat("d 'de' MMMM 'de' yyyy", 'es_ES').format(d),
        reason: 'el mes $mes difiere entre es y es_ES',
      );
    }
  });

  group('getBirthdayFormat', () {
    const casos = <(String, String, String)>[
      ('es', 'ES', '31 de mayo'),
      ('es', 'PT', '31 de mayo'),
      ('pt', 'PT', '31º de maio'),
      ('pt', 'BR', '31º de maio'),
      ('en', 'US', 'May 31st'),
      ('en', 'PT', 'May 31st'),
    ];

    for (final (idioma, pais, esperado) in casos) {
      test('app en $idioma desde $pais → "$esperado"', () {
        situarse(idioma: idioma, pais: pais);

        expect(fecha.getBirthdayFormat, esperado);
      });
    }
  });
}
