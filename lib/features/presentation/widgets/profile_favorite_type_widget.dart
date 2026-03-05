import 'package:flutter/material.dart';
import '../../../core/utils/pokemon_type_utils.dart';

/// Chip de tipo favorito del entrenador.
class ProfileFavoriteTypeWidget extends StatelessWidget {
  final String? typeName;

  const ProfileFavoriteTypeWidget({super.key, this.typeName});

  @override
  Widget build(BuildContext context) {
    if (typeName == null) {
      return const SizedBox.shrink();
    }

    final color = PokemonTypeUtils.typeColor(typeName!);
    final bgColor = PokemonTypeUtils.typeColorBackground(typeName!);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonTypeUtils.typeIcon(typeName!, size: 16),
          const SizedBox(width: 6),
          Text(
            PokemonTypeUtils.typeName(typeName!),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

