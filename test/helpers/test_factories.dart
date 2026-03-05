import 'package:flutter_pokemon/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_list_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_stat_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_weakness_entity.dart';

/// Fábrica de objetos de prueba reutilizables en todos los tests.
class TestFactories {
  TestFactories._();

  static PokemonEntity makePokemon({
    int id = 1,
    String name = 'bulbasaur',
    int height = 7,
    int weight = 69,
    String imageUrl = 'https://example.com/bulbasaur.png',
    List<PokemonTypeEntity>? types,
    List<PokemonStatEntity>? stats,
    List<String>? abilities,
    String description = 'A strange seed was planted on its back at birth.',
    String category = 'Seed Pokémon',
  }) =>
      PokemonEntity(
        id: id,
        name: name,
        height: height,
        weight: weight,
        imageUrl: imageUrl,
        types: types ??
            [
              const PokemonTypeEntity(name: 'grass'),
              const PokemonTypeEntity(name: 'poison'),
            ],
        stats: stats ??
            [
              const PokemonStatEntity(name: 'hp', baseStat: 45),
              const PokemonStatEntity(name: 'attack', baseStat: 49),
            ],
        abilities: abilities ?? ['overgrow'],
        description: description,
        category: category,
      );

  static PokemonEntity makeCharizard() => makePokemon(
        id: 6,
        name: 'charizard',
        height: 17,
        weight: 905,
        types: [
          const PokemonTypeEntity(name: 'fire'),
          const PokemonTypeEntity(name: 'flying'),
        ],
        abilities: ['blaze'],
        description: 'Spits fire that is hot enough to melt boulders.',
        category: 'Flame Pokémon',
      );

  static PokemonEntity makeMewtwo() => makePokemon(
        id: 150,
        name: 'mewtwo',
        height: 20,
        weight: 1220,
        types: [const PokemonTypeEntity(name: 'psychic')],
        abilities: ['pressure'],
        description: 'It was created by a scientist after years of gene splicing.',
        category: 'Genetic Pokémon',
      );

  static PokemonListEntity makeList({List<PokemonEntity>? pokemons}) =>
      PokemonListEntity(
        count: 151,
        pokemons: pokemons ?? [makePokemon(), makeCharizard()],
        hasNextPage: true,
      );

  static PokemonTypeWeaknessEntity makeWeakness({
    String typeName = 'grass',
    List<String>? doubleDamageFrom,
    List<String>? halfDamageFrom,
    List<String>? noDamageFrom,
  }) =>
      PokemonTypeWeaknessEntity(
        typeName: typeName,
        doubleDamageFrom: doubleDamageFrom ?? ['fire', 'ice', 'poison', 'flying', 'bug'],
        halfDamageFrom: halfDamageFrom ?? ['water', 'grass', 'electric', 'ground'],
        noDamageFrom: noDamageFrom ?? [],
      );
}

