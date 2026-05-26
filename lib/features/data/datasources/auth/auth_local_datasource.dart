import '../../../../core/database/app_database.dart';
import '../../models/trainer_model.dart';

class AuthLocalDatasource {
  final AppDatabase database;

  AuthLocalDatasource(this.database);

  Future<void> saveTrainer(
      TrainerModel trainer,
      ) async {
    await database.saveTrainer(
      uid: trainer.uid,
      username: trainer.username,
      email: trainer.email,
      gender: trainer.gender.name,
    );
  }

  Future<TrainerModel?> getTrainer() async {
    final trainer = await database.getTrainer();

    if (trainer == null) return null;

    return TrainerModel(
      uid: trainer.uid,
      username: trainer.username,
      email: trainer.email,
      gender: TrainerGender.values.firstWhere(
            (e) => e.name == trainer.gender,
      ),
    );
  }

  Future<void> clearSession() async {
    await database.clearSession();
  }
}