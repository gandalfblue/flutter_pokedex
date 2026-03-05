/// Entidad de dominio que representa las relaciones de daño de un tipo.
/// Calculadas desde /type/{name} → damage_relations de la PokéAPI.
class PokemonTypeWeaknessEntity {
  const PokemonTypeWeaknessEntity({
    required this.typeName,
    required this.doubleDamageFrom,
    required this.halfDamageFrom,
    required this.noDamageFrom,
  });

  final String typeName;

  /// Tipos que hacen ×2 de daño (debilidades).
  final List<String> doubleDamageFrom;

  /// Tipos que hacen ×0.5 de daño (resistencias).
  final List<String> halfDamageFrom;

  /// Tipos que no hacen daño (inmunidades).
  final List<String> noDamageFrom;
}
