// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonListNotifierHash() =>
    r'baf8b85bf802601e3d71caf804e9d8b1d66208ae';

/// Provider de estado para la lista paginada de Pokémon.
/// Usa Notifier para manejar side-effects y estado acumulativo.
///
/// Copied from [PokemonListNotifier].
@ProviderFor(PokemonListNotifier)
final pokemonListNotifierProvider =
    AutoDisposeNotifierProvider<PokemonListNotifier, PokemonListState>.internal(
  PokemonListNotifier.new,
  name: r'pokemonListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonListNotifier = AutoDisposeNotifier<PokemonListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
