import 'package:flutter/material.dart';

import '../../features/presentation/providers/pokemon_filter_provider.dart';

/// Constantes estáticas utilizadas en el proyecto.
abstract class PokemonConstants {
  PokemonConstants._();

  // ── Tipos ────────────────────────────────────────────────────────────────

  static const List<String> types = [
    'normal', 'fire', 'water', 'electric', 'grass', 'ice',
    'fighting', 'poison', 'ground', 'flying', 'psychic', 'bug',
    'rock', 'ghost', 'dragon', 'dark', 'steel', 'fairy',
  ];

  // ── Generaciones ─────────────────────────────────────────────────────────

  static const List<({String label, int value, String range})> generations = [
    (label: 'Gen I',    value: 1, range: '#001 – #151'),
    // Las generaciones posteriores se pueden agregar, cuando las agreguen en el API.
    // (label: 'Gen II',   value: 2, range: '#152 – #251'),
    // (label: 'Gen III',  value: 3, range: '#252 – #386'),
    // (label: 'Gen IV',   value: 4, range: '#387 – #493'),
    // (label: 'Gen V',    value: 5, range: '#494 – #649'),
    // (label: 'Gen VI',   value: 6, range: '#650 – #721'),
    // (label: 'Gen VII',  value: 7, range: '#722 – #809'),
    // (label: 'Gen VIII', value: 8, range: '#810 – #905'),
    // (label: 'Gen IX',   value: 9, range: '#906+'),
  ];

  // ── Alturas ───────────────────────────────────────────────────────────────

  static const List<({String label, IconData icon, String value, String sub})> heights = [
    (label: 'Pequeño', icon: Icons.arrow_downward_rounded, value: 'small',  sub: 'Menos de 0.7 m'),
    (label: 'Mediano', icon: Icons.height_rounded,         value: 'medium', sub: 'Entre 0.7 y 1.4 m'),
    (label: 'Grande',  icon: Icons.arrow_upward_rounded,   value: 'large',  sub: 'Más de 1.4 m'),
  ];

  // ── Pesos ─────────────────────────────────────────────────────────────────

  static const List<({String label, IconData icon, String value, String sub})> weights = [
    (label: 'Ligero',  icon: Icons.wind_power_rounded,      value: 'light',  sub: 'Menos de 10 kg'),
    (label: 'Mediano', icon: Icons.fitness_center_rounded,  value: 'medium', sub: 'Entre 10 y 50 kg'),
    (label: 'Pesado',  icon: Icons.scale_rounded,           value: 'heavy',  sub: 'Más de 50 kg'),
  ];

  // ── Categorías del selector superior ─────────────────────────────────────

  static const List<({FilterCategory cat, String label, IconData icon})> categories = [
    (cat: FilterCategory.type,       label: 'Tipo',       icon: Icons.style_rounded),
    (cat: FilterCategory.generation, label: 'Generación', icon: Icons.auto_stories_rounded),
    (cat: FilterCategory.height,     label: 'Altura',     icon: Icons.height_rounded),
    (cat: FilterCategory.weight,     label: 'Peso',       icon: Icons.monitor_weight_rounded),
  ];
}

