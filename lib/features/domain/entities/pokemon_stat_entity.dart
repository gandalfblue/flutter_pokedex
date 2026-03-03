import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat_entity.freezed.dart';

/// Entidad de estadística base de un Pokémon.
@freezed
class PokemonStatEntity with _$PokemonStatEntity {
  const factory PokemonStatEntity({
    required String name,
    required int baseStat,
  }) = _PokemonStatEntity;
}

