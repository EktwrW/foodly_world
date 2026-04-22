// ignore_for_file: avoid_print
//
// Smoke test manual: cliente Flutter → backend proxy productivo.
//
// **Uso:**
//   FOODLY_BEARER="Bearer xxxxxxxxxxxx" \
//     dart run tool/places_proxy_smoke.dart
//
// Opcional:
//   FOODLY_BASE_URL="https://api.foodly.solutions/api/v1"   (default)
//
// **Por qué existe:** en Fase 3 armamos los clients Retrofit
// (FoodlyPlacesClient, ConfigFeaturesClient) pero todavía no hay consumers
// migrados — sin este smoke test no tenemos forma de verificar que el
// stack nuevo parsea las respuestas reales del backend de producción.
// En Fase 4 vamos a migrar LocationService/LocationBloc/SignUpCubit; si
// cualquier cosa en los DTOs está mal, lo detectamos acá y no en el
// usuario final.
//
// **Qué cubre:**
//   1. GET  /config/features               (público)
//   2. POST /geocoding/reverse             (público)
//   3. POST /places/autocomplete           (authed)
//   4. GET  /places/details/{placeId}      (authed, usando place_id del #3)
//   5. POST /geocoding/forward             (authed)
//
// **Qué NO cubre** (intencional):
//   - Autenticación / login flow: el script asume que ya tenés un Bearer
//     válido en FOODLY_BEARER. Esto es para aislar Fase 3 de AuthFlow.
//   - Cache del AppFeaturesRepo: eso ya está testeado unit-side.
//   - Carga / rate-limiting: estos requests NO deberían disparar throttle.
//
// **Este script no forma parte del build de la app.** Vive en `tool/`
// porque es tooling de desarrollo, no código de producción.

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/network/app_config/config_features_client.dart';
import 'package:foodly_world/core/network/places_proxy/foodly_places_client.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_forward_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_reverse_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/place_autocomplete_request_dto.dart';

// ─── colores ANSI mínimos para que el output sea legible ────────────────
const _green = '\x1B[32m';
const _red = '\x1B[31m';
const _yellow = '\x1B[33m';
const _gray = '\x1B[90m';
const _bold = '\x1B[1m';
const _reset = '\x1B[0m';

/// Traza los pass/fail para emitir exit code al final. Persistir un solo
/// contador evita tener que usar un try/catch global al nivel del main.
int _failed = 0;

Future<void> main() async {
  final bearer = Platform.environment['FOODLY_BEARER'];
  final baseUrl = Platform.environment['FOODLY_BASE_URL'] ??
      'https://api.foodly.solutions/api';

  if (bearer == null || bearer.isEmpty) {
    stderr.writeln(
      '${_red}FOODLY_BEARER env var es requerida$_reset\n'
      'Ejemplo: FOODLY_BEARER="Bearer eyJ0eXA..." dart run tool/places_proxy_smoke.dart',
    );
    exit(2);
  }

  print('${_bold}Smoke test Places Proxy$_reset');
  print('${_gray}Base URL:$_reset $baseUrl');
  print('${_gray}Bearer:$_reset   ${bearer.substring(0, bearer.length.clamp(0, 24))}…\n');

  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // El script NO pasa por el DioRequestHandler de la app. Inyectamos
      // el Authorization manualmente en los endpoints authed — omitido
      // en los públicos (reverse, features).
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    // validateStatus=null hace que Dio devuelva la Response en vez de
    // tirar DioException en 4xx. Los manejamos manual para reportar con
    // más contexto en el smoke test.
    validateStatus: (status) => status != null && status < 500,
  ));

  // Authorization dinámico por request (algunos pegan al Bearer, otros no).
  final placesClient = FoodlyPlacesClient(_withAuth(dio, bearer));
  final featuresClient = ConfigFeaturesClient(dio);

  // ── 1. /config/features (público) ─────────────────────────────────────
  await _run('1. GET /config/features (público)', () async {
    final features = await featuresClient.getFeatures();
    print('   ${_gray}places_proxy_enabled:$_reset ${features.placesProxyEnabled}');
  });

  // ── 2. /geocoding/reverse (público) ───────────────────────────────────
  await _run('2. POST /geocoding/reverse (público, Covilhã 40.2791,-7.5063)', () async {
    // Usamos un Dio sin bearer para este endpoint — simula el caller
    // pre-login. El backend debe responder OK igual.
    final publicClient = FoodlyPlacesClient(dio);
    final res = await publicClient.reverse(
      const GeocodingReverseRequestDTO(
        lat: 40.2791,
        lng: -7.5063,
        language: 'es',
      ),
    );
    print('   ${_gray}status:$_reset ${res.status.name}');
    print('   ${_gray}results:$_reset ${res.results.length}');
    if (res.results.isNotEmpty) {
      print('   ${_gray}first.formatted_address:$_reset ${res.results.first.formattedAddress}');
    }
  });

  // ── 3. /places/autocomplete (authed) ──────────────────────────────────
  String? firstPlaceId;
  String? sessionToken;
  await _run('3. POST /places/autocomplete (authed, input="Covilh")', () async {
    sessionToken = _uuidV4Pseudo();
    final res = await placesClient.autocomplete(
      PlaceAutocompleteRequestDTO(
        input: 'Covilh',
        sessionToken: sessionToken,
        language: 'es',
        region: 'pt',
        components: 'country:pt|country:es',
      ),
    );
    print('   ${_gray}status:$_reset       ${res.status.name}');
    print('   ${_gray}predictions:$_reset  ${res.predictions.length}');
    if (res.predictions.isNotEmpty) {
      final first = res.predictions.first;
      print('   ${_gray}first.placeId:$_reset ${first.placeId}');
      print('   ${_gray}first.desc:$_reset    ${first.description}');
      firstPlaceId = first.placeId;
    }
  });

  // ── 4. /places/details/{placeId} (authed) ─────────────────────────────
  if (firstPlaceId != null) {
    await _run('4. GET /places/details/$firstPlaceId (authed, misma sesión)', () async {
      final res = await placesClient.details(
        firstPlaceId!,
        sessionToken: sessionToken,
        language: 'es',
      );
      print('   ${_gray}status:$_reset ${res.status.name}');
      final r = res.result;
      if (r != null) {
        print('   ${_gray}name:$_reset    ${r.name ?? "(sin name)"}');
        print('   ${_gray}address:$_reset ${r.formattedAddress ?? "(sin formatted_address)"}');
        final loc = r.geometry?.location;
        if (loc != null) {
          print('   ${_gray}coords:$_reset  ${loc.lat}, ${loc.lng}');
        }
        print('   ${_gray}components:$_reset ${r.addressComponents.length}');
      } else {
        print('   ${_yellow}result es null — esperado solo en NOT_FOUND$_reset');
      }
    });
  } else {
    print('${_yellow}4. skipped — autocomplete no devolvió place_id$_reset');
    _failed++;
  }

  // ── 5. /geocoding/forward (authed) ────────────────────────────────────
  await _run('5. POST /geocoding/forward (authed, query="Rua da Alegria, Viseu")', () async {
    final res = await placesClient.forward(
      const GeocodingForwardRequestDTO(
        query: 'Rua da Alegria, Viseu, Portugal',
        language: 'es',
      ),
    );
    print('   ${_gray}status:$_reset  ${res.status.name}');
    print('   ${_gray}results:$_reset ${res.results.length}');
    if (res.results.isNotEmpty) {
      final first = res.results.first;
      print('   ${_gray}first.addr:$_reset ${first.formattedAddress}');
      final loc = first.geometry?.location;
      if (loc != null) {
        print('   ${_gray}first.coords:$_reset ${loc.lat}, ${loc.lng}');
      }
    }
  });

  // ── resumen ───────────────────────────────────────────────────────────
  print('');
  if (_failed == 0) {
    print('$_green$_bold✓ Smoke test OK — todos los endpoints parsearon$_reset');
    exit(0);
  } else {
    print('$_red$_bold✗ Smoke test falló en $_failed endpoint(s)$_reset');
    exit(1);
  }
}

/// Corre un bloque imprimiendo header + ✓/✗. Captura cualquier excepción
/// (Dio, parsing, lo que sea) y la imprime con stack — el smoke test no
/// aborta al primer error para poder diagnosticar todos los endpoints de
/// una pasada.
Future<void> _run(String title, Future<void> Function() body) async {
  print('$_bold$title$_reset');
  final sw = Stopwatch()..start();
  try {
    await body();
    sw.stop();
    print('   $_green✓ OK$_reset $_gray(${sw.elapsedMilliseconds}ms)$_reset\n');
  } catch (e, s) {
    sw.stop();
    _failed++;
    print('   $_red✗ FAIL$_reset $_gray(${sw.elapsedMilliseconds}ms)$_reset');
    print('   ${_gray}error:$_reset $e');
    if (e is DioException) {
      print('   ${_gray}status:$_reset ${e.response?.statusCode}');
      print('   ${_gray}body:$_reset   ${e.response?.data}');
    } else {
      // Parsing exception u otro — imprimir stack para poder arreglar el DTO.
      print('   ${_gray}stack:$_reset\n$s');
    }
    print('');
  }
}

/// Devuelve un nuevo Dio que hereda `dio` pero agrega el Authorization
/// header. NO mutamos el dio original para que los clients "públicos"
/// sigan usándolo sin bearer.
Dio _withAuth(Dio dio, String bearer) {
  final authed = Dio(BaseOptions(
    baseUrl: dio.options.baseUrl,
    headers: {
      ...dio.options.headers,
      'Authorization': bearer.startsWith('Bearer ') ? bearer : 'Bearer $bearer',
    },
    connectTimeout: dio.options.connectTimeout,
    receiveTimeout: dio.options.receiveTimeout,
    validateStatus: dio.options.validateStatus,
  ));
  return authed;
}

/// UUID v4 pseudo para el `sessionToken` de autocomplete → details.
/// Google no valida que sea un UUID real — solo que sea un string
/// consistente entre la call a autocomplete y la siguiente a details
/// (para facturación de "sesión" unificada). No usamos `package:uuid`
/// para no agregar dependency solo por el smoke.
String _uuidV4Pseudo() {
  final r = DateTime.now().microsecondsSinceEpoch;
  final h = r.toRadixString(16).padLeft(16, '0');
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-4${h.substring(13, 16)}'
      '-8${h.substring(0, 3)}-${h.substring(4, 16)}';
}
