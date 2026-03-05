import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/features/domain/usecases/get_type_weaknesses_usecase.dart';

import '../../../helpers/mock_repository.dart';
import '../../../helpers/test_factories.dart';

void main() {
  late MockPokemonRepository repository;
  late GetTypeWeaknessesUseCase useCase;

  setUp(() {
    repository = MockPokemonRepository();
    useCase = GetTypeWeaknessesUseCase(repository);
  });

  group('GetTypeWeaknessesUseCase', () {
    test('retorna la entidad de debilidades en caso de éxito', () async {
      final weakness = TestFactories.makeWeakness(typeName: 'grass');
      repository.stubGetWeaknesses('grass', right(weakness));

      final result = await useCase('grass');

      expect(result.isRight, isTrue);
      expect(result.getOrNull()?.typeName, 'grass');
      expect(result.getOrNull()?.doubleDamageFrom, contains('fire'));
    });

    test('convierte el tipo a minúsculas y recorta espacios', () async {
      final weakness = TestFactories.makeWeakness(typeName: 'fire');
      repository.stubGetWeaknesses('fire', right(weakness));

      final result = await useCase('  FIRE  ');

      expect(result.isRight, isTrue);
    });

    test('retorna Failure si el repositorio falla', () async {
      repository.stubGetWeaknesses(
          'unknown', left(const Failure.server(message: 'Type not found', statusCode: 404)));

      final result = await useCase('unknown');

      expect(result.isLeft, isTrue);
    });
  });
}

