// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_model.freezed.dart';
part 'pokemon_species_model.g.dart';

/// Modelo para la respuesta de /pokemon-species/{name}.
/// Solo mapeamos los campos que nos interesan: flavor_text_entries y genera.
@freezed
class PokemonSpeciesModel with _$PokemonSpeciesModel {
  const factory PokemonSpeciesModel({
    required int id,
    required String name,
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextEntryModel> flavorTextEntries,
    required List<GeneraModel> genera,
  }) = _PokemonSpeciesModel;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesModelFromJson(json);
}

/// Una entrada de texto descriptivo (Pokédex entry).
@freezed
class FlavorTextEntryModel with _$FlavorTextEntryModel {
  const factory FlavorTextEntryModel({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required SpeciesLanguageModel language,
    required SpeciesVersionModel version,
  }) = _FlavorTextEntryModel;

  factory FlavorTextEntryModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryModelFromJson(json);
}

/// Categoría del Pokémon en un idioma determinado (ej. "Seed Pokémon").
@freezed
class GeneraModel with _$GeneraModel {
  const factory GeneraModel({
    required String genus,
    required SpeciesLanguageModel language,
  }) = _GeneraModel;

  factory GeneraModel.fromJson(Map<String, dynamic> json) =>
      _$GeneraModelFromJson(json);
}

@freezed
class SpeciesLanguageModel with _$SpeciesLanguageModel {
  const factory SpeciesLanguageModel({
    required String name,
    required String url,
  }) = _SpeciesLanguageModel;

  factory SpeciesLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesLanguageModelFromJson(json);
}

@freezed
class SpeciesVersionModel with _$SpeciesVersionModel {
  const factory SpeciesVersionModel({
    required String name,
    required String url,
  }) = _SpeciesVersionModel;

  factory SpeciesVersionModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesVersionModelFromJson(json);
}

