// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonListNotifierHash() =>
    r'fafe8853769d8c3125efb02789b4a545b50a20c9';

/// Provider de estado para la lista paginada de Pokémon.
/// keepAlive: true → el estado persiste al navegar, evitando recargas innecesarias.
///
/// Copied from [PokemonListNotifier].
@ProviderFor(PokemonListNotifier)
final pokemonListNotifierProvider =
    NotifierProvider<PokemonListNotifier, PokemonListState>.internal(
  PokemonListNotifier.new,
  name: r'pokemonListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonListNotifier = Notifier<PokemonListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
