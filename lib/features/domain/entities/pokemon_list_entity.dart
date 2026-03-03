import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_entity.dart';

part 'pokemon_list_entity.freezed.dart';

/// Entidad que representa una página de resultados de la lista de Pokémon.
@freezed
class PokemonListEntity with _$PokemonListEntity {
  const factory PokemonListEntity({
    required int count,
    required List<PokemonEntity> pokemons,
    required bool hasNextPage,
  }) = _PokemonListEntity;
}

