import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pokemon_entity.dart';
import 'providers.dart';

part 'pokemon_search_provider.g.dart';

/// Estado de la búsqueda de Pokémon.
@riverpod
class PokemonSearchNotifier extends _$PokemonSearchNotifier {
  @override
  AsyncValue<PokemonEntity?> build() => const AsyncValue.data(null);

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data(null);
      return;
    }
    state = const AsyncValue.loading();
    final useCase = ref.read(searchPokemonUseCaseProvider);
    final result = await useCase(query);
    state = result.fold(
      (failure) => AsyncValue.error(
        failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
        ),
        StackTrace.current,
      ),
      (pokemon) => AsyncValue.data(pokemon),
    );
  }

  void clear() => state = const AsyncValue.data(null);
}


