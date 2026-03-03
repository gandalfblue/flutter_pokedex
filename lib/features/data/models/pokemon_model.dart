// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

/// Modelo completo de Pokémon mapeando la respuesta de /pokemon/{name}.
@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    required SpritesModel sprites,
    required List<PokemonTypeSlotModel> types,
    required List<PokemonStatSlotModel> stats,
    required List<PokemonAbilitySlotModel> abilities,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}

@freezed
class SpritesModel with _$SpritesModel {
  const factory SpritesModel({
    @JsonKey(name: 'front_default') String? frontDefault,
    OtherSpritesModel? other,
  }) = _SpritesModel;

  factory SpritesModel.fromJson(Map<String, dynamic> json) =>
      _$SpritesModelFromJson(json);
}

@freezed
class OtherSpritesModel with _$OtherSpritesModel {
  const factory OtherSpritesModel({
    @JsonKey(name: 'official-artwork') OfficialArtworkModel? officialArtwork,
  }) = _OtherSpritesModel;

  factory OtherSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesModelFromJson(json);
}

@freezed
class OfficialArtworkModel with _$OfficialArtworkModel {
  const factory OfficialArtworkModel({
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _OfficialArtworkModel;

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkModelFromJson(json);
}

@freezed
class PokemonTypeSlotModel with _$PokemonTypeSlotModel {
  const factory PokemonTypeSlotModel({
    required int slot,
    required PokemonTypeInfoModel type,
  }) = _PokemonTypeSlotModel;

  factory PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotModelFromJson(json);
}

@freezed
class PokemonTypeInfoModel with _$PokemonTypeInfoModel {
  const factory PokemonTypeInfoModel({
    required String name,
    required String url,
  }) = _PokemonTypeInfoModel;

  factory PokemonTypeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoModelFromJson(json);
}

@freezed
class PokemonStatSlotModel with _$PokemonStatSlotModel {
  const factory PokemonStatSlotModel({
    @JsonKey(name: 'base_stat') required int baseStat,
    required PokemonStatInfoModel stat,
  }) = _PokemonStatSlotModel;

  factory PokemonStatSlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatSlotModelFromJson(json);
}

@freezed
class PokemonStatInfoModel with _$PokemonStatInfoModel {
  const factory PokemonStatInfoModel({
    required String name,
    required String url,
  }) = _PokemonStatInfoModel;

  factory PokemonStatInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoModelFromJson(json);
}

@freezed
class PokemonAbilitySlotModel with _$PokemonAbilitySlotModel {
  const factory PokemonAbilitySlotModel({
    required PokemonAbilityInfoModel ability,
    @JsonKey(name: 'is_hidden') required bool isHidden,
  }) = _PokemonAbilitySlotModel;

  factory PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitySlotModelFromJson(json);
}

@freezed
class PokemonAbilityInfoModel with _$PokemonAbilityInfoModel {
  const factory PokemonAbilityInfoModel({
    required String name,
    required String url,
  }) = _PokemonAbilityInfoModel;

  factory PokemonAbilityInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityInfoModelFromJson(json);
}
