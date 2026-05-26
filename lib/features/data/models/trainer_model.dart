import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'trainer_model.freezed.dart';
part 'trainer_model.g.dart';

enum TrainerGender { trainer, trainerFemale }

@freezed
class TrainerModel with _$TrainerModel {
  const factory TrainerModel({
    required String uid,
    required String username,
    required String email,
    required TrainerGender gender,
  }) = _TrainerModel;

  factory TrainerModel.fromFirebase(
      User user,
      ) {
    return TrainerModel(
      uid: user.uid,
      username: user.displayName ?? '',
      email: user.email ?? '',
      gender: TrainerGender.trainer,
    );
  }

  factory TrainerModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$TrainerModelFromJson(json);
}