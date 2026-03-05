import 'package:flutter/material.dart';

/// Barra de género animada con indicadores de porcentaje macho/hembra.
/// La proporción se anima desde 0 hasta el valor real con [animation].
class PokemonGenderBarWidget extends StatelessWidget {
  /// Porcentaje macho (0–100). Si es null se muestra "Sin género".
  final double? maleRatio;
  final Animation<double> animation;

  const PokemonGenderBarWidget({
    super.key,
    required this.maleRatio,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    if (maleRatio == null) {
      return const Text(
        'Sin género',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF9CA3AF),
        ),
      );
    }

    final male   = maleRatio! / 100;
    final female = 1 - male;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: AnimatedBuilder(
            animation: animation,
            builder: (_, __) {
              final maleW = male * animation.value;
              return Stack(
                children: [
                  // Fondo femenino
                  Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF472B6),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  // Barra masculina
                  FractionallySizedBox(
                    widthFactor: maleW,
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2551C3),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Etiquetas
        Row(
          children: [
            _GenderBadge(
              icon: Icons.male_rounded,
              color: Colors.black54,
              label: '${(male * 100).toStringAsFixed(1)}%',
            ),
            const Spacer(),
            _GenderBadge(
              icon: Icons.female_rounded,
              color: Colors.black54,
              label: '${(female * 100).toStringAsFixed(1)}%',
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _GenderBadge({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}

