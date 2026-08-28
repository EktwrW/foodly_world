import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';

/// Dobles de los cubits que `AuthSessionService` apaga al cerrar sesión.
///
/// POR QUÉ HACEN FALTA. Las dos salidas de sesión —`clearInvalidSession` y
/// `_tearDownSession`— vacían el estado que pertenece al usuario, y tres de
/// esos cubits los pide por el service locator. Un test que ejercite
/// cualquiera de las dos rutas sin registrarlos revienta con "not registered".
///
/// Se registran DOBLES y no los reales a propósito: lo que estos tests miden
/// es que la ruta de cierre los toque, no lo que cada cubit hace por dentro.
/// `fueLimpiado` deja comprobarlo sin montar medio grafo de dependencias.
class FakeSocialCubit implements SocialCubit {
  bool fueLimpiado = false;

  @override
  void clear() => fueLimpiado = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class FakeNearbyPromotionsCubit implements NearbyPromotionsCubit {
  bool fueLimpiado = false;

  @override
  void clear() => fueLimpiado = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class FakeActiveGroupOrderCubit implements ActiveGroupOrderCubit {
  bool fueTerminado = false;

  @override
  void end() => fueTerminado = true;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

/// Los registra y los devuelve, para poder interrogarlos después.
({
  FakeSocialCubit social,
  FakeNearbyPromotionsCubit promociones,
  FakeActiveGroupOrderCubit ordenActiva,
}) registrarCubitsDeUsuario() {
  desregistrarCubitsDeUsuario();

  final social = FakeSocialCubit();
  final promociones = FakeNearbyPromotionsCubit();
  final ordenActiva = FakeActiveGroupOrderCubit();

  di
    ..registerSingleton<SocialCubit>(social)
    ..registerSingleton<NearbyPromotionsCubit>(promociones)
    ..registerSingleton<ActiveGroupOrderCubit>(ordenActiva);

  return (social: social, promociones: promociones, ordenActiva: ordenActiva);
}

void desregistrarCubitsDeUsuario() {
  if (di.isRegistered<SocialCubit>()) di.unregister<SocialCubit>();
  if (di.isRegistered<NearbyPromotionsCubit>()) di.unregister<NearbyPromotionsCubit>();
  if (di.isRegistered<ActiveGroupOrderCubit>()) di.unregister<ActiveGroupOrderCubit>();
}
