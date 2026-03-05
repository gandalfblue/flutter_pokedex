import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../entities/pokemon_type_weakness_entity.dart';
import '../repositories/pokemon_repository.dart';

/// Caso de uso: obtiene las relaciones de daño (debilidades, resistencias,
/// inmunidades) de un tipo consultando /type/{typeName} de la PokéAPI.
class GetTypeWeaknessesUseCase {
  const GetTypeWeaknessesUseCase(this._repository);

  final PokemonRepository _repository;

  Future<Either<Failure, PokemonTypeWeaknessEntity>> call(String typeName) {
    return _repository.getTypeWeaknesses(typeName.toLowerCase().trim());
  }
}

