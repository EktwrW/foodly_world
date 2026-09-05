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

## El stack REAL de este proyecto

Verificado contra `pubspec.yaml`. No proponer alternativas a esto sin que te lo
pidan: la versión anterior de este archivo listaba Riverpod, GraphQL, Isar,
ObjectBox, drift, auto_route, flutter_hooks, Rive, Provider y mockito, y
**ninguna de las catorce estaba en el proyecto**.

| Capa | Lo que se usa |
|---|---|
| Estado | `flutter_bloc` + `bloc`, cubits; `hydrated_bloc` para persistir |
| Navegación | `go_router` |
| Inyección | `get_it` (`dependency_injection_service.dart`), sin `injectable` |
| Red | `dio` + `retrofit` (+ `retrofit_generator`) |
| Modelos | `freezed` + `json_serializable` |
| Almacenamiento | `shared_preferences`, `flutter_secure_storage` (tokens) |
| Tiempo real | `pusher_channels_flutter` |
| Pagos | `flutter_stripe` |
| Firebase | core, auth, analytics, crashlytics, messaging |
| Mapas y lugares | `google_maps_flutter`, `geolocator`, `nova_places_api` (legacy, ver proxy de Places) |
| Tema | `flex_color_scheme` + `google_fonts`; Material 3 |
| OTA | `shorebird_code_push` |
| Tests | `flutter_test` a secas — **no hay** mockito ni bloc_test; los dobles se escriben a mano |

79 dependencias directas en total. Antes de añadir una, comprobar si algo de la
lista ya lo cubre.

---

## Publicación en tiendas (App Store y Play)

### Foodly YA está publicada. Una versión nueva no es un alta.

La app lleva meses en producción en **las dos** tiendas — el registro del
backend menciona un «post-go-live 1.6.4 en Play Store» de junio de 2026. Por lo
tanto, al subir una versión:

**Se heredan** la clasificación por edad, el cuestionario IARC, la seguridad de
los datos, la declaración del ID de publicidad, la URL de borrado de cuenta, el
público objetivo y el resto de formularios. **Sólo se toca lo que cambió de
verdad en esa versión.** Volver a contestarlos es trabajo inventado, y en Play
tocar respuestas ya aprobadas puede reabrir revisiones que estaban cerradas.

Antes de decir que algo «falta», hay que preguntarse si es nuevo **en esta
versión** o si ya estaba publicado. Los posts, el feed por proximidad, los
likes y los seguidores existen desde mucho antes que los pedidos en vivo: no
son un cambio a declarar.

**La excepción es cuando cambia la PREGUNTA, no la app.** En julio de 2026
Apple añadió preguntas sobre capacidades de redes sociales al cuestionario de
edad; ésas hay que contestarlas aunque el feed lleve meses publicado. Es de
Apple y no se traslada a Play por analogía.

### Los límites de cada tienda no son iguales

|  | App Store | Play |
|---|---|---|
| Capturas | 10 por localización | **8** por tipo de dispositivo |
| Notas de versión | 4000 caracteres | **500** |
| Feature graphic | no existe | 1024×500, obligatorio |
| Tamaño de captura | 1290×2796 | 1290×2580 |

Los assets salen de `brand-assets/store-assets`: `render.js` compone las slides
a 2x y `downscale.py` las baja a medida. Un solo comando produce los dos
tamaños, en `appstore/<lang>/` y `play/<lang>/`.

**Las capturas del simulador de iOS sirven para Play.** Flutter dibuja la misma
interfaz en los dos sistemas, y el único elemento que delata el aparato —la
barra de inicio de iOS— cae fuera del encuadre del render. No hay que
recapturar en Android.

### Apple Developer Account
- **Apple ID:** owentours@gmail.com
- **Team ID:** V76AZLAYJ4
- **Bundle ID:** com.foodlysolutions.app
- **App Store Connect App ID:** 6761689908 (App name: "Foodly Solutions")
- **SKU:** foodly_ios_app
- **Min iOS:** 15.0

> **Note:** There is an old app record "Foodly World" (ID: 6741719812) with bundle ID `world.foodly.mobile` — this is deprecated and should not be used. The active app uses `com.foodlysolutions.app`.

### Runbook de release iOS

El orden importa y hay tres trampas dentro. Los comandos van desde `ios/`.

1. `export STRIPE_PUBLISHABLE_KEY=pk_live_...` — ya está en `~/.zprofile`, pero
   **antes de abrir VS Code**: las tasks sustituyen `${env:...}` desde el
   entorno que VS Code cacheó al arrancar, no desde el shell donde corren.
2. Task **«Shorebird - Release iOS (App Store)»**. Depende de
   «Foodly - Verificar Stripe (tienda)», que con `REQUIRE_LIVE=1` mata la
   compilación si la clave es de test. Debe imprimir `✓ Stripe LIVE · …xxxx`.
3. `sh .vscode/upload_dsyms.sh` — **antes de cualquier `flutter clean`**, que se
   lleva el `.xcarchive`.
4. `bundle exec fastlane beta_upload`
5. Si la versión no existe en App Store Connect, crearla a mano:
   **+ Versión o plataforma**.
6. `bundle exec fastlane metadata`
7. Capturas a mano en la consola, información de revisión, y enviar.

**Nunca `fastlane release` sobre una build de Shorebird.** Ese lane hace
`flutter clean` + `flutter build ipa`: reconstruye con Flutter puro, tira la
build de Shorebird y la deja sin tracking para futuros patches OTA. Usa
`beta_upload`, que sube el IPA existente; entra igual en App Store Connect y
aparece en el selector de build de la versión de App Store, no sólo en
TestFlight.

**`beta_upload` no sube los dSYMs** — sólo lo hacía el lane `release`. Sin ellos
los crashes de esa versión llegan a Crashlytics sin simbolizar.

**`fastlane metadata` necesita que la versión ya exista.** Con
`skip_binary_upload: true` deliver no la crea, sólo la busca, y falla con
«Cannot find edit app store version» reintentando siete veces con backoff.

**El JS/CSS que se inyecte en un HTML no va antes del último `</script>`**: si
ese script tiene `src`, su contenido inline se ignora y el código no se ejecuta
nunca, sin error en consola. (Aprendido en la landing, aplica igual aquí.)

### Lanes disponibles

```bash
bundle exec fastlane beta          # build limpio + TestFlight
bundle exec fastlane beta_upload   # sube el IPA existente (el de Shorebird)
bundle exec fastlane release       # build con Flutter puro + App Store — ver aviso arriba
bundle exec fastlane metadata      # sólo textos de la ficha, sin binario ni capturas
```

**Configuración:** `ios/Gemfile`, `ios/fastlane/Appfile`, `ios/fastlane/Fastfile`,
`ios/fastlane/.env` (**no está en git**) y `ios/fastlane/.env.default`.

`.env` necesita `ANALYTICS_TOKEN` y `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD`
(se genera en account.apple.com → Sign-In and Security → App-Specific Passwords).

> **Las claves de los proveedores de IA ya no se inyectan** (2026-08-18). Se
> pasaban por `--dart-define`, o sea compiladas dentro de `libapp.so` / el IPA:
> extraíbles con `strings` desde cualquier binario publicado. La generación de
> AI promos se movió al backend (`POST /promotions/ai-generate`) y las
> credenciales viven en Secret Manager. Si ves `OPENAI_API_KEY` o
> `REPLICATE_API_KEY` en un `.env` local, borralas.

### Build de Android

Task **«Shorebird - Release Android (Play Store)»**, con el mismo guard de
Stripe. Produce `build/app/outputs/bundle/release/app-release.aab`. Para leer
qué lleva dentro (versionCode, targetSdk, permisos reales tras la fusión de
manifiestos), el manifiesto empaquetado está en
`build/app/intermediates/packaged_manifests/release/processReleaseManifestForPackage/AndroidManifest.xml`
— no el de `app/src/main/`, que no incluye lo que aportan los plugins.

### Patches OTA (Shorebird)

Tasks **«Shorebird - Patch Android/iOS (OTA)»**. Llaman a
`.vscode/shorebird_patch.sh`, que **lee la versión de `pubspec.yaml`** en lugar
de llevarla escrita. Antes iba a mano y se quedó en `2.0.2+97` mientras
producción iba por `2.0.6+99`; como esa release vieja SIGUE activa, el patch se
subía en silencio a una release que ya no usa nadie.

**`shorebird patch` NO acepta `--flutter-version`** — es exclusiva de
`shorebird release`. El patch toma la revisión de Flutter de la release que
parchea, que es justo el punto. Copiar los argumentos de la task de release a
la de patch falla con `Could not find an option named "--flutter-version"`.

Antes de subir nada: `--dry-run` compila, verifica que el patch se aplica a la
release y detecta diffs nativos o de assets, sin publicar. Termina en
`No issues detected.`

Un patch OTA sólo lleva **Dart**. Si el cambio toca un plugin, un permiso o el
manifiesto, hace falta release nueva.

### App Review: cómo dejar que el revisor llegue a Apple Pay (2026-09-03)

Apple pidió probar las órdenes y ver Apple Pay. Lo que funcionó:

- **Cuenta demo de comensal, no de dueño**: `userdemo2@mail.com` (la contraseña
  va en App Store Connect, nunca en el repo). `userdemo1` es el manager de The
  Pizzeria Restaurant y verlo desde dentro no es el flujo del revisor.
- **Favoritos en vez de geolocalización**: el revisor está en California y la
  home va por GPS. Con The Pizzeria en favoritos de userdemo2, el camino es
  icono de favoritos → Businesses → The Pizzeria Restaurant → Menu → botón
  "Order live" → "+" en un plato → "View order" → "Finish order" → "Pay the
  order · €X" → PaymentSheet con Apple Pay arriba.
- **El negocio en modo prepago** y con Stripe activo en live; el sheet solo
  declara Apple Pay si la orden trae `business_country` (viene del negocio).
- Un vídeo de ese recorrido, grabado en simulador, acompañó las notas. En
  simulador Apple Pay muestra la hoja pero no completa un pago live: sirve
  para el vídeo, no para probar de verdad.
- Si el revisor completa el pago es dinero real a nuestra propia cuenta: se
  reembolsa desde Stripe. Dejar un plato barato (mínimo €0,50).

**Sign in with Apple en el simulador**: "Ocultar mi email" falla con
`AuthorizationError 1000` (el simulador no provisiona el relay) y el token
suele llegar sin claim `email`, que el código frena a propósito. No es bug de
la app; en dispositivo real funciona. Probar con "Compartir mi email" o en un
iPhone por TestFlight.

**Nombres en las tiendas** desde 2.0.6: "Foodly Solutions: QR Menu" (en-US),
"Carta QR" (es-ES), "Menú QR" (es-MX), "Menu QR" (pt-PT). En App Store viven
en `ios/fastlane/metadata/*/name.txt` y los sube `fastlane metadata`; en Play
el nombre es un campo manual de la consola — nada en el repo lo escribe.

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
- `.vscode/tasks.json` todavía trae en claro `GOOGLE_MAPS_API_KEY`,
  `GOOGLE_SIGN_IN_CLIENT_ID` y `ANALYTICS_TOKEN`. `STRIPE_PUBLISHABLE_KEY` ya
  no: se lee de `${env:...}`. Las tres primeras viajan igualmente dentro del
  binario publicado —son claves de cliente—, así que lo que las protege son
  las restricciones del lado del servidor, no el secreto
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

### La vigencia de una promo se mide por DÍA, no por instante (2026-09-05)

**EL BUG.** Una promo que vencía HOY salía en la home pero no en promociones
guardadas, ni en las pestañas de promos del cliente y del dueño.

La home la filtra el BACKEND, y `NearbyPromotionsController` usa
`whereDate('start_date', '<=', $today)` y `whereDate('expire_date', '>=',
$today)`: compara días de calendario, así que la promo vale todo su último
día. El front comparaba instantes (`expireDate.isAfter(now)`), o sea que la
daba por terminada a las **00:00 de ese mismo día**. Las dos fuentes decían
cosas distintas sobre la misma promo.

Y no estaba en un sitio: la misma regla estaba reimplementada en cinco —
`PromotionDM`, `NearbyPromotionDM`, `promotions_vm` (visita),
`manage_promotions_vm` (dueño) y la página de guardadas. Los dos view models
la tenían copiada a mano ignorando los getters del modelo, que es cómo se
desincronizaron. Ahora la regla vive solo en los dos modelos y el resto
delega.

`DateTimeExtension.dateOnly` es la pieza: normaliza a día local. Si aparece
otro sitio que filtre promos, tiene que usar los getters del modelo, no
comparar fechas a mano.

**Un detalle de los helpers de fecha, que confunde:** `isBeforeNow` NO
significa "esta fecha es anterior a ahora" — está implementado como
`DateTime.now().isBefore(this)`, o sea que devuelve `true` cuando la fecha
está en el FUTURO. `isAfterNow` es el espejo. Los usos que había eran
correctos, pero se leen al revés de lo que dicen.

**Lo que NO es un bug:** una promo guardada que ya expiró no aparece en
"mis promociones favoritas" — la página solo separa activas y próximas, y las
expiradas no caen en ninguna de las dos.

### El appbar del home (2026-09-05)

No tenía ningún bug: tenía cosas sin decidir. Después de rediseñar las dos
tarjetas, el header había quedado siendo lo menos diseñado de la pantalla.

**El `BackdropFilter` no difuminaba nada.** El fondo era un `Stack` con un
`Container` blanco y encima un `BackdropFilter` de sigma .75 con
`primaryFoodly` al 30%. `BackdropFilter` difumina lo que hay DETRÁS, y detrás
solo había blanco uniforme: difuminar blanco da blanco. Era una capa de
composición por frame —en un header `pinned`, que repinta con cada scroll de
la lista— sin ningún píxel de salida. Lo único que pintaba era el tinte, y ese
tinte (#D7B3CE) no era un color elegido: era el morado de marca diluido.

**El saludo y la pregunta eran el mismo estilo.** Los dos usaban
`homeAppBarSmallSubtitle` y el saludo solo le hacía `copyWith(fontSize: 24)`,
así que no había jerarquía, solo escala. Y el eje cambiaba dos veces: saludo a
la izquierda, pregunta centrada, búsqueda a lo ancho.

**El saludo se encogía en vez de recortarse.** Iba en un `FittedBox(scaleDown)`
dentro de un `SizedBox(width: screenWidth * .73)`: a un usuario con nombre
largo le bajaba el tamaño de letra, o sea que el saludo medía distinto según
quién entrara.

**El botón del drawer: círculo sí, neumórfico no.** Se mantiene circular
porque el OTRO botón que abre el drawer —el de
`sliver_app_bar_animations.dart`, que usan el appbar de negocio y el perfil—
también lo es; pero aquel muestra el AVATAR, no el icono de menú, así que el
del home es el único de su tipo y no hay con qué desentonar. Pasa a ciruela
sólido (`NEUMORPHIC_PURPLE_GRADIENT`, el mismo de la barra de compartir y del
"+ info") porque sobre el fondo claro nuevo un círculo blanco no se separaba
de nada, siendo el único control de navegación del header. Sin tooltip, como
estaba: `S.current.menu` es "Menú" y acá se leería como la carta del negocio.
Los iconos, en todo el header, son exactamente los que ya estaban.

**El chip de ubicación tiene variante, no copia.** `CurrentLocationButton` vive
en tres pantallas (home, Sociales, Categorías) y su lógica —los tres casos de
"no tengo ubicación", el aviso de cobertura, el diálogo— es lo caro de
mantener. En vez de un widget nuevo para el home, tiene un
`CurrentLocationStyle`: `translucent` (el de siempre, que funciona igual sobre
el morado de Sociales que sobre el claro de Categorías) y `homeAppBar`. Solo
cambia el envase. Los botones de teclado y micrófono sí se alinearon a esa
familia sin variante porque viven únicamente en el `SearchWidget` del home.

**`secondaryFoodlyTextOnTint` existe por el mismo motivo que
`secondaryFoodlyText`.** Sobre el extremo oscuro del degradado del header
(#E6CBE0), el tono normal de texto secundario da 3,75:1 — por debajo del 4,5:1
que pide la WCAG a 13 px. `text_contrast_test.dart` mide los dos, y también
comprueba que el normal NO llegue: si algún día uno de los dos sobra, que sea
una decisión y no un descuido.

**El icono del teclado no estaba descentrado por layout.** El `ElevatedButton`
ya centra a su hijo: envolverlo en un `Center` no cambia un píxel (medido, las
dos capturas salen idénticas). Lo que está descentrado es la TINTA del glifo
dentro de su cuadro em. Renderizando a 10× y midiendo la caja de tinta:
`FontAwesome.keyboard` cae 0,7 px a la derecha y 0,5 px abajo a tamaño 23;
`FontAwesome.microphone_lines_solid` mide 0,0 y por eso no lleva corrección.

El código anterior ya compensaba esto —el padding asimétrico `left: 6,
right: 9`— pero empujaba 1,5 px, o sea que corregía de más y dejaba el icono
descentrado hacia el otro lado. Ahora va con un `Transform.translate`, que no
toca ni el tamaño ni el área táctil. Si algún día se cambia el icono, la
corrección hay que volver a medirla o quitarla.

**El degradado del fondo se reparte sobre ~208 px, no sobre 149.** El
`SliverAppBar` pinta también la zona de la status bar, así que su caja real es
`expandedHeight + topPadding`. El borde inferior queda en el color final
exacto, pero el tramo donde cae el saludo se ve más claro que en el mock. Es
deliberado que se haya dejado así; y el test de contraste mide contra el
extremo oscuro del degradado, o sea el peor caso, así que sigue siendo una
cota segura.

**La variante en morado quedó guardada para el tema oscuro.** Es el mismo
layout con `UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT` —el degradado que ya
usa la cabecera de Promos— y los controles en vidrio blanco. En claro
competía con los títulos de sección y endurecía el salto contra las tarjetas;
en oscuro es exactamente lo que hace falta. Está en el canvas `AppBar del home
Foodly` (claude.ai/code/artifact/7c00f489-508f-4ab1-b917-f939f901c84f).

### La card de negocio de "Nuevos en Foodly" (2026-09-04)

Mismo rediseño que la card de promo, y por eso comparte el sistema:
`FoodlyGlassPanel` para la cinta, `UIDecorations.CARD_SHADOW` para la sombra,
`FoodlyThemes.titleOnGlass` para el título. El widget dejó de ser privado
(`NewReleaseBusinessCard`) para poder testearlo.

**Aquí no había solo un problema de jerarquía: había tres bugs.**

1.  **El nombre desbordaba.** Vivía en un `Text` dentro de un `Column` dentro
    de un `Row`, sin `Expanded` ni `Flexible`. Con un nombre corto entraba;
    con uno largo se salía de la tarjeta con las rayas de overflow. El test a
    320 dp es lo que impide que vuelva.
2.  **Tocar la foto no abría el negocio.** La portada usaba
    `FeedMultipleImageView`, que trae su propio `GestureDetector` y abre el
    visor de imágenes. El gesto que navegaba estaba por fuera, así que la
    zona más grande de la tarjeta hacía algo distinto del resto. Ahora se
    dibuja `MultipleImageView` — el mismo collage, sin gesto.
3.  **La descripción se rellenaba con saltos de línea.** Vivía en un
    `SizedBox(height: 60)` cuyo valor por defecto era la cadena `'\n \n'`.

Y de andamiaje: la cabecera morada eran **dos `Card` apiladas** (una de 90 px
detrás, la principal con `paddingOnly(top: 55)` encima) y el logo de 100 px
flotaba en 50 px de zona muerta. La pastilla de ubicación era blanco sobre
`tertiaryFoodly` — 2,3:1, la mitad del mínimo WCAG — y `+ info` era el único
azul de la pantalla.

**Lo que recortaba la sombra de la tarjeta (2026-09-05).** Eran DOS capas, las
dos por defecto y las dos invisibles hasta que se mira el borde:

1.  El `layoutBuilder` por defecto de `AnimatedSwitcher` es un `Stack`, y
    `Stack` recorta (`Clip.hardEdge`) a la caja de la tarjeta.
2.  `SizeTransition` envuelve a su hijo en un `ClipRect` — es como consigue el
    efecto de crecer —, así que recorta también, y al terminar la animación
    sigue recortando.

La altura ya la anima el `AnimatedSize`, así que la transición del hijo solo
tiene que ser un fundido: no necesita recortar nada. Si alguien vuelve a poner
`SizeTransition` ahí, la sombra se corta otra vez.

**Las flechas se fueron a los costados de la portada.** Estaban abajo
flanqueando los puntos, a 20 px de diámetro y en neumórfico: lejos del
contenido que mueven y por debajo del mínimo táctil. Ahora son
`FoodlyGlassButton` de 44 px sobre la foto, ancladas al centro vertical de la
portada — que es calculable sin medir nada, porque la portada es 4:3 a todo el
ancho. Los puntos se quedan abajo: siguen diciendo cuántos hay y en cuál
estás, que es lo que las flechas no dicen.

**El fantasma al cambiar de tarjeta.** `AnimatedSwitcher` desvanece la saliente
y la entrante A LA VEZ, apiladas: durante ~450 ms se veían los dos negocios
encima uno del otro, con el nombre y la descripción de cada uno cruzados. Se
arregla con `switchOutCurve: const Threshold(0)`.

**TODAS LAS TARJETAS MIDEN LO MISMO, Y ES A PROPÓSITO.** Es la regla que más
fácil se rompe sin querer, así que: el nombre va a UNA línea y el hueco de la
descripción se reserva SIEMPRE, tenga texto o no.

No es estético. Esta sección rota sola cada 4 segundos dentro de un
`SingleChildScrollView`: si las tarjetas miden distinto, cada rotación mueve
todo lo que hay debajo sin que el usuario haya tocado nada, y puede desplazar
justo lo que estaba por tocar.

Hubo un intento intermedio de animar ese cambio de alto con `AnimatedSize`.
Suavizaba el tirón pero no lo quitaba: lo que molesta no es que el cambio sea
brusco, es que haya cambio. Se quitó cuando las alturas pasaron a ser
constantes por construcción.

El alto reservado sale de `_reservedLines`, que lo calcula desde la métrica del
`TextStyle` y el `textScaler` del sistema — no de un número clavado. Con un
`SizedBox(height: 60)` fijo, subir el tamaño de letra en Ajustes recorta el
texto. El test `todas las tarjetas miden lo mismo` cubre las cuatro
combinaciones (sin descripción, con, con una larga, y con nombre largo).

**El placeholder vacío espeja la card a propósito.** Si se cambia una,
`_EmptyNewReleasesWidget` tiene que cambiar con ella: su docblock promete el
mismo shape, y con radios distintos la transición vacío → real se siente como
un salto de layout.

**La propuesta B quedó guardada, sin implementar**, igual que la de promos:
portada 4:5 a sangre con todo en vidrio oscuro encima. Aquí sale más barata
que en promos (458 px contra los 489 de antes, porque desaparece el cuerpo
blanco), pero pide encuadre 4:5 y un degradado que aguante portadas claras.
Está en el canvas `Card de negocio Foodly`
(claude.ai/code/artifact/ac8db81c-a23f-4335-b1a7-daa8b35f9731), segunda página.

**Lo que quedó descolgado:** el `BusinessCard` compartido de búsqueda y
favoritos es un cuarto lenguaje visual para el mismo objeto. No se tocó.

### La card de promoción: rediseño y por qué la B quedó guardada (2026-09-04)

La promo se dibujaba en tres sitios que no se parecían entre sí: el carrusel
de la home (`main_top_offers_widget.dart`), la card grande en modo visita y la
misma card en modo dueño. Las dos grandes eran **el mismo archivo copiado**,
con `PromotionCard` y `PromoMedia` declarados dos veces, idénticos salvo el
control de arriba a la derecha.

**Lo que estaba mal, en orden de impacto:**

1.  Jerarquía plana. Título a 17 px contra descripción a 14: el gancho ganaba
    3 px. Todo centrado, todo con el mismo peso.
2.  Colores fuera del sistema. `Colors.green[900]` en el título y
    `Colors.green[700]` en el megáfono — ninguno es token Foodly — y
    `FoodlyThemes.error` (#F31708) en la fecha de fin, rojo de alarma para un
    dato que no es un error.
3.  Los días envolvían. `Wrap` con `minWidth: 54` y `spacing: 12`: siete no
    entran en 390 dp (7 × 54 + 6 × 12 = 450) y caían 6 + 1.
4.  Áreas táctiles por debajo del mínimo: 28 px el corazón, 32 px el expandir
    del carrusel.
5.  Ampliar la imagen era un tap invisible sobre la foto, sin ninguna pista.
6.  `Card(elevation: 3)` envolviendo un `ui.NeumorphicButton` **sin
    `onPressed`**: dos sistemas de sombra superpuestos y un contenedor
    disfrazado de botón.

**Lo que se hizo (propuesta A).** La card vive una sola vez en
`lib/ui/shared_widgets/cards/promotion_card_view.dart`; las dos `part` de las
páginas quedan como envoltorio que solo elige el control superior derecho. El
vidrio se centralizó en `lib/ui/shared_widgets/glass/foodly_glass.dart`: antes
cada sitio inventaba su sigma y su blanco (6 y `embossMaxWhiteColor` al 50% en
el carrusel, 6 y negro al 45% en el visor, 3 y `Colors.white38` en el sheet).

El contenido es **exactamente** el de antes. Lo único que se añadió es el
tooltip `expandImage` y que los días inactivos ahora también se dibujan, en
gris: es el complemento del mismo dato y es lo que permite la fila fija.

**Dos cosas que no son obvias mirando el código:**

-   **La cinta se ancla con `bottom: -_ribbonOverflow` a propósito.** Sobresale
    siempre 30 px exactos por debajo de la foto, cuánto mida el título dentro.
    Por eso el cuerpo puede reservar arriba `_ribbonOverflow + 16` y el hueco
    bajo la cinta es siempre 16. Si se cambia a `Transform.translate` deja de
    cuadrar: el transform no ocupa layout y el cuerpo se sube 30 px.
-   **El peor caso de contraste del vidrio claro es calculable.** Es blanco al
    74%, así que sobre una foto negra queda en un gris medio, y ese gris es el
    suelo contra el que miden el título y el subtítulo. Está en
    `test/ui/theme/text_contrast_test.dart`, sacado del propio token: si
    alguien baja el alpha del vidrio, el test lo caza.

**El corazón de favoritos, dos intentos.** La primera versión lo envolvía en
vidrio CIRUELA y le apagaba su fondo con `enableBackground: false`.
`FavoriteButton` pinta el corazón guardado con `FoodlyThemes.favourites`, que
es ese mismo ciruela: guardada, el corazón desaparecía en el vidrio.

El segundo intento fue devolverle su fondo (blanco cuando guardada). Se leía,
pero `UIFavoriteWidget` dibuja ese fondo como un CÍRCULO y el vidrio es un
cuadrado redondeado: aparecía un círculo blanco metido en un squircle, con las
esquinas del vidrio asomando, y al lado del botón de ampliar se veía
descuadrado.

Lo que quedó es que el estado lo cuente **el tono del vidrio**, que ya tiene la
forma correcta: `FoodlyGlassTone.dark` sin guardar, `light` guardada, con el
corazón blanco o ciruela encima. Misma silueta en los dos estados. Por eso
`PromoFavoriteButton` tiene su propio `BlocBuilder` aunque `FavoriteButton` ya
tenga uno: el tono se decide FUERA del botón. El carrusel no puede usar ese
widget —su modelo es `NearbyPromotionDM`, con el estado en `isFavorited`— así
que ambos comparten `PromoFavoriteGlass`.

Ninguno de los dos problemas lo vieron los tests: los dos salieron de mirar el
simulador.

**La sombra de la card en el carrusel.** El `PageView` de `carousel_slider`
recorta su viewport (`Clip.hardEdge` por defecto) y la sombra esparcida moría
en seco contra el borde de abajo. Darle hueco dentro del item NO alcanza: con
`blurRadius: 30` la sombra se desvanece a lo largo de unos 40 px y ese hueco se
come la card en un viewport de 219 dp. La salida es
`CarouselOptions(clipBehavior: Clip.none)` — lo único que se sale del viewport
es sombra.

**El favorito del carrusel no avisaba de nada.** Venía de antes del rediseño.
`NearbyPromoCard` usa `UIFavoriteWidget` directo en vez del `FavoriteButton`
compartido, porque su modelo es `NearbyPromotionDM` y el estado viaja en
`isFavorited`. Al saltarse el botón compartido se saltaba también lo que ESE
hace además de dibujar: la animación al pasar a favorito y el snackbar de
"añadida"/"eliminada". Guardar una promo desde la home no daba ninguna
respuesta; la misma promo desde la vista completa, sí. `_NearbyFavoriteButton`
replica esas dos cosas; el toggle sigue yendo por `NearbyPromotionsCubit`.

Si alguien vuelve a usar `UIFavoriteWidget` directo en otra pantalla, esto es
lo que hay que acordarse de replicar.

**La propuesta B quedó guardada, sin implementar.** Es la misma card con la
foto en 4:5 en vez de 16:9 — 458 px de alto contra 206, título en vidrio
oscuro sobre la imagen y hoja blanca montada abajo. No entró ahora porque
pide tres cosas que A no pide:

1.  El carrusel de la home crece ~142 px por card.
2.  Las fotos apaisadas ya publicadas se recortan. La salida es marco 4:5 con
    la imagen `contain` encima de una copia difuminada de sí misma, que es lo
    que evita que ninguna promo existente pierda encuadre.
3.  El editor de promociones tendría que enseñar el marco 4:5 al subir.

El diseño de las dos está en el canvas `Widget de promoción Foodly`
(claude.ai/code/artifact/7d36652a-5bac-47da-8165-59290f29f361), con la hoja de
valores exactos.

### Revolut Pay no salía en iOS: el sheet lo filtra sin `returnURL` (2026-09-04)

En producción (2.0.6+99) Revolut Pay aparecía en el PaymentSheet de **Android**
y no en el de **iOS**, con el mismo código Dart y el mismo negocio. No era la
cuenta ni la configuración de Stripe: el PaymentIntent de esa misma pantalla
ofrecía `["card", "link", "mb_way", "revolut_pay"]` y la payment method
configuration tenía `revolut_pay` activo.

Lo filtra `stripe-ios` antes de dibujar. En `PaymentMethodType.swift`
(`supportsAdding`) cada método declara sus requisitos y `.revolutPay` devuelve
`[.returnURL]`; en `PaymentElementConfiguration.swift`, `fulfilledRequirements`
solo añade `.returnURL` `if returnURL != nil`. La app nunca lo mandaba, así que
el requisito no se cumplía y el método desaparecía. Misma regla para PayPal,
Klarna, Amazon Pay, Satispay, TWINT y compañía.

**Android no lo exige**, y de ahí la asimetría que despistaba: su SDK trae su
propio retorno (`stripesdk://payment_return_url/<applicationId>`) y no
condiciona la visibilidad a nada nuestro. Su plugin ni siquiera lee `returnURL`
del mapa de la hoja; el `urlScheme` de `Stripe.initialise` que sí existe
alimenta `confirmPayment`/`confirmSetupIntent`, no el PaymentSheet, y la app no
lo usa. Mandar la clave en ambas plataformas es inocuo: en Android **ya viajaba
como `null` en todos los builds** (`payment_sheet.g.dart` la emite siempre) y el
parser nativo ignora lo que no conoce. No es ni una clave nueva.

Arreglo: `StripePaymentService.stripeReturnUrl` +
`CFBundleURLTypes` en `ios/Runner/Info.plist`. El plugin ya implementa
`application(_:open:options:)` y llama a `StripeAPI.handleURLCallback`, así que
**no hay que tocar el `AppDelegate`**: se registra con `addApplicationDelegate`
y `FlutterAppDelegate` consulta a los plugins ANTES de mirar el deep linking de
Flutter. El plugin imprime en debug un aviso diciendo que con
`FlutterDeepLinkingEnabled` hay que llamar a mano a `Stripe.handleURLCallback`;
en Flutter 3.44.6 **eso no aplica** (comprobado en `FlutterAppDelegate.mm`).

Dos cosas que conviene no repetir:

- **Es cambio nativo: no viaja por patch OTA.** Registrar el esquema toca el
  bundle, así que necesita build nueva de tienda.
- **MB WAY no es el mismo caso.** Nunca estuvo en el sheet nativo (por eso
  existe el botón aparte a la página alojada). Que faltara a la vez que Revolut
  invitaba a juntarlos y es una pista falsa.

El esquema es reverse-DNS (`com.foodlysolutions.app`, el propio bundle id) por
anti-colisión, no por seguridad: iOS no reserva esquemas y otra app puede
registrar el mismo, eligiendo el sistema cuál gana. El sufijo `stripe-redirect`
lo separa del `<bundle-id>://firebaseauth/link` de Firebase Auth. Un test ata la
constante de Dart al esquema del plist para que no se separen.

Riesgo asumido, acotado y NO del todo cubierto: Revolut Pay es el primer método
del sheet que SACA al comensal de la app. Si vuelve sin aprobar, el intento queda
en `requires_action`, iOS reporta `Canceled` y la pantalla llama a
`cancelPayment()`.

El dinero está a salvo —`hasCommittedFunds()` pregunta a Stripe antes de soltar
nada—, pero **la orden se queda bloqueada hasta 6 minutos**: sin Checkout Session
(y el PI de la hoja nativa nunca la tiene) esa función devuelve `true` durante
`REQUIRES_ACTION_TTL_MINUTES = 6` contados desde `intent->created`, así que
`cancelPayment` responde 409, el participante sigue en `processing` y no hay
webhook que lo libere. `group_order_page.dart` se traga ese 409 en silencio, así
que el comensal no ve por qué no puede reintentar.

No es una regresión de este cambio: la ventana existe desde el 2026-08-15 para el
3DS de tarjeta abandonado en la hoja nativa, que llega al mismo sitio. Revolut
sólo añade otro camino hacia ella, y probablemente más transitado (saltar a otra
app y volverse atrás es más fácil que abandonar un 3DS). Si se vuelve molesto, el
arreglo no es tocar el TTL sino que la pantalla distinga el 409 y lo explique.
Probarlo en vivo antes de publicar.

### Ubicación: la última conocida primero, el fix después (2026-09-03)

`LocationBloc.determinePosition` emite `locationChecked` DOS veces por
arranque en nativo: primero con `getLastKnownPosition()` (caché del sistema,
milisegundos) y después con el fix preciso de `getCurrentPosition` (hasta
10-12 s en interiores). Antes la home no pedía nada hasta el fix. Quien
consuma la posición tiene que tolerar la segunda emisión:
`FoodlyLocationWrapper` y la página de categorías solo recargan si
`LocationService.movedSignificantly(antes, después)` (≥ 1 km: con radios de
15-20 km, menos no cambia lo que se ve). Una última conocida de más de una
hora se descarta (es la última fix del sistema, de cualquier app; en iOS puede
ser de hace días y pintaría otra ciudad). La provisional NO trae ciudad ni
dirección (el reverse-geocoding corre tras el fix): el chip de la home cae a
"Usar ubicación del dispositivo" en vez de pintar `" ."`, y el registro sigue
actualizando las coordenadas con cada emisión mientras vengan del dispositivo.
En web no hay última conocida (`geolocator_web` no la implementa) y sigue
habiendo una sola emisión.

### Menú visitado: negocio y menú en paralelo (2026-09-03)

`VisitedMenuCubit` pedía el menú y DESPUÉS el negocio (`fetchBusinessById`)
cuando el caller no traía el `BusinessDM`: dos viajes en serie de ~0,7 s. Los
callers que conocen el uuid del negocio (pedidos en vivo, buzz, join por
link) lo mandan en la ruta como `?b=<uuid>` y el cubit lo pide a la vez que el
menú (`businessUuid:` en el constructor, `_businessInFlight`). Con `extra:
BusinessDM` no hay petición; sin `?b=` ni `extra`, se sigue pidiendo después.
Si el `?b=` no coincide con el negocio que trae el menú, se pide el correcto.

### Imágenes: una sola caché de disco, `memCacheWidth` y precarga acotada (2026-09-03)

Toda imagen que pasa por `CachedNetworkImage` usa `FoodlyImageCache.manager`
(`core/services/foodly_image_cache.dart`): 1000 objetos, 30 días. Widget
(`CachedNetworkImage`) y provider (`CachedNetworkImageProvider`) tienen que
usar el MISMO gestor; con dos, la precarga escribe en uno y la pantalla lee del
otro y se descarga dos veces. `DefaultCacheManager` (200 objetos, 7 días) se
quedaba corto: entre menús, promos y avatares se desalojaba en dos sesiones.

El bucket sirve las fotos con caché inmutable de un año (be-foodly,
2026-09-03) y cada subida tiene URL nueva, así que guardar mucho tiempo es
seguro: una foto reemplazada nunca llega con la misma URL.

Quedan `Image.network` sueltos (paquetes de servicio, reservas del manager,
snackbars de negocio) que no pasan por ninguna caché de disco: pendiente.

**`memCacheWidth` siempre que la imagen se pinte pequeña, y con dos trampas.**
Si el widget usa `imageBuilder`, `memCacheWidth` NO afecta a lo que se pinta
(OctoImage descarta su `Image` interno): hay que envolver el provider con
`ResizeImage` del mismo ancho, como hace `AvatarWidget._resized`. Y si el ancho
puede ser `double.infinity` (tarjetas en rejilla), `(width * 3).ceil()` lanza:
`AvatarWidget._memCacheWidth` devuelve null en ese caso. La precarga del menú
resuelve con `ResizeImage(…, width: menuCardMemCacheWidth)` y suelta el
listener; sin eso decodificaba el original entero y nunca lo liberaba. Sin él, una foto de
1280 px se decodifica entera (~5 MB de RAM) para una tarjeta de 100 px, la
caché en memoria de Flutter (100 MB) se llena con veinte y redecodifica al
hacer scroll. Tarjetas de menú: 400. Avatares: `width * 3`.

**La precarga del menú solo cubre la primera pantalla**
(`menu_precache.dart`): `ceil(alto / 110) + 2`, entre 6 y 16, tope 1,5 s. Antes
eran todas las fotos con tope de 4 s, que en móvil se agotaba siempre: spinner
de 4 s y las fotos entraban igual a cuentagotas. Usa `PlatformDispatcher`, no
`WidgetsBinding`, para que los tests del cubit no necesiten binding.

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
