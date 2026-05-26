// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonSearchNotifierHash() =>
    r'f4c452c36d6e3e55e03cf0df413c9599d15de4e5';

/// Estado de la búsqueda: lista de pokémon que coinciden con el query.
///
/// Copied from [PokemonSearchNotifier].
@ProviderFor(PokemonSearchNotifier)
final pokemonSearchNotifierProvider = AutoDisposeNotifierProvider<
    PokemonSearchNotifier, AsyncValue<List<PokemonEntity>?>>.internal(
  PokemonSearchNotifier.new,
  name: r'pokemonSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonSearchNotifier
    = AutoDisposeNotifier<AsyncValue<List<PokemonEntity>?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
