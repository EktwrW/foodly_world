# Instrucciones para Claude: Desarrollo Flutter 3.29 y Dart 3

## Perfil de Asistencia

Eres Claude, un asistente de IA especializado en desarrollo senior y arquitectura de aplicaciones en Flutter 3.38 y Dart 3.7. Tu objetivo es proporcionar asistencia de alto nivel para el diseño, implementación y resolución de problemas en proyectos de Flutter complejos, con énfasis en código moderno, elegante y optimizado.

## Áreas de Experiencia

Arquitectura de aplicaciones Flutter a escala empresarial

Código Dart moderno con características avanzadas de Dart 3.7

Widgets especializados y optimización de rendimiento UI

Patrones de diseño avanzados (Clean Architecture, MVVM, BLoC, Riverpod)

Programación asíncrona y reactiva con Dart 3

Optimización de rendimiento y mejora de UX

Integración de APIs y servicios externos

Manejo avanzado de estado con enfoques modernos

Null safety y características avanzadas de Dart 3.7

Pruebas unitarias, de integración y de widgets

CI/CD para aplicaciones Flutter

Soluciones multi-plataforma (iOS, Android, Web, Desktop)

Migraciones y actualizaciones de versiones

Seguridad y mejores prácticas

Flutter DevTools y depuración avanzada

## Directrices para la Asistencia

### Generales

1. **Enfoque Arquitectónico**: Prioriza soluciones escalables, mantenibles y que sigan las mejores prácticas de la industria.
2. **Código de Alta Calidad**: Proporciona implementaciones que sigan los principios SOLID, DRY y patrones de diseño adecuados.
3. **Pensamiento Crítico**: Evalúa críticamente los requerimientos y sugiere mejoras cuando sea apropiado.
4. **Explicaciones Detalladas**: Incluye comentarios explicativos en el código y justifica las decisiones arquitectónicas.

### Específicas para Flutter 3.38 y Dart 3

Características Modernas de Dart: Utiliza records, pattern matching, sealed classes, extension types, extension methods y class modifiers.

Widgets Especializados: Evita Container cuando sea posible, priorizando SizedBox, ConstrainedBox, DecoratedBox, ColoredBox, etc.

Material 3 y Widgets Actualizados: Implementa con Material 3, Material3 theme y widgets modernos.

Rendimiento: Optimiza con const widgets, ListView.builder, RepaintBoundary, y técnicas de build optimization.

Null Safety: Código 100% null-safe con sound null safety.

Multiplataforma: Considera las particularidades de cada plataforma.

## Formato de Respuestas

### Para Consultas Arquitectónicas

1. **Análisis del Requisito**: Evalúa y clarifica lo solicitado.
2. **Consideraciones Arquitectónicas**: Presenta diferentes enfoques con sus pros y contras.
3. **Recomendación Justificada**: Proporciona una solución recomendada con justificación técnica.
4. **Diagrama Conceptual**: Cuando sea útil, proporciona diagramas para ilustrar la arquitectura.
5. **Ejemplos de Implementación**: Código de muestra para los componentes principales.

### Para Implementaciones de Código

1. **Estructura de Archivos**: Sugiere una organización de archivos lógica.
2. **Implementación Completa**: Proporciona código completo, no solo fragmentos.
3. **Tests**: Incluye pruebas unitarias o de widget cuando sea apropiado.
4. **Documentación**: Añade comentarios de documentación en formato Dart Doc.
5. **Consideraciones de Rendimiento**: Menciona posibles cuellos de botella y optimizaciones.

### Para Debugging y Resolución de Problemas

1. **Análisis Sistemático**: Enfoque paso a paso para identificar la causa raíz.
2. **Soluciones Alternativas**: Diferentes enfoques para resolver el problema.
3. **Prevención**: Sugerencias para evitar problemas similares en el futuro.
4. **Herramientas de Diagnóstico**: Consejos sobre cómo utilizar DevTools u otras herramientas.

## Tecnologías y Librerías Relevantes

### Manejo de Estado

- BLoC / flutter_bloc / Cubit
- Provider

### Arquitectura

- Features are organized by view/widget/bloc pattern
- BLoC/Cubit for state management
- Repository pattern for data access
- Dependency injection with GetIt

### Networking

- Dio
- http
- Retrofit
- GraphQL (graphql_flutter)

### Base de Datos y Almacenamiento

- Hive
- SQLite (sqflite, drift)
- Firebase
- Isar
- ObjectBox

### Inyección de Dependencias

- get_it
- injectable

### Testing

- flutter_test
- mockito / mocktail
- integration_test
- flutter_driver
- bloc_test 9.1+

### UI/UX

- Material 3
- Cupertino
- flutter_hooks
- animations
- lottie
- rive

### Navegación

- go_router
- auto_route
- navigator 2.0

## Ejemplos de Implementación

Incluye ejemplos concretos de patrones comunes como:

```dart
// Ejemplo de un BLoC básico en Flutter 3.29 con Dart 3
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Evento
sealed class CounterEvent {}
final class CounterIncremented extends CounterEvent {}
final class CounterDecremented extends CounterEvent {}

// Estado
class CounterState extends Equatable {
  final int count;

  const CounterState({required this.count});

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    on<CounterIncremented>(_onIncrement);
    on<CounterDecremented>(_onDecrement);
  }

  void _onIncrement(CounterIncremented event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onDecrement(CounterDecremented event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count - 1));
  }
}
```

## Guía para Solicitar Ayuda

Para obtener la mejor asistencia, proporciona:

1. **Contexto del Proyecto**: Describe brevemente el propósito de la aplicación.
2. **Requisitos Específicos**: Detalla lo que necesitas implementar.
3. **Restricciones**: Menciona limitaciones técnicas o de negocio.
4. **Código Existente**: Comparte fragmentos relevantes del código actual.
5. **Preferencias**: Indica tus preferencias en cuanto a patrones, librerías o enfoques.

## Comandos Específicos

Puedes utilizar estos comandos para obtener ayuda específica:

- `/architecture [tipo]`: Genera una propuesta de arquitectura completa
- `/pattern [nombre]`: Muestra implementación de un patrón de diseño específico
- `/refactor [código]`: Sugiere mejoras para el código proporcionado
- `/optimize [área]`: Proporciona consejos de optimización para un área específica
- `/test [componente]`: Genera pruebas para el componente especificado
- `/example [feature]`: Proporciona ejemplo completo de implementación
- `/compare [opción1] vs [opción2]`: Compara dos enfoques o tecnologías

## Ejemplo de Uso

```
/architecture clean-architecture-bloc

# Respuesta esperada: Una propuesta completa de arquitectura Clean Architecture con BLoC incluyendo estructura de carpetas, componentes principales y ejemplos de código.
```

---

## iOS Deployment & TestFlight

### Apple Developer Account
- **Apple ID:** owentours@gmail.com
- **Team ID:** V76AZLAYJ4
- **Bundle ID:** com.foodlysolutions.app
- **App Store Connect App ID:** 6761689908 (App name: "Foodly Solutions")
- **SKU:** foodly_ios_app
- **Min iOS:** 15.0

> **Note:** There is an old app record "Foodly World" (ID: 6741719812) with bundle ID `world.foodly.mobile` — this is deprecated and should not be used. The active app uses `com.foodlysolutions.app`.

### Fastlane Setup (Local)
Fastlane is configured in `ios/fastlane/` for automated builds and uploads:

```bash
cd ios/
bundle exec fastlane beta          # Clean build + upload to TestFlight
bundle exec fastlane beta_upload   # Upload existing IPA only (skip build)
bundle exec fastlane release       # Build + upload to App Store (manual submit)
```

**Configuration files:**
- `ios/Gemfile` — Ruby dependencies (fastlane, cocoapods)
- `ios/fastlane/Appfile` — App identifier, Apple ID, Team ID
- `ios/fastlane/Fastfile` — Build and upload lanes
- `ios/fastlane/.env` — API keys and app-specific password (**NOT in git**)
- `ios/fastlane/.env.default` — Template for `.env` (safe to commit)

**Environment variables required in `.env`:**
- `ANALYTICS_TOKEN` — dart-define value

> **Las claves de los proveedores de IA ya no se inyectan** (2026-08-18). Se pasaban
> por `--dart-define`, lo que las compilaba dentro de `libapp.so` / el IPA: extraíbles
> con `strings` desde cualquier APK publicado. La generación de AI promos se movió al
> backend (`POST /promotions/ai-generate`) y las credenciales viven en Secret Manager.
> Si ves estas variables en un `.env` local, borralas.
- `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` — Generated at account.apple.com > Sign-In and Security > App-Specific Passwords

### iOS Build (without Fastlane)
Existing VS Code tasks also work:
- "Shorebird - Release iOS (App Store)" — Generates IPA with Shorebird tracking
- "Shorebird - Patch iOS (OTA)" — Dart-only OTA patch via Shorebird
- "Foodly - Build IPA Release" — Vanilla Flutter IPA build

### Signing
- **Automatic signing** via Xcode with Team V76AZLAYJ4
- Provisioning profiles are managed automatically by Xcode
- Capabilities enabled: Associated Domains, Push Notifications

### App Store Metadata
Prepared metadata (descriptions, keywords, release notes) in 3 languages (EN/ES/PT) is in `ios/fastlane/metadata/app-store-metadata.md`.

### Localized Permission Strings
iOS permission descriptions are localized in:
- `ios/Runner/en.lproj/InfoPlist.strings`
- `ios/Runner/es.lproj/InfoPlist.strings`
- `ios/Runner/pt.lproj/InfoPlist.strings`

### Security Notes
- API keys are currently hardcoded in `.vscode/tasks.json` — plan to migrate to `.env` files
- `android/key.properties` and `android/app/foodly-release.jks` are committed to repo despite being in `.gitignore` — need to rotate and clean git history
- `NSAllowsArbitraryLoads` is set to `true` in Info.plist (needed for some image URLs) — may need justification during App Review

---

## Dual Token Authentication System (2026-04-12)

### Architecture

The app uses a **dual token system**: short-lived access token (24h) + long-lived refresh token (180 days). This enables biometric login to work after weeks of inactivity without requiring the user to re-authenticate.

### Token Flow

1. **Login/Register/Social Login** → Backend returns both `access_token` and `refresh_token`
2. **Normal API calls** → Use `access_token` as Bearer header
3. **Access token expires (23h client threshold)** → Proactive silent refresh using `refresh_token`
4. **401 response on any API call** → Reactive silent refresh + retry original request
5. **Refresh token expires (180d)** → Session cleared, user must re-authenticate

### Key Files

-   **`lib/core/services/auth_session_service.dart`**: Central session manager. Stores `_refreshToken` in memory, delegates persistence to `SecureTokenService`. Methods:
    -   `setSession(UserSessionDM)` — stores both tokens, persists to secure storage
    -   `silentRefresh()` — exchanges refresh token for new pair via `POST /token/refresh`. Temporarily injects refresh token as Bearer header, restores access token on success.
    -   `initializeSessionOrClear()` — on app startup, tries silent refresh if access token is expired
    -   `restoreTokensFromSecureStorage()` — restores tokens from encrypted storage on cold start + one-time migration from HydratedBloc
    -   `isAccessTokenExpired` — uses 23h threshold (backend access token is 24h)
    -   `clearSession()` — wipes `_refreshToken` and `SecureTokenService.clearAll()`

-   **`lib/core/services/secure_token_service.dart`**: Wraps `flutter_secure_storage` v10. Stores access token, refresh token, token type, and creation timestamp in encrypted platform storage (Keychain on iOS, AES-GCM on Android).
    -   Keys: `foodly_access_token`, `foodly_refresh_token`, `foodly_token_type`, `foodly_token_created_at`
    -   Android: Default `AndroidOptions()` — v10 uses AES-GCM with RSA OAEP key wrapping automatically (no `encryptedSharedPreferences` flag needed, it's deprecated)
    -   iOS: `IOSOptions(accessibility: KeychainAccessibility.first_unlock)`

-   **`lib/core/network/base/dio_request_handler.dart`**: Dio interceptor with:
    -   **Request interceptor (proactive)**: Before sending any request, checks `isAccessTokenExpired`. If expired and not already refreshing, calls `silentRefresh()` and updates the header.
    -   **Error interceptor (reactive)**: On 401, attempts `silentRefresh()` + retries original request once. If refresh fails, calls `notifyTokenExpired()`.
    -   **Exclusion list**: `/token/refresh`, `/login`, `/register`, `/social-login` — these endpoints skip the refresh interceptor to prevent infinite loops.

-   **`lib/core/blocs/root/root_bloc.dart`**: HydratedBloc persistence. `toJson()` strips `token`, `access_token`, `refresh_token` before writing to SharedPreferences (plaintext). `fromJson()` restores session from secure storage via `unawaited(_restoreAndInitialize())`.

-   **`lib/core/network/users/me_client.dart`**: Retrofit endpoint `POST /token/refresh → UserSessionDM`

-   **`lib/data_models/user_session/user_session_dm.dart`**: Freezed model includes `accessToken` (`@JsonKey(name: 'access_token')`) and `refreshToken` (`@JsonKey(name: 'refresh_token')`) fields.

### Multi-dispositivo y sesiones activas (2026-08-29)

Una cuenta admite hasta **6 sesiones simultáneas**. Antes admitía una sola:
`createDualTokens()` borraba todos los tokens del usuario, así que entrar en la
tablet echaba del teléfono — sin aviso y a mitad de lo que estuvieras haciendo.
No estaba escrito como requisito y se leía como un bug (la app cerraba sola).

Al llegar al tope se desaloja la sesión **menos usada**, nunca se bloquea el
login: rechazar el séptimo inicio dejaría fuera justo a quien perdió el teléfono
y entra desde otro aparato.

**El dispositivo viaja en el interceptor**, no dentro de cuatro DTOs:
`DioRequestHandler._adjuntarDispositivo` adjunta `device` al cuerpo de `/login`,
`/social-login`, `/register`, `/token/refresh` y `/biometric-login`. Sale de
`AuthSessionService.deviceForSession`, que reusa lo que `initDeviceMetadata()` ya
recoge al arrancar para analíticas — no se le pide nada nuevo al aparato. Es
opcional de punta a punta: una versión vieja de la app no manda nada y el login
sigue siendo válido.

**El modelo NO se traduce a nombre comercial.** El aparato devuelve códigos
(`iPhone17,1`, `SM-G991B`); la tabla que los convierte en "iPhone 15 Pro"
envejece con cada teléfono que sale. El título dice la plataforma —y si es iPad
o iPhone, que el prefijo del código sí distingue— y el código queda como
detalle. Ver `session_presentation.dart`.

**Pantalla**: `ActiveSessionsPage`, colgada del perfil junto a la contraseña.
Lista las sesiones (la actual primero) y cierra una concreta. La actual no
ofrece botón de cerrar, y el backend además la rechaza con 422.

La lista NO se recorta en local antes de que el backend confirme: si el cierre
falla, "parecía cerrada y volvió" deja al usuario sin saber si echó a alguien.

### Accesibilidad: los dos tonos de texto secundario (2026-08-29)

`FoodlyThemes.secondaryFoodly` (#AF8B96) es color de marca para **bordes, iconos
y fondos teñidos**. Sobre blanco da 3.02:1 y NO llega al 4.5:1 que la WCAG pide
para texto por debajo de ~18px. Para texto hay dos constantes:

- `secondaryFoodlyText` (#855C68) — 5.63:1. Mismo tono y saturación, más oscuro.
- `neutralTextGrey` (#616161) — 5.92:1. Donde el texto YA era gris; teñir de
  rosa fechas, gráficos y pies de página habría cambiado el diseño.

`neutralTextGrey` es un literal y no `Colors.grey.shade700` porque ese getter no
es `const` y varios de estos textos viven dentro de un `const TextStyle`.

Aplicar `alpha` a un color de texto **siempre** le quita contraste: fue lo que
hundió el peor caso a 2.49:1. `test/ui/theme/text_contrast_test.dart` fija los
mínimos y deja escrito qué colores se retiraron y por qué.

El texto **deshabilitado está exento** de la norma y debe seguir viéndose
apagado: oscurecerlo sería mentir sobre el estado del control.

### One-Time Migration

Existing users who upgrade from the old single-token system are transparently migrated: `restoreTokensFromSecureStorage()` checks if tokens exist in secure storage. If not but a session exists in HydratedBloc, it copies the legacy `token` to secure storage as the access token.

### Dependencies

-   `flutter_secure_storage: ^10.0.0` in `pubspec.yaml`
-   `SecureTokenService` registered as lazy singleton in `dependency_injection_service.dart`
-   `AuthSessionService` constructor receives `secureTokenService: di()`

---

## Business Analytics Dashboard (2026-04-13)

### Architecture

Manager-only feature showing business performance metrics. Data comes from the NLP microservice (`GET /nlp-service/business/{uuid}/overview?days=30`).

### Key Frontend Files

-   **Data models**: `lib/data_models/analytics/business_overview_dm.dart` — Freezed models: `BusinessOverviewResponseDM`, `BusinessOverviewDataDM`, `KpisDM`, `FunnelDM`, `FunnelStepDM`, `FunnelConversionDM`, `DailySeriesDM`, `DailyPointDM`, `BreakdownsDM`, `BreakdownItemDM`
-   **Generated files**: `business_overview_dm.g.dart` has **custom deserialization** helpers (not standard Freezed output):
    -   `_parseFunnelSteps()` — converts backend Map `{"key": value}` → `List<FunnelStepDM>`
    -   `_parseBreakdownMapOrList()` — converts backend Map `{"status": count}` → `List<BreakdownItemDM>`
    -   `_parseEventTypes()` — maps `event_type`→`label`, `count`→`value` from backend format
-   **Cubit**: `lib/ui/views/analytics/cubit/` — fetches data from NLP service
-   **Widgets**:
    -   `funnel_chart.dart` — Horizontal bar funnel with gradient bars
    -   `daily_trends_chart.dart` — Line chart (fl_chart) showing reservations + events over time
    -   `top_events_bar.dart` — Bar chart of most common event types
    -   `reservations_donut.dart` — Pie chart of reservation statuses with color-coded legend
-   **Label humanizer**: `lib/ui/views/analytics/helpers/analytics_label_helper.dart` — Converts raw backend keys (`business_open`, `cta_clicked`, `reservation_started`, etc.) into localized user-friendly labels via `S.current.*`. Three methods: `funnelStep()`, `eventType()`, `reservationStatus()`. Has fallback that replaces `_`/`.` with spaces + capitalizes.

### Backend JSON ↔ Frontend Model Mapping

| Backend JSON key | Frontend Dart field | Notes |
|---|---|---|
| `funnel.steps` (Map) | `FunnelDM.steps` (List<FunnelStepDM>) | Custom `_parseFunnelSteps()` in `.g.dart` |
| `funnel.conversion.open_to_cta_rate` | `FunnelConversionDM.openToCtaRate` | |
| `funnel.conversion.open_to_reservation_rate` | `FunnelConversionDM.openToReservationRate` | |
| `funnel.conversion.cta_to_reservation_rate` | `FunnelConversionDM.ctaToReservationRate` | |
| `series.*_daily[].value` | `DailyPointDM.value` | |
| `breakdowns.reservations_by_status` (Map) | `BreakdownsDM.reservationsByStatus` (List) | Custom `_parseBreakdownMapOrList()` |
| `breakdowns.top_event_types[].event_type` | `BreakdownItemDM.label` | Custom `_parseEventTypes()` |
| `breakdowns.top_event_types[].count` | `BreakdownItemDM.value` | Custom `_parseEventTypes()` |

### l10n Keys (analytics labels)

Added 22 keys to all 3 `.arb` files (EN/ES/PT): `analyticsLabelBusinessOpen`, `analyticsLabelCtaClicked`, `analyticsLabelCtaWhatsapp`, `analyticsLabelCtaPhone`, `analyticsLabelCtaWebsite`, `analyticsLabelCtaDirections`, `analyticsLabelCtaInstagram`, `analyticsLabelSearchResult`, `analyticsLabelReservationStarted`, `analyticsLabelReservationSubmitted`, `analyticsLabelReservationSucceeded`, `analyticsLabelFavoriteAdded`, `analyticsLabelFavoriteRemoved`, `analyticsLabelReviewCreated`, `analyticsLabelMenuViewed`, `analyticsLabelShare`, `analyticsStatusConfirmed`, `analyticsStatusCompleted`, `analyticsStatusPending`, `analyticsStatusCancelled`, `analyticsStatusRejected`, `analyticsStatusNoShow`.

**Important**: After editing `.arb` files, run the l10n generator to update `lib/generated/`.

---

## Registro del idioma: `intl_es.arb` es español NEUTRO

**Regla: español neutro con tuteo. Ni voseo rioplatense, ni vosotros de España.**

La app se lanza en Portugal y apunta a España antes que a Latinoamérica; el
diccionario tiene que leerse natural en Madrid, en Bogotá y en Buenos Aires.
Hasta el 2026-08-10 estaba escrito en argentino y hubo que convertir 53
strings.

Al escribir o revisar un string en español:

| No | Sí |
|---|---|
| Tocá, Pedí, Probá, Revisá, Activá, Subí, Andá | Toca, Pide, Prueba, Revisa, Activa, Sube, Ve |
| podés, tenés, querés, sos, pagás, aceptás | puedes, tienes, quieres, eres, pagas, aceptas |
| pagáis, tenéis, vuestro *(vosotros = solo España)* | pagas, tienes, tu *(o impersonal)* |
| acá, allá | aquí, allí |
| reservación *(México/Caribe)* | reserva |
| manejar *(en sentido de gestionar)* | gestionar |

Lo único que distingue voseo de tuteo suele ser **la tilde final**: `tocá` vs
`toca`, `pagás` vs `pagas`. Un grep de `toc[aá]` da falsos positivos sobre las
formas ya correctas — hay que buscar la forma acentuada exacta.

Para verificar que no se coló nada:

```bash
grep -oE "\b(podés|querés|tenés|sos|pagás|aceptás|reportás|probá|revisá|tocá|activá|confirmá|ingresá|abrí|mostrá|usá|andá|establecé|verificá|retomá|digitalizá|subí|acá|allá|reservación|\w+áis|\w+éis)\b" lib/l10n/intl_es.arb
```

Sin salida = limpio.

**`intl_pt.arb` es portugués de Portugal** (no de Brasil): "ao balcão", "estás",
"dirige-te".

### Route Guard

`businessAnalytics` route is registered in `permission_guarded_resource_enum.dart` → `_appModulesMap` mapped to `ModuleGuardType.business`, so only managers with an active business can access it.

---

## Visited Business Mode (2026-04-12)

### Two-Page Architecture

-   `BusinessPage` — Owner/manager view with edit controls (accessed from "My Business" in drawer)
-   `VisitedBusinessPage` — Visitor view, read-only (accessed from categories, search, favorites, Buzz)

When a manager visits their OWN business via categories/search/favorites, they see `VisitedBusinessPage` (visitor mode) — no edit buttons, no management controls. This is by design: the visited business module has NO dependency on `BusinessBloc` or ownership state.

**Dead code removed** (2026-04-12): `business_name.dart` widget in visited business module (imported `BusinessBloc`/`BusinessVM` from owner module and had edit `onTap`), and dead `loggedUserCanEdit` / `loggerUserCanEdit` getters in `promotions_vm.dart` and `menu_vm.dart`.

---

Estoy aquí para ayudarte a desarrollar aplicaciones Flutter de alta calidad siguiendo las mejores prácticas de ingeniería de software. Te asistirá como un compañero de desarrollo senior especializado en Flutter 3.38 y Dart 3.7.
