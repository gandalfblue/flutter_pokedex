import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/pokemon_type_utils.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../providers/pokemon_favorites_provider.dart';
import 'pokemon_type_chip_widget.dart';

class PokemonCardWidget extends ConsumerWidget {
  final PokemonEntity pokemon;

  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      pokemonFavoritesNotifierProvider
          .select((list) => list.any((p) => p.id == pokemon.id)),
    );

    final cardColorBackground = pokemon.types.isNotEmpty
        ? PokemonTypeUtils.typeColorBackground(pokemon.types.first.name)
        : const Color(0xFFAAA67F);

    final cardColor = pokemon.types.isNotEmpty
        ? PokemonTypeUtils.typeColor(pokemon.types.first.name)
        : const Color(0xFFAAA67F);

    final String firstType = pokemon.types.isNotEmpty
        ? pokemon.types.first.name
        : 'normal';

    final formattedId = '#${pokemon.id.toString().padLeft(3, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 110,
      decoration: BoxDecoration(
        color: cardColorBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [

          // Recuadro de fondo con cardColor detrás de la imagen del Pokémon
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),

          // Ícono del tipo decorativo encima del recuadro
          Positioned(
            right: 5,
            top: 5,
            child: Opacity(
              opacity: 0.55,
              child: PokemonTypeUtils.typeIcon(firstType, size: 100),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Left: info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ID
                      Text(
                        formattedId,
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.75),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Name
                      Text(
                        pokemon.name[0].toUpperCase() +
                            pokemon.name.substring(1),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Type chips
                      Wrap(
                        spacing: 6,
                        children: pokemon.types
                            .map((t) => TypeChipWidget(type: t))
                            .toList(),
                      ),
                    ],
                  ),
                ),

                // Right: pokemon image
                SizedBox(
                  width: 95,
                  height: 95,
                  child: Image.network(
                    pokemon.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.catching_pokemon,
                      color: Colors.white54,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Favorite heart button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => ref
                  .read(pokemonFavoritesNotifierProvider.notifier)
                  .toggle(pokemon),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12.withValues(alpha: 0.30),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    switchInCurve: Curves.elasticOut,
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(isFavorite),
                      color: isFavorite ? Colors.red[400] : Colors.white,
                      size: 20,
                    ),
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
