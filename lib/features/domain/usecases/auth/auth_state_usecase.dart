import 'package:flutter_pokemon/core/errors/failures.dart';

import 'package:flutter_pokemon/core/utils/either.dart';

import '../../../data/models/trainer_model.dart';
import '../../repositories/auth_repository.dart';

class AuthStateUsecase {
  final AuthRepository repository;

  AuthStateUsecase(this.repository);

  Stream<Either<Failure, TrainerModel?>> call() {
    return repository.authStateChanges();
  }
}