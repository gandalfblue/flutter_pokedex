import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_type_damage_model.dart';

void main() {
  group('PokemonTypeDamageModel', () {
    final sampleJson = {
      'id': 10,
      'name': 'fire',
      'damage_relations': {
        'double_damage_from': [
          {'name': 'water', 'url': 'url'},
          {'name': 'ground', 'url': 'url'},
          {'name': 'rock', 'url': 'url'},
        ],
        'half_damage_from': [
          {'name': 'fire', 'url': 'url'},
          {'name': 'grass', 'url': 'url'},
          {'name': 'ice', 'url': 'url'},
          {'name': 'bug', 'url': 'url'},
          {'name': 'steel', 'url': 'url'},
          {'name': 'fairy', 'url': 'url'},
        ],
        'no_damage_from': [],
        'double_damage_to': [],
        'half_damage_to': [],
        'no_damage_to': [],
      },
    };

    test('fromJson deserializa name e id', () {
      final model = PokemonTypeDamageModel.fromJson(sampleJson);
      expect(model.name, 'fire');
      expect(model.id, 10);
    });

    test('double_damage_from contiene las debilidades', () {
      final model = PokemonTypeDamageModel.fromJson(sampleJson);
      final weaknesses = model.damageRelations.doubleDamageFrom.map((r) => r.name).toList();
      expect(weaknesses, containsAll(['water', 'ground', 'rock']));
    });

    test('half_damage_from contiene las resistencias', () {
      final model = PokemonTypeDamageModel.fromJson(sampleJson);
      final resistances = model.damageRelations.halfDamageFrom.map((r) => r.name).toList();
      expect(resistances, containsAll(['fire', 'grass', 'ice']));
    });

    test('no_damage_from está vacío para fire', () {
      final model = PokemonTypeDamageModel.fromJson(sampleJson);
      expect(model.damageRelations.noDamageFrom, isEmpty);
    });
  });
}

