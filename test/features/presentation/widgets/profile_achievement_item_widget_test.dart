import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_achievement_item_widget.dart';

Widget _wrap(Widget child) =>
    MaterialApp(home: Scaffold(body: child));

void main() {
  // ── Logro desbloqueado ───────────────────────────────────────────────────
  group('ProfileAchievementItemWidget — desbloqueado', () {
    testWidgets('muestra el título', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.catching_pokemon,
          iconColor: Colors.green,
          title: 'Primeros Pasos',
          subtitle: 'Ve tu primer Pokémon',
          unlocked: true,
        ),
      ));
      expect(find.text('Primeros Pasos'), findsOneWidget);
    });

    testWidgets('muestra el subtítulo', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.catching_pokemon,
          iconColor: Colors.green,
          title: 'Primeros Pasos',
          subtitle: 'Ve tu primer Pokémon',
          unlocked: true,
        ),
      ));
      expect(find.text('Ve tu primer Pokémon'), findsOneWidget);
    });

    testWidgets('muestra el ícono del logro cuando está desbloqueado',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.catching_pokemon,
          iconColor: Colors.green,
          title: 'Primeros Pasos',
          subtitle: 'Ve tu primer Pokémon',
          unlocked: true,
        ),
      ));
      expect(find.byIcon(Icons.catching_pokemon), findsOneWidget);
    });

    testWidgets('muestra check_circle cuando está desbloqueado',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.catching_pokemon,
          iconColor: Colors.green,
          title: 'Primeros Pasos',
          subtitle: 'Ve tu primer Pokémon',
          unlocked: true,
        ),
      ));
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('opacity es 1.0 cuando está desbloqueado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.catching_pokemon,
          iconColor: Colors.green,
          title: 'Test',
          subtitle: 'Sub',
          unlocked: true,
        ),
      ));
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, 1.0);
    });
  });

  // ── Logro bloqueado ──────────────────────────────────────────────────────
  group('ProfileAchievementItemWidget — bloqueado', () {
    testWidgets('muestra ícono de candado cuando está bloqueado',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.military_tech_rounded,
          iconColor: Colors.amber,
          title: 'Maestro',
          subtitle: 'Ve 50 Pokémon',
          unlocked: false,
        ),
      ));
      expect(find.byIcon(Icons.lock_outline_rounded), findsOneWidget);
    });

    testWidgets('opacity es 0.38 cuando está bloqueado', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.military_tech_rounded,
          iconColor: Colors.amber,
          title: 'Maestro',
          subtitle: 'Ve 50 Pokémon',
          unlocked: false,
        ),
      ));
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, 0.38);
    });

    testWidgets('unlocked por defecto es true', (tester) async {
      await tester.pumpWidget(_wrap(
        const ProfileAchievementItemWidget(
          icon: Icons.explore_rounded,
          iconColor: Colors.blue,
          title: 'Explorador',
          subtitle: 'Ve 10 Pokémon',
        ),
      ));
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, 1.0);
    });
  });
}

