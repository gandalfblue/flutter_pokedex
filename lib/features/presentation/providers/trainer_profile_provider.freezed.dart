// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_profile_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrainerProfile {
  String get name => throw _privateConstructorUsedError;
  String get avatarAsset => throw _privateConstructorUsedError;
  int get totalCaptured => throw _privateConstructorUsedError;
  int get totalFavorites => throw _privateConstructorUsedError;
  String? get favoriteType => throw _privateConstructorUsedError;
  int get trainerLevel => throw _privateConstructorUsedError;
  int get pokemonViewed => throw _privateConstructorUsedError;

  /// Create a copy of TrainerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerProfileCopyWith<TrainerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerProfileCopyWith<$Res> {
  factory $TrainerProfileCopyWith(
          TrainerProfile value, $Res Function(TrainerProfile) then) =
      _$TrainerProfileCopyWithImpl<$Res, TrainerProfile>;
  @useResult
  $Res call(
      {String name,
      String avatarAsset,
      int totalCaptured,
      int totalFavorites,
      String? favoriteType,
      int trainerLevel,
      int pokemonViewed});
}

/// @nodoc
class _$TrainerProfileCopyWithImpl<$Res, $Val extends TrainerProfile>
    implements $TrainerProfileCopyWith<$Res> {
  _$TrainerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarAsset = null,
    Object? totalCaptured = null,
    Object? totalFavorites = null,
    Object? favoriteType = freezed,
    Object? trainerLevel = null,
    Object? pokemonViewed = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarAsset: null == avatarAsset
          ? _value.avatarAsset
          : avatarAsset // ignore: cast_nullable_to_non_nullable
              as String,
      totalCaptured: null == totalCaptured
          ? _value.totalCaptured
          : totalCaptured // ignore: cast_nullable_to_non_nullable
              as int,
      totalFavorites: null == totalFavorites
          ? _value.totalFavorites
          : totalFavorites // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteType: freezed == favoriteType
          ? _value.favoriteType
          : favoriteType // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerLevel: null == trainerLevel
          ? _value.trainerLevel
          : trainerLevel // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonViewed: null == pokemonViewed
          ? _value.pokemonViewed
          : pokemonViewed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainerProfileImplCopyWith<$Res>
    implements $TrainerProfileCopyWith<$Res> {
  factory _$$TrainerProfileImplCopyWith(_$TrainerProfileImpl value,
          $Res Function(_$TrainerProfileImpl) then) =
      __$$TrainerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String avatarAsset,
      int totalCaptured,
      int totalFavorites,
      String? favoriteType,
      int trainerLevel,
      int pokemonViewed});
}

/// @nodoc
class __$$TrainerProfileImplCopyWithImpl<$Res>
    extends _$TrainerProfileCopyWithImpl<$Res, _$TrainerProfileImpl>
    implements _$$TrainerProfileImplCopyWith<$Res> {
  __$$TrainerProfileImplCopyWithImpl(
      _$TrainerProfileImpl _value, $Res Function(_$TrainerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarAsset = null,
    Object? totalCaptured = null,
    Object? totalFavorites = null,
    Object? favoriteType = freezed,
    Object? trainerLevel = null,
    Object? pokemonViewed = null,
  }) {
    return _then(_$TrainerProfileImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarAsset: null == avatarAsset
          ? _value.avatarAsset
          : avatarAsset // ignore: cast_nullable_to_non_nullable
              as String,
      totalCaptured: null == totalCaptured
          ? _value.totalCaptured
          : totalCaptured // ignore: cast_nullable_to_non_nullable
              as int,
      totalFavorites: null == totalFavorites
          ? _value.totalFavorites
          : totalFavorites // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteType: freezed == favoriteType
          ? _value.favoriteType
          : favoriteType // ignore: cast_nullable_to_non_nullable
              as String?,
      trainerLevel: null == trainerLevel
          ? _value.trainerLevel
          : trainerLevel // ignore: cast_nullable_to_non_nullable
              as int,
      pokemonViewed: null == pokemonViewed
          ? _value.pokemonViewed
          : pokemonViewed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TrainerProfileImpl implements _TrainerProfile {
  const _$TrainerProfileImpl(
      {this.name = 'Entrenador',
      this.avatarAsset = 'assets/images/entrenador.png',
      this.totalCaptured = 0,
      this.totalFavorites = 0,
      this.favoriteType = null,
      this.trainerLevel = 1,
      this.pokemonViewed = 0});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String avatarAsset;
  @override
  @JsonKey()
  final int totalCaptured;
  @override
  @JsonKey()
  final int totalFavorites;
  @override
  @JsonKey()
  final String? favoriteType;
  @override
  @JsonKey()
  final int trainerLevel;
  @override
  @JsonKey()
  final int pokemonViewed;

  @override
  String toString() {
    return 'TrainerProfile(name: $name, avatarAsset: $avatarAsset, totalCaptured: $totalCaptured, totalFavorites: $totalFavorites, favoriteType: $favoriteType, trainerLevel: $trainerLevel, pokemonViewed: $pokemonViewed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarAsset, avatarAsset) ||
                other.avatarAsset == avatarAsset) &&
            (identical(other.totalCaptured, totalCaptured) ||
                other.totalCaptured == totalCaptured) &&
            (identical(other.totalFavorites, totalFavorites) ||
                other.totalFavorites == totalFavorites) &&
            (identical(other.favoriteType, favoriteType) ||
                other.favoriteType == favoriteType) &&
            (identical(other.trainerLevel, trainerLevel) ||
                other.trainerLevel == trainerLevel) &&
            (identical(other.pokemonViewed, pokemonViewed) ||
                other.pokemonViewed == pokemonViewed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, avatarAsset, totalCaptured,
      totalFavorites, favoriteType, trainerLevel, pokemonViewed);

  /// Create a copy of TrainerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerProfileImplCopyWith<_$TrainerProfileImpl> get copyWith =>
      __$$TrainerProfileImplCopyWithImpl<_$TrainerProfileImpl>(
          this, _$identity);
}

abstract class _TrainerProfile implements TrainerProfile {
  const factory _TrainerProfile(
      {final String name,
      final String avatarAsset,
      final int totalCaptured,
      final int totalFavorites,
      final String? favoriteType,
      final int trainerLevel,
      final int pokemonViewed}) = _$TrainerProfileImpl;

  @override
  String get name;
  @override
  String get avatarAsset;
  @override
  int get totalCaptured;
  @override
  int get totalFavorites;
  @override
  String? get favoriteType;
  @override
  int get trainerLevel;
  @override
  int get pokemonViewed;

  /// Create a copy of TrainerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerProfileImplCopyWith<_$TrainerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
