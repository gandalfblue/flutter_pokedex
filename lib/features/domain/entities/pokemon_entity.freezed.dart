// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<PokemonTypeEntity> get types => throw _privateConstructorUsedError;
  List<PokemonStatEntity> get stats => throw _privateConstructorUsedError;
  List<String> get abilities => throw _privateConstructorUsedError;

  /// Descripción (Pokédex entry) en español o inglés.
  String get description => throw _privateConstructorUsedError;

  /// Categoría del Pokémon (ej. "Seed Pokémon").
  String get category => throw _privateConstructorUsedError;

  /// Create a copy of PokemonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonEntityCopyWith<PokemonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonEntityCopyWith<$Res> {
  factory $PokemonEntityCopyWith(
          PokemonEntity value, $Res Function(PokemonEntity) then) =
      _$PokemonEntityCopyWithImpl<$Res, PokemonEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      String imageUrl,
      List<PokemonTypeEntity> types,
      List<PokemonStatEntity> stats,
      List<String> abilities,
      String description,
      String category});
}

/// @nodoc
class _$PokemonEntityCopyWithImpl<$Res, $Val extends PokemonEntity>
    implements $PokemonEntityCopyWith<$Res> {
  _$PokemonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? imageUrl = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeEntity>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatEntity>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonEntityImplCopyWith<$Res>
    implements $PokemonEntityCopyWith<$Res> {
  factory _$$PokemonEntityImplCopyWith(
          _$PokemonEntityImpl value, $Res Function(_$PokemonEntityImpl) then) =
      __$$PokemonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      String imageUrl,
      List<PokemonTypeEntity> types,
      List<PokemonStatEntity> stats,
      List<String> abilities,
      String description,
      String category});
}

/// @nodoc
class __$$PokemonEntityImplCopyWithImpl<$Res>
    extends _$PokemonEntityCopyWithImpl<$Res, _$PokemonEntityImpl>
    implements _$$PokemonEntityImplCopyWith<$Res> {
  __$$PokemonEntityImplCopyWithImpl(
      _$PokemonEntityImpl _value, $Res Function(_$PokemonEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? imageUrl = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_$PokemonEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeEntity>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatEntity>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PokemonEntityImpl implements _PokemonEntity {
  const _$PokemonEntityImpl(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.imageUrl,
      required final List<PokemonTypeEntity> types,
      required final List<PokemonStatEntity> stats,
      required final List<String> abilities,
      this.description = '',
      this.category = ''})
      : _types = types,
        _stats = stats,
        _abilities = abilities;

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  final String imageUrl;
  final List<PokemonTypeEntity> _types;
  @override
  List<PokemonTypeEntity> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonStatEntity> _stats;
  @override
  List<PokemonStatEntity> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<String> _abilities;
  @override
  List<String> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  /// Descripción (Pokédex entry) en español o inglés.
  @override
  @JsonKey()
  final String description;

  /// Categoría del Pokémon (ej. "Seed Pokémon").
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'PokemonEntity(id: $id, name: $name, height: $height, weight: $weight, imageUrl: $imageUrl, types: $types, stats: $stats, abilities: $abilities, description: $description, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      imageUrl,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_abilities),
      description,
      category);

  /// Create a copy of PokemonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonEntityImplCopyWith<_$PokemonEntityImpl> get copyWith =>
      __$$PokemonEntityImplCopyWithImpl<_$PokemonEntityImpl>(this, _$identity);
}

abstract class _PokemonEntity implements PokemonEntity {
  const factory _PokemonEntity(
      {required final int id,
      required final String name,
      required final int height,
      required final int weight,
      required final String imageUrl,
      required final List<PokemonTypeEntity> types,
      required final List<PokemonStatEntity> stats,
      required final List<String> abilities,
      final String description,
      final String category}) = _$PokemonEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  String get imageUrl;
  @override
  List<PokemonTypeEntity> get types;
  @override
  List<PokemonStatEntity> get stats;
  @override
  List<String> get abilities;

  /// Descripción (Pokédex entry) en español o inglés.
  @override
  String get description;

  /// Categoría del Pokémon (ej. "Seed Pokémon").
  @override
  String get category;

  /// Create a copy of PokemonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonEntityImplCopyWith<_$PokemonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
