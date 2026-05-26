import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pokemon_entity.dart';
import 'providers.dart';

part 'pokemon_detail_provider.g.dart';

/// Provider para obtener el detalle de un Pokémon por nombre.
/// Usa AsyncNotifierProvider para manejar loading/error/data automáticamente.
@riverpod
Future<PokemonEntity> pokemonDetail(
  Ref ref, {
  required String pokemonName,
}) async {
  final useCase = ref.watch(getPokemonDetailUseCaseProvider);
  final result = await useCase(pokemonName);
  return result.fold(
    (failure) => throw failure.when(
      server: (msg, _) => msg,
      network: (msg) => msg,
      cache: (msg) => msg,
      unknown: (msg) => msg,
      firebase: (msg) => msg,
    ),
    (pokemon) => pokemon,
  );
}


