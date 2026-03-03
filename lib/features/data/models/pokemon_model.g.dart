// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonModelImpl _$$PokemonModelImplFromJson(Map<String, dynamic> json) =>
    _$PokemonModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) =>
              PokemonAbilitySlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'sprites': instance.sprites,
      'types': instance.types,
      'stats': instance.stats,
      'abilities': instance.abilities,
    };

_$SpritesModelImpl _$$SpritesModelImplFromJson(Map<String, dynamic> json) =>
    _$SpritesModelImpl(
      frontDefault: json['front_default'] as String?,
      other: json['other'] == null
          ? null
          : OtherSpritesModel.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpritesModelImplToJson(_$SpritesModelImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'other': instance.other,
    };

_$OtherSpritesModelImpl _$$OtherSpritesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtherSpritesModelImpl(
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtworkModel.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OtherSpritesModelImplToJson(
        _$OtherSpritesModelImpl instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

_$OfficialArtworkModelImpl _$$OfficialArtworkModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficialArtworkModelImpl(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$$OfficialArtworkModelImplToJson(
        _$OfficialArtworkModelImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

_$PokemonTypeSlotModelImpl _$$PokemonTypeSlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeSlotModelImpl(
      slot: (json['slot'] as num).toInt(),
      type: PokemonTypeInfoModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeSlotModelImplToJson(
        _$PokemonTypeSlotModelImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

_$PokemonTypeInfoModelImpl _$$PokemonTypeInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonTypeInfoModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonTypeInfoModelImplToJson(
        _$PokemonTypeInfoModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonStatSlotModelImpl _$$PokemonStatSlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatSlotModelImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      stat: PokemonStatInfoModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatSlotModelImplToJson(
        _$PokemonStatSlotModelImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

_$PokemonStatInfoModelImpl _$$PokemonStatInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonStatInfoModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonStatInfoModelImplToJson(
        _$PokemonStatInfoModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonAbilitySlotModelImpl _$$PokemonAbilitySlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilitySlotModelImpl(
      ability: PokemonAbilityInfoModel.fromJson(
          json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
    );

Map<String, dynamic> _$$PokemonAbilitySlotModelImplToJson(
        _$PokemonAbilitySlotModelImpl instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
    };

_$PokemonAbilityInfoModelImpl _$$PokemonAbilityInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonAbilityInfoModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonAbilityInfoModelImplToJson(
        _$PokemonAbilityInfoModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
