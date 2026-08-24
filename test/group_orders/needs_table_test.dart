import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// F4c — ¿cuándo se le pregunta la mesa al comensal?
///
/// El diálogo es fricción, así que solo puede aparecer cuando de verdad hace
/// falta: negocio que sirve en mesa Y orden sin mesa. El que entró por el QR
/// de la suya no lo ve nunca, y en un bar de mostrador tampoco existe.
void main() {
  GroupOrderDM orden({bool sirveEnMesa = true, String? mesa}) =>
      GroupOrderDM(uuid: 'o1', businessTableService: sirveEnMesa, tableLabel: mesa);

  test('sirve en mesa y no hay mesa: se pregunta', () {
    expect(orden().needsTable, isTrue);
  });

  test('vino del QR con su mesa: no se pregunta', () {
    expect(orden(mesa: 'Mesa 7').needsTable, isFalse);
  });

  test('mostrador o food truck: no se pregunta nunca', () {
    expect(orden(sirveEnMesa: false).needsTable, isFalse);
    expect(orden(sirveEnMesa: false, mesa: 'Mesa 7').needsTable, isFalse);
  });

  test('una mesa en blanco no cuenta como mesa', () {
    // Si contara, el comensal no vería el diálogo y el pedido saldría sin
    // saber a dónde llevarlo — que es el bug entero.
    expect(orden(mesa: '').needsTable, isTrue);
    expect(orden(mesa: '   ').needsTable, isTrue);
  });

  test('por defecto un negocio NO sirve en mesa', () {
    // El default del backend es false y el DM tiene que coincidir: si el
    // payload viniera sin el campo, preguntar sería fricción inventada.
    expect(const GroupOrderDM(uuid: 'o1').businessTableService, isFalse);
    expect(const GroupOrderDM(uuid: 'o1').needsTable, isFalse);
  });
}
