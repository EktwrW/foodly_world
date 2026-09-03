import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';

/// Las tarjetas en rejilla (`BusinessGridCard`) pasan `double.infinity` como
/// tamaño y dejan que `AspectRatio` decida. `(infinity * 3).ceil()` lanza
/// `UnsupportedError`, y en release eso es una caja de error por tarjeta
/// (regresión cazada en revisión, 2026-09-03).
void main() {
  Future<void> montar(WidgetTester tester, {required String? url}) => tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 1,
                child: AvatarWidget(
                  avatarUrl: url,
                  width: double.infinity,
                  height: double.infinity,
                  avatarType: AvatarType.business,
                ),
              ),
            ),
          ),
        ),
      );

  testWidgets('con URL y tamaño infinito no lanza', (tester) async {
    await montar(tester, url: 'https://storage.googleapis.com/x/logo.jpg');
    await tester.pump();

    expect(tester.takeException(), isNull);
  });

  testWidgets('el placeholder con tamaño infinito tampoco lanza', (tester) async {
    await montar(tester, url: null);
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
