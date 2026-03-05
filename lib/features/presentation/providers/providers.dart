import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/datasources/pokemon_remote_datasource_impl.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/usecases/get_pokemon_detail_usecase.dart';
import '../../domain/usecases/get_pokemon_list_usecase.dart';
import '../../domain/usecases/get_type_weaknesses_usecase.dart';
import '../../domain/usecases/search_pokemon_usecase.dart';

part 'providers.g.dart';

// ─── Infraestructura ────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => DioClient.create();

@Riverpod(keepAlive: true)
PokemonRemoteDataSource pokemonRemoteDataSource(Ref ref) =>
    PokemonRemoteDataSourceImpl(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
PokemonRepository pokemonRepository(Ref ref) =>
    PokemonRepositoryImpl(ref.watch(pokemonRemoteDataSourceProvider));

// ─── Use Cases ──────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
GetPokemonListUseCase getPokemonListUseCase(Ref ref) =>
    GetPokemonListUseCase(ref.watch(pokemonRepositoryProvider));

@Riverpod(keepAlive: true)
GetPokemonDetailUseCase getPokemonDetailUseCase(Ref ref) =>
    GetPokemonDetailUseCase(ref.watch(pokemonRepositoryProvider));

@Riverpod(keepAlive: true)
SearchPokemonUseCase searchPokemonUseCase(Ref ref) =>
    SearchPokemonUseCase(ref.watch(pokemonRepositoryProvider));

@Riverpod(keepAlive: true)
GetTypeWeaknessesUseCase getTypeWeaknessesUseCase(Ref ref) =>
    GetTypeWeaknessesUseCase(ref.watch(pokemonRepositoryProvider));

