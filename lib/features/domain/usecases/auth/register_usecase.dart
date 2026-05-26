
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../../../data/models/trainer_model.dart';
import '../../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure,TrainerModel>> call({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  }) {
    return repository.register(
      username: username,
      email: email,
      password: password,
      gender: gender,
    );
  }
}