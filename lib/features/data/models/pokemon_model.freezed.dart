// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return _PokemonModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  SpritesModel get sprites => throw _privateConstructorUsedError;
  List<PokemonTypeSlotModel> get types => throw _privateConstructorUsedError;
  List<PokemonStatSlotModel> get stats => throw _privateConstructorUsedError;
  List<PokemonAbilitySlotModel> get abilities =>
      throw _privateConstructorUsedError;

  /// Serializes this PokemonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonModelCopyWith<PokemonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonModelCopyWith<$Res> {
  factory $PokemonModelCopyWith(
          PokemonModel value, $Res Function(PokemonModel) then) =
      _$PokemonModelCopyWithImpl<$Res, PokemonModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      SpritesModel sprites,
      List<PokemonTypeSlotModel> types,
      List<PokemonStatSlotModel> stats,
      List<PokemonAbilitySlotModel> abilities});

  $SpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonModelCopyWithImpl<$Res, $Val extends PokemonModel>
    implements $PokemonModelCopyWith<$Res> {
  _$PokemonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? sprites = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
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
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as SpritesModel,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlotModel>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlotModel>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlotModel>,
    ) as $Val);
  }

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpritesModelCopyWith<$Res> get sprites {
    return $SpritesModelCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonModelImplCopyWith<$Res>
    implements $PokemonModelCopyWith<$Res> {
  factory _$$PokemonModelImplCopyWith(
          _$PokemonModelImpl value, $Res Function(_$PokemonModelImpl) then) =
      __$$PokemonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int height,
      int weight,
      SpritesModel sprites,
      List<PokemonTypeSlotModel> types,
      List<PokemonStatSlotModel> stats,
      List<PokemonAbilitySlotModel> abilities});

  @override
  $SpritesModelCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonModelImplCopyWithImpl<$Res>
    extends _$PokemonModelCopyWithImpl<$Res, _$PokemonModelImpl>
    implements _$$PokemonModelImplCopyWith<$Res> {
  __$$PokemonModelImplCopyWithImpl(
      _$PokemonModelImpl _value, $Res Function(_$PokemonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? sprites = null,
    Object? types = null,
    Object? stats = null,
    Object? abilities = null,
  }) {
    return _then(_$PokemonModelImpl(
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
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as SpritesModel,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeSlotModel>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokemonStatSlotModel>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PokemonAbilitySlotModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonModelImpl implements _PokemonModel {
  const _$PokemonModelImpl(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.sprites,
      required final List<PokemonTypeSlotModel> types,
      required final List<PokemonStatSlotModel> stats,
      required final List<PokemonAbilitySlotModel> abilities})
      : _types = types,
        _stats = stats,
        _abilities = abilities;

  factory _$PokemonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  final SpritesModel sprites;
  final List<PokemonTypeSlotModel> _types;
  @override
  List<PokemonTypeSlotModel> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonStatSlotModel> _stats;
  @override
  List<PokemonStatSlotModel> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<PokemonAbilitySlotModel> _abilities;
  @override
  List<PokemonAbilitySlotModel> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, height: $height, weight: $weight, sprites: $sprites, types: $types, stats: $stats, abilities: $abilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.sprites, sprites) || other.sprites == sprites) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      height,
      weight,
      sprites,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_abilities));

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      __$$PokemonModelImplCopyWithImpl<_$PokemonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonModel implements PokemonModel {
  const factory _PokemonModel(
          {required final int id,
          required final String name,
          required final int height,
          required final int weight,
          required final SpritesModel sprites,
          required final List<PokemonTypeSlotModel> types,
          required final List<PokemonStatSlotModel> stats,
          required final List<PokemonAbilitySlotModel> abilities}) =
      _$PokemonModelImpl;

  factory _PokemonModel.fromJson(Map<String, dynamic> json) =
      _$PokemonModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  SpritesModel get sprites;
  @override
  List<PokemonTypeSlotModel> get types;
  @override
  List<PokemonStatSlotModel> get stats;
  @override
  List<PokemonAbilitySlotModel> get abilities;

  /// Create a copy of PokemonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpritesModel _$SpritesModelFromJson(Map<String, dynamic> json) {
  return _SpritesModel.fromJson(json);
}

/// @nodoc
mixin _$SpritesModel {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;
  OtherSpritesModel? get other => throw _privateConstructorUsedError;

  /// Serializes this SpritesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpritesModelCopyWith<SpritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpritesModelCopyWith<$Res> {
  factory $SpritesModelCopyWith(
          SpritesModel value, $Res Function(SpritesModel) then) =
      _$SpritesModelCopyWithImpl<$Res, SpritesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      OtherSpritesModel? other});

  $OtherSpritesModelCopyWith<$Res>? get other;
}

/// @nodoc
class _$SpritesModelCopyWithImpl<$Res, $Val extends SpritesModel>
    implements $SpritesModelCopyWith<$Res> {
  _$SpritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as OtherSpritesModel?,
    ) as $Val);
  }

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtherSpritesModelCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $OtherSpritesModelCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpritesModelImplCopyWith<$Res>
    implements $SpritesModelCopyWith<$Res> {
  factory _$$SpritesModelImplCopyWith(
          _$SpritesModelImpl value, $Res Function(_$SpritesModelImpl) then) =
      __$$SpritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'front_default') String? frontDefault,
      OtherSpritesModel? other});

  @override
  $OtherSpritesModelCopyWith<$Res>? get other;
}

/// @nodoc
class __$$SpritesModelImplCopyWithImpl<$Res>
    extends _$SpritesModelCopyWithImpl<$Res, _$SpritesModelImpl>
    implements _$$SpritesModelImplCopyWith<$Res> {
  __$$SpritesModelImplCopyWithImpl(
      _$SpritesModelImpl _value, $Res Function(_$SpritesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? other = freezed,
  }) {
    return _then(_$SpritesModelImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
      other: freezed == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as OtherSpritesModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpritesModelImpl implements _SpritesModel {
  const _$SpritesModelImpl(
      {@JsonKey(name: 'front_default') this.frontDefault, this.other});

  factory _$SpritesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpritesModelImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @override
  final OtherSpritesModel? other;

  @override
  String toString() {
    return 'SpritesModel(frontDefault: $frontDefault, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpritesModelImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault, other);

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpritesModelImplCopyWith<_$SpritesModelImpl> get copyWith =>
      __$$SpritesModelImplCopyWithImpl<_$SpritesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpritesModelImplToJson(
      this,
    );
  }
}

abstract class _SpritesModel implements SpritesModel {
  const factory _SpritesModel(
      {@JsonKey(name: 'front_default') final String? frontDefault,
      final OtherSpritesModel? other}) = _$SpritesModelImpl;

  factory _SpritesModel.fromJson(Map<String, dynamic> json) =
      _$SpritesModelImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;
  @override
  OtherSpritesModel? get other;

  /// Create a copy of SpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpritesModelImplCopyWith<_$SpritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherSpritesModel _$OtherSpritesModelFromJson(Map<String, dynamic> json) {
  return _OtherSpritesModel.fromJson(json);
}

/// @nodoc
mixin _$OtherSpritesModel {
  @JsonKey(name: 'official-artwork')
  OfficialArtworkModel? get officialArtwork =>
      throw _privateConstructorUsedError;

  /// Serializes this OtherSpritesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherSpritesModelCopyWith<OtherSpritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherSpritesModelCopyWith<$Res> {
  factory $OtherSpritesModelCopyWith(
          OtherSpritesModel value, $Res Function(OtherSpritesModel) then) =
      _$OtherSpritesModelCopyWithImpl<$Res, OtherSpritesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork')
      OfficialArtworkModel? officialArtwork});

  $OfficialArtworkModelCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class _$OtherSpritesModelCopyWithImpl<$Res, $Val extends OtherSpritesModel>
    implements $OtherSpritesModelCopyWith<$Res> {
  _$OtherSpritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_value.copyWith(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtworkModel?,
    ) as $Val);
  }

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfficialArtworkModelCopyWith<$Res>? get officialArtwork {
    if (_value.officialArtwork == null) {
      return null;
    }

    return $OfficialArtworkModelCopyWith<$Res>(_value.officialArtwork!,
        (value) {
      return _then(_value.copyWith(officialArtwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtherSpritesModelImplCopyWith<$Res>
    implements $OtherSpritesModelCopyWith<$Res> {
  factory _$$OtherSpritesModelImplCopyWith(_$OtherSpritesModelImpl value,
          $Res Function(_$OtherSpritesModelImpl) then) =
      __$$OtherSpritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork')
      OfficialArtworkModel? officialArtwork});

  @override
  $OfficialArtworkModelCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class __$$OtherSpritesModelImplCopyWithImpl<$Res>
    extends _$OtherSpritesModelCopyWithImpl<$Res, _$OtherSpritesModelImpl>
    implements _$$OtherSpritesModelImplCopyWith<$Res> {
  __$$OtherSpritesModelImplCopyWithImpl(_$OtherSpritesModelImpl _value,
      $Res Function(_$OtherSpritesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = freezed,
  }) {
    return _then(_$OtherSpritesModelImpl(
      officialArtwork: freezed == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as OfficialArtworkModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherSpritesModelImpl implements _OtherSpritesModel {
  const _$OtherSpritesModelImpl(
      {@JsonKey(name: 'official-artwork') this.officialArtwork});

  factory _$OtherSpritesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherSpritesModelImplFromJson(json);

  @override
  @JsonKey(name: 'official-artwork')
  final OfficialArtworkModel? officialArtwork;

  @override
  String toString() {
    return 'OtherSpritesModel(officialArtwork: $officialArtwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherSpritesModelImpl &&
            (identical(other.officialArtwork, officialArtwork) ||
                other.officialArtwork == officialArtwork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, officialArtwork);

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherSpritesModelImplCopyWith<_$OtherSpritesModelImpl> get copyWith =>
      __$$OtherSpritesModelImplCopyWithImpl<_$OtherSpritesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherSpritesModelImplToJson(
      this,
    );
  }
}

abstract class _OtherSpritesModel implements OtherSpritesModel {
  const factory _OtherSpritesModel(
      {@JsonKey(name: 'official-artwork')
      final OfficialArtworkModel? officialArtwork}) = _$OtherSpritesModelImpl;

  factory _OtherSpritesModel.fromJson(Map<String, dynamic> json) =
      _$OtherSpritesModelImpl.fromJson;

  @override
  @JsonKey(name: 'official-artwork')
  OfficialArtworkModel? get officialArtwork;

  /// Create a copy of OtherSpritesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherSpritesModelImplCopyWith<_$OtherSpritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficialArtworkModel _$OfficialArtworkModelFromJson(Map<String, dynamic> json) {
  return _OfficialArtworkModel.fromJson(json);
}

/// @nodoc
mixin _$OfficialArtworkModel {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;

  /// Serializes this OfficialArtworkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfficialArtworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfficialArtworkModelCopyWith<OfficialArtworkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficialArtworkModelCopyWith<$Res> {
  factory $OfficialArtworkModelCopyWith(OfficialArtworkModel value,
          $Res Function(OfficialArtworkModel) then) =
      _$OfficialArtworkModelCopyWithImpl<$Res, OfficialArtworkModel>;
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class _$OfficialArtworkModelCopyWithImpl<$Res,
        $Val extends OfficialArtworkModel>
    implements $OfficialArtworkModelCopyWith<$Res> {
  _$OfficialArtworkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfficialArtworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_value.copyWith(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficialArtworkModelImplCopyWith<$Res>
    implements $OfficialArtworkModelCopyWith<$Res> {
  factory _$$OfficialArtworkModelImplCopyWith(_$OfficialArtworkModelImpl value,
          $Res Function(_$OfficialArtworkModelImpl) then) =
      __$$OfficialArtworkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class __$$OfficialArtworkModelImplCopyWithImpl<$Res>
    extends _$OfficialArtworkModelCopyWithImpl<$Res, _$OfficialArtworkModelImpl>
    implements _$$OfficialArtworkModelImplCopyWith<$Res> {
  __$$OfficialArtworkModelImplCopyWithImpl(_$OfficialArtworkModelImpl _value,
      $Res Function(_$OfficialArtworkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfficialArtworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
  }) {
    return _then(_$OfficialArtworkModelImpl(
      frontDefault: freezed == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficialArtworkModelImpl implements _OfficialArtworkModel {
  const _$OfficialArtworkModelImpl(
      {@JsonKey(name: 'front_default') this.frontDefault});

  factory _$OfficialArtworkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficialArtworkModelImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @override
  String toString() {
    return 'OfficialArtworkModel(frontDefault: $frontDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficialArtworkModelImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault);

  /// Create a copy of OfficialArtworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficialArtworkModelImplCopyWith<_$OfficialArtworkModelImpl>
      get copyWith =>
          __$$OfficialArtworkModelImplCopyWithImpl<_$OfficialArtworkModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficialArtworkModelImplToJson(
      this,
    );
  }
}

abstract class _OfficialArtworkModel implements OfficialArtworkModel {
  const factory _OfficialArtworkModel(
          {@JsonKey(name: 'front_default') final String? frontDefault}) =
      _$OfficialArtworkModelImpl;

  factory _OfficialArtworkModel.fromJson(Map<String, dynamic> json) =
      _$OfficialArtworkModelImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;

  /// Create a copy of OfficialArtworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfficialArtworkModelImplCopyWith<_$OfficialArtworkModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonTypeSlotModel _$PokemonTypeSlotModelFromJson(Map<String, dynamic> json) {
  return _PokemonTypeSlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeSlotModel {
  int get slot => throw _privateConstructorUsedError;
  PokemonTypeInfoModel get type => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeSlotModelCopyWith<PokemonTypeSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeSlotModelCopyWith<$Res> {
  factory $PokemonTypeSlotModelCopyWith(PokemonTypeSlotModel value,
          $Res Function(PokemonTypeSlotModel) then) =
      _$PokemonTypeSlotModelCopyWithImpl<$Res, PokemonTypeSlotModel>;
  @useResult
  $Res call({int slot, PokemonTypeInfoModel type});

  $PokemonTypeInfoModelCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypeSlotModelCopyWithImpl<$Res,
        $Val extends PokemonTypeSlotModel>
    implements $PokemonTypeSlotModelCopyWith<$Res> {
  _$PokemonTypeSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonTypeInfoModel,
    ) as $Val);
  }

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonTypeInfoModelCopyWith<$Res> get type {
    return $PokemonTypeInfoModelCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeSlotModelImplCopyWith<$Res>
    implements $PokemonTypeSlotModelCopyWith<$Res> {
  factory _$$PokemonTypeSlotModelImplCopyWith(_$PokemonTypeSlotModelImpl value,
          $Res Function(_$PokemonTypeSlotModelImpl) then) =
      __$$PokemonTypeSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, PokemonTypeInfoModel type});

  @override
  $PokemonTypeInfoModelCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokemonTypeSlotModelImplCopyWithImpl<$Res>
    extends _$PokemonTypeSlotModelCopyWithImpl<$Res, _$PokemonTypeSlotModelImpl>
    implements _$$PokemonTypeSlotModelImplCopyWith<$Res> {
  __$$PokemonTypeSlotModelImplCopyWithImpl(_$PokemonTypeSlotModelImpl _value,
      $Res Function(_$PokemonTypeSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$PokemonTypeSlotModelImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokemonTypeInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeSlotModelImpl implements _PokemonTypeSlotModel {
  const _$PokemonTypeSlotModelImpl({required this.slot, required this.type});

  factory _$PokemonTypeSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeSlotModelImplFromJson(json);

  @override
  final int slot;
  @override
  final PokemonTypeInfoModel type;

  @override
  String toString() {
    return 'PokemonTypeSlotModel(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeSlotModelImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeSlotModelImplCopyWith<_$PokemonTypeSlotModelImpl>
      get copyWith =>
          __$$PokemonTypeSlotModelImplCopyWithImpl<_$PokemonTypeSlotModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeSlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeSlotModel implements PokemonTypeSlotModel {
  const factory _PokemonTypeSlotModel(
      {required final int slot,
      required final PokemonTypeInfoModel type}) = _$PokemonTypeSlotModelImpl;

  factory _PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeSlotModelImpl.fromJson;

  @override
  int get slot;
  @override
  PokemonTypeInfoModel get type;

  /// Create a copy of PokemonTypeSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeSlotModelImplCopyWith<_$PokemonTypeSlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonTypeInfoModel _$PokemonTypeInfoModelFromJson(Map<String, dynamic> json) {
  return _PokemonTypeInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeInfoModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeInfoModelCopyWith<PokemonTypeInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeInfoModelCopyWith<$Res> {
  factory $PokemonTypeInfoModelCopyWith(PokemonTypeInfoModel value,
          $Res Function(PokemonTypeInfoModel) then) =
      _$PokemonTypeInfoModelCopyWithImpl<$Res, PokemonTypeInfoModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonTypeInfoModelCopyWithImpl<$Res,
        $Val extends PokemonTypeInfoModel>
    implements $PokemonTypeInfoModelCopyWith<$Res> {
  _$PokemonTypeInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeInfoModel
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
abstract class _$$PokemonTypeInfoModelImplCopyWith<$Res>
    implements $PokemonTypeInfoModelCopyWith<$Res> {
  factory _$$PokemonTypeInfoModelImplCopyWith(_$PokemonTypeInfoModelImpl value,
          $Res Function(_$PokemonTypeInfoModelImpl) then) =
      __$$PokemonTypeInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonTypeInfoModelImplCopyWithImpl<$Res>
    extends _$PokemonTypeInfoModelCopyWithImpl<$Res, _$PokemonTypeInfoModelImpl>
    implements _$$PokemonTypeInfoModelImplCopyWith<$Res> {
  __$$PokemonTypeInfoModelImplCopyWithImpl(_$PokemonTypeInfoModelImpl _value,
      $Res Function(_$PokemonTypeInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonTypeInfoModelImpl(
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
class _$PokemonTypeInfoModelImpl implements _PokemonTypeInfoModel {
  const _$PokemonTypeInfoModelImpl({required this.name, required this.url});

  factory _$PokemonTypeInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeInfoModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonTypeInfoModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeInfoModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonTypeInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeInfoModelImplCopyWith<_$PokemonTypeInfoModelImpl>
      get copyWith =>
          __$$PokemonTypeInfoModelImplCopyWithImpl<_$PokemonTypeInfoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeInfoModel implements PokemonTypeInfoModel {
  const factory _PokemonTypeInfoModel(
      {required final String name,
      required final String url}) = _$PokemonTypeInfoModelImpl;

  factory _PokemonTypeInfoModel.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeInfoModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonTypeInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeInfoModelImplCopyWith<_$PokemonTypeInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonStatSlotModel _$PokemonStatSlotModelFromJson(Map<String, dynamic> json) {
  return _PokemonStatSlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatSlotModel {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  PokemonStatInfoModel get stat => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatSlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatSlotModelCopyWith<PokemonStatSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatSlotModelCopyWith<$Res> {
  factory $PokemonStatSlotModelCopyWith(PokemonStatSlotModel value,
          $Res Function(PokemonStatSlotModel) then) =
      _$PokemonStatSlotModelCopyWithImpl<$Res, PokemonStatSlotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat, PokemonStatInfoModel stat});

  $PokemonStatInfoModelCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokemonStatSlotModelCopyWithImpl<$Res,
        $Val extends PokemonStatSlotModel>
    implements $PokemonStatSlotModelCopyWith<$Res> {
  _$PokemonStatSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonStatInfoModel,
    ) as $Val);
  }

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonStatInfoModelCopyWith<$Res> get stat {
    return $PokemonStatInfoModelCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonStatSlotModelImplCopyWith<$Res>
    implements $PokemonStatSlotModelCopyWith<$Res> {
  factory _$$PokemonStatSlotModelImplCopyWith(_$PokemonStatSlotModelImpl value,
          $Res Function(_$PokemonStatSlotModelImpl) then) =
      __$$PokemonStatSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat, PokemonStatInfoModel stat});

  @override
  $PokemonStatInfoModelCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokemonStatSlotModelImplCopyWithImpl<$Res>
    extends _$PokemonStatSlotModelCopyWithImpl<$Res, _$PokemonStatSlotModelImpl>
    implements _$$PokemonStatSlotModelImplCopyWith<$Res> {
  __$$PokemonStatSlotModelImplCopyWithImpl(_$PokemonStatSlotModelImpl _value,
      $Res Function(_$PokemonStatSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? stat = null,
  }) {
    return _then(_$PokemonStatSlotModelImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokemonStatInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatSlotModelImpl implements _PokemonStatSlotModel {
  const _$PokemonStatSlotModelImpl(
      {@JsonKey(name: 'base_stat') required this.baseStat, required this.stat});

  factory _$PokemonStatSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatSlotModelImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  final PokemonStatInfoModel stat;

  @override
  String toString() {
    return 'PokemonStatSlotModel(baseStat: $baseStat, stat: $stat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatSlotModelImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, stat);

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatSlotModelImplCopyWith<_$PokemonStatSlotModelImpl>
      get copyWith =>
          __$$PokemonStatSlotModelImplCopyWithImpl<_$PokemonStatSlotModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatSlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatSlotModel implements PokemonStatSlotModel {
  const factory _PokemonStatSlotModel(
      {@JsonKey(name: 'base_stat') required final int baseStat,
      required final PokemonStatInfoModel stat}) = _$PokemonStatSlotModelImpl;

  factory _PokemonStatSlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonStatSlotModelImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  PokemonStatInfoModel get stat;

  /// Create a copy of PokemonStatSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatSlotModelImplCopyWith<_$PokemonStatSlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonStatInfoModel _$PokemonStatInfoModelFromJson(Map<String, dynamic> json) {
  return _PokemonStatInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonStatInfoModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonStatInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStatInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatInfoModelCopyWith<PokemonStatInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatInfoModelCopyWith<$Res> {
  factory $PokemonStatInfoModelCopyWith(PokemonStatInfoModel value,
          $Res Function(PokemonStatInfoModel) then) =
      _$PokemonStatInfoModelCopyWithImpl<$Res, PokemonStatInfoModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonStatInfoModelCopyWithImpl<$Res,
        $Val extends PokemonStatInfoModel>
    implements $PokemonStatInfoModelCopyWith<$Res> {
  _$PokemonStatInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStatInfoModel
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
abstract class _$$PokemonStatInfoModelImplCopyWith<$Res>
    implements $PokemonStatInfoModelCopyWith<$Res> {
  factory _$$PokemonStatInfoModelImplCopyWith(_$PokemonStatInfoModelImpl value,
          $Res Function(_$PokemonStatInfoModelImpl) then) =
      __$$PokemonStatInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonStatInfoModelImplCopyWithImpl<$Res>
    extends _$PokemonStatInfoModelCopyWithImpl<$Res, _$PokemonStatInfoModelImpl>
    implements _$$PokemonStatInfoModelImplCopyWith<$Res> {
  __$$PokemonStatInfoModelImplCopyWithImpl(_$PokemonStatInfoModelImpl _value,
      $Res Function(_$PokemonStatInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonStatInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonStatInfoModelImpl(
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
class _$PokemonStatInfoModelImpl implements _PokemonStatInfoModel {
  const _$PokemonStatInfoModelImpl({required this.name, required this.url});

  factory _$PokemonStatInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatInfoModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonStatInfoModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatInfoModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonStatInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatInfoModelImplCopyWith<_$PokemonStatInfoModelImpl>
      get copyWith =>
          __$$PokemonStatInfoModelImplCopyWithImpl<_$PokemonStatInfoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonStatInfoModel implements PokemonStatInfoModel {
  const factory _PokemonStatInfoModel(
      {required final String name,
      required final String url}) = _$PokemonStatInfoModelImpl;

  factory _PokemonStatInfoModel.fromJson(Map<String, dynamic> json) =
      _$PokemonStatInfoModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonStatInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatInfoModelImplCopyWith<_$PokemonStatInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonAbilitySlotModel _$PokemonAbilitySlotModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonAbilitySlotModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilitySlotModel {
  PokemonAbilityInfoModel get ability => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden')
  bool get isHidden => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilitySlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilitySlotModelCopyWith<PokemonAbilitySlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilitySlotModelCopyWith<$Res> {
  factory $PokemonAbilitySlotModelCopyWith(PokemonAbilitySlotModel value,
          $Res Function(PokemonAbilitySlotModel) then) =
      _$PokemonAbilitySlotModelCopyWithImpl<$Res, PokemonAbilitySlotModel>;
  @useResult
  $Res call(
      {PokemonAbilityInfoModel ability,
      @JsonKey(name: 'is_hidden') bool isHidden});

  $PokemonAbilityInfoModelCopyWith<$Res> get ability;
}

/// @nodoc
class _$PokemonAbilitySlotModelCopyWithImpl<$Res,
        $Val extends PokemonAbilitySlotModel>
    implements $PokemonAbilitySlotModelCopyWith<$Res> {
  _$PokemonAbilitySlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
    Object? isHidden = null,
  }) {
    return _then(_value.copyWith(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonAbilityInfoModel,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonAbilityInfoModelCopyWith<$Res> get ability {
    return $PokemonAbilityInfoModelCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonAbilitySlotModelImplCopyWith<$Res>
    implements $PokemonAbilitySlotModelCopyWith<$Res> {
  factory _$$PokemonAbilitySlotModelImplCopyWith(
          _$PokemonAbilitySlotModelImpl value,
          $Res Function(_$PokemonAbilitySlotModelImpl) then) =
      __$$PokemonAbilitySlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PokemonAbilityInfoModel ability,
      @JsonKey(name: 'is_hidden') bool isHidden});

  @override
  $PokemonAbilityInfoModelCopyWith<$Res> get ability;
}

/// @nodoc
class __$$PokemonAbilitySlotModelImplCopyWithImpl<$Res>
    extends _$PokemonAbilitySlotModelCopyWithImpl<$Res,
        _$PokemonAbilitySlotModelImpl>
    implements _$$PokemonAbilitySlotModelImplCopyWith<$Res> {
  __$$PokemonAbilitySlotModelImplCopyWithImpl(
      _$PokemonAbilitySlotModelImpl _value,
      $Res Function(_$PokemonAbilitySlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ability = null,
    Object? isHidden = null,
  }) {
    return _then(_$PokemonAbilitySlotModelImpl(
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as PokemonAbilityInfoModel,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonAbilitySlotModelImpl implements _PokemonAbilitySlotModel {
  const _$PokemonAbilitySlotModelImpl(
      {required this.ability,
      @JsonKey(name: 'is_hidden') required this.isHidden});

  factory _$PokemonAbilitySlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilitySlotModelImplFromJson(json);

  @override
  final PokemonAbilityInfoModel ability;
  @override
  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  @override
  String toString() {
    return 'PokemonAbilitySlotModel(ability: $ability, isHidden: $isHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilitySlotModelImpl &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ability, isHidden);

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilitySlotModelImplCopyWith<_$PokemonAbilitySlotModelImpl>
      get copyWith => __$$PokemonAbilitySlotModelImplCopyWithImpl<
          _$PokemonAbilitySlotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilitySlotModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilitySlotModel implements PokemonAbilitySlotModel {
  const factory _PokemonAbilitySlotModel(
          {required final PokemonAbilityInfoModel ability,
          @JsonKey(name: 'is_hidden') required final bool isHidden}) =
      _$PokemonAbilitySlotModelImpl;

  factory _PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilitySlotModelImpl.fromJson;

  @override
  PokemonAbilityInfoModel get ability;
  @override
  @JsonKey(name: 'is_hidden')
  bool get isHidden;

  /// Create a copy of PokemonAbilitySlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilitySlotModelImplCopyWith<_$PokemonAbilitySlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokemonAbilityInfoModel _$PokemonAbilityInfoModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonAbilityInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonAbilityInfoModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonAbilityInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonAbilityInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonAbilityInfoModelCopyWith<PokemonAbilityInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonAbilityInfoModelCopyWith<$Res> {
  factory $PokemonAbilityInfoModelCopyWith(PokemonAbilityInfoModel value,
          $Res Function(PokemonAbilityInfoModel) then) =
      _$PokemonAbilityInfoModelCopyWithImpl<$Res, PokemonAbilityInfoModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonAbilityInfoModelCopyWithImpl<$Res,
        $Val extends PokemonAbilityInfoModel>
    implements $PokemonAbilityInfoModelCopyWith<$Res> {
  _$PokemonAbilityInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonAbilityInfoModel
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
abstract class _$$PokemonAbilityInfoModelImplCopyWith<$Res>
    implements $PokemonAbilityInfoModelCopyWith<$Res> {
  factory _$$PokemonAbilityInfoModelImplCopyWith(
          _$PokemonAbilityInfoModelImpl value,
          $Res Function(_$PokemonAbilityInfoModelImpl) then) =
      __$$PokemonAbilityInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonAbilityInfoModelImplCopyWithImpl<$Res>
    extends _$PokemonAbilityInfoModelCopyWithImpl<$Res,
        _$PokemonAbilityInfoModelImpl>
    implements _$$PokemonAbilityInfoModelImplCopyWith<$Res> {
  __$$PokemonAbilityInfoModelImplCopyWithImpl(
      _$PokemonAbilityInfoModelImpl _value,
      $Res Function(_$PokemonAbilityInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonAbilityInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokemonAbilityInfoModelImpl(
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
class _$PokemonAbilityInfoModelImpl implements _PokemonAbilityInfoModel {
  const _$PokemonAbilityInfoModelImpl({required this.name, required this.url});

  factory _$PokemonAbilityInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonAbilityInfoModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonAbilityInfoModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonAbilityInfoModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonAbilityInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonAbilityInfoModelImplCopyWith<_$PokemonAbilityInfoModelImpl>
      get copyWith => __$$PokemonAbilityInfoModelImplCopyWithImpl<
          _$PokemonAbilityInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonAbilityInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonAbilityInfoModel implements PokemonAbilityInfoModel {
  const factory _PokemonAbilityInfoModel(
      {required final String name,
      required final String url}) = _$PokemonAbilityInfoModelImpl;

  factory _PokemonAbilityInfoModel.fromJson(Map<String, dynamic> json) =
      _$PokemonAbilityInfoModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonAbilityInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonAbilityInfoModelImplCopyWith<_$PokemonAbilityInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
