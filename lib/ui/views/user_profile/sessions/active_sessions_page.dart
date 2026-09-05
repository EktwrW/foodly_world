import 'package:animate_do/animate_do.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/user/active_session_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/user_profile/sessions/cubit/active_sessions_cubit.dart';
import 'package:foodly_world/ui/views/user_profile/sessions/session_presentation.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';
import 'package:intl/intl.dart';

/// Desde dónde está abierta la cuenta, y cómo echar a un aparato.
///
/// Existe desde que una cuenta admite varias sesiones a la vez: antes entrar
/// en un dispositivo echaba de todos los demás, así que no había nada que
/// listar ni que cerrar. Sin esta pantalla, el único modo de echar a un
/// intruso sería cambiar la contraseña —que también echa tus propios aparatos.
///
/// El tono es de INVENTARIO, no de alarma: no hay rojos ni advertencias. Quien
/// entra aquí viene a comprobar una lista, y una pantalla que grita convierte
/// una comprobación de rutina en un susto.
class ActiveSessionsPage extends StatelessWidget {
  const ActiveSessionsPage({super.key});

  /// Gris muy claro, para que las tarjetas blancas se despeguen del fondo.
  static const _fondo = Color(0xFFF6F4F5);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActiveSessionsCubit(di()),
      child: Scaffold(
        backgroundColor: _fondo,
        // Nav bar secundaria de Foodly (gradiente glassmórfico + back redondo),
        // la misma de About, Mis reservas y Usuarios bloqueados. Esta pantalla
        // se cuelga del perfil como esas, así que llega por el mismo sitio y
        // tiene que verse igual.
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: UIDecorations.glassmorphicPurpleGradient,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          actions: [
            Text(
              S.current.activeSessionsTitle,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
            ).paddingOnly(right: 18),
          ],
          leading: CustomRoundedNeumorphicButton(
            iconSize: 26,
            diameter: 32,
            iconData: Bootstrap.caret_left_fill,
            onPressed: () {
              if (context.canPop()) {
                di<AppRouter>().removeLastRouteHistory();
                context.pop();
              } else {
                di<AppRouter>().goBackToLastRoute();
              }
            },
            padding: const EdgeInsets.all(6),
          ).paddingSymmetric(vertical: 10, horizontal: 10),
          leadingWidth: 60,
        ),
        body: BlocBuilder<ActiveSessionsCubit, ActiveSessionsState>(
          builder: (context, state) => switch (state) {
            ActiveSessionsLoading() => const Center(child: LoadingWidgetFoodlyIso(height: 48)),
            ActiveSessionsError(:final message) => _ErrorWdg(message: message),
            ActiveSessionsLoaded(:final data, :final closingId) => _Lista(data: data, closingId: closingId),
          },
        ),
      ),
    );
  }
}

class _ErrorWdg extends StatelessWidget {
  const _ErrorWdg({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: FoodlyTextStyles.caption, textAlign: TextAlign.center).paddingHorizontal(32),
          TextButton(
            onPressed: () => context.read<ActiveSessionsCubit>().load(),
            child: Text(S.current.retry, style: FoodlyTextStyles.primaryBodySemiBold),
          ),
        ],
      ),
    );
  }
}

class _Lista extends StatelessWidget {
  const _Lista({required this.data, required this.closingId});

  final ActiveSessionsDM data;
  final String? closingId;

  /// ¿Queda alguna sesión de las de antes de esta función? Solo entonces se
  /// explica el hueco, y una sola vez para toda la lista en vez de repetir la
  /// misma frase en cada tarjeta.
  bool get _hayHeredadas => data.sessions.any((s) => !s.isIdentified);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActiveSessionsCubit>();

    return RefreshIndicator(
      color: FoodlyThemes.primaryFoodly,
      onRefresh: cubit.load,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 32),
        children: [
          _Capacidad(usadas: data.sessions.length, max: data.max),
          ...data.sessions.map(
            (s) => _Tarjeta(
              session: s,
              cerrando: closingId == s.id,
              bloqueada: closingId != null && closingId != s.id,
            ).paddingBottom(12),
          ),
          if (_hayHeredadas) const _AvisoHeredadas().paddingTop(4),
          Text(
            S.current.activeSessionsPrivacyNote,
            style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.secondaryFoodlyText, height: 1.5),
          ).paddingOnly(top: 20, left: 6, right: 6),
        ],
      ),
    );
  }
}

class _Capacidad extends StatelessWidget {
  const _Capacidad({required this.usadas, required this.max});

  final int usadas;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.current.activeSessionsDevicesCount(usadas, max), style: FoodlyTextStyles.labelBold),
              Text(
                S.current.activeSessionsCapHint(max),
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.secondaryFoodlyText),
              ).paddingTop(3),
            ],
          ),
        ),
        // Los puntos son el mismo dato que el texto, dicho de un vistazo. No
        // es una barra de progreso: llegar al tope no es un problema, así que
        // no se pinta como si lo fuera.
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            max,
            (i) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i < usadas ? FoodlyThemes.primaryFoodly : FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
              ),
            ),
          ),
        ),
      ],
    ).paddingOnly(left: 4, right: 4, bottom: 12);
  }
}

class _Tarjeta extends StatelessWidget {
  const _Tarjeta({required this.session, required this.cerrando, required this.bloqueada});

  final ActiveSessionDM session;
  final bool cerrando;
  final bool bloqueada;

  String _fecha(DateTime d) => DateFormat.yMMMMd(Intl.getCurrentLocale()).format(d.toLocal());

  @override
  Widget build(BuildContext context) {
    final detalle = session.detailLine(_fecha);
    final identificada = session.isIdentified;

    return FadeIn(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.16),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Icono(session: session, actual: session.current),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            session.deviceLabel,
                            style: FoodlyTextStyles.labelBold.copyWith(
                              fontSize: 15,
                              // La heredada se nombra en gris: no es un aparato
                              // reconocido, y decirlo con el mismo peso que a
                              // los demás sería fingir que sí lo es.
                              color: identificada ? Colors.black87 : Colors.black.withValues(alpha: 0.70),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (session.current) const _EsteDispositivo().paddingLeft(8),
                      ],
                    ),
                    if (session.lastUsedAt != null)
                      Text(
                        session.lastUsedAt!.toLocal().timeAgo,
                        style: FoodlyTextStyles.caption
                            .copyWith(fontSize: 13, color: Colors.black.withValues(alpha: 0.66)),
                      ).paddingTop(5),
                    if (detalle.isNotEmpty)
                      Text(
                        detalle,
                        style: FoodlyTextStyles.caption.copyWith(
                          fontSize: 11,
                          color: FoodlyThemes.secondaryFoodlyText,
                        ),
                      ).paddingTop(5),
                  ],
                ).paddingLeft(14),
              ),
              // La sesión actual NO ofrece cierre: para salir de este aparato
              // está cerrar sesión, y ponerlo aquí invita a un accidente.
              if (!session.current) _BotonCerrar(session: session, cerrando: cerrando, bloqueada: bloqueada),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icono extends StatelessWidget {
  const _Icono({required this.session, required this.actual});

  final ActiveSessionDM session;
  final bool actual;

  @override
  Widget build(BuildContext context) {
    final color =
        actual ? FoodlyThemes.tertiaryFoodly : (session.isIdentified ? FoodlyThemes.primaryFoodly : Colors.black38);

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(session.deviceIcon, size: 21, color: color),
    );
  }
}

class _EsteDispositivo extends StatelessWidget {
  const _EsteDispositivo();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        S.current.activeSessionsThisDevice,
        style: FoodlyTextStyles.caption.copyWith(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
          color: FoodlyThemes.tertiaryFoodly,
        ),
      ).paddingSymmetric(horizontal: 8, vertical: 3),
    );
  }
}

class _BotonCerrar extends StatelessWidget {
  const _BotonCerrar({required this.session, required this.cerrando, required this.bloqueada});

  final ActiveSessionDM session;
  final bool cerrando;
  final bool bloqueada;

  @override
  Widget build(BuildContext context) {
    if (cerrando) {
      return const SizedBox(
        width: 44,
        height: 44,
        child: Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: FoodlyThemes.secondaryFoodly),
          ),
        ),
      );
    }

    return IconButton(
      onPressed: bloqueada ? null : () => confirmarCierreDeSesion(context, session),
      icon: const Icon(Bootstrap.door_open_fill, size: 19),
      color: FoodlyThemes.primaryFoodly,
      tooltip: S.current.activeSessionsCloseCta,
      constraints: const BoxConstraints.tightFor(width: 44, height: 44),
      padding: EdgeInsets.zero,
    );
  }
}

class _AvisoHeredadas extends StatelessWidget {
  const _AvisoHeredadas();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Bootstrap.info_circle, size: 17, color: FoodlyThemes.primaryFoodly),
          Expanded(
            child: Text(
              S.current.activeSessionsLegacyNotice,
              style: FoodlyTextStyles.caption.copyWith(color: Colors.black87, height: 1.55),
            ).paddingLeft(12),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 14),
    );
  }
}

/// Confirma el cierre con el `SnackBarWdg` de Foodly.
///
/// Snackbar y no diálogo porque es la pieza con la que la app ya pregunta las
/// cosas —el mismo reborde de color, el mismo tirador— y porque no oscurece la
/// pantalla: la lista se sigue viendo detrás mientras decides, que es
/// exactamente lo que quieres mirar para confirmar que eliges la correcta.
///
/// `SnackBarType.action` con icono explícito: `action` no lleva icono por
/// defecto, y pedir uno es decir "este sí" (ver `SnackBarWdg.icon`). El icono
/// es el mismo `door_open_fill` con el que el drawer cierra sesión.
void confirmarCierreDeSesion(BuildContext context, ActiveSessionDM session) {
  final cubit = context.read<ActiveSessionsCubit>();
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  final snack = SnackBarWdg(
    type: SnackBarType.action,
    icon: Bootstrap.door_open_fill,
    content: Column(
      children: [
        Text(
          S.current.activeSessionsCloseTitle,
          style: FoodlyTextStyles.sectionsTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          S.current.activeSessionsCloseBody(session.deviceLabel),
          style: FoodlyTextStyles.snackBarLightBody,
          textAlign: TextAlign.center,
        ).paddingTop(10),
      ],
    ),
    // Dos acciones: el botón único que trae por defecto no sirve para una
    // confirmación, que necesita una salida además de una entrada.
    buttonBuilder: (dismiss) => Column(
      children: [
        CustomNeumorphicButton(
          text: S.current.activeSessionsCloseCta,
          disabled: false,
          margin: EdgeInsets.zero,
          onPressed: () async {
            // El aviso de éxito se arma AHORA, no después del `await`: para
            // entonces este `context` puede estar desmontado.
            final hecho = SnackBarWdg(
              type: SnackBarType.success,
              content: Text(
                S.current.activeSessionsClosed,
                style: FoodlyTextStyles.snackBarLightBody,
                textAlign: TextAlign.center,
              ),
            ).getSnackBar(context);

            dismiss();
            if (await cubit.closeSession(session.id)) messenger.showSnackBar(hecho);
          },
        ),
        TextButton(
          onPressed: dismiss,
          child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
        ),
      ],
    ),
  );

  messenger.showSnackBar(snack.getSnackBar(context));
}
