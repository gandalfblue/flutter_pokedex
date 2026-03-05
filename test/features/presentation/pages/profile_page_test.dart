import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_pokemon/features/presentation/pages/profile_page.dart';
import 'package:flutter_pokemon/features/presentation/providers/pokemon_favorites_provider.dart';
import 'package:flutter_pokemon/features/presentation/providers/pokemon_list_provider.dart';
import 'package:flutter_pokemon/features/presentation/providers/trainer_profile_provider.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_avatar_widget.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_stat_card_widget.dart';
import 'package:flutter_pokemon/features/presentation/widgets/profile_achievement_item_widget.dart';
import 'package:flutter_pokemon/features/presentation/widgets/bottom_nav_pokemon_widget.dart';

import 'package:flutter_pokemon/features/domain/entities/pokemon_entity.dart';

// ── Fakes ─────────────────────────────────────────────────────────────────────

/// Notifier de lista sin llamada al API.
class _FakeListNotifier extends PokemonListNotifier {
  @override
  PokemonListState build() => const PokemonListState();
}

/// Notifier de favoritos vacío.
class _FakeFavoritesNotifier extends PokemonFavoritesNotifier {
  @override
  List<PokemonEntity> build() => [];
}

/// Notifier de perfil con nombre personalizado.
class _FakeProfileNotifier extends TrainerProfileNotifier {
  final String _name;
  _FakeProfileNotifier(this._name);

  @override
  TrainerProfile build() => TrainerProfile(name: _name);
}

// ── Helpers ───────────────────────────────────────────────────────────────────

GoRouter _buildRouter() => GoRouter(
      initialLocation: '/profile',
      routes: [
        GoRoute(
          path: '/profile',
          builder: (_, __) => const ProfilePage(),
        ),
        GoRoute(
          path: '/pokemon',
          builder: (_, __) => const Scaffold(body: Text('PokéList')),
        ),
        GoRoute(
          path: '/favorites',
          builder: (_, __) => const Scaffold(body: Text('Favorites')),
        ),
      ],
    );

/// Lista base de overrides que siempre se aplican para evitar llamadas al API.
List<Override> _baseOverrides({String profileName = 'Entrenador'}) => [
      pokemonListNotifierProvider.overrideWith(_FakeListNotifier.new),
      pokemonFavoritesNotifierProvider.overrideWith(_FakeFavoritesNotifier.new),
      trainerProfileNotifierProvider.overrideWith(
        () => _FakeProfileNotifier(profileName),
      ),
    ];

Widget buildSubject({List<Override> overrides = const []}) => ProviderScope(
      overrides: [
        ..._baseOverrides(),
        ...overrides,
      ],
      child: MaterialApp.router(
        routerConfig: _buildRouter(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('es'),
      ),
    );

// ── Tests ─────────────────────────────────────────────────────────────────────

void main() {
  // ── Estructura básica ────────────────────────────────────────────────────
  group('ProfilePage — estructura', () {
    testWidgets('renderiza un Scaffold', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('muestra el BottomNavPokemonWidget', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(BottomNavPokemonWidget), findsOneWidget);
    });

    testWidgets('muestra el ProfileAvatarWidget', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(ProfileAvatarWidget), findsOneWidget);
    });

    testWidgets('muestra 3 ProfileStatCardWidget', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(ProfileStatCardWidget), findsNWidgets(3));
    });

    testWidgets('muestra 4 ProfileAchievementItemWidget', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(ProfileAchievementItemWidget), findsNWidgets(4));
    });
  });

  // ── Nombre del entrenador ────────────────────────────────────────────────
  group('ProfilePage — nombre del entrenador', () {
    testWidgets('muestra el nombre por defecto "Entrenador"', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Entrenador'), findsWidgets);
    });

    testWidgets('muestra el nombre personalizado del provider', (tester) async {
      await tester.pumpWidget(
        buildSubject(overrides: [
          trainerProfileNotifierProvider.overrideWith(
            () => _FakeProfileNotifier('Ash'),
          ),
        ]),
      );
      await tester.pump();
      expect(find.text('Ash'), findsOneWidget);
    });
  });

  // ── Badge de nivel ───────────────────────────────────────────────────────
  group('ProfilePage — nivel', () {
    testWidgets('muestra Nv.1 por defecto', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Nv.1'), findsOneWidget);
    });
  });

  // ── Estadísticas ─────────────────────────────────────────────────────────
  group('ProfilePage — estadísticas', () {
    testWidgets('stat "Vistos" muestra el texto', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Vistos'), findsOneWidget);
    });

    testWidgets('stat "Favoritos" muestra el texto', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Favoritos'), findsAtLeastNWidgets(1));
    });

    testWidgets('stat "Nivel" muestra el texto', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Nivel'), findsOneWidget);
    });
  });

  // ── Logros ───────────────────────────────────────────────────────────────
  group('ProfilePage — logros', () {
    testWidgets('muestra logro "Primeros Pasos"', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Primeros Pasos'), findsOneWidget);
    });

    testWidgets('muestra logro "Explorador"', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Explorador'), findsOneWidget);
    });

    testWidgets('muestra logro "Coleccionista"', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Coleccionista'), findsOneWidget);
    });

    testWidgets('muestra logro "Maestro Pokémon"', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Maestro Pokémon'), findsOneWidget);
    });

    testWidgets(
        '"Primeros Pasos" está bloqueado cuando no hay pokémon vistos',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      final achievements = tester
          .widgetList<ProfileAchievementItemWidget>(
            find.byType(ProfileAchievementItemWidget),
          )
          .toList();
      expect(achievements.first.unlocked, isFalse);
    });
  });

  // ── Tipo favorito ─────────────────────────────────────────────────────────
  group('ProfilePage — tipo favorito', () {
    testWidgets('muestra "Aún no hay favoritos" cuando no hay tipo',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.text('Aún no hay favoritos'), findsOneWidget);
    });
  });

  // ── Acerca de ─────────────────────────────────────────────────────────────
  group('ProfilePage — acerca de', () {
    testWidgets('muestra "Acerca de" al hacer scroll', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.drag(
          find.byType(CustomScrollView), const Offset(0, -600));
      await tester.pump();
      expect(find.text('Acerca de'), findsOneWidget);
    });

    testWidgets('muestra la versión de la app al hacer scroll', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.drag(
          find.byType(CustomScrollView), const Offset(0, -600));
      await tester.pump();
      expect(find.text('Versión 1.0.0'), findsOneWidget);
    });
  });

  // ── Diálogo de nombre ─────────────────────────────────────────────────────
  group('ProfilePage — diálogo de nombre', () {
    testWidgets('abre el diálogo al presionar el botón de edición',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.edit_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('el diálogo tiene un TextField', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.edit_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('el diálogo tiene botones Guardar y Cancelar', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.edit_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Guardar'), findsOneWidget);
      expect(find.text('Cancelar'), findsOneWidget);
    });

    testWidgets('Cancelar cierra el diálogo', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.edit_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      await tester.tap(find.text('Cancelar'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  // ── Bottom nav ────────────────────────────────────────────────────────────
  group('ProfilePage — bottom nav', () {
    testWidgets('muestra el BottomNavPokemonWidget', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();
      expect(find.byType(BottomNavPokemonWidget), findsOneWidget);
    });
  });
}

