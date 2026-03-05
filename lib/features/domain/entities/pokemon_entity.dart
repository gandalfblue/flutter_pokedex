import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_stat_entity.dart';
import 'pokemon_type_entity.dart';

part 'pokemon_entity.freezed.dart';

/// Entidad principal de Pokémon en la capa de dominio.
/// Libre de dependencias de infraestructura (Dio, JSON, etc.).
@freezed
class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required int id,
    required String name,
    required int height,
    required int weight,
    required String imageUrl,
    required List<PokemonTypeEntity> types,
    required List<PokemonStatEntity> stats,
    required List<String> abilities,
    /// Descripción (Pokédex entry) en español o inglés.
    @Default('') String description,
    /// Categoría del Pokémon (ej. "Seed Pokémon").
    @Default('') String category,
  }) = _PokemonEntity;
}

