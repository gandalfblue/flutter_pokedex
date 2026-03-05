import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/features/domain/usecases/get_pokemon_detail_usecase.dart';

import '../../../helpers/mock_repository.dart';
import '../../../helpers/test_factories.dart';

void main() {
  late MockPokemonRepository repository;
  late GetPokemonDetailUseCase useCase;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = GetPokemonDetailUseCase(repository);
  });

  group('GetPokemonDetailUseCase', () {
    test('retorna PokemonEntity en caso de éxito', () async {
      final pokemon = TestFactories.makePokemon();
      repository.stubGetDetail('bulbasaur', right(pokemon));

      final result = await useCase('bulbasaur');

      expect(result.isRight, isTrue);
      expect(result.getOrNull()?.name, 'bulbasaur');
    });

    test('convierte el nombre a minúsculas antes de llamar al repositorio', () async {
      final pokemon = TestFactories.makePokemon();
      repository.stubGetDetail('bulbasaur', right(pokemon));

      final result = await useCase('BULBASAUR');

      expect(result.isRight, isTrue);
    });

    test('recorta espacios del nombre', () async {
      final pokemon = TestFactories.makePokemon();
      repository.stubGetDetail('bulbasaur', right(pokemon));

      final result = await useCase('  bulbasaur  ');

      expect(result.isRight, isTrue);
    });

    test('retorna Failure si el repositorio falla', () async {
      repository.stubGetDetail(
          'unknownmon', left(const Failure.server(message: 'Not found', statusCode: 404)));

      final result = await useCase('unknownmon');

      expect(result.isLeft, isTrue);
    });
  });
}

