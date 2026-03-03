// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonListEntity {
  int get count => throw _privateConstructorUsedError;
  List<PokemonEntity> get pokemons => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListEntityCopyWith<PokemonListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListEntityCopyWith<$Res> {
  factory $PokemonListEntityCopyWith(
          PokemonListEntity value, $Res Function(PokemonListEntity) then) =
      _$PokemonListEntityCopyWithImpl<$Res, PokemonListEntity>;
  @useResult
  $Res call({int count, List<PokemonEntity> pokemons, bool hasNextPage});
}

/// @nodoc
class _$PokemonListEntityCopyWithImpl<$Res, $Val extends PokemonListEntity>
    implements $PokemonListEntityCopyWith<$Res> {
  _$PokemonListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pokemons = null,
    Object? hasNextPage = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonEntity>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListEntityImplCopyWith<$Res>
    implements $PokemonListEntityCopyWith<$Res> {
  factory _$$PokemonListEntityImplCopyWith(_$PokemonListEntityImpl value,
          $Res Function(_$PokemonListEntityImpl) then) =
      __$$PokemonListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<PokemonEntity> pokemons, bool hasNextPage});
}

/// @nodoc
class __$$PokemonListEntityImplCopyWithImpl<$Res>
    extends _$PokemonListEntityCopyWithImpl<$Res, _$PokemonListEntityImpl>
    implements _$$PokemonListEntityImplCopyWith<$Res> {
  __$$PokemonListEntityImplCopyWithImpl(_$PokemonListEntityImpl _value,
      $Res Function(_$PokemonListEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pokemons = null,
    Object? hasNextPage = null,
  }) {
    return _then(_$PokemonListEntityImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonEntity>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PokemonListEntityImpl implements _PokemonListEntity {
  const _$PokemonListEntityImpl(
      {required this.count,
      required final List<PokemonEntity> pokemons,
      required this.hasNextPage})
      : _pokemons = pokemons;

  @override
  final int count;
  final List<PokemonEntity> _pokemons;
  @override
  List<PokemonEntity> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  final bool hasNextPage;

  @override
  String toString() {
    return 'PokemonListEntity(count: $count, pokemons: $pokemons, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListEntityImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count,
      const DeepCollectionEquality().hash(_pokemons), hasNextPage);

  /// Create a copy of PokemonListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListEntityImplCopyWith<_$PokemonListEntityImpl> get copyWith =>
      __$$PokemonListEntityImplCopyWithImpl<_$PokemonListEntityImpl>(
          this, _$identity);
}

abstract class _PokemonListEntity implements PokemonListEntity {
  const factory _PokemonListEntity(
      {required final int count,
      required final List<PokemonEntity> pokemons,
      required final bool hasNextPage}) = _$PokemonListEntityImpl;

  @override
  int get count;
  @override
  List<PokemonEntity> get pokemons;
  @override
  bool get hasNextPage;

  /// Create a copy of PokemonListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListEntityImplCopyWith<_$PokemonListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
