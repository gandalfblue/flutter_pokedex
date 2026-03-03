import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_entity.freezed.dart';

/// Entidad de tipo de Pokémon (ej: fire, water, grass).
@freezed
class PokemonTypeEntity with _$PokemonTypeEntity {
  const factory PokemonTypeEntity({
    required String name,
  }) = _PokemonTypeEntity;
}

