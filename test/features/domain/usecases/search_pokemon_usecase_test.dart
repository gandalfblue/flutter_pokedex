import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/features/domain/usecases/search_pokemon_usecase.dart';

import '../../../helpers/mock_repository.dart';
import '../../../helpers/test_factories.dart';

void main() {
  late MockPokemonRepository repository;
  late SearchPokemonUseCase useCase;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = SearchPokemonUseCase(repository);
  });

  group('SearchPokemonUseCase', () {
    test('retorna Failure.server si el query está vacío', () async {
      final result = await useCase('');

      expect(result.isLeft, isTrue);
      result.fold(
        (f) => f.when(
          server: (msg, _) => expect(msg, contains('empty')),
          network: (_) => fail('No debería ser network'),
          cache: (_) => fail('No debería ser cache'),
          unknown: (_) => fail('No debería ser unknown'),
        ),
        (_) => fail('Debería ser Left'),
      );
    });

    test('retorna el Pokémon cuando la búsqueda es exitosa', () async {
      final pokemon = TestFactories.makePokemon(name: 'pikachu');
      repository.stubGetDetail('pikachu', right(pokemon));

      final result = await useCase('pikachu');

      expect(result.isRight, isTrue);
      expect(result.getOrNull()?.name, 'pikachu');
    });

    test('convierte a minúsculas y recorta espacios', () async {
      final pokemon = TestFactories.makePokemon(name: 'pikachu');
      repository.stubGetDetail('pikachu', right(pokemon));

      final result = await useCase('  PIKACHU  ');

      expect(result.isRight, isTrue);
    });

    test('retorna Failure cuando el repositorio no encuentra el Pokémon', () async {
      repository.stubGetDetail(
          'xxxxxx', left(const Failure.server(message: 'Not found', statusCode: 404)));

      final result = await useCase('xxxxxx');

      expect(result.isLeft, isTrue);
    });
  });
}

