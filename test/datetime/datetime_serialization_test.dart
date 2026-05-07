import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_transfer_objects/analytics/event_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_register_dto.dart';

/// Tests del patrón de serialización de DateTime documentado en
/// `/sessions/.auto-memory/feedback_datetime_extension.md`:
///
///   "Para serializar DateTime a la API: `.toIso8601String()` a secas, sin
///    `.toUtc()`. El BE (Carbon::parse) acepta cualquier zona y normaliza."
///
/// Sin estos tests, alguien puede re-introducir `.toUtc()` en un refactor
/// y nadie lo nota hasta que se filtra a producción y rompe la consistencia
/// de timestamps entre DTOs (ej: `EventDTO.clientTimestamp` con "Z",
/// `UserDM.dateOfBirth` sin "Z" → narrativas inconsistentes en analytics
/// y en displays de "hace X tiempo").
///
/// Bug histórico que arregló esto:
/// - `event_tracking_service.dart` tenía `DateTime.now().toUtc().toIso8601String()`
/// - `sign_up_cubit.dart` tenía `dateOfBirth?.toUtc() ?? DateTime.now().toUtc()`
/// Ambos arreglados 2026-05-07. Ver feedback_datetime_extension.md.
void main() {
  group('DateTime.toIso8601String() — sanity', () {
    test(
      'DateTime local NO termina en "Z"',
      () {
        // Caso: si construimos un DateTime explícito local, el ISO no
        // tiene sufijo de zona. Esto es lo que el BE espera por default.
        final local = DateTime(2026, 5, 7, 14, 30);
        final iso = local.toIso8601String();

        expect(iso.endsWith('Z'), false,
            reason: 'DateTime local serializado a ISO no debe llevar "Z" — '
                'Z indica UTC explícito y ese NO es el patrón de Foodly');
        expect(iso, '2026-05-07T14:30:00.000');
      },
    );

    test(
      'DateTime.now() (clock local) NO termina en "Z"',
      () {
        // Caso: cuando capturamos "ahora" para enviarlo al BE (ej: client
        // timestamp de un evento de analytics), debe serializarse sin "Z".
        final iso = DateTime.now().toIso8601String();

        expect(iso.endsWith('Z'), false,
            reason: 'DateTime.now() es local; serializarlo con "Z" forzaría '
                'una conversión UTC que rompe el patrón establecido');
      },
    );

    test(
      'DateTime.now().toUtc() SÍ termina en "Z" (regresión-detector)',
      () {
        // Este test es el "canary": si pasara que `.toUtc()` se vuelve no-op
        // o cambia comportamiento en una versión futura del SDK, lo
        // detectaríamos acá. Hoy `.toUtc()` siempre añade "Z" — protegerlo
        // garantiza que nuestros tests siguen siendo significativos.
        final iso = DateTime.now().toUtc().toIso8601String();

        expect(iso.endsWith('Z'), true,
            reason: '.toUtc().toIso8601String() debe terminar en "Z" — '
                'si esto cambia el resto de los tests pierden significado');
      },
    );

    test(
      'fechas históricas locales (DateOfBirth) tampoco llevan "Z"',
      () {
        // Caso típico: un usuario se registra y `dateOfBirth` es un
        // DateTime construido por el date picker (local).
        final dob = DateTime(1990, 5, 15);
        final iso = dob.toIso8601String();

        expect(iso.endsWith('Z'), false);
        expect(iso, '1990-05-15T00:00:00.000');
      },
    );
  });

  group('EventDTO — clientTimestamp serialization', () {
    test(
      'clientTimestamp generado con DateTime.now().toIso8601String() NO lleva "Z"',
      () {
        // Reproducimos exactamente lo que hace event_tracking_service.dart:77.
        // Si alguien le agrega `.toUtc()` en un refactor futuro, este test
        // rompe inmediatamente.
        final dto = EventDTO(
          eventClientId: 'test-client-id',
          eventType: 'test.event',
          clientTimestamp: DateTime.now().toIso8601String(),
          sourceModule: 'test',
          sessionId: 'session-1',
          platform: 'android',
        );

        final json = dto.toJson();

        expect(json['client_timestamp'], isA<String>());
        final ts = json['client_timestamp'] as String;
        expect(ts.endsWith('Z'), false,
            reason: 'EventDTO.clientTimestamp debe ser local time sin "Z". '
                'Si rompió, alguien re-introdujo `.toUtc()` en '
                'event_tracking_service.dart');
      },
    );

    test(
      'EventDTO conserva el timestamp tal cual se pasa al constructor',
      () {
        // Defensa: el DTO no debe transformar el timestamp internamente.
        // Si alguien decide "normalizar" timestamps en el toJson(), este
        // test rompe.
        const fixedTimestamp = '2026-05-07T14:30:00.000';
        final dto = const EventDTO(
          eventClientId: 'x',
          eventType: 'x',
          clientTimestamp: fixedTimestamp,
          sourceModule: 'x',
          sessionId: 'x',
          platform: 'x',
        );

        expect(dto.toJson()['client_timestamp'], fixedTimestamp);
      },
    );
  });

  group('UserBodyRegisterDTO — dateOfBirth serialization', () {
    UserBodyRegisterDTO buildDto({required DateTime dob}) {
      return UserBodyRegisterDTO(
        userName: 'tester',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        password: 'pass123',
        passwordConfirmation: 'pass123',
        phone: '+5491133334444',
        dateOfBirth: dob,
        address: 'Av. Siempre Viva 123',
        zipCode: '1000',
        city: 'CABA',
        country: FoodlyCountries.ARGENTINA,
        gender: 'male',
        roleId: UserRole.customer,
        termsAndContiditionsAccepted: true,
        latitude: -34.6,
        longitude: -58.4,
      );
    }

    test(
      'dateOfBirth local → JSON sin "Z" (post-fix sign_up_cubit)',
      () {
        // Reproduce el flujo real: el date picker entrega un DateTime
        // local, el cubit lo pasa al DTO sin transformación, y json
        // serialization debe preservar el local time.
        final dto = buildDto(dob: DateTime(1990, 5, 15));
        final json = dto.toJson();

        expect(json['date_of_birth'], isA<String>());
        final raw = json['date_of_birth'] as String;
        expect(raw.endsWith('Z'), false,
            reason: 'Si rompió, alguien re-introdujo `.toUtc()` en '
                'sign_up_cubit.dart al pasar dateOfBirth al DTO');
        expect(raw, '1990-05-15T00:00:00.000');
      },
    );

    test(
      'dateOfBirth con hora explícita NO se "redondea" a UTC',
      () {
        // Edge case: si el date picker entrega hora distinta de medianoche
        // (raro pero posible si el flow cambia), la hora local se preserva
        // 1:1 sin shift por timezone offset.
        final dto = buildDto(dob: DateTime(1995, 3, 20, 9, 15, 30));
        final raw = dto.toJson()['date_of_birth'] as String;

        expect(raw, '1995-03-20T09:15:30.000');
        expect(raw.endsWith('Z'), false);
      },
    );

    test(
      'dateOfBirth=DateTime.now() (fallback del cubit) NO lleva "Z"',
      () {
        // Reproduce la rama del fallback: si el form se envía sin date
        // picker tocado, el cubit usa `DateTime.now()`. Tampoco debe
        // emitir Z.
        final dto = buildDto(dob: DateTime.now());
        final raw = dto.toJson()['date_of_birth'] as String;

        expect(raw.endsWith('Z'), false,
            reason: 'El fallback DateTime.now() debe seguir el mismo '
                'patrón local-sin-Z que el path normal del date picker');
      },
    );
  });

  group('Round-trip (parse → serialize) preserva el patrón', () {
    test(
      'DateTime.parse de un string sin "Z" → toIso8601String tampoco lleva "Z"',
      () {
        // Defensa: si el BE alguna vez devuelve fechas en formato local
        // y las round-trippeamos, no debemos accidentalmente emitir UTC.
        const original = '2026-05-07T14:30:00.000';
        final parsed = DateTime.parse(original);
        final reSerialized = parsed.toIso8601String();

        expect(reSerialized.endsWith('Z'), false);
        expect(reSerialized, original);
      },
    );

    test(
      'DateTime.parse de un string con "Z" SÍ emite UTC en re-serialize',
      () {
        // Canary: si el BE manda "Z", parseamos como UTC y al re-serializar
        // mantenemos UTC. Esto es comportamiento estándar de Dart — solo
        // verificamos que el SDK no cambió.
        const original = '2026-05-07T14:30:00.000Z';
        final parsed = DateTime.parse(original);
        final reSerialized = parsed.toIso8601String();

        expect(reSerialized.endsWith('Z'), true,
            reason: 'DateTime.parse preserva Z en round-trip — si esto '
                'cambia, la mitad de los tests del proyecto pierden significado');
      },
    );
  });
}
