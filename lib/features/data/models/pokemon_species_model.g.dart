// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonSpeciesModelImpl _$$PokemonSpeciesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonSpeciesModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => GeneraModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonSpeciesModelImplToJson(
        _$PokemonSpeciesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flavor_text_entries': instance.flavorTextEntries,
      'genera': instance.genera,
    };

_$FlavorTextEntryModelImpl _$$FlavorTextEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlavorTextEntryModelImpl(
      flavorText: json['flavor_text'] as String,
      language: SpeciesLanguageModel.fromJson(
          json['language'] as Map<String, dynamic>),
      version:
          SpeciesVersionModel.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlavorTextEntryModelImplToJson(
        _$FlavorTextEntryModelImpl instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

_$GeneraModelImpl _$$GeneraModelImplFromJson(Map<String, dynamic> json) =>
    _$GeneraModelImpl(
      genus: json['genus'] as String,
      language: SpeciesLanguageModel.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeneraModelImplToJson(_$GeneraModelImpl instance) =>
    <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language,
    };

_$SpeciesLanguageModelImpl _$$SpeciesLanguageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SpeciesLanguageModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$SpeciesLanguageModelImplToJson(
        _$SpeciesLanguageModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$SpeciesVersionModelImpl _$$SpeciesVersionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SpeciesVersionModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$SpeciesVersionModelImplToJson(
        _$SpeciesVersionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
