import 'package:flutter/material.dart';

/// Tarjeta de información de una sola métrica del Pokémon
/// (peso, altura, categoría, habilidad, etc.).
class PokemonDetailInfoCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color accent;

  // Tamaño del ícono del label
  static const double _iconSize = 14;

  const PokemonDetailInfoCardWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Label con ícono ──────────────────────────────────────────
          Row(
            children: [
              Icon(
                icon,
                size: _iconSize,
                color: Colors.black.withValues(alpha: 0.45),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.black45,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // ── Container alineado al ícono ───────────────────────────────
          SizedBox(
            height: 52,
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE5EAF0), width: 1),
              ),
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
