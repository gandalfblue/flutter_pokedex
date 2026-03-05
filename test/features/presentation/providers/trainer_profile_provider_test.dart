import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokemon/features/presentation/providers/trainer_profile_provider.dart';

void main() {
  // ── Estado inicial ────────────────────────────────────────────────────────
  group('TrainerProfile — estado inicial', () {
    test('nombre por defecto es "Entrenador"', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final profile = container.read(trainerProfileNotifierProvider);
      expect(profile.name, 'Entrenador');
    });

    test('pokemonViewed inicia en 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        container.read(trainerProfileNotifierProvider).pokemonViewed,
        0,
      );
    });

    test('totalFavorites inicia en 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        container.read(trainerProfileNotifierProvider).totalFavorites,
        0,
      );
    });

    test('favoriteType inicia en null', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        container.read(trainerProfileNotifierProvider).favoriteType,
        isNull,
      );
    });
  });

  // ── updateName ────────────────────────────────────────────────────────────
  group('TrainerProfileNotifier.updateName()', () {
    test('actualiza el nombre correctamente', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .updateName('Ash');
      expect(
        container.read(trainerProfileNotifierProvider).name,
        'Ash',
      );
    });

    test('hace trim al nombre', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .updateName('  Misty  ');
      expect(
        container.read(trainerProfileNotifierProvider).name,
        'Misty',
      );
    });

    test('ignora nombre vacío', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .updateName('   ');
      expect(
        container.read(trainerProfileNotifierProvider).name,
        'Entrenador',
      );
    });
  });

  // ── updateAvatar ──────────────────────────────────────────────────────────
  group('TrainerProfileNotifier.updateAvatar()', () {
    test('actualiza el avatar correctamente', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .updateAvatar('assets/images/entrenadora.png');
      expect(
        container.read(trainerProfileNotifierProvider).avatarAsset,
        'assets/images/entrenadora.png',
      );
    });
  });

  // ── incrementViewed ───────────────────────────────────────────────────────
  group('TrainerProfileNotifier.incrementViewed()', () {
    test('incrementa pokemonViewed en 1', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .incrementViewed();
      expect(
        container.read(trainerProfileNotifierProvider).pokemonViewed,
        1,
      );
    });

    test('acumulaciones sucesivas suman correctamente', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier =
          container.read(trainerProfileNotifierProvider.notifier);
      notifier.incrementViewed();
      notifier.incrementViewed();
      notifier.incrementViewed();
      expect(
        container.read(trainerProfileNotifierProvider).pokemonViewed,
        3,
      );
    });
  });

  // ── syncFavorites ─────────────────────────────────────────────────────────
  group('TrainerProfileNotifier.syncFavorites()', () {
    test('actualiza totalFavorites', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .syncFavorites(['fire', 'fire', 'water'], 3);
      expect(
        container.read(trainerProfileNotifierProvider).totalFavorites,
        3,
      );
    });

    test('determina el tipo más frecuente como favoriteType', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .syncFavorites(['fire', 'fire', 'water', 'fire'], 4);
      expect(
        container.read(trainerProfileNotifierProvider).favoriteType,
        'fire',
      );
    });

    test('favoriteType es null con lista vacía', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(trainerProfileNotifierProvider.notifier)
          .syncFavorites([], 0);
      expect(
        container.read(trainerProfileNotifierProvider).favoriteType,
        isNull,
      );
    });
  });

  // ── computedLevel ─────────────────────────────────────────────────────────
  group('TrainerProfileNotifier.computedLevel', () {
    TrainerProfileNotifier notifierWithViewed(int viewed) {
      final container = ProviderContainer();
      final notifier =
          container.read(trainerProfileNotifierProvider.notifier);
      for (var i = 0; i < viewed; i++) {
        notifier.incrementViewed();
      }
      return notifier;
    }

    test('nivel 1 con 0 pokemones vistos', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        container
            .read(trainerProfileNotifierProvider.notifier)
            .computedLevel,
        1,
      );
    });

    test('nivel 1 con 9 pokemones vistos', () {
      final n = notifierWithViewed(9);
      expect(n.computedLevel, 1);
    });

    test('nivel 2 con 10 pokemones vistos', () {
      final n = notifierWithViewed(10);
      expect(n.computedLevel, 2);
    });

    test('nivel 3 con 30 pokemones vistos', () {
      final n = notifierWithViewed(30);
      expect(n.computedLevel, 3);
    });

    test('nivel 4 con 60 pokemones vistos', () {
      final n = notifierWithViewed(60);
      expect(n.computedLevel, 4);
    });

    test('nivel 5 con 100 pokemones vistos', () {
      final n = notifierWithViewed(100);
      expect(n.computedLevel, 5);
    });
  });
}

