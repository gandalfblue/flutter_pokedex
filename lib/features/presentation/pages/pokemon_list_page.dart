import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../providers/pokemon_list_provider.dart';
import '../providers/pokemon_search_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/pokemon_card_widget.dart';
import '../widgets/search_bar_widget.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  @override
  ConsumerState<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  final _scrollController = ScrollController();
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(pokemonListNotifierProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listState = ref.watch(pokemonListNotifierProvider);
    final searchState = ref.watch(pokemonSearchNotifierProvider);

    // Determina la lista a mostrar: resultado de búsqueda o lista paginada
    final pokemons = searchState.when(
      data: (found) => found != null ? [found] : listState.pokemons,
      loading: () => listState.pokemons,
      error: (_, __) => listState.pokemons,
    );

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
                children: const [
                  Text(
                    'Pokédex',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1D1D),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Busca tu Pokémon favorito',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            SearchBarWidget(
              onChanged: (query) {
                if (query.isEmpty) {
                  ref.read(pokemonSearchNotifierProvider.notifier).clear();
                } else {
                  ref.read(pokemonSearchNotifierProvider.notifier).search(query);
                }
              },
            ),

            // Body
            Expanded(
              child: _buildBody(listState, searchState, pokemons),
            ),

            // Bottom nav
            BottomNavPokemonWidget(
              currentIndex: _currentTab,
              onTap: (i) {
                if (i == _currentTab) return;
                setState(() => _currentTab = i);
                if (i == 2) context.go(AppRoutes.favorites);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    PokemonListState listState,
    AsyncValue searchState,
    dynamic pokemons,
  ) {
    // Estado inicial de carga
    if (listState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Error en la lista principal
    if (listState.errorMessage != null && listState.pokemons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(
              listState.errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () =>
                  ref.read(pokemonListNotifierProvider.notifier).loadInitial(),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    // Búsqueda en loading
    if (searchState is AsyncLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Sin resultados de búsqueda
    if (searchState is AsyncError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              searchState.error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: pokemons.length + (listState.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == pokemons.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return PokemonCardWidget(pokemon: pokemons[index]);
      },
    );
  }
}

