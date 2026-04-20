#!/usr/bin/env bash
#
# Commit script para los 2 fixes post-PT smoke test (2026-04-20):
#
#   Bug A → Lista de notificaciones vacía + modal "contacte al administrador"
#           Causa: FE enum sin los 5 subtypes service_* del vertical Catering
#           & Chefs → ArgumentError en NotificationDM.fromJson aborta el parse
#           de toda la response.
#
#   Bug B → Diálogo de permiso de ubicación no aparece después del de push
#           Causa: Android no encola diálogos de permiso. El pedido de
#           POST_NOTIFICATIONS (unawaited en main.dart) corría en paralelo con
#           el de location del FoodlyLocationWrapper → Android deniega
#           silenciosamente el segundo.
#
# El script:
#   1. Corre build_runner para regenerar .freezed.dart + .g.dart
#      (notifications_dm.g.dart necesita el nuevo entry _$FoodlyNotificationSubTypeEnumMap
#       + el handler de unknownEnumValue).
#   2. Corre flutter analyze para atajar typos del enum nuevo.
#   3. Stagea los sources + generados y commitea.
#
# No toca nativo → Shorebird patch OK, NO hace falta release nuevo.

set -euo pipefail

cd "$(dirname "$0")"

echo "==> 1. build_runner (regenera notifications_dm.g.dart + .freezed.dart)"
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo "==> 2. flutter analyze (fail fast si el enum nuevo rompe algún switch)"
fvm flutter analyze --no-fatal-infos

echo "==> 3. git add (sources + generados)"
git add \
  lib/core/enums/foodly_notification_enums.dart \
  lib/data_models/notifications/notifications_dm.dart \
  lib/data_models/notifications/notifications_dm.freezed.dart \
  lib/data_models/notifications/notifications_dm.g.dart \
  lib/core/services/push_notification_service.dart \
  lib/ui/views/foodly_location_wrapper.dart \
  .commit-frontend.sh

echo "==> 4. git status (verificá que no haya archivos extra)"
git status --short

echo ""
echo "==> 5. commit"
git commit -m "fix(notifications,permissions): soportar subtypes service_* + serializar diálogos de permiso Android

Bug A — lista de notificaciones vacía + modal genérico tras push llegar
   El BE (vertical Catering & Chefs) emite subtypes service_booking_requested,
   service_quote_{received,approved,rejected} y service_message_new que el
   FE enum FoodlyNotificationSubType no conocía. json_serializable tiraba
   ArgumentError en fromJson de NotificationDM con cualquier item de ese
   subtype, abortando el parse de toda la NotificationsResponseDM → lista
   vacía aunque el badge (endpoint /unread-count que devuelve int) mostrara
   el conteo correcto.

   Fix:
   - Agregar los 5 subtypes al enum.
   - Agregar @JsonKey(unknownEnumValue: generalUpdate) en NotificationDM.subType
     como red de seguridad defensiva contra divergencias futuras — si el BE
     emite un subtype nuevo antes del deploy del FE, el item degrada a
     generalUpdate en vez de romper la lista.
   - Extender entityUuid para mapear los 5 al data.reservationUuid (service
     bookings comparten tabla con dine-in).
   - Nuevo getter isServiceBookingNotification para que la UI pueda
     diferenciar iconografía si quiere.

Bug B — diálogo de permiso de ubicación no aparece en fresh install
   main.dart disparaba PushNotificationService.initialize() fire-and-forget.
   initialize() pide POST_NOTIFICATIONS (Android 13+) y authorizationStatus
   (iOS). En paralelo, FoodlyLocationWrapper.initState programaba un
   addPostFrameCallback que dispara checkLocation → Geolocator.requestPermission().
   Android no encola diálogos de permiso — el segundo pedido retorna
   inmediatamente con el estado actual (denied) sin mostrar diálogo, lo que
   dejaba al app sin permiso de location y al botón 'current location'
   colgado en 'verificando ubicación'.

   Fix:
   - PushNotificationService expone Future<void> get permissionFlowComplete
     (Completer settlea cuando el flow de permisos terminó, sea éxito,
     denegación o path de early-return web/idempotente/catch).
   - FoodlyLocationWrapper hace await pushService.permissionFlowComplete
     .timeout(5s) dentro del addPostFrameCallback ANTES del guard biométrico
     existente. El timeout defensivo cubre el caso degenerado donde el
     Completer nunca se settlea por bug futuro.

Tests manuales requeridos (QA post-deploy):
   - Fresh install Android 13+: aprobar push → debe aparecer el diálogo
     de ubicación inmediatamente después.
   - Fresh install iOS: aprobar push → debe aparecer el diálogo de ubicación.
   - Login existente con biometría: ambos diálogos aparecen en secuencia sin
     cancelar el prompt biométrico.
   - Mandar una solicitud de reserva de servicio (Catering) al business:
     notification aparece en la lista con navegación correcta.

Entrega: Shorebird patch (cero código nativo en este commit).

Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>"

echo ""
echo "==> 6. Listo. Siguiente paso:"
echo "     git push origin main"
echo "     shorebird patch android --release-version 1.4.2+32"
echo "     shorebird patch ios --release-version 1.4.2+32"
