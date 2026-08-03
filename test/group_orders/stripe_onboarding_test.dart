import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/stripe_connect_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/stripe_onboarding_banner.dart';
import 'package:logger/logger.dart';

/// F4a-6 — onboarding de pagos: cubit (status/onboard/refresh) y banner
/// (dos estados de la maqueta 3 + launch del AccountLink).

class _FakeRepo implements GroupOrderRepo {
  ApiResult<StripeConnectStatusDM>? statusOutcome;
  ApiResult<StripeOnboardResponseDM>? onboardOutcome;
  int statusCalls = 0;

  @override
  Future<ApiResult<StripeConnectStatusDM>> stripeStatus(String businessUuid) async {
    statusCalls++;
    return statusOutcome!;
  }

  @override
  Future<ApiResult<StripeOnboardResponseDM>> stripeOnboard(String businessUuid) async =>
      onboardOutcome!;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  late _FakeRepo repo;
  late StripeOnboardingCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = StripeOnboardingCubit(
      repo: repo,
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
  });

  tearDown(() => cubit.close());

  group('StripeOnboardingCubit', () {
    test('load: refleja charges/payouts del backend', () async {
      repo.statusOutcome = const ApiResult.success(
        StripeConnectStatusDM(connected: true, chargesEnabled: true, payoutsEnabled: true),
      );

      await cubit.load();

      expect(cubit.state.loading, isFalse);
      expect(cubit.state.chargesEnabled, isTrue);
      expect(cubit.state.payoutsEnabled, isTrue);
    });

    test('load con fallo de red: no asume nada (chargesEnabled queda null)', () async {
      repo.statusOutcome = const ApiResult.failure(AppRequestException(error: 'down'));

      await cubit.load();

      expect(cubit.state.loading, isFalse);
      expect(cubit.state.chargesEnabled, isNull);
    });

    test('startOnboarding devuelve la URL del AccountLink (o null si falla)', () async {
      repo.onboardOutcome = const ApiResult.success(
        StripeOnboardResponseDM(onboardingUrl: 'https://connect.stripe.com/setup/x'),
      );
      expect(await cubit.startOnboarding(), 'https://connect.stripe.com/setup/x');

      repo.onboardOutcome = const ApiResult.failure(AppRequestException(error: 'boom'));
      expect(await cubit.startOnboarding(), isNull);
    });
  });

  group('StripeOnboardingBanner', () {
    Widget app(Future<void> Function(Uri)? onLaunch) => MaterialApp(
          home: BlocProvider.value(
            value: cubit,
            child: Scaffold(body: StripeOnboardingBanner(onLaunch: onLaunch)),
          ),
        );

    testWidgets('sin datos: invisible; sin activar: banner con CTA que abre '
        'el AccountLink; refresco re-consulta', (tester) async {
      // Sin consulta aún → nada.
      await tester.pumpWidget(app(null));
      expect(find.text(S.current.managerActivateWithStripe), findsNothing);

      // Sin activar → banner CTA.
      repo.statusOutcome = const ApiResult.success(StripeConnectStatusDM());
      await cubit.load();
      await tester.pumpAndSettle();
      expect(find.text(S.current.managerActivatePaymentsTitle), findsOneWidget);

      // CTA → onboarding → launch de la URL (hook de test).
      Uri? launched;
      repo.onboardOutcome = const ApiResult.success(
        StripeOnboardResponseDM(onboardingUrl: 'https://connect.stripe.com/setup/x'),
      );
      await tester.pumpWidget(app((u) async => launched = u));
      await tester.tap(find.text(S.current.managerActivateWithStripe));
      await tester.pumpAndSettle();
      expect(launched.toString(), 'https://connect.stripe.com/setup/x');

      // Botón de refresco → re-consulta el estado.
      final callsBefore = repo.statusCalls;
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
      expect(repo.statusCalls, callsBefore + 1);
    });

    testWidgets('al volver a la app (resumed, p. ej. cerraste el navegador '
        'del onboarding) re-consulta solo y el banner pasa a activo', (tester) async {
      // Estado inicial: sin activar → banner CTA.
      repo.statusOutcome = const ApiResult.success(StripeConnectStatusDM());
      await cubit.load();
      await tester.pumpWidget(app(null));
      await tester.pumpAndSettle();
      expect(find.text(S.current.managerActivatePaymentsTitle), findsOneWidget);

      // El onboarding terminó en el navegador: Stripe ya reporta charges.
      repo.statusOutcome = const ApiResult.success(
        StripeConnectStatusDM(connected: true, chargesEnabled: true, payoutsEnabled: true),
      );

      // La app se fue a background (navegador) y volvió.
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();

      // Sin tocar nada: confirmación activa, CTA fuera.
      expect(find.text(S.current.managerPaymentsActive), findsOneWidget);
      expect(find.text(S.current.managerActivateWithStripe), findsNothing);
    });

    testWidgets('con pagos YA activos, resumed no re-consulta (cero llamadas '
        'de más)', (tester) async {
      repo.statusOutcome = const ApiResult.success(
        StripeConnectStatusDM(connected: true, chargesEnabled: true, payoutsEnabled: true),
      );
      await cubit.load();
      await tester.pumpWidget(app(null));
      await tester.pumpAndSettle();

      final calls = repo.statusCalls;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();

      expect(repo.statusCalls, calls);
    });

    testWidgets('activo: confirmación compacta, sin CTA', (tester) async {
      repo.statusOutcome = const ApiResult.success(
        StripeConnectStatusDM(connected: true, chargesEnabled: true, payoutsEnabled: true),
      );
      await cubit.load();

      await tester.pumpWidget(app(null));
      await tester.pumpAndSettle();

      expect(find.text(S.current.managerPaymentsActive), findsOneWidget);
      expect(find.text(S.current.managerActivateWithStripe), findsNothing);
    });
  });
}
