// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonSummaryModel _$PokemonSummaryModelFromJson(Map<String, dynamic> json) {
  return _PokemonSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonSummaryModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSummaryModelCopyWith<PokemonSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSummaryModelCopyWith<$Res> {
  factory $PokemonSummaryModelCopyWith(
          PokemonSummaryModel value, $Res Function(PokemonSummaryModel) then) =
      _$PokemonSummaryModelCopyWithImpl<$Res, PokemonSummaryModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonSummaryModelCopyWithImpl<$Res, $Val extends PokemonSummaryModel>
    implements $PokemonSummaryModelCopyWith<$Res> {
  _$PokemonSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSummaryModelImplCopyWith<$Res>
    implements $PokemonSummaryModelCopyWith<$Res> {
  factory _$$PokemonSummaryModelImplCopyWith(_$PokemonSummaryModelImpl value,
          $Res Function(_$PokemonSummaryModelImpl) then) =
      __$$PokemonSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonSummaryModelImplCopyWithImpl<$Res>
    extends _$PokemonSummaryModelCopyWithImpl<$Res, _$PokemonSummaryModelImpl>
    implements _$$PokemonSummaryModelImplCopyWith<$Res> {
  __$$PokemonSummaryModelImplCopyWithImpl(_$PokemonSummaryModelImpl _value,
      $Res Function(_$PokemonSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonSummaryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSummaryModelImpl implements _PokemonSummaryModel {
  const _$PokemonSummaryModelImpl({required this.name, required this.url});

  factory _$PokemonSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSummaryModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonSummaryModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSummaryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSummaryModelImplCopyWith<_$PokemonSummaryModelImpl> get copyWith =>
      __$$PokemonSummaryModelImplCopyWithImpl<_$PokemonSummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonSummaryModel implements PokemonSummaryModel {
  const factory _PokemonSummaryModel(
      {required final String name,
      required final String url}) = _$PokemonSummaryModelImpl;

  factory _PokemonSummaryModel.fromJson(Map<String, dynamic> json) =
      _$PokemonSummaryModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSummaryModelImplCopyWith<_$PokemonSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
