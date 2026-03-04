import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/constants/pokemon_constants.dart';
import '../constants/api_constants.dart';

/// Utilidades centralizadas para colores, nombres e iconos de tipos de Pokemon.
/// Patron Utility Class con metodos estaticos (KISS, DRY).
abstract class PokemonTypeUtils {
  /// ID numérico de cada tipo según la PokéAPI.
  static int typeId(String type) {
    return switch (type.toLowerCase()) {
      'normal'   => 1,
      'fighting' => 2,
      'flying'   => 3,
      'poison'   => 4,
      'ground'   => 5,
      'rock'     => 6,
      'bug'      => 7,
      'ghost'    => 8,
      'steel'    => 9,
      'fire'     => 10,
      'water'    => 11,
      'grass'    => 12,
      'electric' => 13,
      'psychic'  => 14,
      'ice'      => 15,
      'dragon'   => 16,
      'dark'     => 17,
      'fairy'    => 18,
      _          => 1,
    };
  }

  static Color typeColor(String type) {
    return switch (type.toLowerCase()) {
      'normal'   => const Color(0xFFA8A77A),
      'fire'     => const Color(0xFFEE8130),
      'water'    => const Color(0xFF6390F0),
      'electric' => const Color(0xFFF7D02C),
      'grass'    => const Color(0xFF7AC74C),
      'ice'      => const Color(0xFF96D9D6),
      'fighting' => const Color(0xFFC22E28),
      'poison'   => const Color(0xFFA33EA1),
      'ground'   => const Color(0xFFE2BF65),
      'flying'   => const Color(0xFFA98FF3),
      'psychic'  => const Color(0xFFF95587),
      'bug'      => const Color(0xFFA6B91A),
      'rock'     => const Color(0xFFB6A136),
      'ghost'    => const Color(0xFF735797),
      'dragon'   => const Color(0xFF6F35FC),
      'dark'     => const Color(0xFF705746),
      'steel'    => const Color(0xFFB7B7CE),
      'fairy'    => const Color(0xFFD685AD),
      _          => const Color(0xFFA8A77A),
    };
  }

  /// Versión más clara del color del tipo, ideal para fondos de cards o detalles.
  /// Mezcla el color original con blanco al 85% de opacidad.
  static Color typeColorBackground(String type) {
    final base = typeColor(type);
    return Color.lerp(base, Colors.white, 0.40)!;
  }

  static Color typeTextColor(String type) {
    // Tipos con colores claros → texto oscuro para contraste
    return switch (type.toLowerCase()) {
      'normal' || 'electric' || 'ice' || 'ground' || 'steel' ||
      'bug'    || 'rock'     || 'grass' => const Color(0xFF1D1D1D),
      _ => Colors.white,
    };
  }

  static String typeName(String type) => type.isEmpty
      ? type
      : '${type[0].toUpperCase()}${type.substring(1)}';

  /// Retorna un Widget con la imagen local del tipo de Pokemon desde assets/icons.
  /// [size] controla el tamaño de la imagen (default: 16).
  static Widget typeIcon(String type, {double size = 16, Color color = Colors.white}) {
    final lowerType = type.toLowerCase();

    if (PokemonConstants.types.contains(lowerType)) {
      return Image.asset(
        'assets/icons/icon_$lowerType.png',
        color: color,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Icon(
          Icons.help_outline_rounded,
          size: size,
          color: typeTextColor(type),
        ),
      );
    }

    // Tipo desconocido: icono genérico
    return Icon(Icons.catching_pokemon, size: size, color: color);
  }

  /// URL del ícono/badge PNG del tipo desde los sprites oficiales de PokéAPI.
  static String typeIconUrl(String type) {
    final id = typeId(type);
    return '${ApiConstants.typeIconBaseUrl}$id.png';
  }
}