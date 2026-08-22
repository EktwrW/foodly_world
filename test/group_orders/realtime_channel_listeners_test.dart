import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';

/// Varios consumidores sobre UN canal.
///
/// EL BUG (reportado en device). El chip flotante y la página de la orden
/// observan el MISMO `private-group-order.{uuid}`, pero el registro guardaba
/// UN solo callback por canal. Al abrir la página, su callback reemplazaba en
/// silencio al del chip; al cerrarla, el `cancel` borraba el canal entero.
/// Resultado: después de entrar una vez a la orden, el chip quedaba sordo
/// para siempre — y no se recuperaba, porque `watchActive` se cree suscrito
/// (`_watchedUuid` sigue seteado) y no reintenta.
///
/// El invitado agregaba platos desde el menú y el monto del chip no se movía
/// ante nada de lo que hiciera el anfitrión.
void main() {
  test('dos oyentes en el mismo canal reciben AMBOS el evento', () {
    final canal = ChannelListeners(eventName: 'group-order.touched');
    var chip = 0;
    var pagina = 0;

    canal.add(1, () => chip++);
    canal.add(2, () => pagina++);
    canal.notificar();

    expect(chip, 1);
    expect(pagina, 1);
  });

  test('el segundo en llegar no pisa al primero', () {
    final canal = ChannelListeners(eventName: 'e');
    var chip = 0;

    canal.add(1, () => chip++);
    canal.add(2, () {});
    canal.notificar();

    expect(chip, 1, reason: 'el chip seguía enganchado al abrirse la página');
  });

  test('cancelar uno deja vivo al otro, y el canal NO se cierra', () {
    final canal = ChannelListeners(eventName: 'e');
    var chip = 0;

    canal.add(1, () => chip++);
    canal.add(2, () {});

    final sinOyentes = canal.remove(2); // se cerró la página

    expect(sinOyentes, isFalse, reason: 'todavía queda el chip: no hay que soltar el canal');
    canal.notificar();
    expect(chip, 1);
  });

  test('cuando se va el último, el canal avisa que quedó vacío', () {
    final canal = ChannelListeners(eventName: 'e');
    canal.add(1, () {});

    expect(canal.remove(1), isTrue);
    expect(canal.vacio, isTrue);
  });

  test('quitar un id que no está no vacía el canal por accidente', () {
    final canal = ChannelListeners(eventName: 'e');
    canal.add(1, () {});

    expect(canal.remove(99), isFalse);
    expect(canal.vacio, isFalse);
  });

  test('un oyente puede cancelarse desde su propio callback', () {
    // La página se cierra AL recibir el evento (la orden se borró). Sin la
    // copia previa, iterar el mapa mientras se modifica revienta.
    final canal = ChannelListeners(eventName: 'e');
    var chip = 0;

    canal.add(1, () => chip++);
    canal.add(2, () => canal.remove(2));

    expect(canal.notificar, returnsNormally);
    expect(chip, 1);
  });
}
