import '../models/pokemon_list_response_model.dart';
import '../models/pokemon_model.dart';

/// Contrato abstracto del datasource remoto.
/// La inversión de dependencias permite mockear en tests fácilmente.
abstract class PokemonRemoteDataSource {
  /// Obtiene la lista paginada de Pokémon.
  Future<PokemonListResponseModel> getPokemonList({
    required int limit,
    required int offset,
  });

  /// Obtiene el detalle completo de un Pokémon.
  Future<PokemonModel> getPokemonDetail(String name);
}

