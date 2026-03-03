// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonTypeEntity {
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeEntityCopyWith<PokemonTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeEntityCopyWith<$Res> {
  factory $PokemonTypeEntityCopyWith(
          PokemonTypeEntity value, $Res Function(PokemonTypeEntity) then) =
      _$PokemonTypeEntityCopyWithImpl<$Res, PokemonTypeEntity>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PokemonTypeEntityCopyWithImpl<$Res, $Val extends PokemonTypeEntity>
    implements $PokemonTypeEntityCopyWith<$Res> {
  _$PokemonTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonTypeEntityImplCopyWith<$Res>
    implements $PokemonTypeEntityCopyWith<$Res> {
  factory _$$PokemonTypeEntityImplCopyWith(_$PokemonTypeEntityImpl value,
          $Res Function(_$PokemonTypeEntityImpl) then) =
      __$$PokemonTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PokemonTypeEntityImplCopyWithImpl<$Res>
    extends _$PokemonTypeEntityCopyWithImpl<$Res, _$PokemonTypeEntityImpl>
    implements _$$PokemonTypeEntityImplCopyWith<$Res> {
  __$$PokemonTypeEntityImplCopyWithImpl(_$PokemonTypeEntityImpl _value,
      $Res Function(_$PokemonTypeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PokemonTypeEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PokemonTypeEntityImpl implements _PokemonTypeEntity {
  const _$PokemonTypeEntityImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'PokemonTypeEntity(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeEntityImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PokemonTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeEntityImplCopyWith<_$PokemonTypeEntityImpl> get copyWith =>
      __$$PokemonTypeEntityImplCopyWithImpl<_$PokemonTypeEntityImpl>(
          this, _$identity);
}

abstract class _PokemonTypeEntity implements PokemonTypeEntity {
  const factory _PokemonTypeEntity({required final String name}) =
      _$PokemonTypeEntityImpl;

  @override
  String get name;

  /// Create a copy of PokemonTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeEntityImplCopyWith<_$PokemonTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
