import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/location_service.dart';

/// EL TEXTO DE LA DIRECCIÓN EN EL CHIP DE UBICACIÓN.
///
/// EL BUG (2026-09-05). Se armaba concatenando a mano —`'$address, $city.'`—
/// así que en cuanto una parte llegaba vacía quedaban los separadores sueltos.
/// El caso que se vio en pantalla fue `"Rua Irmãos Bonina, ."`: dirección sin
/// ciudad. El tooltip tenía la misma familia de fallos, con hasta tres comas
/// seguidas.
///
/// Ya había un parche para UNA combinación. Estos tests cubren la clase, que
/// es lo que faltaba: cualquier subconjunto de partes presentes tiene que dar
/// un texto legible.
void main() {
  String fmt(List<String?> parts) => LocationService.formatAddress(parts);

  test('todas las partes presentes', () {
    expect(fmt(['Rua Rui Faleiro', 'Covilhã', '6200', 'Portugal']), 'Rua Rui Faleiro, Covilhã, 6200, Portugal.');
  });

  test('EL CASO REPORTADO: dirección sin ciudad', () {
    expect(fmt(['Rua Irmãos Bonina', '']), 'Rua Irmãos Bonina.');
  });

  test('ciudad sin dirección', () {
    expect(fmt(['', 'Covilhã']), 'Covilhã.');
  });

  test('huecos en medio', () {
    expect(fmt(['Rua Rui Faleiro', '', '6200', 'Portugal']), 'Rua Rui Faleiro, 6200, Portugal.');
  });

  test('nulos mezclados con vacíos', () {
    expect(fmt([null, 'Covilhã', null, '']), 'Covilhã.');
  });

  test('sin nada, cadena vacía: el llamador decide el reemplazo', () {
    expect(fmt([]), '');
    expect(fmt(['', null, '   ']), '');
    expect(fmt([',', '.', ' , ']), '');
  });

  test('las partes vienen con separadores pegados y no se duplican', () {
    expect(fmt(['Rua Rui Faleiro,', ' Covilhã ']), 'Rua Rui Faleiro, Covilhã.');
    expect(fmt(['Covilhã.', 'Portugal']), 'Covilhã, Portugal.');
  });

  /// El geocoding a veces devuelve la misma cadena como dirección y como
  /// ciudad; repetirla no aporta y queda raro.
  test('no repite una parte igual a la anterior', () {
    expect(fmt(['Covilhã', 'Covilhã']), 'Covilhã.');
    expect(fmt(['covilhã', 'Covilhã', 'Portugal']), 'covilhã, Portugal.');
  });

  test('una parte que se repite pero NO seguida sí se conserva', () {
    expect(fmt(['Covilhã', 'Portugal', 'Covilhã']), 'Covilhã, Portugal, Covilhã.');
  });

  /// La coma dentro de una parte es legítima y no se toca.
  test('respeta la puntuación interna de una parte', () {
    expect(fmt(['Rua Rui Faleiro, 12', 'Covilhã']), 'Rua Rui Faleiro, 12, Covilhã.');
  });
}
