// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonListResponseModel _$PokemonListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonListResponseModel {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PokemonSummaryModel> get results => throw _privateConstructorUsedError;

  /// Serializes this PokemonListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListResponseModelCopyWith<PokemonListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListResponseModelCopyWith<$Res> {
  factory $PokemonListResponseModelCopyWith(PokemonListResponseModel value,
          $Res Function(PokemonListResponseModel) then) =
      _$PokemonListResponseModelCopyWithImpl<$Res, PokemonListResponseModel>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PokemonSummaryModel> results});
}

/// @nodoc
class _$PokemonListResponseModelCopyWithImpl<$Res,
        $Val extends PokemonListResponseModel>
    implements $PokemonListResponseModelCopyWith<$Res> {
  _$PokemonListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonSummaryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListResponseModelImplCopyWith<$Res>
    implements $PokemonListResponseModelCopyWith<$Res> {
  factory _$$PokemonListResponseModelImplCopyWith(
          _$PokemonListResponseModelImpl value,
          $Res Function(_$PokemonListResponseModelImpl) then) =
      __$$PokemonListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<PokemonSummaryModel> results});
}

/// @nodoc
class __$$PokemonListResponseModelImplCopyWithImpl<$Res>
    extends _$PokemonListResponseModelCopyWithImpl<$Res,
        _$PokemonListResponseModelImpl>
    implements _$$PokemonListResponseModelImplCopyWith<$Res> {
  __$$PokemonListResponseModelImplCopyWithImpl(
      _$PokemonListResponseModelImpl _value,
      $Res Function(_$PokemonListResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PokemonListResponseModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonSummaryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListResponseModelImpl implements _PokemonListResponseModel {
  const _$PokemonListResponseModelImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<PokemonSummaryModel> results})
      : _results = results;

  factory _$PokemonListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListResponseModelImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PokemonSummaryModel> _results;
  @override
  List<PokemonSummaryModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonListResponseModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListResponseModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListResponseModelImplCopyWith<_$PokemonListResponseModelImpl>
      get copyWith => __$$PokemonListResponseModelImplCopyWithImpl<
          _$PokemonListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonListResponseModel implements PokemonListResponseModel {
  const factory _PokemonListResponseModel(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<PokemonSummaryModel> results}) =
      _$PokemonListResponseModelImpl;

  factory _PokemonListResponseModel.fromJson(Map<String, dynamic> json) =
      _$PokemonListResponseModelImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PokemonSummaryModel> get results;

  /// Create a copy of PokemonListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListResponseModelImplCopyWith<_$PokemonListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
