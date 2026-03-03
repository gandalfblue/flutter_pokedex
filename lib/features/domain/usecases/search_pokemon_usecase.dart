import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';

/// Caso de uso para buscar un Pokémon por nombre exacto.
/// La búsqueda usa el mismo endpoint de detalle de la PokéAPI.
class SearchPokemonUseCase {
  const SearchPokemonUseCase(this._repository);

  final PokemonRepository _repository;

  Future<Either<Failure, PokemonEntity>> call(String query) {
    if (query.isEmpty) {
      return Future.value(left(const Failure.server(message: 'Query cannot be empty')));
    }
    return _repository.getPokemonDetail(query.toLowerCase().trim());
  }
}

