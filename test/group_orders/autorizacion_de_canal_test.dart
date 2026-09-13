import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/download_client.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';

/// La orden se quedaba muda sin que nada fallara.
///
/// `connect()` funciona → `_socketHealthy = true` → se apaga el polling. Pero la
/// suscripción al canal privado pasa por `authorize`, que salía con un `Dio()`
/// sin ningún techo. Si se colgaba, el canal no se suscribía nunca y el fallback
/// ya estaba apagado: ni evento, ni polling, ni error.
///
/// Y el techo solo no basta: al authorizer lo llama el PLUGIN, fuera del `try`
/// de `_connect`, así que su fallo no llega a aquel `catch`.
class _AuthFalso implements AuthSessionService {
  @override
  UserSessionDM? userSessionDM;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Adaptador que siempre falla, como una red que traga paquetes.
class _RedCaida implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(RequestOptions o, Stream<List<int>>? s, Future<void>? c) async =>
      throw DioException.connectionError(requestOptions: o, reason: 'sin red');

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const canal = 'private-group-order.o1';
  late GroupOrderRealtimeService servicio;

  setUp(() {
    final dio = Dio()..httpClientAdapter = _RedCaida();
    servicio = GroupOrderRealtimeService(authSession: _AuthFalso(), clienteDeAutorizacion: dio);
  });

  tearDown(() => servicio.unwatchAll());

  group('una autorización fallida no deja la orden muda', () {
    test('enciende el polling', () async {
      await expectLater(servicio.authorize(canal, 'sock-1', null), throwsA(isA<DioException>()));

      expect(servicio.pollingActivo, isTrue, reason: 'sin socket y sin polling, no queda nada');
    });

    test('y arma el reintento del socket', () async {
      await expectLater(servicio.authorize(canal, 'sock-1', null), throwsA(isA<DioException>()));

      expect(servicio.reintentoProgramado, isTrue);
    });

    /// El canal queda anotado como suscrito ANTES de que la autorización falle,
    /// y `_connect` salta los que ya están en el set: sin sacarlo, el reintento
    /// no volvería a pedirlo nunca.
    test('y saca el canal de los suscritos para que el reintento lo repita', () async {
      servicio.suscritosNativos.add(canal);

      await expectLater(servicio.authorize(canal, 'sock-1', null), throwsA(isA<DioException>()));

      expect(servicio.suscritosNativos, isNot(contains(canal)));
    });

    test('y el fallo se propaga al plugin, no se lo traga', () async {
      await expectLater(servicio.authorize(canal, 'sock-1', null), throwsA(isA<DioException>()));
    });
  });

  group('los clientes sin techo ya no existen', () {
    test('el de autorización trae los suyos', () {
      final o = GroupOrderRealtimeService.dioDeAutorizacion().options;

      expect(o.connectTimeout, GroupOrderRealtimeService.connectTimeoutDeAutorizacion);
      expect(o.receiveTimeout, GroupOrderRealtimeService.receiveTimeoutDeAutorizacion);
    });

    test('y el de descargas también', () {
      final o = dioDeDescarga().options;

      expect(o.connectTimeout, connectTimeoutDeDescarga);
      expect(o.receiveTimeout, receiveTimeoutDeDescarga);
    });
  });
}
