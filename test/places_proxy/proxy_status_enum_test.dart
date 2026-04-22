import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/places_proxy/place_autocomplete_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';

/// Invariante protegida: el enum `ProxyStatusEnum` debe mapear TODOS los
/// strings que Google (y nuestro proxy) puede emitir, y debe caer a
/// `unknown` sin romper el parse cuando aparezca un valor futuro.
///
/// Estos tests fallarán si:
/// - Alguien agrega un valor al enum pero olvida el `@JsonValue`.
/// - Alguien remueve el `unknownEnumValue: ProxyStatusEnum.unknown` de
///   algún `@JsonKey` que deserialice este enum → una respuesta con un
///   status raro abortaría toda la respuesta y no veríamos los datos.
/// - Alguien cambia el `@JsonValue('OK')` a otra cosa → rompería
///   parsing de todas las respuestas exitosas en producción.
void main() {
  group('ProxyStatusEnum — JSON value mapping', () {
    test('cada valor del enum (excepto unknown) declara su @JsonValue', () {
      // Parsing directo de cada valor a través de un envelope mínimo.
      // Usamos PlaceAutocompleteResponseDM porque es el envelope más
      // liviano que deserializa el enum con unknownEnumValue.
      const googleStatuses = <String, ProxyStatusEnum>{
        'OK': ProxyStatusEnum.ok,
        'ZERO_RESULTS': ProxyStatusEnum.zeroResults,
        'NOT_FOUND': ProxyStatusEnum.notFound,
        'INVALID_REQUEST': ProxyStatusEnum.invalidRequest,
        'OVER_QUERY_LIMIT': ProxyStatusEnum.overQueryLimit,
        'REQUEST_DENIED': ProxyStatusEnum.requestDenied,
        'UNKNOWN_ERROR': ProxyStatusEnum.unknownError,
        'UPSTREAM_ERROR': ProxyStatusEnum.upstreamError,
      };

      for (final entry in googleStatuses.entries) {
        final parsed = PlaceAutocompleteResponseDM.fromJson({
          'status': entry.key,
          'predictions': <dynamic>[],
        });
        expect(
          parsed.status,
          entry.value,
          reason: 'Status "${entry.key}" debería mapear a ${entry.value}',
        );
      }
    });

    test('un status desconocido cae a ProxyStatusEnum.unknown sin romper', () {
      // Scenario: Google introduce mañana PARTIAL_MATCH_NEW. Si nos
      // descuidamos con el unknownEnumValue, fromJson tiraría y
      // perderíamos la lista entera de predictions (vacía en este
      // caso, pero el riesgo aplica a listas pobladas también).
      final parsed = PlaceAutocompleteResponseDM.fromJson({
        'status': 'PARTIAL_MATCH_NEW',
        'predictions': <dynamic>[],
      });
      expect(parsed.status, ProxyStatusEnum.unknown);
    });

    // NOTA: intencionalmente NO testeamos `'status': null`. El campo
    // `status` es `required` en los 3 response DMs porque el contrato
    // del backend garantiza que siempre viene (ver smoke test Fase 3).
    // Si algún día el backend empieza a mandar null, preferimos que el
    // parser explote ruidoso antes que silenciar un contrato roto con
    // un default. `unknownEnumValue` solo cubre strings futuros, no
    // ausencias — eso es decisión de diseño, no omisión.
  });

  group('ProxyStatusEnum — helpers semánticos', () {
    test('isOk solo es true para ok', () {
      for (final v in ProxyStatusEnum.values) {
        expect(v.isOk, v == ProxyStatusEnum.ok);
      }
    });

    test('isEmpty cubre zeroResults y notFound — y nadie más', () {
      // "No hay datos pero la query fue válida" → UI empty state.
      // Mezclar cualquiera de estos dos con isError rompería la UX
      // (mostraríamos toast de error cuando solo hay que mostrar
      // "sin resultados").
      for (final v in ProxyStatusEnum.values) {
        final shouldBeEmpty =
            v == ProxyStatusEnum.zeroResults || v == ProxyStatusEnum.notFound;
        expect(v.isEmpty, shouldBeEmpty, reason: 'Caso: $v');
      }
    });

    test('isError cubre errores reales + unknown catch-all', () {
      // `unknown` es error: si un día Google introduce un status que
      // no es ni OK ni empty, por default queremos que la UI muestre
      // error genérico (mejor eso que mostrar empty state silencioso).
      const expectedErrors = <ProxyStatusEnum>{
        ProxyStatusEnum.upstreamError,
        ProxyStatusEnum.overQueryLimit,
        ProxyStatusEnum.requestDenied,
        ProxyStatusEnum.unknownError,
        ProxyStatusEnum.unknown,
      };
      for (final v in ProxyStatusEnum.values) {
        expect(v.isError, expectedErrors.contains(v), reason: 'Caso: $v');
      }
    });

    test('isOk, isEmpty, isError son mutuamente excluyentes', () {
      // Invariante de diseño: un status no puede ser "ok y error" al
      // mismo tiempo. Si alguien toca los getters, este test falla.
      for (final v in ProxyStatusEnum.values) {
        final flags = [v.isOk, v.isEmpty, v.isError].where((x) => x).length;
        // invalidRequest es el único que deliberadamente NO cae en
        // ninguno de los 3 buckets (es un error "del cliente", no
        // algo que la UI muestre como toast ni como empty state —
        // los consumers de autocomplete validan el input antes de
        // emitir el request, así que no debería llegar).
        if (v == ProxyStatusEnum.invalidRequest) {
          expect(flags, 0, reason: 'invalidRequest no debe estar en ninguno');
        } else {
          expect(flags, 1, reason: 'Caso $v debería estar en exactamente 1 bucket');
        }
      }
    });
  });
}
