import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/views/business/reservations/cubit/manage_reservations_cubit.dart';
import 'package:logger/logger.dart';

/// APROBAR UNA RESERVA REVENTABA, Y LAS SEIS ACCIONES CON ELLA.
///
/// `_performAction` declaraba su callback como `Future<dynamic> Function(String)`,
/// así que `result` era `dynamic` y `result.when(...)` se resolvía en tiempo de
/// ejecución. Pero `when` NO es un método de instancia: freezed 3 lo genera en
/// una **extensión** (`extension ApiResultPatterns<T> on ApiResult<T>`), y las
/// extensiones se resuelven de forma ESTÁTICA — sobre un receptor `dynamic` no
/// se encuentran. De ahí el
///
///     NoSuchMethodError: Class '_Success<ReservationActionResponseDM>'
///     has no instance method 'when'.
///
/// El analizador no lo ve —una llamada dinámica es legal— y la excepción salta
/// DESPUÉS de `emit(loading)`, así que la pantalla se queda en el shimmer para
/// siempre. Las seis acciones del manager pasan por aquí.
class _ClienteInerte implements ReservationClient {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

const _pendiente = ReservationDM(
  reservationUuid: 'r1',
  businessUuid: 'b1',
  partySize: 2,
);

class _RepoDeAcciones extends ReservationRepo {
  _RepoDeAcciones() : super(reservationClient: _ClienteInerte());

  /// La respuesta de la acción trae la reserva YA actualizada: es lo que el
  /// cubit mete en la lista sin releer.
  static const confirmada = ReservationDM(
    reservationUuid: 'r1',
    businessUuid: 'b1',
    partySize: 2,
    status: ReservationStatus.confirmed,
  );

  int confirmaciones = 0;

  @override
  Future<ApiResult<ReservationsResponseDM>> getBusinessReservations(
    String businessUuid, {
    int? page,
    int? perPage,
    String? status,
    String? date,
    String? bookingType,
  }) async =>
      const ApiResult.success(ReservationsResponseDM(reservations: [_pendiente]));

  @override
  Future<ApiResult<ReservationActionResponseDM>> confirmReservation(String uuid) async {
    confirmaciones++;
    return const ApiResult.success(
      ReservationActionResponseDM(success: true, reservation: confirmada),
    );
  }

  @override
  Future<ApiResult<ReservationActionResponseDM>> markNoShow(String uuid) async =>
      const ApiResult.success(ReservationActionResponseDM(success: true, reservation: confirmada));
}

Logger get _mudo => Logger(level: Level.off);

void main() {
  late _RepoDeAcciones repo;
  late ManageReservationsCubit cubit;

  setUp(() async {
    repo = _RepoDeAcciones();
    cubit = ManageReservationsCubit(
      reservationRepo: repo,
      logger: _mudo,
      businessUuid: 'b1',
    );
    // El constructor ya dispara `fetchReservations()`.
    await pumpEventQueue();
  });

  tearDown(() => cubit.close());

  /// Si [cubit] se quedó pintando el esqueleto.
  bool enCarga(ManageReservationsCubit c) => c.state.when(
        initial: (_) => false,
        loading: (_) => true,
        loaded: (_) => false,
        error: (_, __) => false,
      );

  test('aprobar una reserva no revienta y saca la pantalla del shimmer', () async {
    expect(enCarga(cubit), isFalse, reason: 'premisa: la carga inicial ya terminó');

    final ok = await cubit.confirmReservation('r1');

    expect(repo.confirmaciones, 1, reason: 'premisa: la acción llegó al repo');
    expect(ok, isTrue);
    expect(enCarga(cubit), isFalse, reason: 'la pantalla se quedó en el shimmer');
  });

  /// Y la reserva devuelta reemplaza a la suya en la lista, que es la otra
  /// mitad de `_performAction` — la que el shimmer eterno tapaba.
  test('la reserva devuelta reemplaza a la suya en la lista', () async {
    await cubit.confirmReservation('r1');

    final actualizada = cubit.state.when(
      initial: (vm) => vm,
      loading: (vm) => vm,
      loaded: (vm) => vm,
      error: (vm, _) => vm,
    ).reservations.singleWhere((r) => r.reservationUuid == 'r1');

    expect(actualizada.status, ReservationStatus.confirmed);
  });

  /// Las SEIS acciones comparten `_performAction`, así que una sola bastaba
  /// para romperlas todas. Una segunda deja fijado que no es cosa de
  /// `confirmReservation`.
  test('y lo mismo por otra de las seis acciones', () async {
    expect(await cubit.markNoShow('r1'), isTrue);
    expect(enCarga(cubit), isFalse);
  });
}
