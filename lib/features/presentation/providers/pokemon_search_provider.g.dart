// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonSearchNotifierHash() =>
    r'6782ebcd60ee3c6c22bcea594018fae37ed197fc';

/// Estado de la búsqueda de Pokémon.
///
/// Copied from [PokemonSearchNotifier].
@ProviderFor(PokemonSearchNotifier)
final pokemonSearchNotifierProvider = AutoDisposeNotifierProvider<
    PokemonSearchNotifier, AsyncValue<PokemonEntity?>>.internal(
  PokemonSearchNotifier.new,
  name: r'pokemonSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonSearchNotifier
    = AutoDisposeNotifier<AsyncValue<PokemonEntity?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
