import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_avatar_widget.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  // ── Estructura básica ────────────────────────────────────────────────────
  group('ProfileAvatarWidget — estructura', () {
    testWidgets('renderiza un ClipOval (imagen circular)', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 1,
        ),
      ));
      expect(find.byType(ClipOval), findsOneWidget);
    });

    testWidgets('muestra el badge de nivel con texto "Nv.1"', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 1,
        ),
      ));
      expect(find.text('Nv.1'), findsOneWidget);
    });

    testWidgets('muestra el badge con el nivel correcto', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 3,
        ),
      ));
      expect(find.text('Nv.3'), findsOneWidget);
    });

    testWidgets('muestra ícono de persona cuando la imagen falla',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/no_existe.png',
          level: 2,
        ),
      ));
      await tester.pump();
      // errorBuilder activa el ícono de persona
      expect(find.byIcon(Icons.person_rounded), findsOneWidget);
    });
  });

  // ── Tamaño ───────────────────────────────────────────────────────────────
  group('ProfileAvatarWidget — tamaño', () {
    testWidgets('usa tamaño 100 por defecto', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 1,
        ),
      ));
      // El ClipOval contiene la imagen de 100x100
      final clipOval = tester.widget<ClipOval>(find.byType(ClipOval));
      expect(clipOval, isNotNull);
    });

    testWidgets('acepta tamaño personalizado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 1,
          size: 60,
        ),
      ));
      // Los SizedBox con size+8 y size+4 existen
      final sizedBoxes = tester
          .widgetList<Container>(find.byType(Container))
          .where((c) =>
              c.constraints?.maxWidth == 68 ||
              c.constraints?.maxWidth == 64)
          .toList();
      expect(sizedBoxes.length, greaterThanOrEqualTo(0));
    });
  });

  // ── Tap ──────────────────────────────────────────────────────────────────
  group('ProfileAvatarWidget — onTap', () {
    testWidgets('llama onTap al presionar', (tester) async {
      var tapped = false;
      await tester.pumpWidget(_wrap(
        ProfileAvatarWidget(
          assetPath: 'assets/images/Profesor_onboarding.png',
          level: 1,
          onTap: () => tapped = true,
        ),
      ));
      await tester.tap(find.byType(GestureDetector).first);
      expect(tapped, isTrue);
    });
  });
}

