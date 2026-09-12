# Foodly · notas para Claude

Este fichero NO es una guía de Flutter: es lo que no se deduce leyendo el
código. Está organizado en tres partes:

1. **El stack real** y las reglas de publicación en tiendas.
2. **Los hallazgos**, uno por sección y **fechados**, de lo más nuevo a lo más
   viejo. Cada uno cuenta qué estaba mal, qué se midió y qué trampa hay dentro.
3. **Las convenciones** de idioma y de l10n, al final.

**Stack:** Flutter **3.44.6** (la versión que fijan las tasks de Shorebird) con
`sdk: ^3.6.0`. Material 3 vía `FlexThemeData`. El detalle, en la sección
siguiente.

**Cómo se escribe aquí:**

- **El código va escueto; las explicaciones, en este fichero.** Un docblock de
  treinta líneas dentro de un widget es ruido — el porqué vive aquí, con su
  fecha y su medición.
- **Widgets concretos antes que `Container`**: `SizedBox`, `ConstrainedBox`,
  `DecoratedBox`, `ColoredBox`.
- **Medir antes que razonar.** Casi todos los hallazgos de abajo empiezan
  porque el inventario decía una cosa y las medidas decían otra.
- **Un test verde puede estarlo por el motivo equivocado.** Valídalo por
  mutación: rompe la línea que debería protegerlo y comprueba que se pone rojo.
- **Una recomendación, no un volcado de opciones.** Si hay que decidir, decide y
  explica por qué; si la decisión es del usuario, se pregunta una vez y en corto.

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
- **App Store Connect App ID:** 6761689908 (nombre de la app: "Foodly Solutions")
- **SKU:** foodly_ios_app
- **iOS mínimo:** 15.0

> **Ojo:** existe una ficha vieja, "Foodly World" (ID: 6741719812), con bundle id
> `world.foodly.mobile`. Está obsoleta y no se usa. La app activa es
> `com.foodlysolutions.app`.

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

**El token de sesión dura 15 min y el patch tarda más (2026-09-07).** El
`patch ios` de `2.0.8+101` compiló, subió los artefactos y murió en el último
paso con `Unauthorized` al pedir los channels. El access token de
`~/Library/Application Support/shorebird/credentials.json` se emite al arrancar
el comando con 15 minutos de vida y el CLI **no lo refresca a mitad de run**
(upstream tiene abierta la rama `fix/login-expired-credentials`); solo el link
de AOT se llevó 240 s. El patch **queda creado y subido, pero sin track**: no
llega a ningún teléfono y no hace falta recompilar nada.

```sh
shorebird patches list --release-version 2.0.8+101      # «[no track]» = huérfano
shorebird patches set-track --release 2.0.8+101 --patch 1 --track stable
```

`patches promote` hace lo mismo pero está deprecada y usa otros nombres de
flags (`--release-version`, `--patch-number`).

Después de cada patch, confirmá con `patches list` que dice `track: stable`.

**UN ICONO NUEVO ES UN CAMBIO DE ASSET, aunque parezca Dart puro (2026-09-12).**
Las fuentes de iconos se recortan al montar —el `tree-shaken … 99.1% reduction`
que sale en el log de build— así que **dentro del binario solo están los glifos
que el código usaba ese día**. Un patch reemplaza el snapshot de Dart y nada
más: no puede añadir glifos. Referenciar uno que falte deja el icono **en
blanco** en el dispositivo, sin error y sin aviso en tiempo de ejecución.

Shorebird sí avisa, pero con un mensaje que se malinterpreta fácil:

```
[WARN] Your app contains asset changes, which will not be included in the patch.
    Changed files:
        …/flutter_assets/fonts/MaterialIcons-Regular.otf
        …/packages/icons_plus_pro/assets/fonts/Bootstrap.ttf
Continue anyway? (y/N)
```

**Lo que importa NO es que los ficheros difieran**, que es lo único que dice el
aviso: importa si el código nuevo pide un glifo que el binario no trae. Quitar
iconos también cambia la fuente y es inofensivo. La comprobación, que se hace
en segundos:

```sh
# glifos referenciados en el commit de la release vs los del arbol de trabajo
git ls-tree -r --name-only <commit-de-la-release> lib/ | grep '\.dart$'
# … y buscar `Icons.` / `Bootstrap.` en los dos lados: lo que sobre en el
# arbol de trabajo es lo que saldria en blanco.
```

Pasó preparando el patch #2 de `2.0.8+101`: de todo el trabajo de estados
vacíos, los **únicos tres glifos nuevos** eran los iconos por defecto de
`FoodlyEmptyView` (`inbox_outlined`, `filter_alt_outlined`, `wifi_off_outlined`)
— justo los que se pintan cuando la pantalla no trae icono propio, o sea todos
los vacíos de filtro y de fallo. Se cambiaron por `outbox_rounded`,
`tune_rounded` y `wifi_off_rounded`, que ya viajaban dentro. Está documentado en
el propio `_iconoPorDefecto`.

Si de verdad hace falta un glifo nuevo, entra por release de tienda.

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

### Firma
- **Firma automática** desde Xcode con el Team V76AZLAYJ4
- Los perfiles de aprovisionamiento los gestiona Xcode solo
- Capacidades activadas: Associated Domains, Push Notifications

### Metadatos de App Store
Los textos preparados —descripciones, palabras clave, notas de versión— en los
tres idiomas (EN/ES/PT) están en `ios/fastlane/metadata/app-store-metadata.md`.

### Textos de permisos, traducidos
Las descripciones de permisos de iOS viven en:
- `ios/Runner/en.lproj/InfoPlist.strings`
- `ios/Runner/es.lproj/InfoPlist.strings`
- `ios/Runner/pt.lproj/InfoPlist.strings`

### Notas de seguridad
- `.vscode/tasks.json` todavía trae en claro `GOOGLE_MAPS_API_KEY`,
  `GOOGLE_SIGN_IN_CLIENT_ID` y `ANALYTICS_TOKEN`. `STRIPE_PUBLISHABLE_KEY` ya
  no: se lee de `${env:...}`. Las tres primeras viajan igualmente dentro del
  binario publicado —son claves de cliente—, así que lo que las protege son
  las restricciones del lado del servidor, no el secreto
- `android/key.properties` y `android/app/foodly-release.jks` **están
  commiteados** en el repo a pesar de figurar en `.gitignore`. Hay que rotarlos
  y limpiar el historial de git
- `NSAllowsArbitraryLoads` está en `true` en el `Info.plist` (hace falta para
  algunas URL de imagen) — puede pedir justificación en App Review

---

## Autenticación con doble token (2026-04-12)

### La idea

La app usa **dos tokens**: uno de acceso, corto (24 h), y uno de refresco,
largo (180 días). Es lo que permite que el login biométrico siga funcionando
después de semanas sin abrir la app, sin pedirle al usuario que se autentique
otra vez.

### El recorrido de los tokens

1. **Login / registro / login social** → el backend devuelve `access_token` y
   `refresh_token`
2. **Peticiones normales** → va el `access_token` como cabecera Bearer
3. **El de acceso caduca** (umbral de 23 h en el cliente) → refresco silencioso
   proactivo con el `refresh_token`
4. **Un 401 en cualquier petición** → refresco silencioso reactivo y reintento
   de la petición original
5. **El de refresco caduca** (180 días) → se limpia la sesión y el usuario tiene
   que volver a autenticarse

### Ficheros clave

-   **`lib/core/services/auth_session_service.dart`**: el gestor central de la
    sesión. Guarda `_refreshToken` en memoria y delega la persistencia en
    `SecureTokenService`. Métodos:
    -   `setSession(UserSessionDM)` — guarda los dos tokens y los persiste en el
        almacenamiento seguro
    -   `silentRefresh()` — canjea el token de refresco por un par nuevo con
        `POST /token/refresh`. Inyecta temporalmente el de refresco como
        cabecera Bearer y restaura el de acceso si sale bien.
    -   `initializeSessionOrClear()` — al arrancar la app, intenta el refresco
        silencioso si el token de acceso está caducado
    -   `restoreTokensFromSecureStorage()` — restaura los tokens del
        almacenamiento cifrado en arranque en frío, más la migración de una sola
        vez desde HydratedBloc
    -   `isAccessTokenExpired` — usa un umbral de 23 h (el del backend es de 24)
    -   `clearSession()` — borra `_refreshToken` y llama a
        `SecureTokenService.clearAll()`

-   **`lib/core/services/secure_token_service.dart`**: envuelve
    `flutter_secure_storage` v10. Guarda el token de acceso, el de refresco, el
    tipo y la marca de tiempo de creación en el almacenamiento cifrado de la
    plataforma (Keychain en iOS, AES-GCM en Android).
    -   Claves: `foodly_access_token`, `foodly_refresh_token`,
        `foodly_token_type`, `foodly_token_created_at`
    -   Android: `AndroidOptions()` por defecto — la v10 usa AES-GCM con
        envoltura de clave RSA OAEP automáticamente; **no hace falta** el flag
        `encryptedSharedPreferences`, que está obsoleto
    -   iOS: `IOSOptions(accessibility: KeychainAccessibility.first_unlock)`

-   **`lib/core/network/base/dio_request_handler.dart`**: el interceptor de Dio.
    -   **Interceptor de petición (proactivo)**: antes de mandar nada comprueba
        `isAccessTokenExpired`. Si está caducado y no hay ya un refresco en
        curso, llama a `silentRefresh()` y actualiza la cabecera.
    -   **Interceptor de error (reactivo)**: ante un 401 intenta
        `silentRefresh()` y reintenta la petición original UNA vez. Si el
        refresco falla, llama a `notifyTokenExpired()`.
    -   **Lista de exclusión**: `/token/refresh`, `/login`, `/register`,
        `/social-login`. Esos endpoints se saltan el interceptor de refresco
        para no entrar en un bucle infinito.

-   **`lib/core/blocs/root/root_bloc.dart`**: la persistencia de HydratedBloc.
    `toJson()` quita `token`, `access_token` y `refresh_token` antes de escribir
    en SharedPreferences, que va en claro. `fromJson()` restaura la sesión desde
    el almacenamiento seguro con `unawaited(_restoreAndInitialize())`.

-   **`lib/core/network/users/me_client.dart`**: el endpoint de Retrofit
    `POST /token/refresh → UserSessionDM`

-   **`lib/data_models/user_session/user_session_dm.dart`**: el modelo de Freezed
    lleva `accessToken` (`@JsonKey(name: 'access_token')`) y `refreshToken`
    (`@JsonKey(name: 'refresh_token')`).

### Las fechas las manda el idioma, no el país del GPS (2026-09-07)

`getStringFormat` y `getBirthdayFormat` (`lib/core/extensions/datetime_extension.dart`)
miraban `currentCountryCode` **antes** que el idioma:

```dart
if (countryCode == 'ES') return _dateStringES;
if (countryCode == 'PT') return _dateStringPT;   // ← ganaba este
if (lang == FoodlyStrings.ES) return _dateStringLAT;
return _dateStringUS;
```

Con la app en español desde Portugal, las fechas salían en portugués. **Está
publicado**: la captura española del slide 4 de App Store y Play dice «31 de
maio de 2026». Se descubrió preparando la recaptura de esas fichas, no por un
reporte.

La comprobación de país además no aportaba nada: los tres formatos largos usan
el MISMO patrón (`d 'de' MMMM 'de' yyyy`), así que lo único que cambiaba era el
nombre del mes — justo lo que tiene que seguir al idioma. Y `es` y `es_ES` dan
el mismo nombre, o sea que la rama de España era código muerto; se borraron
`_dateStringES` y `_birthdayStringES`, con un test que avisa si algún día
dejaran de coincidir.

Tampoco había rama de idioma portugués: con la app en portugués fuera de
Portugal las fechas salían en inglés.

Ahora las dos ordenan por `Intl.getCurrentLocale()` con `startsWith`, porque el
locale llega como `es_ES` / `pt_BR` / `en_US`, no pelado.

**`getShortFormat` es el caso contrario, y también estaba mal.** Ahí el país SÍ
manda —el orden de día y mes es convención regional, no del idioma: un inglés en
Madrid lee `31/05` y un hispanohablante en Texas `05/31`—, pero la regla estaba
invertida:

```dart
if (countryCode == 'US' || (lang != ES && countryCode != 'ES' && countryCode != 'PT'))
```

`MM/dd` era el caso por defecto y `dd/MM` la excepción, cuando en el mundo pasa
justo al revés: Estados Unidos es prácticamente el único país que escribe el mes
primero. Con la app en portugués desde Brasil salía `05/31`, y también en
Francia, México o Reino Unido con la app en cualquier idioma que no fuera
español. Ahora es `MM/dd` solo si el país es Estados Unidos.

Riesgo de ese cambio, medido antes de hacerlo: tres sitios de uso —la fecha de
una reseña y los dos botones de fechas al crear promoción—, los tres pintando
texto. Nada parsea esa cadena de vuelta; lo que viaja es el `DateTime`.

**Queda un resto sin tocar:** `currentCountryCode` cae a Estados Unidos mientras
no haya ubicación, así que antes de resolver el GPS se ve `MM/dd`. Es el
comportamiento que ya había.

La tabla de idioma × país está en `test/core/fecha_por_idioma_test.dart`, 31
casos. Valídala por mutación: devolver la comprobación de país al principio de
`getStringFormat` pone 5 en rojo, y restaurar la regla vieja de `getShortFormat`
otros 6.
### La tira de promos de la home tiene TRES estados y los tres medían distinto (2026-09-06)

La home pega un salto al terminar de cargar las promos: la tira encoge y el
título "Nuevos en Foodly" con su tarjeta suben de golpe. La causa es que la tira
se pinta de tres formas —shimmer de carga, placeholder de vacío/error y
carrusel cargado— y **cada una sacaba su alto por su cuenta**.

Medido pintando los widgets (`test/ui/home/home_promo_strip_sin_salto_test.dart`):

| ancho | shimmer | vacío | cargado | salto |
| ----- | ------- | ----- | ------- | ----- |
| 375 (iPhone SE) | 333 | 301,9 | **210,9** | +122 |
| 402 (iPhone 16 Pro) | 333 | 317,1 | **226,1** | +107 |
| 430 (16 Pro Max) | 333 | 332,9 | **241,9** | +91 |
| 744 (iPad mini) | 333 | 509,5 | **225,0** | +285 |
| 1024 (iPad Pro) | 333 | 667,0 | **225,0** | +442 |

**La trampa: `CarouselSlider` sin `height` no tiene un alto, tiene una
proporción.** Cae a su `aspectRatio` 16/9 sobre el ancho disponible, así que el
alto de la tira cambia con cada teléfono y no hay ningún número en el código con
el que cuadrar. `PromoCarouselShimmer` llevaba un `_carouselH = 333` a mano
—escrito cuando la card era otra— y su comentario decía que compartía geometría
con el carrusel, que era justo lo que no hacía. Y `_EmptyOffersWidget`, cuyo
comentario prometía literalmente *"keep the carousel height to avoid layout
jump"*, montaba su `AspectRatio` 16/9 con `paddingBottom(96)` encima: 91 px de
más en móvil, y en tablet se disparaba porque nada lo frenaba.

**El arreglo.** `resolveHomePromoCarouselGeometry` se mudó a
`lib/ui/shared_widgets/carousel/foodly_carousel.dart` y ahora devuelve
`height` **no nulo también en móvil**, con la misma fórmula que aplicaba el
aspectRatio (`screenWidth / kHomePromoCarouselAspectRatio`). El número que ve el
usuario en móvil no cambió ni un píxel; lo que cambió es que pasó a ser legible.
Los tres estados lo leen de ahí:

-   el carrusel, vía `homePromoCarouselOptions()` — pública a propósito, para
    que el test mida las **mismas** opciones que pinta la home y no una copia;
-   `PromoCarouselShimmer`, que ya no tiene constante propia;
-   `EmptyOffersWidget` (antes privado; se hizo público sólo para poder
    medirlo), que además pasó a superponer el mensaje sobre el vídeo en vez de
    dejarle 96 px debajo — igual que hace `NearbyPromoCard` con su cinta.

**El criterio, para la próxima: manda el carrusel.** El shimmer y el
placeholder siguen a lo que el usuario acaba viendo, nunca al revés. Un
esqueleto "bonito" con un alto inventado es exactamente cómo se llega a un
salto de 122 px.

**Lo que queda pendiente y no se tocó:** la composición interna del esqueleto
(foto arriba + franja blanca con nombre y botones abajo) sigue siendo la de la
card ANTERIOR al rediseño del 2026-09-04. La de hoy es foto a sangre con la
cinta de vidrio superpuesta. No afecta al alto, que es de lo que iba esto.

**Protección.** `test/ui/home/home_promo_strip_sin_salto_test.dart` mide los
tres estados al mismo ancho en siete anchos (320 → 1024) y falla si se separan;
comprueba además que ninguno desborda y que el alto de móvil sigue siendo el que
daba el aspectRatio, para que "cuadrarlos" no pueda hacerse en el número
equivocado. Validado por mutación: hardcodear otra vez el 333 en el shimmer,
devolverle los 96 px al placeholder, y cambiar la proporción compartida, ponen
el test en rojo por esas tres razones distintas.

### Responsive: hay TRES palancas, no una (2026-09-11)

Corrección a lo que hice los días anteriores. Apliqué `ContentColumn` —un techo
de ancho— a casi todo, y **es la herramienta equivocada para dos de los tres
casos**. Héctor lo vio probando en una tableta Lenovo: la tarjeta de negocio
acotada «se veía pequeña», y tenía razón.

| palanca | para qué | cómo se ve si te equivocas |
| --- | --- | --- |
| **Techo de lectura** (`ContentColumn`) | texto y formularios | — |
| **Margen por breakpoint** (`SCREEN_PADDING_TABLET`) | tarjetas con foto | con techo: pequeñas y con hueco al lado |
| **Columnas** (`columnasDeLista`, `columnasDeRejilla`) | listas y colecciones | con techo: media pantalla vacía |

**Un techo fijo no escala**: 420 px se ven igual a 744 que a 1280. Ese es el
defecto que delata que se usó la palanca equivocada.

**Dónde SÍ va el techo, y con argumento tipográfico y no de dispositivo:**
términos, privacidad, altas, perfil, sesiones, usuarios bloqueados. Una línea de
más de ~75 caracteres se lee mal porque el ojo pierde el renglón — eso vale
igual en una tableta que en un monitor de 27".

**Dónde NO, y por qué cada uno falla distinto:**

- Una tarjeta **con foto** quiere área. Ahí manda el margen por breakpoint.
- Una **fila de datos** (avatar, nombre, fechas, estado) no sufre por el ancho
  en sí: sufre por el **recorrido del ojo**. A 1200 px el avatar queda en una
  punta y el estado en la otra. Aquí el margen por breakpoint EMPEORA las cosas;
  la salida son columnas.

Reservas, gestión de reservas e historial de órdenes pasaron de techo a
columnas. `ListaAdaptativa` sigue siendo un `ListView.builder` por dentro —
**la paginación y el pie de «cargando más» no se tocan**, solo cambia que cada
elemento puede ser una fila de N tarjetas. Con una columna el resultado es
idéntico al de antes. El historial va agrupado por día y no encaja en eso, así
que usa `enFilasDe` y emite las filas a mano: la cabecera del día ocupa el ancho
entero y solo las órdenes se reparten.

**Una guarda que no guardaba nada.** `columnasDeLista` llevaba un
`if (ancho < 600) return 1`. Al validar por mutación la quité y los tests
siguieron verdes: con 620 px de objetivo, la cuenta ya da 1 por debajo de 1240,
o sea que el `clamp` lo garantizaba solo. Se borró. Una guarda redundante es
peor que ninguna porque invita a confiar en ella.

### El menú en tableta: índice al lado, no dos paneles (2026-09-10)

En tableta el menú era una columna larguísima: para llegar a «Postres» hay que
bajar por toda la carta, con media pantalla vacía al lado.

**Se valoró el maestro-detalle —secciones a la izquierda, platos a la derecha—
y se descartó a propósito.** Una carta se navega **mirando, no buscando**: al
enseñar solo una sección se pierde el descubrimiento de lo que hay al lado, que
es lo que vende platos. Y con un negocio de una o dos secciones el panel
izquierdo queda vacío robando 168 px.

Lo que hay es `MenuSectionIndex`
(`lib/ui/shared_widgets/menu/menu_section_index.dart`): un índice que dice dónde
estás y deja saltar, con el scroll **continuo como siempre**. El panel de platos
es literalmente el widget de hoy, así que el riesgo queda confinado al índice —
importante, porque nada de esto se puede verificar visualmente desde aquí.

`debeMostrarIndiceDeSecciones` pide dos cosas: `sw600` de ancho (el mismo umbral
que el resto de la app, así que sirve igual en el build web de escritorio) y al
menos **3 secciones**. Con menos no hay recorrido que acortar.

**La jerarquía real, que no es obvia:** `MenuCategory` son tres fijas —comida,
bebidas, combos— y se pasan con un `PageView`. Dentro de cada una hay una lista
de `CategoryDM`, que son las secciones del negocio. El índice indexa las
segundas, no las primeras.

**El detalle espinoso: la lista es PEREZOSA.** Una sección lejana no tiene
`RenderObject`, así que `Scrollable.ensureVisible` no tiene a qué agarrarse.
`_irASeccion` salta primero a una posición estimada por proporción y afina en el
frame siguiente. Y `_recalcularSeccionActual` solo mira las secciones
construidas — que son justo las que importan para «dónde estoy».

**Aplicado en las TRES cartas** —visitada, gestión y pública—. Y son tres, no
seis: la cuenta de «seis pantallas» incluía las páginas que las alojan, pero la
lista de secciones vive solo en los constructores de categoría.

La parte delicada vive una sola vez, en `MenuSectionIndexController`: posiciones
de scroll y ciclos de vida son justo lo que no conviene tener por triplicado.

**LAS CLAVES VAN POR UUID, NO POR ÍNDICE, y es deliberado.** Una clave por
posición se le pega a «lo que haya en el sitio 3», así que al añadir o borrar
una sección el estado con `AutomaticKeepAlive` se mapearía a la sección
equivocada. Al ser una `GlobalKey` por uuid, además sustituye a la
`ValueKey(uuid)` que ya llevaban esos widgets sin perder identidad. Hay un test
que lo fija: borrar la primera sección no puede hacer que la segunda herede su
clave.

**Lo que NO cubre ningún test:** el salto en sí. Depende de posiciones reales de
scroll sobre una lista perezosa, y montarlo en test sería probar una simulación
propia, no el comportamiento. Ese gesto hay que probarlo en un dispositivo.

### Los huecos con vídeo del home: tres tarjetas, no un placeholder (2026-09-10)

Salió de probar en una tableta Lenovo. El hueco de promos «se veía muy
pequeñito». No era pequeño: estaba **aplastado**. El alto quedó clavado en 225
px de tablet en adelante —para que las cards del carrusel conserven
proporciones de teléfono— pero el hueco no es un carrusel de cards, era **una
sola card a todo el ancho**: 1264 × 225, una tira de buzón.

**El arreglo de fondo lo propuso Héctor y es mejor que lo que yo iba a hacer.**
En vez de un placeholder que hay que cuadrar con el carrusel cargado, el vacío
**ES el carrusel**: tres tarjetas con las mismas `homePromoCarouselOptions` y
la misma geometría. Ya no hay dos alturas que puedan separarse, así que la
promesa de «sin salto» pasa de estar vigilada por un test a ser cierta por
construcción. Y de paso cada tarjeta ocupa el hueco de una promo, que es lo que
arregla el aplastamiento.

Las tres cuentan una historia: **llegarán → guárdalas → compártelas**. La
tercera cambia según quién mire (`isBusinessOwner`): a un dueño «lo bueno se
comparte» no le dice nada, y que sus promociones salen en la portada de los
clientes de al lado, sí. Es el único de los tres huecos con botón, porque es el
único con adónde ir.

**LA TARJETA NO PUEDE NACER EN BLANCO (2026-09-12).** Lo vio Héctor probando en
la tableta: al entrar al home aparecía primero **la sombra de la tarjeta** y un
instante después el contenido. Solo en los huecos, nunca con negocios y promos
de verdad.

La causa no era la sombra: era que **durante 100-300 ms el interior de la
tarjeta estaba prácticamente vacío**. Mientras el `VideoPlayerController`
arranca —cada vez, porque el `State` se monta de cero al volver al home— el
fondo era `primaryFoodly` al **4 %** sobre `NeumorphicColors.background`, o sea
casi el mismo color; y encima de eso la cinta de vidrio, que es blanco al 74 %,
tampoco se separaba de nada. Lo único que delataba la tarjeta era su sombra. Con
contenido real no pasa porque las fotos vienen de `FoodlyImageCache` y pintan en
el primer frame.

Ahora el fondo de los dos huecos con vídeo es `FoodlyBrandSurface` **desde el
primer frame**, y el vídeo entra encima con un fundido. La tarjeta está completa
siempre; lo que llega tarde es una textura, no la tarjeta.

De paso desapareció el `LoadingWidgetFoodlyIso` que iba dentro: era un indicador
de carga dentro de algo que ya venía de un shimmer. Y `_videoFailed` se borró de
los dos States — la superficie de marca ES el fallback, así que ya no había nada
que decidir.

**En test el vídeo nunca está listo** (no hay canal de plataforma), lo cual es
justo el momento que hay que medir: `huecos_con_video_test.dart` comprueba que la
tarjeta ya trae superficie de marca en ese primer frame. Validado por mutación:
devolver el tinte al 4 % en cualquiera de los dos huecos, o quitar el fundido,
ponen el banco en rojo.

**El fondo NO es una foto, y es deliberado.** Se valoró generar imágenes con
IA. Un plato generado dentro de una tarjeta con forma de promoción **se lee como
una promoción de verdad**: el usuario la toca esperando una oferta y no hay
ninguna. `FoodlyBrandSurface` es degradado + el iso de marca de agua + trama
diagonal. No pesa (el asset ya viaja en el bundle), el contraste del vidrio deja
de ser una lotería, y escala sin pixelarse para la web. El vídeo se queda solo
en la primera tarjeta, que era el límite de recursos que puso Héctor.

**EL DESBORDAMIENTO, medido:** el hueco de negocios nuevos era un
`SizedBox(height: 430)` con un `AspectRatio(4/3)` dentro. Con el padding lateral
del home, en tableta el vídeo pedía el ancho entero por 3/4 de alto:
**desbordaba 250 px a 820 y 595 a 1280**. En teléfono colaba de milagro. Ahora
el alto lo pone la proporción dentro de un techo de ancho.

**El botón de reintentar dejó de ser neumórfico.** Un `CustomNeumorphicButton`
—relieve, esquinas de 4 px, 32 px de alto— metido dentro de una composición de
vidrio: dos lenguajes peleándose en 200 píxeles. Ahora es el mismo vidrio que la
cinta, y 44 px.

**DOS TRAMPAS QUE ME MORDIERON AQUÍ:**

1. **No leas la inyección de dependencias dentro de un `build`.** Puse
   `di<AuthSessionService>().userIsManager` en el build de `EmptyOffersWidget` y
   el widget dejó de poder pintarse sin DI — tumbó el test que ya existía. El
   dato entra por parámetro y lo resuelve quien lo construye.
2. **Cuidado con QUÉ nodo se mide.** El nodo externo de `FoodlyEmptyMediaCard`
   es un `Center` que ocupa todo el ancho; el techo va por dentro. Midiendo ese
   salen 1280 y parece que no acota nada. Es exactamente el mismo despiste que
   con las hojas inferiores de Material 3.

Canvas del diseño: artifact 6da99564.

### Estados vacíos: tres intenciones, no un estilo (2026-09-10)

Foodly tenía **24 estados vacíos** escritos a mano, con nueve tratamientos de
texto y cuatro tamaños de icono. Pero la inconsistencia visual era la mitad
fácil. El problema de fondo: **tres cosas distintas se pintaban igual**.

- **novato** — no hay nada todavía; la salida es empezar algo.
- **filtro** — sí hay contenido, pero no con este criterio; la salida es
  cambiarlo.
- **fallo** — no se pudo cargar; la salida es reintentar, nunca dar ánimos.

Al usuario nuevo se le decía «aún no tienes nada» tanto cuando era cierto como
cuando la petición se había caído. `FoodlyEmptyView`
(`lib/ui/shared_widgets/placeholders/foodly_empty_view.dart`) lo separa.

Alguien ya había llegado a esta conclusión una vez: `posts_feed_wdg` distingue
por dentro entre «no hay publicaciones cerca» y «no sigues a nadie», y lo
explica en un comentario. No se había propagado a ninguna otra pantalla.

**Dato que ordena las prioridades: solo 1 de los 24 tenía botón.** Los otros 23
son callejones sin salida — dicen que no hay nada y ahí acaban. Para un usuario
de la primera semana eso pesa más que la tipografía. Por eso `onAction` es lo
que decide si se pinta salida: **sin callback no hay botón**, porque es
preferible un vacío sin salida a uno que no lleva a ninguna parte.

**El vidrio NO se hereda literalmente, y es deliberado.** Un `BackdropFilter`
necesita algo detrás que desenfocar; un estado vacío se pinta sobre fondo plano,
así que el vidrio sería un panel teñido y nada más. Se hereda la paleta, la
tipografía, los radios y el suelo táctil de 44 px.

**Colores nuevos y por qué:** `failureOnSurface` (#C0261A) es `error` (#F31708)
oscurecido. El original está pensado para un texto de validación; en un medallón
de 96 px vibra y se pelea con el ciruela.

**Fase 1 hecha:** `NoItemsViewWdg` —el único que ya se compartía, con cinco
llamadas— delega ahora en `FoodlyEmptyView`. Pintaba con `NeumorphicText` y
Poppins traído de `GoogleFonts` directo, o sea el sistema anterior al rediseño.
Se conservan nombre y firma para no tocar las cinco llamadas. Dos de ellas
—«no hay promociones en esta sección»— eran vacíos por FILTRO disfrazados de
novato y ahora lo dicen.

**Sin hacer:** las 15 pantallas sueltas, y el copy. Cada una necesita título,
subtítulo y etiqueta de botón nuevos en tres idiomas — eso va con Héctor
delante, no inventado. Por eso `subtitle` y `actionLabel` son opcionales: la
fase 1 unifica lo visual sin bloquearse en el copy.

Canvas del diseño: artifact 883d0965 (anatomía, las tres intenciones, tres
comparativas antes-después y el plan).

**Fase 2, los tres de favoritos (2026-09-11).** Negocios, cartas y platos eran
el MISMO bloque copiado tres veces —icono de 64 px, una línea en cursiva con
`height: 1.9`, y `paddingHorizontal(screenWidth * .1)`, que da 32 px en un
iPhone SE y 102 en un iPad para un texto que mide lo mismo—. Ahora los tres son
`FoodlyEmptyView` con intención `nuevo`, título y **subtítulo**: la línea de
antes decía que no había nada, el subtítulo dice qué hacer para que lo haya.

**Sin botón, y no por falta de ganas.** El CTA natural sería «explorar
negocios», pero `_bottomNavIndex` es un `ValueNotifier` local de
`_HomePage369State` que solo se siembra en `initState`: navegar por ruta desde
otra pestaña deja la barra inferior marcando la pestaña equivocada. Es un fallo
que ya existe —el drawer lo tiene igual— y arreglarlo toca la navegación del
teléfono, que está en producción. El vacío mejora igual; la salida se cablea
cuando se arregle el índice.

**Los iconos se separaron a propósito.** Los tres vivían con
`Bootstrap.search_heart`, y son tres pestañas de un `PageView`: deslizar entre
ellas sin que cambie nada se lee como que la app no respondió. Ahora cada una
lleva el icono de su propia tarjeta (`shop_window`, `Icons.menu_book`,
`egg_fried`).

**El hueco es fijo y no hay scroll**, que es lo que hace que la altura importe:
el `PageView` vive en un `SizedBox.fromSize(Size(screenWidth, screenHeight))` y
se le restan appbar y conmutador por arriba. Medido a 320 px de ancho el bloque
son 266 px y con los 120 de relleno quedan 386 contra 448 disponibles — con los
textos de los tres idiomas, que a ese ancho envuelven igual. Está en
`test/ui/placeholders/vacios_de_favoritos_test.dart`; validado por mutación:
agrandar el medallón, recortar el subtítulo a una línea y no pintarlo ponen en
rojo tres cosas distintas.

**Quedan 16 pantallas.** Las claves viejas (`noFavoriteBusinesses`,
`noFavoriteMenus`, `noFavoriteItems`) se borraron de los tres `.arb`: no las
usaba nadie más.

**Fase 3, las dos de reservas (2026-09-11). Aquí sí había un bug de verdad**,
no solo estilo: las dos listas viven **debajo de un filtro** y el vacío decía
«aún no hay reservas» tuvieras 0 o tuvieras 30 filtradas por un estado que no
casa. Es exactamente el fallo que motivó las tres intenciones, y estaba en la
pantalla donde más duele: un dueño que filtra por «hoy» un martes tranquilo lee
que no tiene reservas.

Ahora las dos distinguen, y con un botón que **quita el filtro** — la primera
salida de verdad que tiene un vacío en Foodly aparte de reintentar.

**La regla de qué filtro se puede apagar, que es lo fino de esto:** un botón
solo puede apagar un filtro cuya selección viva en el cubit.

| filtro | dónde vive | ¿botón? |
| --- | --- | --- |
| desplegable de estado (comensal) | `vm.statusFilter`, y el desplegable lo pinta con un `BlocSelector` | **sí** |
| segmentado de tipo (comensal) | `_BookingTypeFilterState._selected` + prefs | **no** — quedaría marcado sobre una lista sin filtrar |
| desplegable del dueño | `cubit.activeFilterKey`, dentro de un `BlocBuilder` | **sí** |
| tipo de reserva del dueño | derivado de la vertical del negocio | **no es un filtro**: el dueño no lo puso y no puede quitarlo |

La última fila es la que se pierde en un refactor, porque `vm.bookingTypeFilter`
existe en los dos VM y parece lo mismo en los dos. En el del dueño sale de
`_deriveBookingType(businessCategory)`.

`ReservationsList` y `ManagerReservationsList` se hicieron públicas para poder
medirlas — las páginas que las contienen arrastran router, prefs y servicios que
no hacen falta para esto. Mismo motivo que `EmptyOffersWidget`.

`test/ui/reservas/vacio_de_reservas_test.dart` (7 casos) monta los cubits reales
sobre un repo que devuelve cero reservas, así que el camino del filtro se
recorre entero. Validado por mutación: seis mutaciones, seis muertes — y una de
ellas, «contar la vertical como filtro», **sólo muere desde que hay un caso con
categoría de catering**; con `businessCategory: null` sobrevivía.

Las claves viejas `noReservationsYet` y `noReservationsFound` se borraron.

**Fase 4: promociones guardadas y paquetes de servicio (2026-09-11).**

*Promociones guardadas* tiene DOS pestañas —vigentes y próximas— y las dos
decían lo mismo: «aún no tienes promociones guardadas en esta sección». Con
promociones en la otra pestaña eso es **falso**, y además deja al usuario sin
enterarse de que la otra existe. Ahora el vacío dice cuál está vacía y el botón
**salta a la otra**.

Con las dos vacías no hay a dónde saltar, así que ahí vuelve a ser el vacío de
novato sin botón. Ese caso no es teórico: la vista cruza promos con negocios y
una promo cuyo negocio no viene en la respuesta desaparece después del filtro de
la página.

**`animateToPage` revienta si el `PageController` no está enganchado a un
PageView** (`positions.isNotEmpty`). Lo encontró el test, no el simulador. En la
página siempre lo está, pero quien decide qué pestaña se marca es el índice del
cubit, así que el salto visual va detrás de un `hasClients`: puede fallar sin
llevarse por delante el cambio de pestaña. El `onToggle` del conmutador tampoco
lo guarda — no se tocó.

`_EmptyListPlaceholder` desapareció (dos usos, los dos migrados). Llevaba un
`SizedBox(height: screenHeight - kToolbarHeight * 4)` que no hacía falta: los dos
sitios donde se pintaba ya tienen alto acotado.

*Paquetes de servicio* son dos pantallas que compartían la clave `noPackagesYet`
y **no comparten sujeto**: en la del dueño es «aún no hay paquetes» y tiene
salida (el botón abre la misma hoja que el «+» de la cabecera, con
`existingPackage: null`); en la del visitante es «este negocio aún no publicó
paquetes» y NO tiene salida, porque el visitante no puede crear uno. La misma
frase para las dos era el problema de siempre en pequeño.

`tapPlusToCreate` —«Toca + para crear tu primer paquete»— se borró: explicar
dónde está el botón sale más caro que poner el botón. `createPackage` ya existía
con el texto exacto.

**Sin test, y a propósito, en las dos de paquetes.** El cuerpo es privado, vive
dentro de un `BlocConsumer` cuyo cubit tira de DI, y lo único que cambia es copy
y un `onAction` que el analizador ya comprueba. No hay rama que fijar: montar
ese andamiaje sería un lastre, no una red.

`test/ui/promociones/vacio_de_promos_guardadas_test.dart` (5 casos) sí existe,
porque ahí sí hay ramas. Validado por mutación: cinco mutaciones, cinco muertes.
`SavedPromotionsView` pasó a pública para poder medirla; de paso su parámetro
`title` se convirtió en `seccion`, que es de donde salen ahora el título de la
sección, el del vacío y cuál es «la otra».

**Fase 5: resultados de búsqueda y categorías (2026-09-11). Una lista de
negocios vacía NUNCA es «aún no hay nada»** — la categoría existe, el radio
existe, la consulta existe: lo que no hay es nada *con eso*. Las dos pantallas
comparten `BusinessResultsView`, así que el vacío es el mismo widget con dos
palancas distintas.

Por eso `noResultsMessage` (una cadena) se cambió por `emptyState` (un widget):
**la palanca la conoce quien llama**, no la vista compartida. El valor por
defecto es un vacío de filtro SIN botón, que es lo honesto para quien no trae
ninguna.

| pantalla | palanca | botón |
| --- | --- | --- |
| categorías | el radio (5/10/15/25 km) | «Ampliar a N km», el SIGUIENTE salto |
| búsqueda | la consulta | «Borrar la búsqueda» → `resetToInitial()` |

**El botón del radio no propone el máximo, propone el siguiente**, y desaparece
en 25 km. Y desaparece también **sin ubicación resuelta**, porque
`toggleRadiusDistance` va a buscar con `latitude!` — ofrecer ampliar ahí es
ofrecer un crash.

`VacioDeCategoria` es presentacional: el radio y la ubicación entran por
parámetro en vez de leerse del cubit, igual que `FoodlyNavigationRail`, y por eso
se mide sin DI. La lista de radios vive ahora en él
(`VacioDeCategoria.radios`) y el selector segmentado de la cabecera la reusa: eran
el mismo dato en dos sitios esperando a separarse.

`noRecommendationsFound` eran dos frases pegadas con un `\n` —constatación y
consejo— que es literalmente un título y un subtítulo escritos a mano. Se partió
en `searchEmptyTitle` y `searchEmptyBody` y la clave vieja se borró.

`test/ui/busqueda/vacio_de_resultados_test.dart`, 6 casos. Cinco mutaciones,
cinco muertes.

**El radio salía con decimal.** `noNearbyBusinessesInCategory` declaraba su
placeholder como `double` y `intl` interpola el valor tal cual: «dentro de 5.0
km». Venía de antes, pero este trabajo lo puso al lado de un botón que dice
«Ampliar a 10 km», y ahí el desajuste canta. El placeholder pasó a `int` y la
llamada a `.toInt()`; los radios son enteros por construcción.

**Fase 6, la última tanda (2026-09-11):** notificaciones, mensajes de reserva,
las tres de la comunidad (buzz, descubrir usuarios, feed de publicaciones) y los
dos estados de ERROR —hoja de perfil y panel de analíticas—, que son los
primeros usos reales de `FoodlyEmptyIntent.fallo`.

**Un bug de verdad, en «descubrir usuarios»:** el vacío estaba **en inglés y a
pelo**, sin pasar por l10n («No users nearby» / «Try increasing your search
radius»), así que un usuario en español o portugués lo veía en inglés. Y encima
el consejo era imposible de seguir: **ahí no hay ningún control de radio** —lo
filtra el servidor desde la ubicación—. Dos fallos en una cadena de dos líneas.

**La hoja de perfil era un callejón sin salida**: decía que no se pudo cargar y
ahí acababa. `_loadProfile` se puede volver a llamar; lo único es devolver el
indicador de carga a mano, porque no lo enciende ella.

**`subtitleMaxLines` es nuevo y tiene un solo usuario a propósito.** El panel de
analíticas pinta como subtítulo el mensaje que viene del SERVIDOR, que puede
medir lo que quiera; el resto del copy es nuestro y es corto por construcción,
así que el tope por defecto es «ninguno». Sin él, un error largo estira el
bloque hasta desbordar.

**Lo que NO se migró, y por qué:** `join_by_link_page`. Es una pantalla de fallo
entera, no el vacío de una lista, y su salida —un botón a lo ancho que va
DIRECTO a la main page— está así por un bug de e2e: ir a `/` disparaba la
restauración de `LAST_PATH`, que podía ser el propio `/join`, y el botón quedaba
«muerto». Meterla en `FoodlyEmptyView` cambiaría ese botón por una píldora y
tocaría un camino cubierto por e2e, a cambio de nada.

**Quedan cero vacíos de lista escritos a mano.** Los `Icon(size: 48)` que siguen
apareciendo en un barrido son diálogos de confirmación y de resultado, que no
son estados vacíos.

### Alturas proporcionales: usa el LADO LARGO, no `screenHeight` (2026-09-07)

Al permitir que la tableta gire hubo que revisar qué se rompe en apaisado, donde
la altura se parte. El barrido de `screenHeight` en toda la app dio **una sola
pantalla en riesgo real**, y es la peor posible: `starting_page`, la de login.

Reparte la pantalla en cajas de alto proporcional —`.12`, `.19`, `.38`, `.19`—
que sumadas dan casi toda la altura. En una tableta de 1280x800 apaisada, la
caja del formulario (`.38`) mediría **304 px, menos que los 332 que tiene hoy en
un iPhone 16 Pro**. El formulario se aplasta.

Arreglo: `context.screenLongestSide` en vez de `context.screenHeight`. En
VERTICAL los dos son el mismo número, así que en teléfono —bloqueado en
vertical— no cambia absolutamente nada. En apaisado la caja conserva su tamaño
de vertical y, como la página ya vive en un `SingleChildScrollView`, lo que
sobra se desplaza en vez de aplastarse.

**Los demás `screenHeight` se revisaron y se dejan**, que también es resultado:
paddings proporcionales (`.15`, `.025`) son inofensivos; `maxHeight: .72` de un
diálogo es un tope; y los `height: screenHeight` sueltos son contenedores a
pantalla completa, que es justo lo que deben ser.

**TRAMPA AL MEDIR ESTO EN TEST:** `ResponsiveBreakpoints` devuelve **0** hasta
que su `LayoutBuilder` mide —ya estaba documentado en
`group_order_invite_snackbar.dart`—. Leyendo `context.screenHeight` en el primer
build salen dos ceros, y un test que compare `ladoLargo == alto` pasa en verde
sin comprobar nada. Hay que `pump()` antes de leer, y afirmar que el valor no es
0.

### Tablet: quién puede girar, y las rejillas (2026-09-07)

**Todo el trabajo de tablet era invisible, y no estaba en el inventario.** Dos
cosas a la vez:

1. `main()` bloqueaba la app en vertical para todo el mundo con
   `setPreferredOrientations([portraitUp])`. Como el `NavigationRail` solo
   aparece en apaisado, era código inalcanzable.
2. `AndroidManifest.xml` declaraba `largeScreens="false"` y
   `xlargeScreens="false"` — la app decía no soportar tabletas. El catálogo de
   dispositivos de Play lee esas banderas: **antes de montar una prueba cerrada
   en tableta hay que comprobar que el dispositivo aparece como compatible.**

Ahora `orientacionesPermitidas` (`lib/core/utils/soporte_de_orientacion.dart`)
decide por tamaño: lado corto >= 600 px (el `sw600dp` de Android) puede girar,
por debajo se queda vertical. **El teléfono no se toca.** Se mide el lado corto
y no el ancho porque la app puede arrancar ya girada. Ante la duda —vista sin
medidas en arranque en frío— vertical.

En iOS, el iPhone sigue solo vertical y el iPad gana las cuatro. **El Info.plist
se edita a mano**: `plistlib` reescribe el fichero entero y se lleva por delante
los comentarios XML, incluido el de cumplimiento de exportación (220 líneas de
diff para añadir tres).

**Las rejillas eran menos de las que decía el inventario.** Al contarlas solo
hay tres con columnas fijas que importen: `business_results_view` (compartida
por categorías y búsqueda), `my_favorite_businesses_view` y su
`BusinessGridShimmer`. Todas pasan por `columnasDeRejilla`, que mantiene la card
en su ancho de teléfono (200 px medidos) y enseña MÁS cards en vez de más
grandes — la misma idea que el carrusel de promos.

Dos que NO se tocan y conviene saber por qué:

- **`month_calendar` tiene `crossAxisCount: 7`** y son los días de la semana. Un
  script que "adapte todas las rejillas" lo rompe.
- El grid de fotos del `user_profile_bottom_sheet` vive dentro de una hoja que
  Material 3 ya acota a 640, así que su ancho no crece.

El esqueleto tiene que pintar las mismas columnas que la rejilla cargada, o la
pantalla salta al terminar de cargar — el mismo fallo que tenía la tira de
promos.

### Tablet: la navegación en apaisado va a un NavigationRail (2026-09-06)

`debeUsarNavigationRail` (en
`lib/ui/views/home/widgets/foodly_navigation_rail.dart`) decide entre rail y
barra inferior: **tablet o desktop Y apaisado**. En teléfono devuelve false en
las dos orientaciones, así que `_buildContent` sale por la rama de siempre sin
tocar nada — la app está en producción y el camino de móvil no se ha movido.

En vertical se queda la barra de abajo a propósito: un rail cuesta ANCHO, y en
apaisado lo que escasea es el alto.

**La traducción del shell.** La barra inferior son cuatro iconos (0..3) más un
FAB acoplado a la muesca del centro, que es el destino 4 (la página principal).
El equivalente canónico en `NavigationRail` es el hueco `leading`, así que el
iso sube arriba y quedan cuatro destinos. De ahí que `selectedIndex` sea
**null** cuando el índice activo es el 4: ese destino no está en la lista, se
pinta en el propio FAB, que ya cambia de versión según esté activo.

Índices, gate de invitado, `navigateTo` y el globo de la campana son los mismos:
solo cambia la presentación.

**Dos diferencias deliberadas en tablet:**
1. El rail NO se esconde durante la búsqueda. La barra inferior sí, para
   devolverle alto a los resultados; en un rail no hay alto que devolver, y el
   usuario conserva la navegación mientras busca.
2. Por eso `_hideBottomBarAnimationController` no se usa en esa rama. Se sigue
   creando y liberando igual: es estado del widget.

**Duplicación consciente:** la composición de los iconos (la tienda con su
corazón, la campana con su globo) está repetida entre el rail y
`_FoodlyBottomNavBar._buildNavBarItem`. Unificarlas obliga a tocar el camino de
móvil, que todavía no se ha visto en un dispositivo. Se juntan cuando se
verifique.

`FoodlyNavigationRail` es presentacional a propósito —el `hasUnread` entra por
parámetro en vez de leerse con un `BlocSelector` como hace la barra— para poder
medirlo sin cubits ni DI. El `BlocSelector` vive en `home_page.dart`.

### Paridad en teléfono: cómo se comprueba que el trabajo de tablet no rompe nada (2026-09-06)

`test/ui/layout/paridad_en_telefono_test.dart` pinta cada forma envuelta DOS
veces —tal cual y con el techo— a 375, 402 y 440 px, y compara el rectángulo de
todos los descendientes marcados. Cubre las nueve formas reales del grupo A más
el mapa del alta de negocio y el `CustomScrollView` de promos guardadas.

**Por qué hace falta y no basta con "640 no muerde a 402".** `ContentColumn` es
un `Align`, y un `Align` le pasa al hijo constraints SUELTAS donde el `Scaffold`
da ancho AJUSTADO. El ancho disponible es el mismo, pero el tipo de constraint
no, y eso puede cambiar el tamaño de una `Column`. Medido: no cambia en ninguna
de las formas que hay en la app, pero es el mecanismo a vigilar si se envuelve
una pantalla nueva.

Los diálogos tienen su propia paridad con los **siete `insetPadding` reales** de
los 13 sitios migrados, y el appbar del home la suya a los tres anchos.

**Valida el banco por mutación antes de fiarte:** forzar el techo a 200 px tiene
que poner los diez en rojo. La primera versión tenía un test que pasaba en falso
porque comparaba una cosa consigo misma (`envolver: (hijo) => hijo`).

### Tablet, piezas transversales: lo que ya estaba bien y lo que no (2026-09-06)

Segundo tramo de `feat/tablet-responsive`. El inventario decía que había siete
piezas compartidas que arrastran a las 38 pantallas. Al medirlas, **dos de las
que daba por rotas ya estaban resueltas** y una de las que daba por buenas no lo
estaba. Todo lo de abajo está medido pintando widgets en test, no leído.

**Hojas inferiores: ya acotadas, no se tocan.** Material 3 le pone
`BoxConstraints(maxWidth: 640)` por defecto a `showModalBottomSheet`
(`_BottomSheetDefaultsM3`), y el tema de Foodly es M3 vía `FlexThemeData`.
Medido: 402 px de ancho en un iPhone, **640 en un iPad de 1024**. Las 24 hojas
de la app estaban bien desde el principio.

OJO al medirlo: `find.byType(BottomSheet)` devuelve el envoltorio EXTERNO, que
sí ocupa todo el ancho — el `ConstrainedBox` va por dentro. Midiendo ese nodo
salen 1024 y parece roto. Hay que medir el contenido.

**Diálogos: esos sí.** `Dialog` se dimensiona con su hijo, acotado solo por el
ancho de pantalla menos el `insetPadding`. Medido: 322 px en un iPhone 16 Pro y
**944 en un iPad**; el `SocialConsentDialog` real daba 988. `DialogThemeData` no
tiene `constraints`, así que no hay arreglo por tema: se añadió `FoodlyDialog`
(`lib/ui/shared_widgets/dialogs/foodly_dialog.dart`), que es un `Dialog` con
`UIDimens.DIALOG_MAX_WIDTH` (460) por delante, y se migraron los 13 sitios que
usaban `Dialog` crudo más `DialogService.showCustomDialog`.

460 está por encima del teléfono vertical más ancho (~430), así que en teléfono
no muerde. Sí muerde en teléfono apaisado, que también es una mejora.

Cuidado al migrar: **`AlertDialog(` contiene `Dialog(` como subcadena**. Un
reemplazo sin frontera por la izquierda lo convierte en `AlertFoodlyDialog(`.

**Carruseles: el compartido ya era adaptativo, el de la home no.**
`FoodlyCarousel` ya resolvía `viewportFraction` por breakpoint con la estrategia
de "ancho de item constante" (`resolveCarouselViewportFraction`), y
`categories_page` y `home_categories_wdg` ya lo usaban. El que no: la tira de
promos de la home, que es un `CarouselSlider` crudo porque necesita
`enlargeCenterPage`. Se le pasó el mismo resolutor
(`foodlyCarouselBreakpointOf` se hizo público para eso).

Y había un segundo problema que no estaba en el inventario: **`CarouselSlider`
sin `height` cae a su `aspectRatio` 16/9 sobre el ancho disponible**, así que la
tira crecía con la pantalla. Medido: 226 px de alto a 402, **576 a 1024**. Con
la fracción ya arreglada eso daba cards estrechas dentro de una caja altísima.
`resolveHomePromoCarouselGeometry` fija el alto de smallTablet en adelante al
que tendría un teléfono de referencia (400 × 9/16 = 225).

Al rotar no hace falta ningún truco: `CarouselSlider.didUpdateWidget` rehace su
`PageController` con la fracción nueva conservando la página.

**Appbars: solo el del home.** Se le puso el techo al contenido del
`FlexibleSpaceBar`, dejando el degradado del `background` a sangre — si no, en
un iPad la barra de búsqueda medía todo el ancho y el botón del drawer quedaba
en la otra punta. `SecondaryMainAppBar` se miró y se deja como está: logo a la
izquierda y etiqueta a la derecha es lo normal en una barra ancha, no es
contenido estirado.

Aquí me esperaba una trampa que **no existe**: el contenido del appbar es una
`Column` con `MainAxisAlignment.end`, y como `Align` encoge en el eje que no
acota, parecía que el techo iba a subir el header al techo de la barra. Medido:
`FlexibleSpaceBar` le da al title un hueco justo de alto, así que las dos
alineaciones dan el MISMO rectángulo. Está en
`test/ui/layout/content_column_en_flexible_space_test.dart`.

**Sin hacer, y a propósito:** drawer fijo en tablet y bottom nav →
`NavigationRail` en apaisado. Las dos cambian la navegación, no el ancho de una
caja, así que van con revisión delante.

**Un salto previo, de móvil, encontrado midiendo:** `PromoCarouselShimmer`
reservaba 333 px y el carrusel real mide 226 a 402 px de ancho, así que la home
pegaba un salto de ~107 px al cargar las promos. Era anterior a este trabajo;
arreglado el mismo día — ver "La tira de promos de la home tiene TRES estados y
los tres medían distinto".

### Tablet: el techo de ancho es de LECTURA, no de dispositivo (2026-09-06)

Rama `feat/tablet-responsive`. Foodly ya tenía `responsive_framework` cableado
y una extensión completa de `isTablet` / `isDesktop`, pero no las usaba
**ninguna** de las 38 pantallas. En un iPad eso no se ve roto, se ve estirado:
líneas de texto de 1024 px, formularios de borde a borde.

**El error que casi cometo.** Mi primer plan decía acotar con
`DeviceSize.maxWidth`. Son **1440 px** — el tope del build web. Todos los iPad
miden entre 744 y 1024, o sea por debajo, así que ese techo no habría recortado
nada en el aparato donde hacía falta. Lo que hay que acotar no es la ventana,
es la columna. De ahí `UIDimens.CONTENT_MAX_WIDTH = 640` (texto y formularios,
~70 caracteres a 14 px) y `LIST_MAX_WIDTH = 700` (listas de tarjetas). Los dos
**por debajo de 744**, que es el iPad mini en vertical; el primer valor que puse
para listas fue 760 y el test lo cazó.

`ContentColumn` (`lib/ui/shared_widgets/layout/content_column.dart`) es
`Align` + `ConstrainedBox`. Por debajo del techo no hace nada: en móvil es
transparente, mismo layout, y no hay condicionales por dispositivo repartidos
por la app.

**Dónde va el techo.** Nunca alrededor de contenido a sangre —sliver app bars
con portada, cabeceras con degradado, carruseles—. En las pantallas con
`SliverAppBar` el techo va por dentro, sobre el `SliverToBoxAdapter` o el
`body:` del `NestedScrollView`, no sobre el `CustomScrollView` entero.

**LA TRAMPA, y me equivoqué al diagnosticarla.** Al acotar una pantalla hay que
buscar anchos de pantalla fijos (`context.screenWidth`) entre sus hijos. Pero
solo son un problema **cuando cuelgan de un `Row`**:

| dónde está el `SizedBox(width: screenWidth)` | qué pasa bajo el techo |
| --- | --- |
| colgando del techo directamente | se recorta solo a 640, sin error |
| dentro de un `Row` | **se desborda** (988 px en 640) |
| dentro de un sliver | se recorta solo a 640, sin error |

Un `SizedBox` recorta su propio ancho contra las constraints que recibe
(`BoxConstraints.enforce`); un `Row`, en cambio, da ancho **sin acotar** a sus
hijos, así que ahí el ancho fijo se respeta tal cual. Yo "arreglé" tres sitios
antes de medirlo y solo uno estaba roto: el mapa de `sign_up_business_form`
(`width: context.screenWidth - 36` dentro de un `Row` → ahora `Expanded`). Los
otros dos los revertí. Está medido en
`test/ui/layout/content_column_test.dart`, grupo «anchos fijos por debajo del
techo».

**Sobre `dart format` en este repo.** No corras el formateador sobre un archivo
entero solo porque tocaste dos líneas: hay archivos escritos a 80 columnas
aunque el ruler de `.vscode/settings.json` esté a 120, y reformatearlos mete en
el diff decenas de líneas que no tocaste. Reindenta solo lo que envuelves.

### El texto de la dirección en el chip de ubicación (2026-09-05)

Se armaba concatenando a mano —`'$currentAddress, $currentCity.'`— así que en
cuanto una parte llegaba vacía quedaban los separadores sueltos. En pantalla
se vio como `"Rua Irmãos Bonina, ."`: dirección sin ciudad. El tooltip tenía
la misma familia de fallos y podía llegar a `"Rua X, , , ."`.

Ya había un parche para UNA de las combinaciones —ciudad vacía en el
tooltip— con su comentario y todo. El resto seguían rotas: es lo que pasa
cuando se arregla el caso y no la clase.

Ahora hay un solo formateador, `LocationService.formatAddress`, y los dos
sitios lo usan a través de `addressLabel` (chip) y `addressTooltip`. Limpia
espacios y separadores pegados, se salta las partes vacías con su separador,
no repite una parte igual a la anterior —el geocoding a veces devuelve la
misma cadena como dirección y como ciudad— y solo pone el punto final si
quedó algo que puntuar. Devuelve cadena vacía cuando no hay nada, y el
llamador decide el reemplazo.

Es `static` a propósito: así se prueba sin DI. `address_format_test.dart`
cubre las combinaciones, no un caso.

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

### La migración de una sola vez

A quien venía del sistema de un solo token se le migra sin que se entere:
`restoreTokensFromSecureStorage()` mira si hay tokens en el almacenamiento
seguro; si no los hay pero sí hay sesión en HydratedBloc, copia el `token` viejo
al almacenamiento seguro como token de acceso.

### Qué hace falta para que esto funcione

-   `flutter_secure_storage: ^10.0.0` en `pubspec.yaml`
-   `SecureTokenService` registrado como lazy singleton en
    `dependency_injection_service.dart`
-   El constructor de `AuthSessionService` recibe `secureTokenService: di()`

---

## El panel de analíticas del negocio (2026-04-13)

### Qué es

Una función solo para managers, con las métricas de rendimiento del negocio.
Los datos vienen del microservicio de NLP
(`GET /nlp-service/business/{uuid}/overview?days=30`).

### Ficheros clave del front

-   **Modelos**: `lib/data_models/analytics/business_overview_dm.dart` — modelos
    de Freezed: `BusinessOverviewResponseDM`, `BusinessOverviewDataDM`,
    `KpisDM`, `FunnelDM`, `FunnelStepDM`, `FunnelConversionDM`,
    `DailySeriesDM`, `DailyPointDM`, `BreakdownsDM`, `BreakdownItemDM`
-   **Generados**: `business_overview_dm.g.dart` lleva ayudantes de
    **deserialización escritos a mano**, que NO son salida estándar de Freezed:
    -   `_parseFunnelSteps()` — convierte el Map del backend `{"clave": valor}`
        en `List<FunnelStepDM>`
    -   `_parseBreakdownMapOrList()` — convierte el Map `{"estado": cuenta}` en
        `List<BreakdownItemDM>`
    -   `_parseEventTypes()` — mapea `event_type`→`label` y `count`→`value`
-   **Cubit**: `lib/ui/views/analytics/cubit/` — pide los datos al NLP
-   **Widgets**:
    -   `funnel_chart.dart` — embudo de barras horizontales con degradado
    -   `daily_trends_chart.dart` — gráfico de líneas (fl_chart) con reservas y
        eventos a lo largo del tiempo
    -   `top_events_bar.dart` — barras con los tipos de evento más frecuentes
    -   `reservations_donut.dart` — quesito de estados de reserva, con leyenda
        por color
-   **Humanizador de etiquetas**:
    `lib/ui/views/analytics/helpers/analytics_label_helper.dart` — convierte las
    claves crudas del backend (`business_open`, `cta_clicked`,
    `reservation_started`…) en etiquetas traducidas vía `S.current.*`. Tres
    métodos: `funnelStep()`, `eventType()` y `reservationStatus()`. Si no
    reconoce la clave, cambia `_` y `.` por espacios y pone mayúscula inicial.

### Correspondencia entre el JSON del backend y el modelo del front

| clave del JSON | campo en Dart | notas |
|---|---|---|
| `funnel.steps` (Map) | `FunnelDM.steps` (List<FunnelStepDM>) | `_parseFunnelSteps()` a mano, en el `.g.dart` |
| `funnel.conversion.open_to_cta_rate` | `FunnelConversionDM.openToCtaRate` | |
| `funnel.conversion.open_to_reservation_rate` | `FunnelConversionDM.openToReservationRate` | |
| `funnel.conversion.cta_to_reservation_rate` | `FunnelConversionDM.ctaToReservationRate` | |
| `series.*_daily[].value` | `DailyPointDM.value` | |
| `breakdowns.reservations_by_status` (Map) | `BreakdownsDM.reservationsByStatus` (List) | `_parseBreakdownMapOrList()` a mano |
| `breakdowns.top_event_types[].event_type` | `BreakdownItemDM.label` | `_parseEventTypes()` a mano |
| `breakdowns.top_event_types[].count` | `BreakdownItemDM.value` | `_parseEventTypes()` a mano |

### Las claves de l10n de las etiquetas

Son 22 claves en los tres `.arb` (EN/ES/PT): `analyticsLabelBusinessOpen`, `analyticsLabelCtaClicked`, `analyticsLabelCtaWhatsapp`, `analyticsLabelCtaPhone`, `analyticsLabelCtaWebsite`, `analyticsLabelCtaDirections`, `analyticsLabelCtaInstagram`, `analyticsLabelSearchResult`, `analyticsLabelReservationStarted`, `analyticsLabelReservationSubmitted`, `analyticsLabelReservationSucceeded`, `analyticsLabelFavoriteAdded`, `analyticsLabelFavoriteRemoved`, `analyticsLabelReviewCreated`, `analyticsLabelMenuViewed`, `analyticsLabelShare`, `analyticsStatusConfirmed`, `analyticsStatusCompleted`, `analyticsStatusPending`, `analyticsStatusCancelled`, `analyticsStatusRejected`, `analyticsStatusNoShow`.

**Importante**: después de tocar un `.arb` hay que correr el generador de l10n
para actualizar `lib/generated/`.

---

## Rendimiento: dónde está el coste de verdad

**La pregunta no es «¿qué orden tiene?», sino «¿con qué n, y cuántas veces por
segundo?».** Un O(n²) sobre 10 elementos una vez es gratis; un O(n) sobre 10
elementos sesenta veces por segundo, no.

Esta sección existe porque la regla genérica —«cuida la complejidad»— **no
habría cazado ni uno** de los problemas reales que ha tenido esta app. Todos
están medidos y documentados más arriba, y ninguno era asintótico.

La jerarquía, de lo que más duele a lo que menos:

**1. Viajes de red.** Cada consulta a Neon cuesta ~35 ms de ida y vuelta, así
que la palanca es **cuántas consultas**, no cuán rápida es cada una. La pantalla
de Favoritos llegó a tardar ~10 s por un N+1 en el backend; un evento de
realtime hacía dos lecturas idénticas por dispositivo. Antes de optimizar un
bucle, cuenta las peticiones.

**2. Trabajo repetido por frame.** Un getter que recorre listas **dentro de un
`build`** se paga en cada reconstrucción, y un `BlocBuilder` reconstruye mucho.
Ahí el orden importa poco y la frecuencia importa todo. Si el resultado no
cambia entre builds, se calcula una vez y se guarda.

**3. Memoria por elemento.** Es constante, no asintótico, y aun así fue el peor:
una foto de 1280 px se decodificaba entera —unos 5 MB— para pintar una tarjeta
de 100 px, la caché de 100 MB de Flutter se llenaba con veinte y redecodificaba
al hacer scroll. `memCacheWidth` siempre que la imagen se pinte pequeña.

**4. Complejidad asintótica.** La última, porque aquí las `n` son pequeñas:
paquetes de servicio, secciones de una carta, promos guardadas. **La señal de
que sí importa es que la lista pueda crecer sin techo** —mensajes de un chat,
platos de una carta grande, historial de órdenes— y entonces la salida suele ser
un `Set` o un `Map` en vez de `List.contains` / `List.where` dentro de un bucle.

Hecho bien, en `reservation_messages_sheet.dart`: para descartar los mensajes ya
recibidos monta un `Set` de uuids **una vez** y pregunta contra él, en vez de
recorrer la lista por cada mensaje entrante. Es O(n+m) en un sitio donde la
lista crece con la conversación.

El caso 2 y el 4 juntos, en `saved_promotions_view_model.dart`: los dos getters
de negocios se leen **dentro de un `build`**, y antes recorrían la lista de
negocios por cada promoción —O(promos × negocios)—. Ahora montan un índice por
uuid y quedan en O(promos + negocios). Con las `n` de hoy la diferencia no se
ve; lo que lo justifica es que era trabajo por frame. Hay banco que fija las tres
cosas que no podían cambiar —el orden, que un negocio no se repita, y que una
promoción sin negocio no aparezca— y se comprobó que la implementación vieja lo
pasa igual, que es como se demuestra que el cambio no altera el comportamiento.

**Al revisar código, el orden de las preguntas es ese**: ¿cuántas peticiones
salen?, ¿esto corre en cada frame?, ¿cuánta memoria pide por elemento?, y solo
entonces, ¿puede crecer la `n` sin techo?

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

### El guardia de la ruta

La ruta `businessAnalytics` está declarada en
`permission_guarded_resource_enum.dart` → `_appModulesMap`, asociada a
`ModuleGuardType.business`: solo entran los managers con un negocio activo.

---

## El home parpadeaba durante la búsqueda del smart search (2026-09-06)

**Síntoma**: tras pulsar buscar, el snackbar se cerraba y durante un instante se
veía **el home recargándose con sus shimmers** (promos cercanas, nuevos en
Foodly); un momento después aparecían los resultados del NLP.

**Causa**, y es de una línea:

```dart
void checkForResetToInitial() async {
  if (state is! _SearchComplete) {   // <- le faltaba _Searching
    await resetToInitial();
  }
}
```

Lo dispara el `onDismiss` del snackbar, y el botón de buscar hace
`searchBusinesses()` **y justo después `dismiss()`**. En ese momento el estado es
`_Searching`, no `_SearchComplete`, así que reseteaba a `initial` — y
`_SmartSearchWrapper` pinta el `child` (el home) para todo lo que no sea
`searching` ni `searchComplete`, con su `orElse`. De ahí el home falso.

**Regla: mientras hay una búsqueda en vuelo no se resetea nada.**

**Cuánto se notaba**: con el Cloud Run del NLP dormido eran **14 segundos** de
home falso —el arranque en frío medido el 2026-09-06—; desde que se mantiene
caliente con un ping son 0,12 s y queda en parpadeo. El arreglo del backend
disimuló el bug del front, no lo quitó.

**Sin test unitario, y a propósito.** `SmartSearchCubit` arrastra unos diez
colaboradores para llegar a `_Searching` —`AuthSessionService` con 5
dependencias, `EventTrackingService` con 3, `SpeechToText`, `LocalStorageService`,
el repo—. Un test así se rompería cada vez que cambie cualquiera de esos
constructores: sería un lastre, no una red. Verificado con `flutter analyze`
limpio y por lectura de la cadena estado → wrapper, que es corta y cerrada.

## Un evento de realtime hacía DOS lecturas idénticas (2026-09-08)

**El problema** (auditoría de escalabilidad). Dos cubits del MISMO cliente
observan el MISMO canal `private-group-order.{uuid}`:

```
group_order_cubit.dart:51         -> _refetchSilently(uuid)   (la página)
active_group_order_cubit.dart:354 -> refresh()                (el chip flotante)
```

y los dos terminan en `_repo.getGroupOrder(uuid)`. Ante un evento salían **dos
peticiones idénticas en el mismo turno**.

Las cuentas, con cuidado porque es fácil contarlas mal: el backend despacha
**UN** evento y Pusher lo abanica a los 8 suscriptores. En una mesa de 8 con la
página y el chip vivos, una mutación pasaba de 8 lecturas de la orden completa
a **16**, y cada una son ~20 consultas a Neon a 35 ms de ida y vuelta. El
coalescer es **por dispositivo**: lleva las 16 a 8, no a 1. Y el «con la página
y el chip vivos» carga todo el peso: sólo tiene dos oyentes quien está DENTRO
de la orden; quien navega el menú tiene uno. El ahorro real por evento está
entre 0 y 8 lecturas, no fijo en 8.

**Dónde NO estaba el problema**: el backend emite UN evento por petición.
Comprobado sobre los 32 sitios que llaman a `GroupOrderTouched::safe`, y
`maybeAutoDeliver()` —que parece candidato— no emite el suyo. El ×2 es del
cliente, no del servidor. Que los dos oyentes reciban el evento es CORRECTO y
está fijado por un test: lo que sobraba era la segunda petición HTTP.

**La solución**: coalescer en `GroupOrderRepo`. Si en el MISMO TURNO ya se pidió
esa orden, la segunda llamada se cuelga de la primera.

```dart
Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid, {bool coalesce = false})
```

**Y aquí está la trampa, que es lo que hace peligroso un coalescer**:
`coalesce` es **solo para las lecturas que nacen de un evento**. Una lectura
que sigue a una mutación propia NO puede coalescer: la petición en vuelo salió
ANTES de la mutación, así que devolvería el estado anterior. Es justo lo que
hace `cancelPayment()`, que re-lee para que el pie deje de decir "confirmando"
— con el estado viejo se quedaría diciéndolo para siempre. Por eso el default
es `false` y solo los dos `onTouched` pasan `true`.

Corolario incómodo: **el default `false` hace que perder el argumento en un
refactor no dé ningún error**. Vuelve el ×2 y nadie se entera. Hay tests de
cableado que fijan quién pide coalescer y quién no, precisamente por eso.

**La ventana es UN TURNO SÍNCRONO, no "hasta que la petición termine"**, y esto
es lo que separa un coalescer correcto de uno barato. La primera versión de
esta PR usaba la ventana larga y la revisión demostró dos fallos reales:

1. **Datos rancios.** Llega un evento y sale L1. Mientras L1 vuela, otro
   comensal agrega un plato y llega un segundo evento, que se colgaba de L1 —
   una respuesta que por construcción no contiene ese plato. Y no hay nada que
   lo recupere: el polling de 10 s **solo corre con el socket caído**
   (`group_order_realtime_service.dart:222` lo apaga al conectar). La orden se
   quedaba rancia hasta el siguiente evento o un resume. Le puede pasar al
   propio autor del cambio: `GroupOrderTouched` usa `broadcast()` sin
   `->toOthers()`, así que uno recibe su propio evento.
2. **Una petición colgada dejaba la orden muda toda la sesión.** Este Dio no
   fija `receiveTimeout` ni `connectTimeout` —son `null` por defecto—, así que
   un GET que nunca responde retenía la entrada para siempre. Modo de fallo
   NUEVO: antes cada evento salía por su cuenta.

Con la ventana de un turno se cierran los dos: `ChannelListeners.notificar()`
avisa a los dos oyentes en el mismo turno, que es todo lo que hay que colapsar,
y los microtasks se drenan antes de volver al bucle de eventos, así que el
próximo evento de Pusher siempre encuentra el mapa limpio. **No es una caché**:
nadie reusa nada fuera de ese turno.

**Con una precisión que la segunda revisión me obligó a hacer**: lo que se
cierra es *la ruta que abría el coalescer*, no el problema de rancidez entero.
Queda viva la de **respuestas fuera de orden** —dos eventos en turnos
distintos, y la respuesta del segundo llega antes que la del primero, así que
la vieja pisa a la nueva—. Eso ya pasaba antes de esta PR y la PR lo estrecha
(de 2 peticiones en vuelo por evento a 1), pero no lo cierra. Cerrarlo pide una
guarda de generación: descartar una respuesta más vieja que la última aplicada.

**Trampa al medir esto**: mi primer barrido de mutaciones dio "M3 sobrevive" y
era mentira del detector, no del test. Con esa mutación un test se queda
esperando un completer y la corrida tarda un minuto, así que la salida empieza
por `01:00` y mi `grep "^00:0"` no la veía. **Usa el código de salida de
`flutter test`, no el texto.**

**El resume también contaba doble.** `GroupOrderRealtimeService` y
`GroupOrderFloatingChipHost` son dos `WidgetsBindingObserver` distintos y los
dos reaccionan a `resumed`; el binding los recorre en un bucle **síncrono**
(`flutter/lib/src/widgets/binding.dart:1332`), así que caen en el mismo turno.
El `refresh()` del host salía sin coalescer: dos peticiones idénticas en cada
vuelta del background, el momento más frecuente del día.

**Fijado en** `test/group_orders/una_lectura_por_evento_test.dart` (18 casos) y
`resume_una_sola_lectura_test.dart` (2).

**Y el cableado hay que fijarlo en LAS DOS direcciones.** Yo había blindado
sólo la pérdida del `coalesce: true`; añadirlo donde no va tampoco puede pasar
desapercibido, y en dos sitios pasaba: la re-lectura tras un pago fallido
(`group_order_cubit.dart`, el 409) y el `refresh()` al cerrar la página
(`group_order_floating_chip_host.dart`). Los dos siguen a algo que ya tocó el
servidor, que es justo el caso donde coalescer devuelve el estado anterior.

De las mutaciones mueren 13. Una sola es **equivalente**: quitar la guarda
`identical`, porque entre que una entrada se registra y corre su microtask no
hay ninguna otra vía de borrado. Se queda por defensa, y el comentario lo dice
así — antes decía «no es paranoia» y sí lo era.

**`clear()` en vez de `remove(uuid)` NO es equivalente**, aunque yo lo escribí
aquí. Hay una secuencia que los distingue y está en el test: si `o2` se
registra primero, la sonda va en un microtask encolado a continuación, y `o1`
se registra después, la cola queda `borrar-o2, sonda, borrar-o1` — la sonda
encuentra `o1` viva con `remove`, y borrada con `clear`. Que ningún test lo
viera sólo significaba «no observable con las llamadas de hoy», que es mucho
más débil que «equivalente».


## El cliente HTTP no tenía techo: una petición podía no terminar nunca (2026-09-12)

**El problema.** `FoodlyApiProvider` no fijaba ninguno de los tres timeouts de
Dio, y en Dio 5.9.2 `connectTimeout`, `receiveTimeout` y `sendTimeout` son
`null` por defecto —comprobado en `dio-5.9.2/lib/src/options.dart`—, que
significa **sin límite**. No «el del sistema»: sin límite.

En un móvil eso no es teórico. Un salto de WiFi a datos, o una red que se traga
los paquetes, deja la petición en vuelo para siempre: la pantalla se queda
girando, sin error y sin reintento, y sólo se destraba matando la app.

Salió revisando la PR #69. Una versión anterior de aquel coalescer retenía la
petición en vuelo hasta que terminara, y sin timeouts «una petición colgada» se
convertía en «la orden queda muda toda la sesión». Aquella PR se arregló por
otro lado —acotó la ventana a un turno síncrono— pero la falta de timeouts
seguía ahí, afectando a la app entera.

**Los números, y de dónde salen.** Medido contra `api.foodly.solutions` desde
una conexión sana: handshake TCP+TLS 50 ms, TTFB 0,2 s.

| | valor | por qué |
|---|---|---|
| `connectTimeout` | 10 s | 200× el handshake medido |
| `receiveTimeout` | 30 s | tiene que caber un arranque en frío de Cloud Run |
| `sendTimeout` | 30 s | de sobra para el JSON de unos KB que manda casi todo |

**Treinta y no veinte** porque el backend vive en Cloud Run **sin ping que lo
mantenga caliente** —el ping que hay es para el NLP, que es otro servicio— y un
arranque en frío tiene que caber. Esto es una red de seguridad contra el cuelgue
infinito, no una promesa de velocidad, y **una red de seguridad que salta sobre
tráfico legítimo hace más daño que la que no está**.

**Las subidas no pueden heredar el techo del JSON, y esa es la trampa.**
`sendTimeout` acota la subida **entera** del cuerpo, no un tramo de ella:
`io_adapter.dart:142` lo envuelve sobre `request.addStream`. Con el global de
30 s, el vídeo de una promo —hasta **80 MB**, `edit_promo_media.dart:205`— se
cortaría a mitad de subida en cualquier red de móvil. Sería romper en nombre de
arreglar.

Así que el interceptor le sube el techo a las subidas, por petición: 5 minutos
de envío y 60 s de recepción (el backend todavía tiene que mover el fichero a
GCS antes de contestar). Cinco minutos no cubren cualquier red —80 MB a 1 Mbps
piden diez— pero acotan lo que hoy no tiene techo: quien suba por una red así va
a fallar igual, y la diferencia es que **falla con un error en vez de dejar la
pantalla girando para siempre**.

Dos decisiones dentro de ese bloque, las dos con test que las fija:

1. **Se detecta por forma, `data is FormData`, no con una lista de rutas.** Es
   exactamente la condición que hace cara la subida, y el endpoint multipart que
   se añada mañana lo hereda solo. Retrofit genera `FormData` para todo
   `@MultiPart()`.
2. **Va antes del `return` de los endpoints de auth**, porque `/register` es
   multipart: manda la foto de perfil. Colocarlo después lo dejaría con el techo
   del JSON, y es el tipo de fallo que no da ningún error.

Y sólo se toca el valor si sigue siendo el global, para no pisar a quien eligió
el suyo a conciencia —`MenuImportRepo` le da 90 s al parse de una foto porque el
fallback de visión es lento—. Aquí las `BaseOptions` ya vienen fundidas en
`RequestOptions` (`Options.compose`), así que comparar contra el global es la
única manera de distinguir «nadie dijo nada» de «el llamante eligió esto».

**El cuelgue que ningún timeout arregla.** Los timeouts de Dio empiezan a contar
**en el adaptador**, o sea después de los interceptores. Una petición que se
queda dentro del interceptor no los ve nunca — y había dos sitios donde se
quedaba. En el camino de `silentRefresh`, cuando el refresco fallaba o no había
refresh token, el código hacía:

```dart
authSessionService.notifyTokenExpired();
return;   // ← y aquí se acababa todo
```

En un interceptor de petición un `return` pelado **no cancela nada**. El futuro
que espera quien llamó se completa cuando alguien invoca
`handler.next/resolve/reject` y con nada más (`dio_mixin.dart:400`: el resultado
del interceptor *es* `handler.future`). Sin esa llamada la petición se queda
pendiente para siempre. Lo que veía el usuario: la redirección a /login con el
spinner de la pantalla anterior girando debajo.

Ahora se rechaza con un **401 sintético**, no con un tipo nuevo: desde el punto
de vista de la app la petición **estaba** sin autenticar, el interceptor sólo se
ahorró el viaje. Así `FoodlyErrorPresenter` la clasifica como `auth` y se calla
—el aviso ya lo pone `notifyTokenExpired`— sin enseñarle un concepto nuevo a
nadie. Y `reject` sin su segundo argumento **no** pasa por `dioErrorHandler`
(`interceptor.dart:84`), así que este 401 no puede realimentar otro ciclo de
refresco.

**Que la petición termine no basta: lo que termina hay que poder pintarlo.**
`AppRequestException.errorMsg` devolvía, para un error **sin respuesta**, la
cadena `'${statusMessage} error code: ${statusCode}'` con los dos a null — o
sea, literalmente **«null error code: null»**, en un snackbar, en producción.
Hay **82 sitios** que pintan `errorMsg` sin pasar por `FoodlyErrorPresenter`, y
tocar los 82 no era el trabajo: el arreglo va en el getter.

Esa rama era casi inalcanzable mientras no hubiera timeouts, porque la petición
no terminaba. **Fijarlos es justo lo que la vuelve alcanzable**, y por eso el
arreglo va en esta PR y no en otra: sin él, el cambio de los timeouts habría
cambiado «pantalla colgada» por «pantalla con un mensaje absurdo».

Sólo cambia el caso sin respuesta —`noConnection` si es de red, el genérico si
no—; en cuanto hay respuesta, el mensaje del backend sigue mandando igual que
antes.

**Dónde NO estaba el problema.** El NLP de búsqueda **no** usa este cliente:
tiene su propio `NlpApiProvider` con 15 s / 30 s ya puestos, así que sus 14 s de
arranque en frío no obligan a subir nada aquí. Las analíticas
(`AnalyticsApiProvider`) y el Dio de geocodificación de `LocationBloc` también
traían los suyos. **El cliente principal era el único sin techo**, que es lo
llamativo: el patrón ya existía en el repo y justo el Dio por el que pasa casi
todo se lo había saltado.

**Fijado en** `test/core/network/timeouts_de_dio_test.dart` (24 casos). De las
seis mutaciones probadas no sobrevive ninguna, incluidas las dos finas: mover el
bloque de subidas **detrás** del `return` de los endpoints de auth mata el caso
de `/register`, y quitar la guarda de «sólo si es el global» mata el de
`MenuImportRepo`.


## El modo «negocio visitado» (2026-04-12)

### Son dos páginas, no una

-   `BusinessPage` — la vista del dueño, con los controles de edición. Se llega
    desde «Mi negocio», en el drawer.
-   `VisitedBusinessPage` — la vista del visitante, de solo lectura. Se llega
    desde categorías, búsqueda, favoritos y Buzz.

**Cuando un manager visita su PROPIO negocio** desde categorías, búsqueda o
favoritos, ve `VisitedBusinessPage` —modo visitante— sin botones de edición ni
controles de gestión. Es deliberado: el módulo de negocio visitado **no depende**
de `BusinessBloc` ni de saber quién es el dueño.

**Código muerto retirado** (2026-04-12): el widget `business_name.dart` del
módulo de negocio visitado, que importaba `BusinessBloc`/`BusinessVM` del módulo
del dueño y traía un `onTap` de edición; y los getters muertos
`loggedUserCanEdit` / `loggerUserCanEdit` de `promotions_vm.dart` y
`menu_vm.dart`.
