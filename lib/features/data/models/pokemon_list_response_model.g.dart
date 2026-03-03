// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonListResponseModelImpl _$$PokemonListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonListResponseModelImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonSummaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonListResponseModelImplToJson(
        _$PokemonListResponseModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
