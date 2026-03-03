import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/pokemon_list_response_model.dart';
import '../models/pokemon_model.dart';
import 'pokemon_remote_datasource.dart';

/// Implementación del datasource que usa Dio para consumir la PokéAPI.
/// Transforma errores de Dio en excepciones de dominio (SRP).
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  const PokemonRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<PokemonListResponseModel> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.pokemon,
        queryParameters: {'limit': limit, 'offset': offset},
      );
      return PokemonListResponseModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PokemonModel> getPokemonDetail(String name) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConstants.pokemon}/$name',
      );
      return PokemonModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
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

