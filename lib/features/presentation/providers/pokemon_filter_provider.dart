import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pokemon_entity.dart';
import 'pokemon_list_provider.dart';

part 'pokemon_filter_provider.g.dart';

/// Parámetro de filtrado activo (pestaña del selector superior).
enum FilterCategory { type, generation, height, weight }

/// Estado completo del filtro.
class PokemonFilterState {
  final FilterCategory activeCategory;
  final Set<String> selectedTypes;
  final int? selectedGeneration; // 1..9
  final String? heightRange;    // 'small' | 'medium' | 'large'
  final String? weightRange;    // 'light' | 'medium' | 'heavy'

  const PokemonFilterState({
    this.activeCategory = FilterCategory.type,
    this.selectedTypes = const {},
    this.selectedGeneration,
    this.heightRange,
    this.weightRange,
  });

  bool get hasActiveFilter =>
      selectedTypes.isNotEmpty ||
      selectedGeneration != null ||
      heightRange != null ||
      weightRange != null;

  PokemonFilterState copyWith({
    FilterCategory? activeCategory,
    Set<String>? selectedTypes,
    int? selectedGeneration,
    String? heightRange,
    String? weightRange,
    bool clearGeneration = false,
    bool clearHeight = false,
    bool clearWeight = false,
  }) =>
      PokemonFilterState(
        activeCategory: activeCategory ?? this.activeCategory,
        selectedTypes: selectedTypes ?? this.selectedTypes,
        selectedGeneration:
            clearGeneration ? null : (selectedGeneration ?? this.selectedGeneration),
        heightRange: clearHeight ? null : (heightRange ?? this.heightRange),
        weightRange: clearWeight ? null : (weightRange ?? this.weightRange),
      );
}

@Riverpod(keepAlive: true)
class PokemonFilterNotifier extends _$PokemonFilterNotifier {
  @override
  PokemonFilterState build() => const PokemonFilterState();

  void setCategory(FilterCategory cat) =>
      state = state.copyWith(activeCategory: cat);

  /// Agrega o quita un tipo de la selección múltiple.
  void toggleType(String type) {
    final current = Set<String>.from(state.selectedTypes);
    if (current.contains(type)) {
      current.remove(type);
    } else {
      current.add(type);
    }
    state = state.copyWith(selectedTypes: current);
  }

  void setGeneration(int? gen) {
    if (state.selectedGeneration == gen) {
      state = state.copyWith(clearGeneration: true);
    } else {
      state = state.copyWith(selectedGeneration: gen);
    }
  }

  void setHeightRange(String? range) {
    if (state.heightRange == range) {
      state = state.copyWith(clearHeight: true);
    } else {
      state = state.copyWith(heightRange: range);
    }
  }

  void setWeightRange(String? range) {
    if (state.weightRange == range) {
      state = state.copyWith(clearWeight: true);
    } else {
      state = state.copyWith(weightRange: range);
    }
  }

  void clearAll() => state = const PokemonFilterState();
}

/// Provider derivado: aplica todos los filtros activos sobre la lista en caché.
@Riverpod(keepAlive: true)
List<PokemonEntity> filteredPokemons(Ref ref) {
  final all = ref.watch(pokemonListNotifierProvider).pokemons;
  final f = ref.watch(pokemonFilterNotifierProvider);

  if (!f.hasActiveFilter) return all;

  return all.where((p) {
    // Filtro por tipos (debe tener AL MENOS uno de los tipos seleccionados)
    if (f.selectedTypes.isNotEmpty) {
      final hasType = p.types.any(
        (t) => f.selectedTypes.contains(t.name.toLowerCase()),
      );
      if (!hasType) return false;
    }

    // Filtro por generación (Gen I=1-151, II=152-251, III=252-386,
    // IV=387-493, V=494-649, VI=650-721, VII=722-809, VIII=810-905, IX=906+)
    if (f.selectedGeneration != null) {
      final genRanges = {
        1: (1, 151), 2: (152, 251), 3: (252, 386),
        4: (387, 493), 5: (494, 649), 6: (650, 721),
        7: (722, 809), 8: (810, 905), 9: (906, 99999),
      };
      final range = genRanges[f.selectedGeneration!];
      if (range != null && (p.id < range.$1 || p.id > range.$2)) return false;
    }

    // Filtro por altura (en decímetros: small<7, medium 7-14, large>14)
    if (f.heightRange != null) {
      final inRange = switch (f.heightRange!) {
        'small'  => p.height < 7,
        'medium' => p.height >= 7 && p.height <= 14,
        'large'  => p.height > 14,
        _        => true,
      };
      if (!inRange) return false;
    }

    // Filtro por peso (en hectogramos: light<100, medium 100-500, heavy>500)
    if (f.weightRange != null) {
      final inRange = switch (f.weightRange!) {
        'light'  => p.weight < 100,
        'medium' => p.weight >= 100 && p.weight <= 500,
        'heavy'  => p.weight > 500,
        _        => true,
      };
      if (!inRange) return false;
    }

    return true;
  }).toList();
}
