// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonFavoritesNotifierHash() =>
    r'3cc02eab8ba9780c5153603019415bdeaa9274af';

/// Provider que mantiene la lista de Pokémon favoritos en memoria.
/// Se puede extender con persistencia local (Hive, SharedPreferences) más adelante.
///
/// Copied from [PokemonFavoritesNotifier].
@ProviderFor(PokemonFavoritesNotifier)
final pokemonFavoritesNotifierProvider = AutoDisposeNotifierProvider<
    PokemonFavoritesNotifier, List<PokemonEntity>>.internal(
  PokemonFavoritesNotifier.new,
  name: r'pokemonFavoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonFavoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonFavoritesNotifier = AutoDisposeNotifier<List<PokemonEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
