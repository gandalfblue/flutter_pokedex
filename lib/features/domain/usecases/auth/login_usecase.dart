import 'package:flutter_pokemon/features/data/models/trainer_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/either.dart';
import '../../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure,TrainerModel>> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}