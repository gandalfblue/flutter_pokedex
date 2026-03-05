import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../providers/pokemon_favorites_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/pokemon_card_widget.dart';
import 'error_page.dart';

class FavoritosPage extends ConsumerStatefulWidget {
  const FavoritosPage({super.key});

  @override
  ConsumerState<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends ConsumerState<FavoritosPage> {
  void _removeFavorite(int index) {
    final l10n = AppLocalizations.of(context)!;
    final removed =
        ref.read(pokemonFavoritesNotifierProvider.notifier).removeAt(index);
    final name =
        '${removed.name[0].toUpperCase()}${removed.name.substring(1)}';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.favoritesRemovedSnackbar(name)),
        action: SnackBarAction(
          label: l10n.favoritesUndoButton,
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

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(pokemonFavoritesNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go(AppRoutes.pokemonList),
        ),
        centerTitle: true,
        title: Text(
          l10n.favoritesTitle,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1D1D1D),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1D1D1D),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (favorites.isEmpty)
              Expanded(
                child: ErrorPage(
                  title: l10n.favoritesEmptyTitle,
                  message: l10n.favoritesEmptyMessage,
                  buttonEnabled: false,
                ),
              )
            else
              ..._favoritesPokemon(favorites: favorites, l10n: l10n),

            // Bottom nav
            const BottomNavPokemonWidget(),
          ],
        ),
      ),
    );
  }

  List<Widget> _favoritesPokemon({
    required List<PokemonEntity> favorites,
    required AppLocalizations l10n,
  }) {
    return [
      // Header
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.favoritesCount(favorites.length),
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
        child: ListView.builder(
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
    ];
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
