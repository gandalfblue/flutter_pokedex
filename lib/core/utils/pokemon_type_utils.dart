import 'package:flutter/material.dart';
/// Utilidades centralizadas para colores y nombres de tipos de Pokemon.
/// Patron Utility Class con metodos estaticos (KISS, DRY).
abstract class PokemonTypeUtils {
  static Color typeColor(String type) {
    return switch (type.toLowerCase()) {
      'fire'     => const Color(0xFFFA7562),
      'water'    => const Color(0xFF76BEFE),
      'grass'    => const Color(0xFF48D0B0),
      'electric' => const Color(0xFFFFD86D),
      'ice'      => const Color(0xFF98D8D8),
      'fighting' => const Color(0xFFFF6B6B),
      'poison'   => const Color(0xFFC183C1),
      'ground'   => const Color(0xFFEBCD86),
      'flying'   => const Color(0xFF92AAEF),
      'psychic'  => const Color(0xFFFA92B2),
      'bug'      => const Color(0xFFA8B820),
      'rock'     => const Color(0xFFB8A038),
      'ghost'    => const Color(0xFF705898),
      'dragon'   => const Color(0xFF7038F8),
      'dark'     => const Color(0xFF705848),
      'steel'    => const Color(0xFFB8B8D0),
      'fairy'    => const Color(0xFFEE99AC),
      'normal'   => const Color(0xFFAAA67F),
      _          => const Color(0xFFAAA67F),
    };
  }
  static Color typeTextColor(String type) {
    return switch (type.toLowerCase()) {
      'electric' || 'ice' || 'normal' || 'steel' => const Color(0xFF1D1D1D),
      _ => Colors.white,
    };
  }
  static String typeName(String type) => type.isEmpty
      ? type
      : '${type[0].toUpperCase()}${type.substring(1)}';
}
