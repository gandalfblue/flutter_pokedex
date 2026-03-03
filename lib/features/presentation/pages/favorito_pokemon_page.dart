import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../providers/pokemon_favorites_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/pokemon_card_widget.dart';

class FavoritosPage extends ConsumerStatefulWidget {
  const FavoritosPage({super.key});

  @override
  ConsumerState<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends ConsumerState<FavoritosPage> {
  int _currentTab = 2;

  void _removeFavorite(int index) {
    final removed = ref
        .read(pokemonFavoritesNotifierProvider.notifier)
        .removeAt(index);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${removed.name[0].toUpperCase()}${removed.name.substring(1)} eliminado de favoritos',
        ),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            ref
                .read(pokemonFavoritesNotifierProvider.notifier)
                .insertAt(index, removed);
          },
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _onTabTap(int index) {
    if (index == _currentTab) return;
    setState(() => _currentTab = index);
    switch (index) {
      case 0:
        context.go(AppRoutes.pokemonList);
        break;
      case 2:
        // Ya estamos aquí
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(pokemonFavoritesNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favoritos',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1D1D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    favorites.isEmpty
                        ? 'Aún no tienes favoritos'
                        : '${favorites.length} Pokémon guardado${favorites.length == 1 ? '' : 's'}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Lista o estado vacío
            Expanded(
              child: favorites.isEmpty
                  ? _EmptyFavorites()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return _SwipeablePokemonCard(
                          key: ValueKey(favorites[index].id),
                          pokemon: favorites[index],
                          onDismissed: () => _removeFavorite(index),
                        );
                      },
                    ),
            ),

            // Bottom nav
            BottomNavPokemonWidget(
              currentIndex: _currentTab,
              onTap: _onTabTap,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widget estado vacío ────────────────────────────────────────────────────

class _EmptyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'Sin favoritos todavía',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Marca Pokémon como favoritos\ndesde la Pokédex',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Tarjeta con swipe para eliminar ────────────────────────────────────────

class _SwipeablePokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onDismissed;

  const _SwipeablePokemonCard({
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
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
      ),
      child: PokemonCardWidget(pokemon: pokemon),
    );
  }
}
