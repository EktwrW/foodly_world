import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MaxLengthEnforcement;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart'
    show LightSource, NeumorphicShape, NeumorphicSwitch, NeumorphicSwitchStyle;
import 'package:foodly_world/core/routing/app_routes.dart' show AppRoutes;
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, FontAwesome;

/// Fila de control del estado "aceptar reservas/solicitudes" en el dashboard
/// del negocio.
///
/// Dos variantes según la vertical (detectada vía [BusinessDM.categoryId]):
///
/// - **Restaurantes/bares/etc.** — switch "Permitir Reservas" + input compacto
///   con el tope de comensales por reserva (party-size).
/// - **Catering & Chefs** — switch "Aceptar solicitudes" + botón "Gestionar
///   agenda". Los catering no manejan party-size a nivel business: ese dato
///   vive por paquete en `service_packages.min_guests` / `max_guests`. En
///   cambio, la pieza accionable aquí es abrir/cerrar fechas del calendario
///   de disponibilidad del proveedor, así que reemplazamos el input por un
///   atajo directo a `AppRoutes.manageAvailability`.
///
/// El switch en sí misma es la misma señal funcional en ambas verticales:
/// controla `business.allow_reservations`, y el backend lo respeta tanto en
/// `POST /reservations` (mesas) como en `POST /reservations/service-booking`
/// (cotización/reserva de paquete).
class AllowReservations extends StatelessWidget {
  const AllowReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      buildWhen: (prev, curr) =>
          prev.vm.allowReservations != curr.vm.allowReservations ||
          prev.vm.currentBusiness?.reservationsSizeLimit != curr.vm.currentBusiness?.reservationsSizeLimit ||
          prev.vm.currentBusiness?.categoryId != curr.vm.currentBusiness?.categoryId ||
          prev.vm.loggedUserCanEdit != curr.vm.loggedUserCanEdit,
      builder: (context, state) {
        final bloc = context.read<BusinessBloc>();
        final business = state.vm.currentBusiness;
        final allowReservations = business?.allowReservations ?? state.vm.allowReservations;
        final canEdit = state.vm.loggedUserCanEdit;
        final isCateringOrChefs = business?.categoryId?.isCateringOrChefs ?? false;

        return Row(
          spacing: 16,
          children: [
            NeumorphicSwitch(
              value: allowReservations,
              duration: Durations.medium2,
              curve: Curves.decelerate,
              onChanged: canEdit ? (val) => bloc.add(BusinessEvent.toggleAllowReservations(val)) : null,
              height: 32,
              style: NeumorphicSwitchStyle(
                activeTrackColor: FoodlyThemes.primaryFoodly.withValues(alpha: .73),
                inactiveTrackColor: Colors.black12,
                activeThumbColor: FoodlyThemes.success,
                inactiveThumbColor: FoodlyThemes.secondaryFoodly,
                thumbShape: NeumorphicShape.convex,
                lightSource: LightSource.topRight,
              ),
            ),
            Expanded(
              child: Text(
                // Copy específico por vertical: catering conceptualmente recibe
                // "solicitudes" (pedido de cotización o booking de paquete),
                // no "reservas" de mesa.
                isCateringOrChefs ? S.current.acceptServiceRequests : S.current.allowReservations,
                maxLines: 2,
                style: FoodlyTextStyles.actionsBody,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isCateringOrChefs)
              // Catering & Chefs: atajo al calendario en lugar del input de
              // party-size. Usa la misma ruta que el AppBar de
              // ManageReservationsPage para mantener el punto de entrada único
              // y no duplicar lógica de navegación.
              SizedBox(
                width: 129,
                height: 38,
                child: CustomNeumorphicButton(
                  text: S.current.manage,
                  type: CustomNeumorphicBtnType.outlined,
                  disabled: (business?.uuid.isEmpty ?? true) || business?.allowReservations == false,
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  margin: EdgeInsets.zero,
                  bosShapeRadius: 8,
                  fontSize: 13,
                  trailing: Icon(Bootstrap.calendar2_week,
                      size: 16, color: business?.allowReservations == false ? Colors.grey : FoodlyThemes.primaryFoodly),
                  onPressed: () => context.pushNamed(
                    AppRoutes.manageAvailability.name,
                    pathParameters: {AppRoutes.routeIdParam: business?.uuid ?? ''},
                  ),
                ),
              )
            else
              SizedBox(
                width: 84,
                height: 38,
                child: TextField(
                  controller: state.vm.reservationSizeLimitCtrl?.controller,
                  keyboardType: TextInputType.number,
                  enabled: canEdit && allowReservations,
                  decoration: InputDecoration(
                    labelText: S.current.maxSizeLabel,
                    labelStyle: const TextStyle(fontSize: 12),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(8),
                    counter: const SizedBox.shrink(),
                    suffixIcon: const Icon(FontAwesome.people_group_solid, size: 20),
                  ),
                  maxLength: 3,
                  style: FoodlyTextStyles.actionsBody,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onSubmitted: (value) {
                    final parsed = int.tryParse(value);
                    if (parsed != null && parsed > 0) {
                      bloc.add(BusinessEvent.setReservationSizeLimit(parsed));
                    } else {
                      state.vm.reservationSizeLimitCtrl?.controller?.text =
                          '${state.vm.currentBusiness?.reservationsSizeLimit ?? 6}';
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
