import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../entities/pokemon_list_entity.dart';
import '../repositories/pokemon_repository.dart';

/// Caso de uso para obtener la lista paginada de Pokémon.
/// Sigue el principio de responsabilidad única (SRP).
class GetPokemonListUseCase {
  const GetPokemonListUseCase(this._repository);

  final PokemonRepository _repository;

  Future<Either<Failure, PokemonListEntity>> call({
    int limit = ApiConstants.pageSize,
    int offset = 0,
  }) {
    return _repository.getPokemonList(limit: limit, offset: offset);
  }
}

