import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/reservations/reservation_client.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/views/business/reservations/cubit/manage_reservations_cubit.dart';
import 'package:foodly_world/ui/views/business/reservations/manage_reservations_page.dart';
import 'package:foodly_world/ui/views/reservations/cubit/my_reservations_cubit.dart';
import 'package:foodly_world/ui/views/reservations/my_reservations_page.dart';
import 'package:logger/logger.dart';

/// El vacio de reservas decia SIEMPRE «aun no hay reservas», tuvieras 0 o 30
/// filtradas por un estado que no casa. Son dos situaciones distintas con
/// salidas distintas, y este banco fija que se distingan.
///
/// La segunda cosa que fija es mas fina y es la que se pierde en un refactor:
/// **cuando el unico filtro activo es el segmentado de tipo, NO puede haber
/// boton**. Ese control guarda su seleccion en su propio `State` y en prefs, no
/// en el cubit, asi que apagar el filtro desde aqui lo dejaria marcado sobre
/// una lista sin filtrar. El desplegable de estado si se puede apagar: lo pinta
/// `vm.statusFilter`.
class _ClienteInerte implements ReservationClient {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

/// Devuelve siempre CERO reservas, que es el caso que se esta midiendo. El
/// camino real del cubit se recorre entero: los filtros que viajan a la
/// peticion salen del vm y la respuesta vuelve a el.
class _RepoVacio extends ReservationRepo {
  _RepoVacio() : super(reservationClient: _ClienteInerte());

  @override
  Future<ApiResult<ReservationsResponseDM>> getMyReservations({
    int? page,
    int? perPage,
    String? status,
    String? bookingType,
  }) async =>
      const ApiResult.success(ReservationsResponseDM());

  @override
  Future<ApiResult<ReservationsResponseDM>> getBusinessReservations(
    String businessUuid, {
    int? page,
    int? perPage,
    String? status,
    String? date,
    String? bookingType,
  }) async =>
      const ApiResult.success(ReservationsResponseDM());
}

/// Apagado: un fallo dentro de un doble no tiene por que ensuciar la salida.
Logger get _mudo => Logger(level: Level.off);

class _CubitDeComensal extends MyReservationsCubit {
  _CubitDeComensal({ReservationStatus? estado, BookingType? tipo})
      : super(reservationRepo: _RepoVacio(), logger: _mudo) {
    // Poner un filtro ya dispara la peticion. Sin ninguno hay que dispararla a
    // mano, igual que hace `_BookingTypeFilter` en la pagina real: el estado
    // `initial` pinta el esqueleto, no el vacio.
    if (estado != null) setStatusFilter(estado);
    if (tipo != null) setBookingTypeFilter(tipo);
    if (estado == null && tipo == null) fetchReservations();
  }
}

class _CubitDeDueno extends ManageReservationsCubit {
  _CubitDeDueno({String? filtro, FoodlyCategories? categoria})
      : super(
          reservationRepo: _RepoVacio(),
          logger: _mudo,
          businessUuid: 'negocio-1',
          initialFilter: filtro,
          businessCategory: categoria,
        );
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<MyReservationsCubit> pintarComensal(
    WidgetTester tester, {
    ReservationStatus? estado,
    BookingType? tipo,
  }) async {
    final cubit = _CubitDeComensal(estado: estado, tipo: tipo);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<MyReservationsCubit>.value(value: cubit, child: const ReservationsList()),
      ),
    ));
    await tester.pumpAndSettle();
    return cubit;
  }

  Future<void> pintarDueno(WidgetTester tester, {String? filtro, FoodlyCategories? categoria}) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<ManageReservationsCubit>.value(
          value: _CubitDeDueno(filtro: filtro, categoria: categoria),
          child: const ManagerReservationsList(),
        ),
      ),
    ));
    await tester.pumpAndSettle();
  }

  FoodlyEmptyView vacio(WidgetTester tester) => tester.widget<FoodlyEmptyView>(find.byType(FoodlyEmptyView));

  group('comensal', () {
    testWidgets('sin filtro es un vacio de novato, sin salida', (tester) async {
      await pintarComensal(tester);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.nuevo);
      expect(v.title, S.current.myReservationsEmptyTitle);
      expect(v.subtitle, S.current.myReservationsEmptyBody);
      expect(v.onAction, isNull, reason: 'no hay filtro que quitar');
    });

    testWidgets('con filtro de estado es un vacio de filtro y ofrece quitarlo', (tester) async {
      await pintarComensal(tester, estado: ReservationStatus.cancelled);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.filtro);
      expect(v.title, S.current.reservationsFilterEmptyTitle);
      expect(v.subtitle, S.current.reservationsFilterEmptyBody);
      expect(find.text(S.current.viewAllReservations), findsOneWidget);
    });

    testWidgets('el boton apaga el filtro de estado de verdad', (tester) async {
      final cubit = await pintarComensal(tester, estado: ReservationStatus.pending);
      expect(cubit.state.vm.statusFilter, ReservationStatus.pending);

      await tester.tap(find.text(S.current.viewAllReservations));
      await tester.pumpAndSettle();

      expect(cubit.state.vm.statusFilter, isNull);
      expect(vacio(tester).intent, FoodlyEmptyIntent.nuevo, reason: 'quitado el filtro, vuelve a ser un vacio de novato');
    });

    testWidgets('solo con el segmentado de tipo dice filtro pero NO pinta boton', (tester) async {
      await pintarComensal(tester, tipo: BookingType.service);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.filtro);
      expect(
        v.onAction,
        isNull,
        reason: 'el segmentado guarda su seleccion fuera del cubit; apagarlo desde aqui lo desincroniza',
      );
      expect(find.text(S.current.viewAllReservations), findsNothing);
    });
  });

  group('dueno', () {
    testWidgets('sin filtro es un vacio de novato', (tester) async {
      await pintarDueno(tester);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.nuevo);
      expect(v.title, S.current.manageReservationsEmptyTitle);
      expect(v.subtitle, S.current.manageReservationsEmptyBody);
      expect(v.onAction, isNull);
    });

    testWidgets('la vertical del negocio NO cuenta como filtro', (tester) async {
      // Un negocio de catering arrastra `bookingTypeFilter: service` desde su
      // categoria, no desde un control. Contarlo como filtro le ofreceria al
      // dueno quitar algo que no puso y que el boton no puede quitar.
      await pintarDueno(tester, categoria: FoodlyCategories.cateringAndChefs);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.nuevo);
      expect(v.onAction, isNull);
    });

    testWidgets('con filtro es un vacio de filtro con salida', (tester) async {
      await pintarDueno(tester, filtro: 'today');

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.filtro);
      expect(v.title, S.current.reservationsFilterEmptyTitle);
      expect(find.text(S.current.viewAllReservations), findsOneWidget);
    });
  });
}
