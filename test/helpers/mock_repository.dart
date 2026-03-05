import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_list_entity.dart';
import 'package:flutter_pokemon/features/domain/entities/pokemon_type_weakness_entity.dart';
import 'package:flutter_pokemon/features/domain/repositories/pokemon_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

/// Helpers de conveniencia para registrar mocks con mocktail.
extension MockRepositorySetup on MockPokemonRepository {
  void stubGetDetail(String name, Either<Failure, PokemonEntity> result) {
    when(() => getPokemonDetail(name)).thenAnswer((_) async => result);
  }

  void stubGetList({
    required int limit,
    required int offset,
    required Either<Failure, PokemonListEntity> result,
  }) {
    when(() => getPokemonList(limit: limit, offset: offset))
        .thenAnswer((_) async => result);
  }

  void stubGetWeaknesses(
      String type, Either<Failure, PokemonTypeWeaknessEntity> result) {
    when(() => getTypeWeaknesses(type)).thenAnswer((_) async => result);
  }
}

