import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_stat_card_widget.dart';

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(body: Row(children: [child])),
    );

void main() {
  // ── Renderizado ──────────────────────────────────────────────────────────
  group('ProfileStatCardWidget — renderizado', () {
    testWidgets('muestra el valor pasado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileStatCardWidget(
          icon: Icons.visibility_rounded,
          value: '42',
          label: 'Vistos',
          accent: Colors.blue,
        ),
      ));
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('muestra el label pasado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileStatCardWidget(
          icon: Icons.favorite_rounded,
          value: '5',
          label: 'Favoritos',
          accent: Colors.red,
        ),
      ));
      expect(find.text('Favoritos'), findsOneWidget);
    });

    testWidgets('renderiza un Icon con el icono pasado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileStatCardWidget(
          icon: Icons.military_tech_rounded,
          value: '3',
          label: 'Nivel',
          accent: Colors.amber,
        ),
      ));
      expect(find.byIcon(Icons.military_tech_rounded), findsOneWidget);
    });

    testWidgets('está expandido (ocupa espacio disponible)', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileStatCardWidget(
          icon: Icons.visibility_rounded,
          value: '0',
          label: 'Vistos',
          accent: Colors.blue,
        ),
      ));
      expect(find.byType(Expanded), findsOneWidget);
    });
  });

  // ── Colores ──────────────────────────────────────────────────────────────
  group('ProfileStatCardWidget — colores del accent', () {
    testWidgets('el valor usa el color accent', (tester) async {
      const accent = Color(0xFF6390F0);
      await tester.pumpWidget(_wrap(
        const ProfileStatCardWidget(
          icon: Icons.visibility_rounded,
          value: '10',
          label: 'Vistos',
          accent: accent,
        ),
      ));
      final valueText = tester.widget<Text>(find.text('10'));
      expect((valueText.style?.color), accent);
    });
  });
}

