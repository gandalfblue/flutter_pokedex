// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) {
  return _PokemonSpeciesModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpeciesModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntryModel> get flavorTextEntries =>
      throw _privateConstructorUsedError;
  List<GeneraModel> get genera => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpeciesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpeciesModelCopyWith<PokemonSpeciesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpeciesModelCopyWith<$Res> {
  factory $PokemonSpeciesModelCopyWith(
          PokemonSpeciesModel value, $Res Function(PokemonSpeciesModel) then) =
      _$PokemonSpeciesModelCopyWithImpl<$Res, PokemonSpeciesModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'flavor_text_entries')
      List<FlavorTextEntryModel> flavorTextEntries,
      List<GeneraModel> genera});
}

/// @nodoc
class _$PokemonSpeciesModelCopyWithImpl<$Res, $Val extends PokemonSpeciesModel>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  _$PokemonSpeciesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? flavorTextEntries = null,
    Object? genera = null,
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
      flavorTextEntries: null == flavorTextEntries
          ? _value.flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<FlavorTextEntryModel>,
      genera: null == genera
          ? _value.genera
          : genera // ignore: cast_nullable_to_non_nullable
              as List<GeneraModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSpeciesModelImplCopyWith<$Res>
    implements $PokemonSpeciesModelCopyWith<$Res> {
  factory _$$PokemonSpeciesModelImplCopyWith(_$PokemonSpeciesModelImpl value,
          $Res Function(_$PokemonSpeciesModelImpl) then) =
      __$$PokemonSpeciesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'flavor_text_entries')
      List<FlavorTextEntryModel> flavorTextEntries,
      List<GeneraModel> genera});
}

/// @nodoc
class __$$PokemonSpeciesModelImplCopyWithImpl<$Res>
    extends _$PokemonSpeciesModelCopyWithImpl<$Res, _$PokemonSpeciesModelImpl>
    implements _$$PokemonSpeciesModelImplCopyWith<$Res> {
  __$$PokemonSpeciesModelImplCopyWithImpl(_$PokemonSpeciesModelImpl _value,
      $Res Function(_$PokemonSpeciesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? flavorTextEntries = null,
    Object? genera = null,
  }) {
    return _then(_$PokemonSpeciesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      flavorTextEntries: null == flavorTextEntries
          ? _value._flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<FlavorTextEntryModel>,
      genera: null == genera
          ? _value._genera
          : genera // ignore: cast_nullable_to_non_nullable
              as List<GeneraModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpeciesModelImpl implements _PokemonSpeciesModel {
  const _$PokemonSpeciesModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'flavor_text_entries')
      required final List<FlavorTextEntryModel> flavorTextEntries,
      required final List<GeneraModel> genera})
      : _flavorTextEntries = flavorTextEntries,
        _genera = genera;

  factory _$PokemonSpeciesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpeciesModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<FlavorTextEntryModel> _flavorTextEntries;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntryModel> get flavorTextEntries {
    if (_flavorTextEntries is EqualUnmodifiableListView)
      return _flavorTextEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavorTextEntries);
  }

  final List<GeneraModel> _genera;
  @override
  List<GeneraModel> get genera {
    if (_genera is EqualUnmodifiableListView) return _genera;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genera);
  }

  @override
  String toString() {
    return 'PokemonSpeciesModel(id: $id, name: $name, flavorTextEntries: $flavorTextEntries, genera: $genera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpeciesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._flavorTextEntries, _flavorTextEntries) &&
            const DeepCollectionEquality().equals(other._genera, _genera));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_flavorTextEntries),
      const DeepCollectionEquality().hash(_genera));

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      __$$PokemonSpeciesModelImplCopyWithImpl<_$PokemonSpeciesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpeciesModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonSpeciesModel implements PokemonSpeciesModel {
  const factory _PokemonSpeciesModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'flavor_text_entries')
      required final List<FlavorTextEntryModel> flavorTextEntries,
      required final List<GeneraModel> genera}) = _$PokemonSpeciesModelImpl;

  factory _PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =
      _$PokemonSpeciesModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntryModel> get flavorTextEntries;
  @override
  List<GeneraModel> get genera;

  /// Create a copy of PokemonSpeciesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpeciesModelImplCopyWith<_$PokemonSpeciesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlavorTextEntryModel _$FlavorTextEntryModelFromJson(Map<String, dynamic> json) {
  return _FlavorTextEntryModel.fromJson(json);
}

/// @nodoc
mixin _$FlavorTextEntryModel {
  @JsonKey(name: 'flavor_text')
  String get flavorText => throw _privateConstructorUsedError;
  SpeciesLanguageModel get language => throw _privateConstructorUsedError;
  SpeciesVersionModel get version => throw _privateConstructorUsedError;

  /// Serializes this FlavorTextEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlavorTextEntryModelCopyWith<FlavorTextEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorTextEntryModelCopyWith<$Res> {
  factory $FlavorTextEntryModelCopyWith(FlavorTextEntryModel value,
          $Res Function(FlavorTextEntryModel) then) =
      _$FlavorTextEntryModelCopyWithImpl<$Res, FlavorTextEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      SpeciesLanguageModel language,
      SpeciesVersionModel version});

  $SpeciesLanguageModelCopyWith<$Res> get language;
  $SpeciesVersionModelCopyWith<$Res> get version;
}

/// @nodoc
class _$FlavorTextEntryModelCopyWithImpl<$Res,
        $Val extends FlavorTextEntryModel>
    implements $FlavorTextEntryModelCopyWith<$Res> {
  _$FlavorTextEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SpeciesLanguageModel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as SpeciesVersionModel,
    ) as $Val);
  }

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpeciesLanguageModelCopyWith<$Res> get language {
    return $SpeciesLanguageModelCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpeciesVersionModelCopyWith<$Res> get version {
    return $SpeciesVersionModelCopyWith<$Res>(_value.version, (value) {
      return _then(_value.copyWith(version: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlavorTextEntryModelImplCopyWith<$Res>
    implements $FlavorTextEntryModelCopyWith<$Res> {
  factory _$$FlavorTextEntryModelImplCopyWith(_$FlavorTextEntryModelImpl value,
          $Res Function(_$FlavorTextEntryModelImpl) then) =
      __$$FlavorTextEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      SpeciesLanguageModel language,
      SpeciesVersionModel version});

  @override
  $SpeciesLanguageModelCopyWith<$Res> get language;
  @override
  $SpeciesVersionModelCopyWith<$Res> get version;
}

/// @nodoc
class __$$FlavorTextEntryModelImplCopyWithImpl<$Res>
    extends _$FlavorTextEntryModelCopyWithImpl<$Res, _$FlavorTextEntryModelImpl>
    implements _$$FlavorTextEntryModelImplCopyWith<$Res> {
  __$$FlavorTextEntryModelImplCopyWithImpl(_$FlavorTextEntryModelImpl _value,
      $Res Function(_$FlavorTextEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_$FlavorTextEntryModelImpl(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SpeciesLanguageModel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as SpeciesVersionModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlavorTextEntryModelImpl implements _FlavorTextEntryModel {
  const _$FlavorTextEntryModelImpl(
      {@JsonKey(name: 'flavor_text') required this.flavorText,
      required this.language,
      required this.version});

  factory _$FlavorTextEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlavorTextEntryModelImplFromJson(json);

  @override
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  @override
  final SpeciesLanguageModel language;
  @override
  final SpeciesVersionModel version;

  @override
  String toString() {
    return 'FlavorTextEntryModel(flavorText: $flavorText, language: $language, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlavorTextEntryModelImpl &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flavorText, language, version);

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlavorTextEntryModelImplCopyWith<_$FlavorTextEntryModelImpl>
      get copyWith =>
          __$$FlavorTextEntryModelImplCopyWithImpl<_$FlavorTextEntryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlavorTextEntryModelImplToJson(
      this,
    );
  }
}

abstract class _FlavorTextEntryModel implements FlavorTextEntryModel {
  const factory _FlavorTextEntryModel(
      {@JsonKey(name: 'flavor_text') required final String flavorText,
      required final SpeciesLanguageModel language,
      required final SpeciesVersionModel version}) = _$FlavorTextEntryModelImpl;

  factory _FlavorTextEntryModel.fromJson(Map<String, dynamic> json) =
      _$FlavorTextEntryModelImpl.fromJson;

  @override
  @JsonKey(name: 'flavor_text')
  String get flavorText;
  @override
  SpeciesLanguageModel get language;
  @override
  SpeciesVersionModel get version;

  /// Create a copy of FlavorTextEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlavorTextEntryModelImplCopyWith<_$FlavorTextEntryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GeneraModel _$GeneraModelFromJson(Map<String, dynamic> json) {
  return _GeneraModel.fromJson(json);
}

/// @nodoc
mixin _$GeneraModel {
  String get genus => throw _privateConstructorUsedError;
  SpeciesLanguageModel get language => throw _privateConstructorUsedError;

  /// Serializes this GeneraModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneraModelCopyWith<GeneraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneraModelCopyWith<$Res> {
  factory $GeneraModelCopyWith(
          GeneraModel value, $Res Function(GeneraModel) then) =
      _$GeneraModelCopyWithImpl<$Res, GeneraModel>;
  @useResult
  $Res call({String genus, SpeciesLanguageModel language});

  $SpeciesLanguageModelCopyWith<$Res> get language;
}

/// @nodoc
class _$GeneraModelCopyWithImpl<$Res, $Val extends GeneraModel>
    implements $GeneraModelCopyWith<$Res> {
  _$GeneraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      genus: null == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SpeciesLanguageModel,
    ) as $Val);
  }

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpeciesLanguageModelCopyWith<$Res> get language {
    return $SpeciesLanguageModelCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeneraModelImplCopyWith<$Res>
    implements $GeneraModelCopyWith<$Res> {
  factory _$$GeneraModelImplCopyWith(
          _$GeneraModelImpl value, $Res Function(_$GeneraModelImpl) then) =
      __$$GeneraModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String genus, SpeciesLanguageModel language});

  @override
  $SpeciesLanguageModelCopyWith<$Res> get language;
}

/// @nodoc
class __$$GeneraModelImplCopyWithImpl<$Res>
    extends _$GeneraModelCopyWithImpl<$Res, _$GeneraModelImpl>
    implements _$$GeneraModelImplCopyWith<$Res> {
  __$$GeneraModelImplCopyWithImpl(
      _$GeneraModelImpl _value, $Res Function(_$GeneraModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = null,
    Object? language = null,
  }) {
    return _then(_$GeneraModelImpl(
      genus: null == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as SpeciesLanguageModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneraModelImpl implements _GeneraModel {
  const _$GeneraModelImpl({required this.genus, required this.language});

  factory _$GeneraModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneraModelImplFromJson(json);

  @override
  final String genus;
  @override
  final SpeciesLanguageModel language;

  @override
  String toString() {
    return 'GeneraModel(genus: $genus, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneraModelImpl &&
            (identical(other.genus, genus) || other.genus == genus) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, genus, language);

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneraModelImplCopyWith<_$GeneraModelImpl> get copyWith =>
      __$$GeneraModelImplCopyWithImpl<_$GeneraModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneraModelImplToJson(
      this,
    );
  }
}

abstract class _GeneraModel implements GeneraModel {
  const factory _GeneraModel(
      {required final String genus,
      required final SpeciesLanguageModel language}) = _$GeneraModelImpl;

  factory _GeneraModel.fromJson(Map<String, dynamic> json) =
      _$GeneraModelImpl.fromJson;

  @override
  String get genus;
  @override
  SpeciesLanguageModel get language;

  /// Create a copy of GeneraModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneraModelImplCopyWith<_$GeneraModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpeciesLanguageModel _$SpeciesLanguageModelFromJson(Map<String, dynamic> json) {
  return _SpeciesLanguageModel.fromJson(json);
}

/// @nodoc
mixin _$SpeciesLanguageModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SpeciesLanguageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeciesLanguageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesLanguageModelCopyWith<SpeciesLanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesLanguageModelCopyWith<$Res> {
  factory $SpeciesLanguageModelCopyWith(SpeciesLanguageModel value,
          $Res Function(SpeciesLanguageModel) then) =
      _$SpeciesLanguageModelCopyWithImpl<$Res, SpeciesLanguageModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SpeciesLanguageModelCopyWithImpl<$Res,
        $Val extends SpeciesLanguageModel>
    implements $SpeciesLanguageModelCopyWith<$Res> {
  _$SpeciesLanguageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeciesLanguageModel
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
abstract class _$$SpeciesLanguageModelImplCopyWith<$Res>
    implements $SpeciesLanguageModelCopyWith<$Res> {
  factory _$$SpeciesLanguageModelImplCopyWith(_$SpeciesLanguageModelImpl value,
          $Res Function(_$SpeciesLanguageModelImpl) then) =
      __$$SpeciesLanguageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$SpeciesLanguageModelImplCopyWithImpl<$Res>
    extends _$SpeciesLanguageModelCopyWithImpl<$Res, _$SpeciesLanguageModelImpl>
    implements _$$SpeciesLanguageModelImplCopyWith<$Res> {
  __$$SpeciesLanguageModelImplCopyWithImpl(_$SpeciesLanguageModelImpl _value,
      $Res Function(_$SpeciesLanguageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeciesLanguageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$SpeciesLanguageModelImpl(
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
class _$SpeciesLanguageModelImpl implements _SpeciesLanguageModel {
  const _$SpeciesLanguageModelImpl({required this.name, required this.url});

  factory _$SpeciesLanguageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesLanguageModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SpeciesLanguageModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesLanguageModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of SpeciesLanguageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesLanguageModelImplCopyWith<_$SpeciesLanguageModelImpl>
      get copyWith =>
          __$$SpeciesLanguageModelImplCopyWithImpl<_$SpeciesLanguageModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesLanguageModelImplToJson(
      this,
    );
  }
}

abstract class _SpeciesLanguageModel implements SpeciesLanguageModel {
  const factory _SpeciesLanguageModel(
      {required final String name,
      required final String url}) = _$SpeciesLanguageModelImpl;

  factory _SpeciesLanguageModel.fromJson(Map<String, dynamic> json) =
      _$SpeciesLanguageModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of SpeciesLanguageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesLanguageModelImplCopyWith<_$SpeciesLanguageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpeciesVersionModel _$SpeciesVersionModelFromJson(Map<String, dynamic> json) {
  return _SpeciesVersionModel.fromJson(json);
}

/// @nodoc
mixin _$SpeciesVersionModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SpeciesVersionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeciesVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesVersionModelCopyWith<SpeciesVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesVersionModelCopyWith<$Res> {
  factory $SpeciesVersionModelCopyWith(
          SpeciesVersionModel value, $Res Function(SpeciesVersionModel) then) =
      _$SpeciesVersionModelCopyWithImpl<$Res, SpeciesVersionModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$SpeciesVersionModelCopyWithImpl<$Res, $Val extends SpeciesVersionModel>
    implements $SpeciesVersionModelCopyWith<$Res> {
  _$SpeciesVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeciesVersionModel
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
abstract class _$$SpeciesVersionModelImplCopyWith<$Res>
    implements $SpeciesVersionModelCopyWith<$Res> {
  factory _$$SpeciesVersionModelImplCopyWith(_$SpeciesVersionModelImpl value,
          $Res Function(_$SpeciesVersionModelImpl) then) =
      __$$SpeciesVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$SpeciesVersionModelImplCopyWithImpl<$Res>
    extends _$SpeciesVersionModelCopyWithImpl<$Res, _$SpeciesVersionModelImpl>
    implements _$$SpeciesVersionModelImplCopyWith<$Res> {
  __$$SpeciesVersionModelImplCopyWithImpl(_$SpeciesVersionModelImpl _value,
      $Res Function(_$SpeciesVersionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeciesVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$SpeciesVersionModelImpl(
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
class _$SpeciesVersionModelImpl implements _SpeciesVersionModel {
  const _$SpeciesVersionModelImpl({required this.name, required this.url});

  factory _$SpeciesVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesVersionModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'SpeciesVersionModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesVersionModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of SpeciesVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesVersionModelImplCopyWith<_$SpeciesVersionModelImpl> get copyWith =>
      __$$SpeciesVersionModelImplCopyWithImpl<_$SpeciesVersionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesVersionModelImplToJson(
      this,
    );
  }
}

abstract class _SpeciesVersionModel implements SpeciesVersionModel {
  const factory _SpeciesVersionModel(
      {required final String name,
      required final String url}) = _$SpeciesVersionModelImpl;

  factory _SpeciesVersionModel.fromJson(Map<String, dynamic> json) =
      _$SpeciesVersionModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of SpeciesVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesVersionModelImplCopyWith<_$SpeciesVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
