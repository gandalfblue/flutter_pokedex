import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_stat_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_weakness_entity.dart';

import '../../../helpers/test_factories.dart';

void main() {
  group('PokemonEntity', () {
    test('crea correctamente con todos los campos', () {
      final p = TestFactories.makePokemon();
      expect(p.id, 1);
      expect(p.name, 'bulbasaur');
      expect(p.height, 7);
      expect(p.weight, 69);
      expect(p.types.length, 2);
      expect(p.stats.length, 2);
      expect(p.abilities, contains('overgrow'));
      expect(p.description, isNotEmpty);
      expect(p.category, isNotEmpty);
    });

    test('description y category tienen valores por defecto vacíos', () {
      final p = PokemonEntity(
        id: 1,
        name: 'bulbasaur',
        height: 7,
        weight: 69,
        imageUrl: 'url',
        types: const [],
        stats: const [],
        abilities: const [],
      );
      expect(p.description, '');
      expect(p.category, '');
    });

    test('copyWith actualiza campos correctamente', () {
      final original = TestFactories.makePokemon();
      final copy = original.copyWith(name: 'ivysaur', id: 2);
      expect(copy.name, 'ivysaur');
      expect(copy.id, 2);
      expect(copy.height, original.height); // sin cambios
    });

    test('igualdad por valor (freezed)', () {
      final a = TestFactories.makePokemon();
      final b = TestFactories.makePokemon();
      expect(a, equals(b));
    });

    test('dos pokémon distintos no son iguales', () {
      final a = TestFactories.makePokemon(id: 1);
      final b = TestFactories.makePokemon(id: 2);
      expect(a, isNot(equals(b)));
    });
  });

  group('PokemonStatEntity', () {
    test('almacena name y baseStat', () {
      const stat = PokemonStatEntity(name: 'hp', baseStat: 45);
      expect(stat.name, 'hp');
      expect(stat.baseStat, 45);
    });

    test('igualdad por valor', () {
      const a = PokemonStatEntity(name: 'attack', baseStat: 49);
      const b = PokemonStatEntity(name: 'attack', baseStat: 49);
      expect(a, equals(b));
    });
  });

  group('PokemonTypeEntity', () {
    test('almacena name', () {
      const type = PokemonTypeEntity(name: 'fire');
      expect(type.name, 'fire');
    });

    test('igualdad por valor', () {
      const a = PokemonTypeEntity(name: 'water');
      const b = PokemonTypeEntity(name: 'water');
      expect(a, equals(b));
    });
  });

  group('PokemonListEntity', () {
    test('crea correctamente con todos los campos', () {
      final list = TestFactories.makeList();
      expect(list.count, 151);
      expect(list.pokemons.length, 2);
      expect(list.hasNextPage, isTrue);
    });

    test('igualdad por valor', () {
      final a = TestFactories.makeList();
      final b = TestFactories.makeList();
      expect(a, equals(b));
    });
  });

  group('PokemonTypeWeaknessEntity', () {
    test('almacena debilidades, resistencias e inmunidades', () {
      final w = TestFactories.makeWeakness();
      expect(w.typeName, 'grass');
      expect(w.doubleDamageFrom, contains('fire'));
      expect(w.halfDamageFrom, contains('water'));
      expect(w.noDamageFrom, isEmpty);
    });

    test('doubleDamageFrom es la lista de debilidades', () {
      final w = PokemonTypeWeaknessEntity(
        typeName: 'water',
        doubleDamageFrom: ['electric', 'grass'],
        halfDamageFrom: ['fire', 'water', 'ice', 'steel'],
        noDamageFrom: [],
      );
      expect(w.doubleDamageFrom.length, 2);
      expect(w.doubleDamageFrom, containsAll(['electric', 'grass']));
    });
  });
}

