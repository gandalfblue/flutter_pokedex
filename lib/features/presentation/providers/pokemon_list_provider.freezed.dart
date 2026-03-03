// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonListState {
  List<PokemonEntity> get pokemons => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListStateCopyWith<PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res, PokemonListState>;
  @useResult
  $Res call(
      {List<PokemonEntity> pokemons,
      bool isLoading,
      bool isLoadingMore,
      bool hasNextPage,
      int currentOffset,
      String? errorMessage});
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res, $Val extends PokemonListState>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasNextPage = null,
    Object? currentOffset = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListStateImplCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$$PokemonListStateImplCopyWith(_$PokemonListStateImpl value,
          $Res Function(_$PokemonListStateImpl) then) =
      __$$PokemonListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PokemonEntity> pokemons,
      bool isLoading,
      bool isLoadingMore,
      bool hasNextPage,
      int currentOffset,
      String? errorMessage});
}

/// @nodoc
class __$$PokemonListStateImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListStateImpl>
    implements _$$PokemonListStateImplCopyWith<$Res> {
  __$$PokemonListStateImplCopyWithImpl(_$PokemonListStateImpl _value,
      $Res Function(_$PokemonListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasNextPage = null,
    Object? currentOffset = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$PokemonListStateImpl(
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PokemonListStateImpl implements _PokemonListState {
  const _$PokemonListStateImpl(
      {final List<PokemonEntity> pokemons = const [],
      this.isLoading = false,
      this.isLoadingMore = false,
      this.hasNextPage = true,
      this.currentOffset = 0,
      this.errorMessage})
      : _pokemons = pokemons;

  final List<PokemonEntity> _pokemons;
  @override
  @JsonKey()
  List<PokemonEntity> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PokemonListState(pokemons: $pokemons, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasNextPage: $hasNextPage, currentOffset: $currentOffset, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListStateImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pokemons),
      isLoading,
      isLoadingMore,
      hasNextPage,
      currentOffset,
      errorMessage);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListStateImplCopyWith<_$PokemonListStateImpl> get copyWith =>
      __$$PokemonListStateImplCopyWithImpl<_$PokemonListStateImpl>(
          this, _$identity);
}

abstract class _PokemonListState implements PokemonListState {
  const factory _PokemonListState(
      {final List<PokemonEntity> pokemons,
      final bool isLoading,
      final bool isLoadingMore,
      final bool hasNextPage,
      final int currentOffset,
      final String? errorMessage}) = _$PokemonListStateImpl;

  @override
  List<PokemonEntity> get pokemons;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get hasNextPage;
  @override
  int get currentOffset;
  @override
  String? get errorMessage;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListStateImplCopyWith<_$PokemonListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
