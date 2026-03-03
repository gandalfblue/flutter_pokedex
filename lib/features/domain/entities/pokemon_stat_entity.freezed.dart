// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_stat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonStatEntity {
  String get name => throw _privateConstructorUsedError;
  int get baseStat => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatEntityCopyWith<PokemonStatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatEntityCopyWith<$Res> {
  factory $PokemonStatEntityCopyWith(
          PokemonStatEntity value, $Res Function(PokemonStatEntity) then) =
      _$PokemonStatEntityCopyWithImpl<$Res, PokemonStatEntity>;
  @useResult
  $Res call({String name, int baseStat});
}

/// @nodoc
class _$PokemonStatEntityCopyWithImpl<$Res, $Val extends PokemonStatEntity>
    implements $PokemonStatEntityCopyWith<$Res> {
  _$PokemonStatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? baseStat = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStatEntityImplCopyWith<$Res>
    implements $PokemonStatEntityCopyWith<$Res> {
  factory _$$PokemonStatEntityImplCopyWith(_$PokemonStatEntityImpl value,
          $Res Function(_$PokemonStatEntityImpl) then) =
      __$$PokemonStatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int baseStat});
}

/// @nodoc
class __$$PokemonStatEntityImplCopyWithImpl<$Res>
    extends _$PokemonStatEntityCopyWithImpl<$Res, _$PokemonStatEntityImpl>
    implements _$$PokemonStatEntityImplCopyWith<$Res> {
  __$$PokemonStatEntityImplCopyWithImpl(_$PokemonStatEntityImpl _value,
      $Res Function(_$PokemonStatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? baseStat = null,
  }) {
    return _then(_$PokemonStatEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PokemonStatEntityImpl implements _PokemonStatEntity {
  const _$PokemonStatEntityImpl({required this.name, required this.baseStat});

  @override
  final String name;
  @override
  final int baseStat;

  @override
  String toString() {
    return 'PokemonStatEntity(name: $name, baseStat: $baseStat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, baseStat);

  /// Create a copy of PokemonStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatEntityImplCopyWith<_$PokemonStatEntityImpl> get copyWith =>
      __$$PokemonStatEntityImplCopyWithImpl<_$PokemonStatEntityImpl>(
          this, _$identity);
}

abstract class _PokemonStatEntity implements PokemonStatEntity {
  const factory _PokemonStatEntity(
      {required final String name,
      required final int baseStat}) = _$PokemonStatEntityImpl;

  @override
  String get name;
  @override
  int get baseStat;

  /// Create a copy of PokemonStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatEntityImplCopyWith<_$PokemonStatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
