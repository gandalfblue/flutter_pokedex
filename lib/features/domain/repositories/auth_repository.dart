import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../data/models/trainer_model.dart';

abstract class AuthRepository {
  Stream<Either<Failure,TrainerModel?>> authStateChanges();

  Future<Either<Failure,TrainerModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure,TrainerModel>> register({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  });

  Future<void> logout();
}