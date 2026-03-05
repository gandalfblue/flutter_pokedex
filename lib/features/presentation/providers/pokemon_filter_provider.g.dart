// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPokemonsHash() => r'3d3acfc77b2fe6e98cdb6c5836cdb29e46007191';

/// Provider derivado: aplica todos los filtros activos sobre la lista en caché.
///
/// Copied from [filteredPokemons].
@ProviderFor(filteredPokemons)
final filteredPokemonsProvider = Provider<List<PokemonEntity>>.internal(
  filteredPokemons,
  name: r'filteredPokemonsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredPokemonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredPokemonsRef = ProviderRef<List<PokemonEntity>>;
String _$pokemonFilterNotifierHash() =>
    r'b2c3ac4d63bef35c83379b919f6bd99aed6519de';

/// See also [PokemonFilterNotifier].
@ProviderFor(PokemonFilterNotifier)
final pokemonFilterNotifierProvider =
    NotifierProvider<PokemonFilterNotifier, PokemonFilterState>.internal(
  PokemonFilterNotifier.new,
  name: r'pokemonFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PokemonFilterNotifier = Notifier<PokemonFilterState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
