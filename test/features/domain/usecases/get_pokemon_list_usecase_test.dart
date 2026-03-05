import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/features/domain/usecases/get_pokemon_list_usecase.dart';

import '../../../helpers/mock_repository.dart';
import '../../../helpers/test_factories.dart';

void main() {
  late MockPokemonRepository repository;
  late GetPokemonListUseCase useCase;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = GetPokemonListUseCase(repository);
  });

  group('GetPokemonListUseCase', () {
    test('retorna PokemonListEntity en caso de éxito', () async {
      final list = TestFactories.makeList();
      repository.stubGetList(limit: 20, offset: 0, result: right(list));

      final result = await useCase();

      expect(result.isRight, isTrue);
      expect(result.getOrNull()?.pokemons.length, 2);
      expect(result.getOrNull()?.count, 151);
    });

    test('usa pageSize y offset por defecto', () async {
      final list = TestFactories.makeList();
      repository.stubGetList(limit: 20, offset: 0, result: right(list));

      final result = await useCase();

      expect(result.isRight, isTrue);
    });

    test('permite especificar limit y offset personalizados', () async {
      final list = TestFactories.makeList();
      repository.stubGetList(limit: 10, offset: 20, result: right(list));

      final result = await useCase(limit: 10, offset: 20);

      expect(result.isRight, isTrue);
    });

    test('retorna Failure si el repositorio falla', () async {
      repository.stubGetList(
        limit: 20,
        offset: 0,
        result: left(const Failure.network(message: 'Sin conexión')),
      );

      final result = await useCase();

      expect(result.isLeft, isTrue);
      result.fold(
        (f) => f.when(
          network: (msg) => expect(msg, 'Sin conexión'),
          server: (_, __) => fail('No debería ser server'),
          cache: (_) => fail('No debería ser cache'),
          unknown: (_) => fail('No debería ser unknown'),
        ),
        (_) => fail('Debería ser Left'),
      );
    });
  });
}

