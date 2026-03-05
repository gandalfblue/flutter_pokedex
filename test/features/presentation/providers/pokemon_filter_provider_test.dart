import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/providers/pokemon_filter_provider.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_entity.dart';

import '../../../helpers/test_factories.dart';

void main() {
  group('PokemonFilterState', () {
    test('estado inicial no tiene filtros activos', () {
      const state = PokemonFilterState();
      expect(state.hasActiveFilter, isFalse);
      expect(state.selectedTypes, isEmpty);
      expect(state.selectedGeneration, isNull);
      expect(state.heightRange, isNull);
      expect(state.weightRange, isNull);
    });

    test('hasActiveFilter es true cuando hay tipos seleccionados', () {
      const state = PokemonFilterState(selectedTypes: {'fire'});
      expect(state.hasActiveFilter, isTrue);
    });

    test('hasActiveFilter es true cuando hay generación seleccionada', () {
      const state = PokemonFilterState(selectedGeneration: 1);
      expect(state.hasActiveFilter, isTrue);
    });

    test('hasActiveFilter es true cuando hay rango de altura', () {
      const state = PokemonFilterState(heightRange: 'small');
      expect(state.hasActiveFilter, isTrue);
    });

    test('hasActiveFilter es true cuando hay rango de peso', () {
      const state = PokemonFilterState(weightRange: 'heavy');
      expect(state.hasActiveFilter, isTrue);
    });

    test('copyWith actualiza activeCategory', () {
      const state = PokemonFilterState();
      final updated = state.copyWith(activeCategory: FilterCategory.height);
      expect(updated.activeCategory, FilterCategory.height);
    });

    test('copyWith con clearGeneration pone selectedGeneration en null', () {
      const state = PokemonFilterState(selectedGeneration: 1);
      final updated = state.copyWith(clearGeneration: true);
      expect(updated.selectedGeneration, isNull);
    });

    test('copyWith con clearHeight pone heightRange en null', () {
      const state = PokemonFilterState(heightRange: 'small');
      final updated = state.copyWith(clearHeight: true);
      expect(updated.heightRange, isNull);
    });

    test('copyWith con clearWeight pone weightRange en null', () {
      const state = PokemonFilterState(weightRange: 'heavy');
      final updated = state.copyWith(clearWeight: true);
      expect(updated.weightRange, isNull);
    });
  });

  // ── Lógica de filtrado ────────────────────────────────────────────────────
  group('Lógica de filtrado de pokémon', () {
    final bulbasaur = TestFactories.makePokemon(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      types: [
        const PokemonTypeEntity(name: 'grass'),
        const PokemonTypeEntity(name: 'poison'),
      ],
    );

    final charizard = TestFactories.makeCharizard(); // height:17 weight:905

    final mewtwo = TestFactories.makeMewtwo(); // id:150 height:20 weight:1220

    final allPokemons = [bulbasaur, charizard, mewtwo];

    List<PokemonEntity> applyFilter(
      List<PokemonEntity> list,
      PokemonFilterState f,
    ) {
      if (!f.hasActiveFilter) return list;

      return list.where((p) {
        if (f.selectedTypes.isNotEmpty) {
          final hasType = p.types.any(
            (t) => f.selectedTypes.contains(t.name.toLowerCase()),
          );
          if (!hasType) return false;
        }

        if (f.selectedGeneration != null) {
          final genRanges = {
            1: (1, 151),
          };
          final range = genRanges[f.selectedGeneration!];
          if (range != null && (p.id < range.$1 || p.id > range.$2)) {
            return false;
          }
        }

        if (f.heightRange != null) {
          final inRange = switch (f.heightRange!) {
            'small'  => p.height < 7,
            'medium' => p.height >= 7 && p.height <= 14,
            'large'  => p.height > 14,
            _        => true,
          };
          if (!inRange) return false;
        }

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

    test('sin filtros activos retorna toda la lista', () {
      const f = PokemonFilterState();
      final result = applyFilter(allPokemons, f);
      expect(result.length, 3);
    });

    test('filtro por tipo grass devuelve solo bulbasaur', () {
      const f = PokemonFilterState(selectedTypes: {'grass'});
      final result = applyFilter(allPokemons, f);
      expect(result.length, 1);
      expect(result.first.name, 'bulbasaur');
    });

    test('filtro por tipo fire devuelve solo charizard', () {
      const f = PokemonFilterState(selectedTypes: {'fire'});
      final result = applyFilter(allPokemons, f);
      expect(result.length, 1);
      expect(result.first.name, 'charizard');
    });

    test('filtro por múltiples tipos (grass o psychic) retorna ambos', () {
      const f = PokemonFilterState(selectedTypes: {'grass', 'psychic'});
      final result = applyFilter(allPokemons, f);
      expect(result.length, 2);
      expect(result.map((p) => p.name), containsAll(['bulbasaur', 'mewtwo']));
    });

    test('filtro por generación 1 retorna los 3 (todos son Gen I)', () {
      const f = PokemonFilterState(selectedGeneration: 1);
      final result = applyFilter(allPokemons, f);
      expect(result.length, 3);
    });

    test('filtro por altura small (height < 7) retorna vacío', () {
      const f = PokemonFilterState(heightRange: 'small');
      final result = applyFilter(allPokemons, f);
      expect(result, isEmpty); // bulbasaur height=7 (no es <7)
    });

    test('filtro por altura medium (7-14) retorna solo bulbasaur', () {
      const f = PokemonFilterState(heightRange: 'medium');
      final result = applyFilter(allPokemons, f);
      expect(result.length, 1);
      expect(result.first.name, 'bulbasaur');
    });

    test('filtro por altura large (>14) retorna charizard y mewtwo', () {
      const f = PokemonFilterState(heightRange: 'large');
      final result = applyFilter(allPokemons, f);
      expect(result.length, 2);
      expect(result.map((p) => p.name), containsAll(['charizard', 'mewtwo']));
    });

    test('filtro por peso light (<100) retorna solo bulbasaur', () {
      const f = PokemonFilterState(weightRange: 'light');
      final result = applyFilter(allPokemons, f);
      expect(result.length, 1);
      expect(result.first.name, 'bulbasaur');
    });

    test('filtro por peso heavy (>500) retorna charizard y mewtwo', () {
      const f = PokemonFilterState(weightRange: 'heavy');
      final result = applyFilter(allPokemons, f);
      expect(result.length, 2);
    });

    test('combinación tipo + peso filtra correctamente', () {
      const f = PokemonFilterState(
        selectedTypes: {'fire'},
        weightRange: 'heavy',
      );
      final result = applyFilter(allPokemons, f);
      expect(result.length, 1);
      expect(result.first.name, 'charizard');
    });
  });
}

