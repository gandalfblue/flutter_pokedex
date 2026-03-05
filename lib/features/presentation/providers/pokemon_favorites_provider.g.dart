// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonFavoritesNotifierHash() =>
    r'd33df6cb182a980bb9f943657c9eeaa66f62552b';

/// Provider que mantiene la lista de Pokémon favoritos en memoria.
/// keepAlive: true evita que el estado se pierda al navegar entre pantallas.
///
/// Copied from [PokemonFavoritesNotifier].
@ProviderFor(PokemonFavoritesNotifier)
final pokemonFavoritesNotifierProvider =
    NotifierProvider<PokemonFavoritesNotifier, List<PokemonEntity>>.internal(
  PokemonFavoritesNotifier.new,
  name: r'pokemonFavoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonFavoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonFavoritesNotifier = Notifier<List<PokemonEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
