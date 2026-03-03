import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_summary_model.freezed.dart';
part 'pokemon_summary_model.g.dart';

/// Modelo del resumen de un Pokémon en la lista (nombre + URL).
@freezed
class PokemonSummaryModel with _$PokemonSummaryModel {
  const factory PokemonSummaryModel({
    required String name,
    required String url,
  }) = _PokemonSummaryModel;

  factory PokemonSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSummaryModelFromJson(json);
}

