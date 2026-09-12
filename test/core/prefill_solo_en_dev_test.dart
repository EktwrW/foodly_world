import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/configs/demo_config.dart';
import 'package:foodly_world/core/configs/dev_config.dart';
import 'package:foodly_world/core/configs/prod_config.dart';
import 'package:logger/logger.dart';

/// El prefill del login solo existe en dev.
///
/// POR QUE HAY TEST (2026-09-12). El cableado —`LOG_EMAIL`, `LOG_PASS`,
/// `REG_PREFILL`— llevaba tiempo escrito pero no lo leia nadie, asi que daba
/// igual que `ProdConfig` tambien implementara `shouldPrefillLogin` a partir de
/// `REG_PREFILL`. Al conectarlo deja de dar igual: un build de tienda con ese
/// define puesto habria arrancado con credenciales en el formulario.
///
/// `ProdConfig` ya no recibe `regPrefill` y hereda `false`. Este test es lo que
/// impide que alguien se lo devuelva «por simetria» con `DevConfig`.
void main() {
  DevConfig dev({String? email, String? pass, bool? prefill}) => DevConfig(
        envLogLevel: Level.off,
        envGooglePlacesBaseUrl: '',
        envGoogleDefaultPublicToken: '',
        envGoogleSignInClientId: '',
        envAppRoot: '',
        envBaseUrl: '',
        envApiVersion: '',
        testUserEmail: email,
        testUserPassword: pass,
        regPrefill: prefill,
      );

  test('dev con REG_PREFILL y correo: prefill encendido', () {
    final config = dev(email: 'alguien@mail.com', pass: 'secreto', prefill: true);

    expect(config.shouldPrefillLogin, isTrue);
    expect(config.prefillEmail, 'alguien@mail.com');
    expect(config.prefillPassword, 'secreto');
  });

  test('dev sin REG_PREFILL: apagado aunque haya credenciales', () {
    expect(dev(email: 'alguien@mail.com', pass: 'secreto').shouldPrefillLogin, isFalse);
  });

  test('dev con REG_PREFILL pero sin correo: apagado', () {
    // Encenderlo sin nada que rellenar solo sirve para confundir.
    expect(dev(prefill: true).shouldPrefillLogin, isFalse);
    expect(dev(email: '', prefill: true).shouldPrefillLogin, isFalse);
  });

  test('PROD no puede encender el prefill de ninguna manera', () {
    final config = ProdConfig(
      envLogLevel: Level.off,
      envGooglePlacesBaseUrl: '',
      envGoogleDefaultPublicToken: '',
      envGoogleSignInClientId: '',
      envAppRoot: '',
      envBaseUrl: '',
      envApiVersion: '',
    );

    expect(config.shouldPrefillLogin, isFalse);
    expect(config.prefillEmail, isEmpty);
    expect(config.prefillPassword, isEmpty);
  });

  test('DEMO tampoco', () {
    final config = DemoConfig(
      envLogLevel: Level.off,
      envGooglePlacesBaseUrl: '',
      envGoogleDefaultPublicToken: '',
      envGoogleSignInClientId: '',
      envAppRoot: '',
      envBaseUrl: '',
      envApiVersion: '',
    );

    expect(config.shouldPrefillLogin, isFalse);
    expect(config.prefillEmail, isEmpty);
    expect(config.prefillPassword, isEmpty);
  });
}
