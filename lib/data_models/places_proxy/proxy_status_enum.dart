import 'package:json_annotation/json_annotation.dart';

/// Google Places / Geocoding response status, modelado con un valor `unknown`
/// catch-all que sirve como `unknownEnumValue` para TODOS los `@JsonKey` que
/// deserialicen este enum.
///
/// ¿Por qué un enum en vez de un String crudo?
/// 1. **Evita typos en el call site** — `ProxyStatusEnum.ok` es refactor-safe,
///    `'OK'` no.
/// 2. **Exhaustividad en switches** — el analyzer nos avisa si Google agrega
///    un nuevo status que no manejemos en una rama de UX.
///
/// ¿Por qué `unknown` en lugar de dejar que Google reviente el parsing?
/// Decisión explícita: si Google algún día introduce `PARTIAL_MATCH_NEW` o
/// similar, NO queremos que toda la lista de predictions/results se pierda
/// por un fromJson que aborta (ver memoria: "JSON enums defensivos —
/// unknownEnumValue"). Caemos a `unknown`, lo loggeamos, y seguimos adelante
/// mostrando los datos que sí vengan.
///
/// Passthrough del backend (decisión Fase 3, 2026-04-22): el backend Laravel
/// NO normaliza el status — devuelve literal lo que dijo Google. Por eso acá
/// cubrimos tanto los valores "backend-originated" (UPSTREAM_ERROR) como los
/// "Google-originated" (REQUEST_DENIED, OVER_QUERY_LIMIT, etc.).
enum ProxyStatusEnum {
  /// Respuesta con payload útil. `predictions` / `result` / `results` vienen
  /// poblados (salvo casos degenerados como listas vacías de Google).
  @JsonValue('OK')
  ok,

  /// Google procesó el request pero no encontró nada que matchee. No es un
  /// error — la UI debe mostrar "sin resultados" (empty state), NO un toast
  /// de error.
  @JsonValue('ZERO_RESULTS')
  zeroResults,

  /// El `place_id` consultado en `/places/details/{placeId}` no existe o
  /// fue dado de baja por Google. El backend lo mapea a HTTP 404 para que
  /// el cliente lo distinga de un outage (`UPSTREAM_ERROR` → 502).
  @JsonValue('NOT_FOUND')
  notFound,

  /// El input no pasó la validación del backend (FormRequest) o Google lo
  /// rechazó por malformado. HTTP 422 del backend.
  @JsonValue('INVALID_REQUEST')
  invalidRequest,

  /// Cuota del proyecto GCP agotada (día o QPS). Disparar alerta — si esto
  /// aparece en prod es señal de DDoS o de un bug que escapó del rate-limit
  /// per-user del backend.
  @JsonValue('OVER_QUERY_LIMIT')
  overQueryLimit,

  /// Key inválida o con API Restriction que no incluye el endpoint. En
  /// nuestro stack esto debería ser imposible porque la key la inyecta el
  /// backend — si aparece, algo está mal en GCP Console.
  @JsonValue('REQUEST_DENIED')
  requestDenied,

  /// Error server-side de Google (5xx interno antes de responder). El backend
  /// reintenta con backoff; si llega a este punto es que los retries no
  /// alcanzaron.
  @JsonValue('UNKNOWN_ERROR')
  unknownError,

  /// El backend no pudo hablar con Google (timeout, 5xx persistente, o
  /// excepción de Guzzle). Status sintético del proxy, no de Google. HTTP
  /// 502 del backend.
  @JsonValue('UPSTREAM_ERROR')
  upstreamError,

  /// Catch-all para valores futuros que Google introduzca. **NUNCA** lo
  /// seteemos manualmente — es el fallback del `unknownEnumValue`.
  unknown;

  /// `true` cuando la respuesta trae payload útil para renderizar.
  bool get isOk => this == ProxyStatusEnum.ok;

  /// `true` si es un "no hay resultados pero la query fue válida".
  /// UI debe mostrar empty state, NO error.
  bool get isEmpty => this == ProxyStatusEnum.zeroResults || this == ProxyStatusEnum.notFound;

  /// `true` si es un error que debe mostrar feedback al usuario.
  bool get isError =>
      this == ProxyStatusEnum.upstreamError ||
      this == ProxyStatusEnum.overQueryLimit ||
      this == ProxyStatusEnum.requestDenied ||
      this == ProxyStatusEnum.unknownError ||
      this == ProxyStatusEnum.unknown;
}
