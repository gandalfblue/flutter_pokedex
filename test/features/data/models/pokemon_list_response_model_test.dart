import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_list_response_model.dart';

void main() {
  group('PokemonListResponseModel', () {
    final sampleJson = {
      'count': 1302,
      'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
      'previous': null,
      'results': [
        {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
        {'name': 'ivysaur',   'url': 'https://pokeapi.co/api/v2/pokemon/2/'},
      ],
    };

    test('fromJson deserializa count, next y results', () {
      final model = PokemonListResponseModel.fromJson(sampleJson);
      expect(model.count, 1302);
      expect(model.next, isNotNull);
      expect(model.results.length, 2);
    });

    test('previous puede ser null', () {
      final model = PokemonListResponseModel.fromJson(sampleJson);
      expect(model.previous, isNull);
    });

    test('results contiene los nombres correctos', () {
      final model = PokemonListResponseModel.fromJson(sampleJson);
      expect(model.results.first.name, 'bulbasaur');
      expect(model.results.last.name, 'ivysaur');
    });

    test('sin next page: next es null', () {
      final json = {
        'count': 2,
        'next': null,
        'previous': 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20',
        'results': [
          {'name': 'bulbasaur', 'url': 'url'},
        ],
      };
      final model = PokemonListResponseModel.fromJson(json);
      expect(model.next, isNull);
    });

    test('igualdad por valor (freezed)', () {
      final a = PokemonListResponseModel.fromJson(sampleJson);
      final b = PokemonListResponseModel.fromJson(sampleJson);
      expect(a, equals(b));
    });
  });
}

