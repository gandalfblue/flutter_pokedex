import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/pokemon_entity.dart';

part 'pokemon_favorites_provider.g.dart';

/// Provider que mantiene la lista de Pokémon favoritos en memoria.
/// Se puede extender con persistencia local (Hive, SharedPreferences) más adelante.
@riverpod
class PokemonFavoritesNotifier extends _$PokemonFavoritesNotifier {
  @override
  List<PokemonEntity> build() => [];

  /// Alterna el favorito: lo agrega si no existe, lo elimina si ya está.
  void toggle(PokemonEntity pokemon) {
    final exists = state.any((p) => p.id == pokemon.id);
    if (exists) {
      state = state.where((p) => p.id != pokemon.id).toList();
    } else {
      state = [...state, pokemon];
    }
  }

  /// Elimina un favorito por índice.
  PokemonEntity removeAt(int index) {
    final removed = state[index];
    state = [...state]..removeAt(index);
    return removed;
  }

  /// Inserta un Pokémon en una posición específica (para deshacer).
  void insertAt(int index, PokemonEntity pokemon) {
    state = [...state]..insert(index, pokemon);
  }

  /// Indica si un Pokémon está marcado como favorito.
  bool isFavorite(int pokemonId) => state.any((p) => p.id == pokemonId);
}

