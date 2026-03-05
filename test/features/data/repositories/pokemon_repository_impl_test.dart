import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_list_response_model.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_model.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_summary_model.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_species_model.dart';
import 'package:flutter_pokemon/features/data/models/pokemon_type_damage_model.dart';
import 'package:flutter_pokemon/features/data/repositories/pokemon_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

// ── Mock del datasource ──────────────────────────────────────────────────────
class MockPokemonRemoteDataSource extends Mock
    implements PokemonRemoteDataSource {}

// ── Fixtures ─────────────────────────────────────────────────────────────────
PokemonModel _makePokemonModel({int id = 1, String name = 'bulbasaur'}) {
  return PokemonModel(
    id: id,
    name: name,
    height: 7,
    weight: 69,
    sprites: const SpritesModel(
      frontDefault: 'https://example.com/bulbasaur.png',
      other: null,
    ),
    types: const [
      PokemonTypeSlotModel(
          slot: 1, type: PokemonTypeInfoModel(name: 'grass', url: 'url')),
      PokemonTypeSlotModel(
          slot: 2, type: PokemonTypeInfoModel(name: 'poison', url: 'url')),
    ],
    stats: const [
      PokemonStatSlotModel(
          baseStat: 45, stat: PokemonStatInfoModel(name: 'hp', url: 'url')),
    ],
    abilities: const [
      PokemonAbilitySlotModel(
          ability: PokemonAbilityInfoModel(name: 'overgrow', url: 'url'),
          isHidden: false),
      PokemonAbilitySlotModel(
          ability: PokemonAbilityInfoModel(name: 'chlorophyll', url: 'url'),
          isHidden: true),
    ],
  );
}

PokemonListResponseModel _makeListResponse() => PokemonListResponseModel(
      count: 1302,
      next: 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
      previous: null,
      results: [
        const PokemonSummaryModel(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      ],
    );

PokemonSpeciesModel _makeSpecies() => PokemonSpeciesModel(
      id: 1,
      name: 'bulbasaur',
      flavorTextEntries: [
        FlavorTextEntryModel(
          flavorText: 'A strange seed was planted on its back.',
          language: const SpeciesLanguageModel(name: 'en', url: 'url'),
          version: const SpeciesVersionModel(name: 'red', url: 'url'),
        ),
      ],
      genera: [
        GeneraModel(
          genus: 'Seed Pokémon',
          language: const SpeciesLanguageModel(name: 'en', url: 'url'),
        ),
      ],
    );

PokemonTypeDamageModel _makeTypeDamage() => PokemonTypeDamageModel(
      id: 12,
      name: 'grass',
      damageRelations: DamageRelationsModel(
        doubleDamageFrom: [
          const TypeReferenceModel(name: 'fire', url: 'url'),
          const TypeReferenceModel(name: 'ice', url: 'url'),
        ],
        halfDamageFrom: [
          const TypeReferenceModel(name: 'water', url: 'url'),
        ],
        noDamageFrom: [],
      ),
    );

void main() {
  late MockPokemonRemoteDataSource dataSource;
  late PokemonRepositoryImpl repository;

  setUp(() {
    dataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(dataSource);
  });

  // ── getPokemonList ─────────────────────────────────────────────────────────
  group('PokemonRepositoryImpl.getPokemonList', () {
    test('retorna PokemonListEntity con la lista de pokémon mapeados', () async {
      final listResponse = _makeListResponse();
      final pokemonModel = _makePokemonModel();

      when(() => dataSource.getPokemonList(limit: 20, offset: 0))
          .thenAnswer((_) async => listResponse);
      when(() => dataSource.getPokemonDetail('bulbasaur'))
          .thenAnswer((_) async => pokemonModel);

      final result = await repository.getPokemonList(limit: 20, offset: 0);

      expect(result.isRight, isTrue);
      final entity = result.getOrNull()!;
      expect(entity.count, 1302);
      expect(entity.pokemons.length, 1);
      expect(entity.pokemons.first.name, 'bulbasaur');
      expect(entity.hasNextPage, isTrue);
    });

    test('retorna Failure.network si el datasource lanza NetworkException', () async {
      when(() => dataSource.getPokemonList(limit: 20, offset: 0))
          .thenThrow(Exception('No internet'));

      final result = await repository.getPokemonList(limit: 20, offset: 0);

      expect(result.isLeft, isTrue);
    });
  });

  // ── getPokemonDetail ───────────────────────────────────────────────────────
  group('PokemonRepositoryImpl.getPokemonDetail', () {
    test('retorna PokemonEntity con description y category del species', () async {
      final pokemonModel = _makePokemonModel();
      final species = _makeSpecies();

      when(() => dataSource.getPokemonDetail('bulbasaur'))
          .thenAnswer((_) async => pokemonModel);
      when(() => dataSource.getPokemonSpecies('bulbasaur'))
          .thenAnswer((_) async => species);

      final result = await repository.getPokemonDetail('bulbasaur');

      expect(result.isRight, isTrue);
      final entity = result.getOrNull()!;
      expect(entity.name, 'bulbasaur');
      expect(entity.description, contains('strange seed'));
      expect(entity.category, 'Seed Pokémon');
      expect(entity.types.map((t) => t.name), containsAll(['grass', 'poison']));
    });

    test('solo mapea habilidades no ocultas', () async {
      when(() => dataSource.getPokemonDetail('bulbasaur'))
          .thenAnswer((_) async => _makePokemonModel());
      when(() => dataSource.getPokemonSpecies('bulbasaur'))
          .thenAnswer((_) async => _makeSpecies());

      final result = await repository.getPokemonDetail('bulbasaur');
      final entity = result.getOrNull()!;

      expect(entity.abilities, contains('overgrow'));
      expect(entity.abilities, isNot(contains('chlorophyll'))); // es hidden
    });

    test('funciona sin species si el datasource de species falla', () async {
      when(() => dataSource.getPokemonDetail('bulbasaur'))
          .thenAnswer((_) async => _makePokemonModel());
      when(() => dataSource.getPokemonSpecies('bulbasaur'))
          .thenThrow(Exception('Species not found'));

      final result = await repository.getPokemonDetail('bulbasaur');

      expect(result.isRight, isTrue);
      final entity = result.getOrNull()!;
      expect(entity.description, isEmpty);
      expect(entity.category, isEmpty);
    });

    test('usa imageUrl del artwork oficial si está disponible', () async {
      final modelWithArtwork = PokemonModel(
        id: 1,
        name: 'bulbasaur',
        height: 7,
        weight: 69,
        sprites: const SpritesModel(
          frontDefault: 'https://example.com/front.png',
          other: OtherSpritesModel(
            officialArtwork: OfficialArtworkModel(
              frontDefault: 'https://example.com/artwork.png',
            ),
          ),
        ),
        types: const [],
        stats: const [],
        abilities: const [],
      );

      when(() => dataSource.getPokemonDetail('bulbasaur'))
          .thenAnswer((_) async => modelWithArtwork);
      when(() => dataSource.getPokemonSpecies('bulbasaur'))
          .thenAnswer((_) async => _makeSpecies());

      final result = await repository.getPokemonDetail('bulbasaur');
      expect(result.getOrNull()?.imageUrl, 'https://example.com/artwork.png');
    });

    test('retorna Failure si el datasource lanza excepción', () async {
      when(() => dataSource.getPokemonDetail('unknownmon'))
          .thenThrow(Exception('Not found'));
      when(() => dataSource.getPokemonSpecies('unknownmon'))
          .thenThrow(Exception('Not found'));

      final result = await repository.getPokemonDetail('unknownmon');

      expect(result.isLeft, isTrue);
    });
  });

  // ── getTypeWeaknesses ──────────────────────────────────────────────────────
  group('PokemonRepositoryImpl.getTypeWeaknesses', () {
    test('retorna PokemonTypeWeaknessEntity con debilidades mapeadas', () async {
      when(() => dataSource.getPokemonTypeWeaknesses('grass'))
          .thenAnswer((_) async => _makeTypeDamage());

      final result = await repository.getTypeWeaknesses('grass');

      expect(result.isRight, isTrue);
      final entity = result.getOrNull()!;
      expect(entity.typeName, 'grass');
      expect(entity.doubleDamageFrom, containsAll(['fire', 'ice']));
      expect(entity.halfDamageFrom, contains('water'));
      expect(entity.noDamageFrom, isEmpty);
    });

    test('retorna Failure si el datasource lanza excepción', () async {
      when(() => dataSource.getPokemonTypeWeaknesses('badtype'))
          .thenThrow(Exception('Type not found'));

      final result = await repository.getTypeWeaknesses('badtype');

      expect(result.isLeft, isTrue);
    });
  });
}

