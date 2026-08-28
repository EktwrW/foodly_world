part of '../user_profile_page.dart';

/// Entrada a "Sesiones activas" desde el perfil.
///
/// Va justo detrás de la contraseña porque es la misma preocupación —quién
/// tiene acceso a esta cuenta— y quien entra a cambiar la clave por sospecha
/// suele querer, en el mismo viaje, echar al aparato que no reconoce.
///
/// NO MUESTRA EL CONTADOR de dispositivos, aunque el diseño lo preveía: el
/// número exige preguntárselo al backend, y no vale una petición más en cada
/// apertura del perfil por un dato que está a un toque de distancia. La
/// pantalla sí lo enseña, que es donde se necesita.
class _ActiveSessionsPlaceholder extends StatelessWidget {
  const _ActiveSessionsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: TextButton(
        onPressed: () => context.pushNamed(AppRoutes.activeSessions.name),
        child: Row(
          children: [
            const Icon(Clarity.devices_line, color: FoodlyThemes.primaryFoodly, size: 20),
            Expanded(
              child: Text(S.current.activeSessionsTitle, style: FoodlyTextStyles.primaryBodySemiBold).paddingLeft(12),
            ),
            Icon(EvaIcons.chevron_right, color: FoodlyThemes.primaryFoodly.withValues(alpha: .69), size: 20),
          ],
        ).paddingLeft(14),
      ),
    );
  }
}
