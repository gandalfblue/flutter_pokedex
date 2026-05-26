import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_pokemon/features/presentation/widgets/pokeball_progress_indicator_widget.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/pokemon_type_utils.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/pokemon_filter_provider.dart';
import '../providers/pokemon_list_provider.dart';
import '../providers/pokemon_search_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/filter_chip_widget.dart';
import '../widgets/pokemon_card_widget.dart';
import '../widgets/pokemon_filter_modal.dart';
import '../widgets/search_bar_widget.dart';
import 'error_page.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  @override
  ConsumerState<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  final _scrollController = ScrollController();

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
    final filterState = ref.watch(pokemonFilterNotifierProvider);
    final filteredList = ref.watch(filteredPokemonsProvider);

    // Si hay error y no hay pokémones cargados, mostrar pantalla de error completa
    if (listState.errorMessage != null && listState.pokemons.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ErrorPage(
                  title: l10n.errorLoadTitle,
                  message: l10n.errorLoadMessage,
                  buttonEnabled: true,
                  onRetry: () =>
                      ref.read(pokemonListNotifierProvider.notifier).loadInitial(),
                ),
              ),
              const BottomNavPokemonWidget(),
            ],
          ),
        ),
      );
    }

    // Determina la lista a mostrar: búsqueda > filtro > lista completa
    final pokemons = searchState.when(
      data: (found) {
        if (found != null) return found;
        return filterState.hasActiveFilter ? filteredList : listState.pokemons;
      },
      loading: () => filterState.hasActiveFilter ? filteredList : listState.pokemons,
      error: (_, __) => filterState.hasActiveFilter ? filteredList : listState.pokemons,
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
              child: Builder(builder: (context) {
                final l10n = AppLocalizations.of(context)!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          l10n.appTitle,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D1D1D),
                          ),
                        ),
                        const Icon(Icons.catching_pokemon, color: Color(0xFF1D1D1D)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.homeSubtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ],
                );
              }),
            ),

            // Search bar con botón de filtro
            SearchBarWidget(
              hasActiveFilter: filterState.hasActiveFilter,
              onFilterTap: () => PokemonFilterModalWidget.show(context),
              onChanged: (query) {
                if (query.isEmpty) {
                  ref.read(pokemonSearchNotifierProvider.notifier).clear();
                } else {
                  ref.read(pokemonSearchNotifierProvider.notifier).search(query);
                }
              },
            ),

            // Chips de filtros activos
            if (filterState.hasActiveFilter)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Builder(builder: (context) {
                  final l10n = AppLocalizations.of(context)!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          l10n.filtersLabel,
                          style: const TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                        // Chips de tipos seleccionados
                        ...filterState.selectedTypes.map((type) => FilterChipWidget(
                              label: PokemonTypeUtils.typeName(type),
                              icon: PokemonTypeUtils.typeIcon(type, size: 12),
                              color: PokemonTypeUtils.typeColor(type),
                              textColor: PokemonTypeUtils.typeTextColor(type),
                              onRemove: () => ref
                                  .read(pokemonFilterNotifierProvider.notifier)
                                  .toggleType(type),
                            )),
                        // Chip de generación
                        if (filterState.selectedGeneration != null)
                          FilterChipWidget(
                            label: '${l10n.filterGenPrefix}${filterState.selectedGeneration}',
                            icon: const Icon(Icons.auto_stories_rounded,
                                size: 12, color: Colors.white),
                            color: const Color(0xFF1D1D1D),
                            textColor: Colors.white,
                            onRemove: () => ref
                                .read(pokemonFilterNotifierProvider.notifier)
                                .setGeneration(filterState.selectedGeneration),
                          ),
                        // Chip de altura
                        if (filterState.heightRange != null)
                          FilterChipWidget(
                            label: switch (filterState.heightRange!) {
                              'small'  => l10n.filterHeightSmall,
                              'medium' => l10n.filterHeightMedium,
                              _        => l10n.filterHeightLarge,
                            },
                            icon: const Icon(Icons.height_rounded,
                                size: 12, color: Colors.white),
                            color: const Color(0xFF1D1D1D),
                            textColor: Colors.white,
                            onRemove: () => ref
                                .read(pokemonFilterNotifierProvider.notifier)
                                .setHeightRange(filterState.heightRange),
                          ),
                        // Chip de peso
                        if (filterState.weightRange != null)
                          FilterChipWidget(
                            label: switch (filterState.weightRange!) {
                              'light'  => l10n.filterWeightLight,
                              'medium' => l10n.filterWeightMedium,
                              _        => l10n.filterWeightHeavy,
                            },
                            icon: const Icon(Icons.scale_rounded,
                                size: 12, color: Colors.white),
                            color: const Color(0xFF1D1D1D),
                            textColor: Colors.white,
                            onRemove: () => ref
                                .read(pokemonFilterNotifierProvider.notifier)
                                .setWeightRange(filterState.weightRange),
                          ),
                      ],
                    ),
                  );
                }),
              ),

            // Body
            Expanded(
              child: _buildBody(listState, searchState, pokemons),
            ),

            // Bottom nav
            const BottomNavPokemonWidget(),
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
      return const Center(child: PokeballProgressIndicator());
    }

    // Búsqueda en loading
    if (searchState is AsyncLoading) {
      return const Center(child: PokeballProgressIndicator());
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

    // Sin resultados de filtro
    if (pokemons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.noResultsFound,
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
            child: Center(child: PokeballProgressIndicator()),
          );
        }
        return PokemonCardWidget(pokemon: pokemons[index]);
      },
    );
  }
}