// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainerModel _$TrainerModelFromJson(Map<String, dynamic> json) {
  return _TrainerModel.fromJson(json);
}

/// @nodoc
mixin _$TrainerModel {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  TrainerGender get gender => throw _privateConstructorUsedError;

  /// Serializes this TrainerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrainerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerModelCopyWith<TrainerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerModelCopyWith<$Res> {
  factory $TrainerModelCopyWith(
          TrainerModel value, $Res Function(TrainerModel) then) =
      _$TrainerModelCopyWithImpl<$Res, TrainerModel>;
  @useResult
  $Res call({String uid, String username, String email, TrainerGender gender});
}

/// @nodoc
class _$TrainerModelCopyWithImpl<$Res, $Val extends TrainerModel>
    implements $TrainerModelCopyWith<$Res> {
  _$TrainerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? email = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as TrainerGender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainerModelImplCopyWith<$Res>
    implements $TrainerModelCopyWith<$Res> {
  factory _$$TrainerModelImplCopyWith(
          _$TrainerModelImpl value, $Res Function(_$TrainerModelImpl) then) =
      __$$TrainerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String username, String email, TrainerGender gender});
}

/// @nodoc
class __$$TrainerModelImplCopyWithImpl<$Res>
    extends _$TrainerModelCopyWithImpl<$Res, _$TrainerModelImpl>
    implements _$$TrainerModelImplCopyWith<$Res> {
  __$$TrainerModelImplCopyWithImpl(
      _$TrainerModelImpl _value, $Res Function(_$TrainerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? email = null,
    Object? gender = null,
  }) {
    return _then(_$TrainerModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as TrainerGender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainerModelImpl implements _TrainerModel {
  const _$TrainerModelImpl(
      {required this.uid,
      required this.username,
      required this.email,
      required this.gender});

  factory _$TrainerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String username;
  @override
  final String email;
  @override
  final TrainerGender gender;

  @override
  String toString() {
    return 'TrainerModel(uid: $uid, username: $username, email: $email, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, username, email, gender);

  /// Create a copy of TrainerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerModelImplCopyWith<_$TrainerModelImpl> get copyWith =>
      __$$TrainerModelImplCopyWithImpl<_$TrainerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerModelImplToJson(
      this,
    );
  }
}

abstract class _TrainerModel implements TrainerModel {
  const factory _TrainerModel(
      {required final String uid,
      required final String username,
      required final String email,
      required final TrainerGender gender}) = _$TrainerModelImpl;

  factory _TrainerModel.fromJson(Map<String, dynamic> json) =
      _$TrainerModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  String get email;
  @override
  TrainerGender get gender;

  /// Create a copy of TrainerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerModelImplCopyWith<_$TrainerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
