# Migración a freezed 3 + flutter_stripe — Nota técnica

**Fecha:** Junio 2026 · **Contexto:** al agregar `flutter_stripe ^13.0.0`, la cadena de
codegen (`retrofit_generator 9.2.0` → `analyzer 7.x`) forzó subir `freezed 2.5.8 → 3.1.0`
y `freezed_annotation 2.4.4 → 3.1.0`.

## Qué cambió (y qué NO hizo falta)

freezed 3.0 introdujo UN breaking change que sí nos afecta:

**Toda clase `@freezed` debe ser `abstract` o `sealed`.**
- `abstract` para los **151 modelos de un solo constructor** (data models).
- `sealed` para las **35 uniones** (estados/eventos de blocs + `ApiResult`).

Eso es **lo único** que hubo que cambiar en el código fuente.

### Sobre `when` / `map` (importante)

freezed 3 **NO** elimina `when`/`whenOrNull`/`maybeWhen`/`map`/`mapOrNull`/`maybeMap`.
Los **mueve** del mixin a una **extensión generada** llamada `${Clase}Patterns`
(p. ej. `ApiResultPatterns`, `BusinessStatePatterns`) dentro del `.freezed.dart`.

Por eso los ~202 call-sites de `when`/`map` **siguen funcionando** una vez regenerado el
código. No hace falta reescribirlos a `switch`. (Un intento inicial de agregar extensiones
`${Clase}Patterns` manuales colisionaba por nombre con las que genera freezed →
`duplicate_definition`; se eliminaron.)

**IMPORTANTE — los métodos de extensión requieren importar la librería que los declara.**
A diferencia de freezed 2 (donde `when`/`map` eran métodos del mixin, disponibles en
cualquier instancia sin imports extra), en freezed 3 son **extensiones**. Para usar
`result.when(...)` sobre un `ApiResult`, el archivo DEBE tener:

```dart
import 'package:foodly_world/core/network/base/api_result.dart';
```

aunque reciba el `ApiResult` por inferencia de tipo. Lo mismo para estados de bloc: el
archivo que llame `state.when(...)` debe importar la librería del estado (el archivo
`xxx_state.dart` standalone, o el `xxx_cubit.dart` si el estado es `part of` el cubit).
Si VS Code marca `The method 'when' isn't defined`, el quick-fix correcto es
**"Import library …"**. (Esta migración añadió ese import a 41 archivos de ApiResult + 2 de estados.)

## Verificación

```bash
cd foodly_world
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter analyze     # debe quedar limpio
fvm flutter test
```

Si quedara algún `when`/`map` no resuelto, casi siempre es por `.freezed.dart` stale:
`fvm flutter clean && fvm flutter pub get && fvm dart run build_runner build --delete-conflicting-outputs`.

## flutter_stripe 13 — estado

Config nativa ya correcta en el repo: `MainActivity` extiende `FlutterFragmentActivity`,
iOS deployment target 15.0, Kotlin 2.3.10, minSdk/compileSdk heredados de Flutter.
Init agregado en `lib/main.dart` (publishable key vía `--dart-define=STRIPE_PUBLISHABLE_KEY`).

## Reversión

Todo está en git. `git diff` muestra los cambios (solo `abstract`/`sealed` en los modelos
+ el init de Stripe en main.dart). Revertir es `git checkout` de los archivos afectados.
