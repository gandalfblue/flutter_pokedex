import '../../../../core/utils/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/pokemon_entity.dart';
import '../entities/pokemon_list_entity.dart';
import '../entities/pokemon_type_weakness_entity.dart';

/// Contrato abstracto del repositorio de Pokémon.
/// La capa de dominio define QUÉ se necesita, no CÓMO se obtiene (DIP).
abstract class PokemonRepository {
  /// Obtiene una página de la lista de Pokémon.
  Future<Either<Failure, PokemonListEntity>> getPokemonList({
    required int limit,
    required int offset,
  });

  /// Obtiene el detalle de un Pokémon por nombre o ID.
  Future<Either<Failure, PokemonEntity>> getPokemonDetail(String name);

  /// Obtiene las relaciones de daño de un tipo (debilidades, resistencias,
  /// inmunidades) consultando /type/{typeName} en la PokéAPI.
  Future<Either<Failure, PokemonTypeWeaknessEntity>> getTypeWeaknesses(
      String typeName);
}

