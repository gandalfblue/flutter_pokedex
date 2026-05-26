import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../domain/repositories/auth_repository.dart';

import '../datasources/auth/auth_local_datasource.dart';
import '../datasources/auth/auth_remote_datasource.dart';
import '../models/trainer_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.datasource, this.localDatasource);

  @override
  Stream<Either<Failure, TrainerModel?>> authStateChanges() {
    return datasource.authStateChanges().map((trainer) {
      try {
        if (trainer == null) return right(null);

        return right(TrainerModel.fromFirebase(trainer));
      } on NetworkException catch (e) {
        return left(Failure.network(message: e.message));
      } on ServerException catch (e) {
        return left(
            Failure.server(message: e.message, statusCode: e.statusCode));
      } catch (e) {
        return left(Failure.unknown(message: e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, TrainerModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await datasource.login(
        email: email,
        password: password,
      );

      final trainer = TrainerModel.fromFirebase(
        credential.user!,
      );

      await localDatasource.saveTrainer(
        trainer,
      );

      return right(trainer);
    } on FirebaseAuthException catch (e) {
      return left(Failure.firebase(message: '${e.code} ${e.message ?? 'Error de autenticación'}'));
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrainerModel>> register({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  }) async {
    try {
      final credential = await datasource.register(
        email: email,
        password: password,
      );

      await datasource.updateTrainerName(username);

      final trainer = TrainerModel(
        uid: credential.user!.uid,
        username: username,
        email: email,
        gender: gender,
      );

      await localDatasource.saveTrainer(
        trainer,
      );

      return right(trainer);
    } on FirebaseAuthException catch (e) {
      return left(Failure.firebase(message: '${e.code} ${e.message ?? 'Error creando usuario'}'));
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await localDatasource.clearSession();
    return await datasource.logout();
  }
}
