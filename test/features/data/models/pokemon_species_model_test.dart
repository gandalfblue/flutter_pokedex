import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_species_model.dart';

void main() {
  group('PokemonSpeciesModel', () {
    final sampleJson = {
      'id': 1,
      'name': 'bulbasaur',
      'flavor_text_entries': [
        {
          'flavor_text': 'A strange seed was planted\non its back at birth.',
          'language': {'name': 'en', 'url': 'https://pokeapi.co/api/v2/language/9/'},
          'version': {'name': 'red', 'url': 'https://pokeapi.co/api/v2/version/1/'},
        },
        {
          'flavor_text': 'Cuando nació, tenía\nuna semilla en la espalda.',
          'language': {'name': 'es', 'url': 'https://pokeapi.co/api/v2/language/7/'},
          'version': {'name': 'diamond', 'url': 'https://pokeapi.co/api/v2/version/12/'},
        },
      ],
      'genera': [
        {
          'genus': 'Seed Pokémon',
          'language': {'name': 'en', 'url': 'https://pokeapi.co/api/v2/language/9/'},
        },
        {
          'genus': 'Pokémon Semilla',
          'language': {'name': 'es', 'url': 'https://pokeapi.co/api/v2/language/7/'},
        },
      ],
      'names': [],
    };

    test('fromJson deserializa correctamente', () {
      final model = PokemonSpeciesModel.fromJson(sampleJson);
      expect(model.id, 1);
      expect(model.name, 'bulbasaur');
      expect(model.flavorTextEntries.length, 2);
      expect(model.genera.length, 2);
    });

    test('flavorTextEntries contiene la entrada en inglés', () {
      final model = PokemonSpeciesModel.fromJson(sampleJson);
      final enEntry =
          model.flavorTextEntries.where((e) => e.language.name == 'en').firstOrNull;
      expect(enEntry, isNotNull);
      expect(enEntry!.flavorText, contains('strange seed'));
    });

    test('flavorTextEntries contiene la entrada en español', () {
      final model = PokemonSpeciesModel.fromJson(sampleJson);
      final esEntry =
          model.flavorTextEntries.where((e) => e.language.name == 'es').firstOrNull;
      expect(esEntry, isNotNull);
      expect(esEntry!.flavorText, contains('semilla'));
    });

    test('genera contiene el genus en inglés', () {
      final model = PokemonSpeciesModel.fromJson(sampleJson);
      final enGenus =
          model.genera.where((g) => g.language.name == 'en').firstOrNull;
      expect(enGenus?.genus, 'Seed Pokémon');
    });

    test('igualdad por valor (freezed)', () {
      final a = PokemonSpeciesModel.fromJson(sampleJson);
      final b = PokemonSpeciesModel.fromJson(sampleJson);
      expect(a, equals(b));
    });
  });

  group('FlavorTextEntryModel', () {
    test('fromJson lee flavor_text y language correctamente', () {
      final json = {
        'flavor_text': 'It can use all kinds of moves.',
        'language': {'name': 'en', 'url': 'url'},
        'version': {'name': 'sword', 'url': 'url'},
      };
      final entry = FlavorTextEntryModel.fromJson(json);
      expect(entry.flavorText, 'It can use all kinds of moves.');
      expect(entry.language.name, 'en');
      expect(entry.version.name, 'sword');
    });
  });

  group('GeneraModel', () {
    test('fromJson lee genus y language correctamente', () {
      final json = {
        'genus': 'Flame Pokémon',
        'language': {'name': 'en', 'url': 'url'},
      };
      final genera = GeneraModel.fromJson(json);
      expect(genera.genus, 'Flame Pokémon');
      expect(genera.language.name, 'en');
    });
  });
}

