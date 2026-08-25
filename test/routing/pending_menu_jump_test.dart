import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/pending_menu_jump.dart';

/// El QR del menú lleva AL MENÚ, no al perfil del negocio.
///
/// EL PROBLEMA. El QR codifica `menu.foodly.solutions/{businessUuid}`, y el
/// comensal con sesión aterrizaba en el PERFIL: tenía que encontrar y tocar
/// "Menu" para poder pedir, cuando escaneó desde su mesa justamente para eso.
/// No se puede redirigir directo —la ruta del menú pide el uuid del MENÚ y el
/// QR trae el del NEGOCIO, y cambiar lo que codifica invalidaría todos los QRs
/// ya impresos y pegados en las mesas— así que la intención se estaciona y la
/// consume la pantalla del negocio cuando ya lo cargó.
///
/// Lo que se protege acá es que sea de UN SOLO USO: la pantalla emite `loaded`
/// también en refetches y rebuilds, y sin consumir la intención el comensal
/// quedaría rebotando al menú cada vez que intente volver al perfil.
void main() {
  setUp(PendingMenuJump.clear);

  test('estacionado, el salto ocurre una vez', () {
    PendingMenuJump.park('b1');

    expect(PendingMenuJump.take('b1'), isTrue);
  });

  test('y no vuelve a ocurrir: un refetch no rebota al comensal', () {
    PendingMenuJump.park('b1');
    PendingMenuJump.take('b1');

    expect(PendingMenuJump.take('b1'), isFalse);
  });

  test('sin escanear nada, no se salta', () {
    expect(PendingMenuJump.take('b1'), isFalse);
  });

  test('el salto es de SU negocio: no se filtra a otro', () {
    // Escanea el QR del negocio A, navega al perfil del B: el B no debe
    // secuestrar el salto ni mandarlo a un menú que no pidió.
    PendingMenuJump.park('b1');

    expect(PendingMenuJump.take('b2'), isFalse);
    expect(PendingMenuJump.take('b1'), isTrue, reason: 'el de A sigue en pie');
  });

  test('un uuid vacío no estaciona nada', () {
    PendingMenuJump.park('');

    expect(PendingMenuJump.take(''), isFalse);
  });

  test('clear cancela un salto pendiente', () {
    PendingMenuJump.park('b1');
    PendingMenuJump.clear();

    expect(PendingMenuJump.take('b1'), isFalse);
  });
}
