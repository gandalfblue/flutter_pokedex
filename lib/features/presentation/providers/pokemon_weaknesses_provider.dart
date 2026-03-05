import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pokemon_type_weakness_entity.dart';
import 'providers.dart';

/// Provider que obtiene las debilidades reales de un Pokémon desde la PokéAPI.
/// El parámetro es un String con los tipos separados por coma (ej: "grass,poison").
/// Se usa String en lugar de List<String> porque List no implementa == por valor,
/// lo que causaría que el FutureProvider.family nunca cache correctamente.
final pokemonWeaknessesProvider =
    FutureProvider.family<List<String>, String>((ref, typesParam) async {
  if (typesParam.isEmpty) return [];

  final types = typesParam.split(',').where((t) => t.isNotEmpty).toList();
  if (types.isEmpty) return [];

  // ref.read en lugar de ref.watch dentro del body async (evita loop infinito)
  final useCase = ref.read(getTypeWeaknessesUseCaseProvider);

  // Consulta todos los tipos del Pokémon en paralelo
  final results = await Future.wait(types.map((t) => useCase(t)));

  // Extrae las entidades ignorando fallos individuales
  final entities = <PokemonTypeWeaknessEntity>[];
  for (final either in results) {
    either.fold((_) {}, entities.add);
  }
  if (entities.isEmpty) return [];

  // Lista completa de tipos atacantes
  const allTypes = [
    'normal', 'fire', 'water', 'electric', 'grass', 'ice',
    'fighting', 'poison', 'ground', 'flying', 'psychic', 'bug',
    'rock', 'ghost', 'dragon', 'dark', 'steel', 'fairy',
  ];

  final weaknesses = <String>[];

  for (final attacker in allTypes) {
    double multiplier = 1.0;

    for (final entity in entities) {
      // Inmunidad → cancela todo daño
      if (entity.noDamageFrom.contains(attacker)) {
        multiplier = 0;
        break;
      }
      if (entity.doubleDamageFrom.contains(attacker)) multiplier *= 2;
      if (entity.halfDamageFrom.contains(attacker))   multiplier *= 0.5;
    }

    if (multiplier >= 2.0) weaknesses.add(attacker);
  }

  return weaknesses;
});
