import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';

/// La pantalla de entrada no puede quedarse en blanco.
///
/// Pasó dos veces. En 2026-05-24 por un 401 multi-dispositivo, y se cerró
/// garantizando el estado del cubit desde `clearInvalidSession`. Volvió el
/// 2026-09-15 por otra puerta: el back de un manager sin sesión válida navega a
/// `/login` sin pasar por ahí, el cubit sigue en `userAuthenticated`, el
/// listener no dispara —no hubo cambio de estado— y la pantalla no pintaba nada
/// ni había forma de salir.
///
/// El guardián ya no vive en cada camino de navegación, que es imposible de
/// enumerar, sino en la pantalla.
void main() {
  const vm = StartingVM();

  test('todo estado que trae VM se pinta', () {
    final conVm = <String, StartingState>{
      'loading': const StartingState.loading(vm),
      'welcome': const StartingState.welcome(vm),
      'error': const StartingState.error('vaya', vm),
      'isNewUser': const StartingState.isNewUser(vm),
      'userAuthenticated': const StartingState.userAuthenticated(vm),
    };

    for (final entrada in conVm.entries) {
      expect(
        StartingPage369.vmPintable(entrada.value),
        isNotNull,
        reason: '${entrada.key} trae VM: dejarlo sin pintar es la pantalla en blanco',
      );
    }
  });

  test('initial es el único que no pinta, y es porque no trae VM', () {
    expect(StartingPage369.vmPintable(const StartingState.initial()), isNull);
  });

  test('el VM que devuelve es el del estado, no otro', () {
    const propio = StartingVM(currentView: StartingPageView.login);

    expect(
      StartingPage369.vmPintable(const StartingState.userAuthenticated(propio))?.currentView,
      StartingPageView.login,
    );
  });
}
