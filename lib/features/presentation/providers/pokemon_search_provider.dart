import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pokemon_entity.dart';
import 'pokemon_list_provider.dart';
import 'providers.dart';

part 'pokemon_search_provider.g.dart';

/// Estado de la búsqueda: lista de pokémon que coinciden con el query.
@riverpod
class PokemonSearchNotifier extends _$PokemonSearchNotifier {
  @override
  AsyncValue<List<PokemonEntity>?> build() => const AsyncValue.data(null);

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data(null);
      return;
    }

    final q = query.toLowerCase().trim();

    // 1️⃣ Filtrar localmente sobre los pokémon ya cargados en memoria
    final loaded = ref.read(pokemonListNotifierProvider).pokemons;
    final localResults = loaded
        .where((p) => p.name.toLowerCase().contains(q))
        .toList();

    if (localResults.isNotEmpty) {
      state = AsyncValue.data(localResults);
      return;
    }

    // 2️⃣ Si no hay resultados locales, llamar a la API con nombre exacto
    state = const AsyncValue.loading();
    final useCase = ref.read(searchPokemonUseCaseProvider);
    final result = await useCase(q);
    state = result.fold(
      (failure) => AsyncValue.error(
        failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
          firebase: (msg) => msg,
        ),
        StackTrace.current,
      ),
      (pokemon) => AsyncValue.data([pokemon]),
    );
  }

  void clear() => state = const AsyncValue.data(null);
}


