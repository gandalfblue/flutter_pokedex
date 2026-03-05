/// Modelo que mapea la respuesta de /type/{name} de la PokéAPI.
/// Solo se mapean los campos relevantes para calcular debilidades.
/// Se usa fromJson manual para evitar dependencia de build_runner.
class PokemonTypeDamageModel {
  const PokemonTypeDamageModel({
    required this.id,
    required this.name,
    required this.damageRelations,
  });

  final int id;
  final String name;
  final DamageRelationsModel damageRelations;

  factory PokemonTypeDamageModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeDamageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      damageRelations: DamageRelationsModel.fromJson(
        json['damage_relations'] as Map<String, dynamic>,
      ),
    );
  }
}

class DamageRelationsModel {
  const DamageRelationsModel({
    required this.doubleDamageFrom,
    required this.halfDamageFrom,
    required this.noDamageFrom,
  });

  /// Tipos que hacen ×2 de daño a este tipo (debilidades).
  final List<TypeReferenceModel> doubleDamageFrom;

  /// Tipos que hacen ×0.5 de daño a este tipo (resistencias).
  final List<TypeReferenceModel> halfDamageFrom;

  /// Tipos que no hacen daño a este tipo (inmunidades).
  final List<TypeReferenceModel> noDamageFrom;

  factory DamageRelationsModel.fromJson(Map<String, dynamic> json) {
    List<TypeReferenceModel> _parse(String key) => (json[key] as List<dynamic>)
        .map((e) => TypeReferenceModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return DamageRelationsModel(
      doubleDamageFrom: _parse('double_damage_from'),
      halfDamageFrom:   _parse('half_damage_from'),
      noDamageFrom:     _parse('no_damage_from'),
    );
  }
}

class TypeReferenceModel {
  const TypeReferenceModel({required this.name, required this.url});

  final String name;
  final String url;

  factory TypeReferenceModel.fromJson(Map<String, dynamic> json) {
    return TypeReferenceModel(
      name: json['name'] as String,
      url:  json['url']  as String,
    );
  }
}
