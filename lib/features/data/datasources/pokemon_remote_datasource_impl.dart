import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/pokemon_list_response_model.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_species_model.dart';
import '../models/pokemon_type_damage_model.dart';
import 'pokemon_remote_datasource.dart';

/// Implementación del datasource que usa Dio para consumir la PokéAPI.
/// Incluye caché en memoria: si ya se tienen ≥25 pokémon cargados, no vuelve
/// a llamar a la API para detalles ya obtenidos (DRY, rendimiento).
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  /// Caché de detalles por nombre: evita llamadas repetidas al API.
  final Map<String, PokemonModel> _detailCache = {};

  /// Caché de listas por offset: evita recargar páginas ya obtenidas.
  final Map<String, PokemonListResponseModel> _listCache = {};

  /// Caché de relaciones de daño por tipo: 18 tipos son fijos, se cachean
  /// indefinidamente ya que no cambian entre sesiones.
  final Map<String, PokemonTypeDamageModel> _typeCache = {};

  /// Caché de species por nombre: descripción y categoría.
  final Map<String, PokemonSpeciesModel> _speciesCache = {};

  /// Umbral mínimo de pokémon en caché para omitir llamadas al API.
  static const int _cacheThreshold = 50;

  @override
  Future<PokemonListResponseModel> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    final cacheKey = '${limit}_$offset';

    // Si ya está en caché, retorna sin llamar a la API
    if (_listCache.containsKey(cacheKey)) {
      return _listCache[cacheKey]!;
    }

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.pokemon,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      final model = PokemonListResponseModel.fromJson(response.data!);
      _listCache[cacheKey] = model;
      return model;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PokemonModel> getPokemonDetail(String name) async {
    // Si el detalle ya está en caché y superamos el umbral, retorna desde caché
    if (_detailCache.containsKey(name) &&
        _detailCache.length >= _cacheThreshold) {
      return _detailCache[name]!;
    }

    // Si está en caché aunque no lleguemos al umbral, igual lo retornamos
    if (_detailCache.containsKey(name)) {
      return _detailCache[name]!;
    }

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConstants.pokemon}/$name',
      );
      final model = PokemonModel.fromJson(response.data!);
      // Guardar en caché
      _detailCache[name] = model;
      return model;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PokemonSpeciesModel> getPokemonSpecies(String name) async {
    final key = name.toLowerCase();
    if (_speciesCache.containsKey(key)) return _speciesCache[key]!;

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConstants.pokemonSpecies}/$key',
      );
      final model = PokemonSpeciesModel.fromJson(response.data!);
      _speciesCache[key] = model;
      return model;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PokemonTypeDamageModel> getPokemonTypeWeaknesses(String typeName) async {
    final key = typeName.toLowerCase();

    // Los 18 tipos son constantes — se cachean para siempre en la sesión
    if (_typeCache.containsKey(key)) return _typeCache[key]!;

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConstants.type}/$key',
      );
      final model = PokemonTypeDamageModel.fromJson(response.data!);
      _typeCache[key] = model;
      return model;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  /// Limpia el caché manualmente (útil para forzar recarga).
  void clearCache() {
    _detailCache.clear();
    _listCache.clear();
    _speciesCache.clear();
  }

  /// Convierte errores de Dio en excepciones tipadas (Strategy Pattern).
  Exception _mapDioError(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout =>
        NetworkException(message: 'Connection timeout: ${e.message}'),
      DioExceptionType.connectionError =>
        NetworkException(message: 'No internet connection'),
      DioExceptionType.badResponse => ServerException(
          message: e.response?.statusMessage ?? 'Server error',
          statusCode: e.response?.statusCode,
        ),
      _ => ServerException(message: e.message ?? 'Unknown error'),
    };
  }
}

