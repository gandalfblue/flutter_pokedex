import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';

/// Caso de uso para obtener el detalle de un Pokémon.
class GetPokemonDetailUseCase {
  const GetPokemonDetailUseCase(this._repository);

  final PokemonRepository _repository;

  Future<Either<Failure, PokemonEntity>> call(String name) {
    return _repository.getPokemonDetail(name.toLowerCase().trim());
  }
}

