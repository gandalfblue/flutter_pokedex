import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_entity.dart';
import 'pokemon_card_widget.dart';

class SwipeablePokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onDismissed;

  const SwipeablePokemonCard({
    super.key,
    required this.pokemon,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(pokemon.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE53935),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: const Icon(Icons.delete, color: Colors.white, size: 28),
      ),
      child: PokemonCardWidget(pokemon: pokemon),
    );
  }
}
