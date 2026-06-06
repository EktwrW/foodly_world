import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart' show UIDimens;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Acción que un invitado intentó hacer y que requiere cuenta. Determina el
/// copy contextual del [GuestGateSheet]. Mantener en sync con los strings
/// `guestGate*` en los .arb.
enum GuestGateAction {
  reserve,
  favorite,
  review,
  post,
  savedPromotions,
  favedBusiness,
  community,
  notifications,
  profile,
  generic;

  /// Mensaje contextual ("Iniciá sesión o registrate para …").
  String get message => switch (this) {
        GuestGateAction.reserve => S.current.guestGateReserve,
        GuestGateAction.favorite => S.current.guestGateFavorite,
        GuestGateAction.review => S.current.guestGateReview,
        GuestGateAction.post => S.current.guestGatePost,
        GuestGateAction.savedPromotions => S.current.guestGateSaved,
        GuestGateAction.favedBusiness => S.current.guestGateFaved,
        GuestGateAction.community => S.current.guestGateCommunity,
        GuestGateAction.notifications => S.current.guestGateNotifications,
        GuestGateAction.profile => S.current.guestGateProfile,
        GuestGateAction.generic => S.current.guestGateGeneric,
      };
}

/// Portero del modo invitado (App Store 5.1.1.v).
///
/// Uso principal (en el handler de la acción, ANTES de disparar el flujo):
/// ```dart
/// if (!GuestGuard.requireAuth(GuestGateAction.reserve)) return;
/// // ...continuar con la reserva
/// ```
/// Devuelve `true` si hay sesión (seguir). Si es invitado, abre el
/// [GuestGateSheet] con CTAs de login/registro y devuelve `false`.
abstract class GuestGuard {
  static bool requireAuth(GuestGateAction action) {
    final auth = di<AuthSessionService>();
    if (auth.isLoggedIn) return true;
    showGuestGateSheet(action);
    return false;
  }

  /// `true` si el usuario está navegando como invitado (sin sesión).
  static bool get isGuest => di<AuthSessionService>().isGuest;
}

/// Abre el bottom sheet de gate. Usa el [rootNavigatorKey] para poder
/// dispararse desde cualquier capa (handler de widget o backstop de repo).
void showGuestGateSheet(GuestGateAction action) {
  final context = rootNavigatorKey.currentContext;
  if (context == null) return;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _GuestGateSheet(action: action),
  );
}

class _GuestGateSheet extends StatelessWidget {
  final GuestGateAction action;
  const _GuestGateSheet({required this.action});

  void _go(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    // Salimos del modo invitado: a partir de acá el usuario va a autenticarse.
    di<AuthSessionService>().exitGuestMode();
    di<AppRouter>().appRouter.goNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ui.NeumorphicColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 43,
            height: 3,
            margin: const EdgeInsets.only(top: 9, bottom: 6),
            decoration: BoxDecoration(
              color: FoodlyThemes.primaryFoodly,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
              child: FadeIn(
                duration: const Duration(milliseconds: 250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.lock_outline_rounded, size: 40, color: FoodlyThemes.primaryFoodly),
                    const SizedBox(height: 16),
                    Text(
                      S.current.guestGateTitle,
                      style: FoodlyTextStyles.sectionsTitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 13),
                    Text(
                      action.message,
                      style: FoodlyTextStyles.label,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 26),
                    CustomNeumorphicButton(
                      disabled: false,
                      onPressed: () => _go(context, AppRoutes.login.name),
                      text: S.current.login,
                    ),
                    const SizedBox(height: 9),
                    CustomNeumorphicButton(
                      disabled: false,
                      type: CustomNeumorphicBtnType.tertiary,
                      onPressed: () => _go(context, AppRoutes.signUp.name),
                      text: S.current.signup,
                      margin: const EdgeInsets.all(UIDimens.SCREEN_PADDING_MOB),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
