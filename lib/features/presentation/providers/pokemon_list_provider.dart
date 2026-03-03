import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pokemon_entity.dart';
import 'providers.dart';

part 'pokemon_list_provider.freezed.dart';
part 'pokemon_list_provider.g.dart';

/// Estado del provider de lista de Pokémon con soporte de paginación.
@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    @Default([]) List<PokemonEntity> pokemons,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasNextPage,
    @Default(0) int currentOffset,
    String? errorMessage,
  }) = _PokemonListState;
}

/// Provider de estado para la lista paginada de Pokémon.
/// Usa Notifier para manejar side-effects y estado acumulativo.
@riverpod
class PokemonListNotifier extends _$PokemonListNotifier {
  static const int _pageSize = 20;

  @override
  PokemonListState build() {
    // Carga la primera página al inicializar
    Future.microtask(loadInitial);
    return const PokemonListState(isLoading: true);
  }

  /// Carga la primera página (o recarga desde cero).
  Future<void> loadInitial() async {
    state = const PokemonListState(isLoading: true);
    final useCase = ref.read(getPokemonListUseCaseProvider);
    final result = await useCase(limit: _pageSize, offset: 0);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
        ),
      ),
      (listEntity) => state = state.copyWith(
        isLoading: false,
        pokemons: listEntity.pokemons,
        hasNextPage: listEntity.hasNextPage,
        currentOffset: _pageSize,
        errorMessage: null,
      ),
    );
  }

  /// Carga la siguiente página (infinite scroll).
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasNextPage) return;

    state = state.copyWith(isLoadingMore: true);
    final useCase = ref.read(getPokemonListUseCaseProvider);
    final result = await useCase(
      limit: _pageSize,
      offset: state.currentOffset,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoadingMore: false,
        errorMessage: failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
        ),
      ),
      (listEntity) => state = state.copyWith(
        isLoadingMore: false,
        pokemons: [...state.pokemons, ...listEntity.pokemons],
        hasNextPage: listEntity.hasNextPage,
        currentOffset: state.currentOffset + _pageSize,
        errorMessage: null,
      ),
    );
  }
}


