import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/pokemon_list_entity.dart';
import '../../domain/entities/pokemon_stat_entity.dart';
import '../../domain/entities/pokemon_type_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';
import '../models/pokemon_model.dart';

/// Implementación del repositorio que coordina datasource y mapeo de errores.
/// Transforma modelos de datos en entidades de dominio (Clean Architecture).
class PokemonRepositoryImpl implements PokemonRepository {
  const PokemonRepositoryImpl(this._dataSource);

  final PokemonRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, PokemonListEntity>> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _dataSource.getPokemonList(
        limit: limit,
        offset: offset,
      );

      // Fetching details concurrently para mejor rendimiento
      final detailFutures = response.results
          .map((summary) => _dataSource.getPokemonDetail(summary.name));
      final details = await Future.wait(detailFutures);

      final pokemons = details.map(_mapToEntity).toList();

      return right(PokemonListEntity(
        count: response.count,
        pokemons: pokemons,
        hasNextPage: response.next != null,
      ));
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonDetail(String name) async {
    try {
      final model = await _dataSource.getPokemonDetail(name);
      return right(_mapToEntity(model));
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(Failure.unknown(message: e.toString()));
    }
  }

  /// Mapea PokemonModel (Data) → PokemonEntity (Domain).
  PokemonEntity _mapToEntity(PokemonModel model) {
    final imageUrl =
        model.sprites.other?.officialArtwork?.frontDefault ??
            model.sprites.frontDefault ??
            AppConstants.officialArtworkUrl(model.id);

    return PokemonEntity(
      id: model.id,
      name: model.name,
      height: model.height,
      weight: model.weight,
      imageUrl: imageUrl,
      types: model.types
          .map((t) => PokemonTypeEntity(name: t.type.name))
          .toList(),
      stats: model.stats
          .map((s) => PokemonStatEntity(name: s.stat.name, baseStat: s.baseStat))
          .toList(),
      abilities: model.abilities
          .where((a) => !a.isHidden)
          .map((a) => a.ability.name)
          .toList(),
    );
  }
}

