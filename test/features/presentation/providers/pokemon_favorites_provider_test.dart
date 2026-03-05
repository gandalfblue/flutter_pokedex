import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/providers/pokemon_favorites_provider.dart';

import '../../../helpers/test_factories.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonFavoritesNotifier', () {
    test('estado inicial es lista vacía', () {
      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state, isEmpty);
    });

    test('toggle agrega un Pokémon si no estaba', () {
      final pokemon = TestFactories.makePokemon();
      container.read(pokemonFavoritesNotifierProvider.notifier).toggle(pokemon);

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state.length, 1);
      expect(state.first.id, 1);
    });

    test('toggle elimina un Pokémon si ya estaba', () {
      final pokemon = TestFactories.makePokemon();
      final notifier = container.read(pokemonFavoritesNotifierProvider.notifier);

      notifier.toggle(pokemon); // agrega
      notifier.toggle(pokemon); // elimina

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state, isEmpty);
    });

    test('isFavorite retorna true si el Pokémon está en favoritos', () {
      final pokemon = TestFactories.makePokemon(id: 25);
      container.read(pokemonFavoritesNotifierProvider.notifier).toggle(pokemon);

      final isFav = container
          .read(pokemonFavoritesNotifierProvider.notifier)
          .isFavorite(25);
      expect(isFav, isTrue);
    });

    test('isFavorite retorna false si el Pokémon no está en favoritos', () {
      final isFav = container
          .read(pokemonFavoritesNotifierProvider.notifier)
          .isFavorite(999);
      expect(isFav, isFalse);
    });

    test('removeAt elimina el Pokémon y retorna el eliminado', () {
      final bulbasaur = TestFactories.makePokemon(id: 1);
      final charizard = TestFactories.makeCharizard();
      final notifier = container.read(pokemonFavoritesNotifierProvider.notifier);

      notifier.toggle(bulbasaur);
      notifier.toggle(charizard);

      final removed = notifier.removeAt(0);
      expect(removed.id, 1);

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state.length, 1);
      expect(state.first.id, 6);
    });

    test('insertAt reinsertar un Pokémon en la posición correcta', () {
      final bulbasaur = TestFactories.makePokemon(id: 1);
      final charizard = TestFactories.makeCharizard();
      final notifier = container.read(pokemonFavoritesNotifierProvider.notifier);

      notifier.toggle(charizard);
      notifier.insertAt(0, bulbasaur);

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state.length, 2);
      expect(state.first.id, 1); // bulbasaur en posición 0
    });

    test('puede tener múltiples pokémon en favoritos', () {
      final notifier = container.read(pokemonFavoritesNotifierProvider.notifier);
      notifier.toggle(TestFactories.makePokemon(id: 1));
      notifier.toggle(TestFactories.makePokemon(id: 2, name: 'ivysaur'));
      notifier.toggle(TestFactories.makeMewtwo());

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state.length, 3);
    });

    test('los IDs no se duplican al hacer toggle dos veces', () {
      final pokemon = TestFactories.makePokemon(id: 4, name: 'charmander');
      final notifier = container.read(pokemonFavoritesNotifierProvider.notifier);

      notifier.toggle(pokemon); // añade
      notifier.toggle(pokemon); // elimina
      notifier.toggle(pokemon); // añade de nuevo

      final state = container.read(pokemonFavoritesNotifierProvider);
      expect(state.where((p) => p.id == 4).length, 1);
    });
  });
}

