// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainerModelImpl _$$TrainerModelImplFromJson(Map<String, dynamic> json) =>
    _$TrainerModelImpl(
      uid: json['uid'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      gender: $enumDecode(_$TrainerGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$TrainerModelImplToJson(_$TrainerModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'gender': _$TrainerGenderEnumMap[instance.gender]!,
    };

const _$TrainerGenderEnumMap = {
  TrainerGender.trainer: 'trainer',
  TrainerGender.trainerFemale: 'trainerFemale',
};
