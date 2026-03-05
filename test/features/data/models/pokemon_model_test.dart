import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_model.dart';

void main() {
  group('PokemonModel', () {
    final sampleJson = {
      'id': 6,
      'name': 'charizard',
      'height': 17,
      'weight': 905,
      'sprites': {
        'front_default': 'https://example.com/charizard.png',
        'other': {
          'official-artwork': {
            'front_default': 'https://example.com/charizard_art.png',
          },
        },
      },
      'types': [
        {
          'slot': 1,
          'type': {'name': 'fire', 'url': 'https://pokeapi.co/api/v2/type/10/'},
        },
        {
          'slot': 2,
          'type': {'name': 'flying', 'url': 'https://pokeapi.co/api/v2/type/3/'},
        },
      ],
      'stats': [
        {
          'base_stat': 78,
          'stat': {'name': 'hp', 'url': 'https://pokeapi.co/api/v2/stat/1/'},
        },
        {
          'base_stat': 84,
          'stat': {'name': 'attack', 'url': 'https://pokeapi.co/api/v2/stat/2/'},
        },
      ],
      'abilities': [
        {
          'ability': {'name': 'blaze', 'url': 'https://pokeapi.co/api/v2/ability/66/'},
          'is_hidden': false,
        },
        {
          'ability': {'name': 'solar-power', 'url': 'https://pokeapi.co/api/v2/ability/94/'},
          'is_hidden': true,
        },
      ],
    };

    test('fromJson deserializa id, name, height y weight', () {
      final model = PokemonModel.fromJson(sampleJson);
      expect(model.id, 6);
      expect(model.name, 'charizard');
      expect(model.height, 17);
      expect(model.weight, 905);
    });

    test('fromJson deserializa sprites correctamente', () {
      final model = PokemonModel.fromJson(sampleJson);
      expect(model.sprites.frontDefault, 'https://example.com/charizard.png');
      expect(
        model.sprites.other?.officialArtwork?.frontDefault,
        'https://example.com/charizard_art.png',
      );
    });

    test('fromJson deserializa los tipos correctamente', () {
      final model = PokemonModel.fromJson(sampleJson);
      expect(model.types.length, 2);
      expect(model.types.first.type.name, 'fire');
      expect(model.types.last.type.name, 'flying');
    });

    test('fromJson deserializa los stats correctamente', () {
      final model = PokemonModel.fromJson(sampleJson);
      expect(model.stats.length, 2);
      expect(model.stats.first.baseStat, 78);
      expect(model.stats.first.stat.name, 'hp');
    });

    test('fromJson deserializa las habilidades con is_hidden', () {
      final model = PokemonModel.fromJson(sampleJson);
      expect(model.abilities.length, 2);
      expect(model.abilities.first.ability.name, 'blaze');
      expect(model.abilities.first.isHidden, isFalse);
      expect(model.abilities.last.isHidden, isTrue);
    });

    test('igualdad por valor (freezed)', () {
      final a = PokemonModel.fromJson(sampleJson);
      final b = PokemonModel.fromJson(sampleJson);
      expect(a, equals(b));
    });
  });
}

