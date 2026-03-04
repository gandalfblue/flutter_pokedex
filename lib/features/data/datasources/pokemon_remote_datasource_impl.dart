import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/pokemon_list_response_model.dart';
import '../models/pokemon_model.dart';
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

  /// Limpia el caché manualmente (útil para forzar recarga).
  void clearCache() {
    _detailCache.clear();
    _listCache.clear();
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

