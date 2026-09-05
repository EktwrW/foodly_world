import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';

/// LA VIGENCIA DE UNA PROMO SE MIDE POR DÍA DE CALENDARIO, NO POR INSTANTE.
///
/// EL BUG (2026-09-05). Una promo que vencía HOY aparecía en la home pero no
/// en promociones guardadas, ni en las pestañas de promos del cliente y del
/// dueño. La home la filtra el backend, que usa
/// `whereDate('expire_date', '>=', $today)` — o sea que la promo vale todo su
/// último día. El front comparaba instantes (`expireDate.isAfter(now)`), así
/// que la daba por terminada a las 00:00 de ese mismo día.
///
/// Y no estaba en un sitio: la misma regla estaba reimplementada en CINCO
/// (los dos modelos y los dos view models, más la página de guardadas). Ahora
/// vive solo en los modelos y los demás delegan.
void main() {
  final hoy = DateTime.now();
  DateTime dia(int delta) => DateTime(hoy.year, hoy.month, hoy.day).add(Duration(days: delta));

  PromotionDM promo(DateTime inicio, DateTime fin) => PromotionDM(
        id: 1,
        uuid: 'p1',
        title: 't',
        description: 'd',
        startDate: inicio,
        expireDate: fin,
        business: null,
        promoDays: const PromoDaysDM(),
      );

  NearbyPromotionDM nearby(DateTime? inicio, DateTime? fin) =>
      NearbyPromotionDM(uuid: 'p1', title: 't', startDate: inicio, expireDate: fin);

  group('PromotionDM', () {
    test('la que vence hoy sigue activa — el caso que se reportó', () {
      final p = promo(dia(-10), dia(0));

      expect(p.isActive, isTrue);
      expect(p.isExpired, isFalse);
      expect(p.isUpcoming, isFalse);
    });

    test('la que empieza hoy ya está activa', () {
      final p = promo(dia(0), dia(10));

      expect(p.isActive, isTrue);
      expect(p.isUpcoming, isFalse);
    });

    test('la que venció ayer está expirada', () {
      final p = promo(dia(-10), dia(-1));

      expect(p.isActive, isFalse);
      expect(p.isExpired, isTrue);
    });

    test('la que empieza mañana está por venir', () {
      final p = promo(dia(1), dia(10));

      expect(p.isActive, isFalse);
      expect(p.isUpcoming, isTrue);
      expect(p.isExpired, isFalse);
    });

    /// El instante dentro del día no puede cambiar el resultado: es
    /// exactamente lo que fallaba antes.
    test('la hora del día no cambia nada', () {
      final finTemprano = DateTime(hoy.year, hoy.month, hoy.day);
      final finTarde = DateTime(hoy.year, hoy.month, hoy.day, 23, 59);

      expect(promo(dia(-1), finTemprano).isActive, isTrue);
      expect(promo(dia(-1), finTarde).isActive, isTrue);
    });

    /// Los tres estados son excluyentes y cubren todos los casos: si dos dan
    /// `true` a la vez, una promo sale en dos pestañas.
    test('los tres estados son excluyentes', () {
      for (final p in [promo(dia(-10), dia(0)), promo(dia(0), dia(0)), promo(dia(-5), dia(-1)), promo(dia(2), dia(9))]) {
        expect([p.isActive, p.isUpcoming, p.isExpired].where((e) => e).length, 1,
            reason: 'activa=${p.isActive} próxima=${p.isUpcoming} expirada=${p.isExpired}');
      }
    });
  });

  group('NearbyPromotionDM', () {
    test('la que vence hoy sigue activa', () {
      expect(nearby(dia(-10), dia(0)).isActive, isTrue);
    });

    test('la que empieza hoy ya está activa', () {
      expect(nearby(dia(0), dia(10)).isActive, isTrue);
      expect(nearby(dia(0), dia(10)).isUpcoming, isFalse);
    });

    test('la que venció ayer no está activa', () {
      expect(nearby(dia(-10), dia(-1)).isActive, isFalse);
    });

    test('la que empieza mañana está por venir', () {
      expect(nearby(dia(1), dia(10)).isUpcoming, isTrue);
      expect(nearby(dia(1), dia(10)).isActive, isFalse);
    });

    test('sin fechas se asume vigente, como antes', () {
      expect(nearby(null, null).isActive, isTrue);
      expect(nearby(null, null).isUpcoming, isFalse);
    });
  });

  /// Los dos modelos describen la misma promo en sitios distintos de la app
  /// (la home usa el ligero, el detalle usa el completo). Si no coinciden,
  /// vuelve el bug: sale en una pantalla y no en la otra.
  test('los dos modelos coinciden en los mismos días', () {
    for (var d = -3; d <= 3; d++) {
      final completo = promo(dia(-10), dia(d));
      final ligero = nearby(dia(-10), dia(d));

      expect(ligero.isActive, completo.isActive, reason: 'difieren con vencimiento en el día $d');
    }
  });
}
