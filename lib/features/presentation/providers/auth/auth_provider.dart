// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../l10n/app_localizations.dart';
//
// part 'auth_provider.freezed.dart';
// part 'auth_provider.g.dart';
//
// /// Tipo de entrenador elegido en el registro.
// enum TrainerGender { trainer, trainerFemale }
//
// /// Modelo del usuario autenticado.
// @freezed
// abstract class AuthUser with _$AuthUser {
//   const factory AuthUser({
//     required String username,
//     required String email,
//     required String password,
//     required TrainerGender gender,
//   }) = _AuthUser;
// }
//
// /// Estado de autenticación.
// @freezed
// class AuthState with _$AuthState {
//   const factory AuthState({
//     @Default(false) bool isLoggedIn,
//     AuthUser? user,
//     String? error,
//     @Default(false) bool isLoading,
//   }) = _AuthState;
// }
//
// /// Provider de autenticación. keepAlive: true → persiste sesión en RAM.
// /// ⚠️ Los usuarios se almacenan únicamente en memoria: se pierden al cerrar la app.
// @Riverpod(keepAlive: true)
// class AuthNotifier extends _$AuthNotifier {
//   // Base de datos en memoria de usuarios registrados.
//   final List<AuthUser> _users = [];
//
//   @override
//   AuthState build() => const AuthState();
//
//   // ── Registro ────────────────────────────────────────────────────────────
//
//   /// Registra un nuevo usuario.
//   /// [l10n] provee los mensajes de error localizados.
//   /// Devuelve null si OK, o el mensaje de error correspondiente.
//   String? register({
//     required String username,
//     required String email,
//     required String password,
//     required TrainerGender gender,
//     required AppLocalizations l10n,
//   }) {
//     if (username.trim().isEmpty) return l10n.authErrorUsernameRequired;
//     if (!_isValidEmail(email))   return l10n.authErrorInvalidEmail;
//     if (!_isStrongPassword(password)) return l10n.authErrorWeakPassword;
//
//     if (_users.any((u) => u.username.toLowerCase() == username.toLowerCase())) {
//       return l10n.authErrorUsernameTaken;
//     }
//     if (_users.any((u) => u.email.toLowerCase() == email.toLowerCase())) {
//       return l10n.authErrorEmailTaken;
//     }
//
//     final user = AuthUser(
//       username: username.trim(),
//       email:    email.trim().toLowerCase(),
//       password: password,
//       gender:   gender,
//     );
//     _users.add(user);
//     state = AuthState(isLoggedIn: true, user: user);
//     return null;
//   }
//
//   // ── Login ────────────────────────────────────────────────────────────────
//
//   /// Inicia sesión.
//   /// [l10n] provee los mensajes de error localizados.
//   /// Devuelve null si OK, o el mensaje de error correspondiente.
//   String? login({
//     required String username,
//     required String password,
//     required AppLocalizations l10n,
//   }) {
//     if (username.trim().isEmpty || password.isEmpty) {
//       return l10n.loginErrorEmpty;
//     }
//
//     final match = _users.cast<AuthUser?>().firstWhere(
//       (u) =>
//           u!.username.toLowerCase() == username.trim().toLowerCase() &&
//           u.password == password,
//       orElse: () => null,
//     );
//
//     if (match == null) return l10n.loginErrorInvalid;
//     state = AuthState(isLoggedIn: true, user: match);
//     return null;
//   }
//
//   // ── Logout ───────────────────────────────────────────────────────────────
//
//   void logout() => state = const AuthState();
//
//   // ── Validadores ──────────────────────────────────────────────────────────
//
//   bool _isValidEmail(String email) =>
//       RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$').hasMatch(email.trim());
//
//   static bool _isStrongPassword(String password) {
//     if (password.length < 10) return false;
//     if (!password.contains(RegExp(r'[a-zA-Z]'))) return false;
//     if (!password.contains(RegExp(r'[0-9]'))) return false;
//     if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/]'))) {
//       return false;
//     }
//     return true;
//   }
//
//   /// Exposición pública para usar en el validador del formulario.
//   static bool validatePassword(String password) => _isStrongPassword(password);
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/auth/auth_local_datasource.dart';
import '../../../data/datasources/auth/auth_remote_datasource.dart';
import '../../../data/models/trainer_model.dart';

import '../../../data/repositories/auth_repository_imp.dart';
import '../../../domain/repositories/auth_repository.dart';

import '../../../domain/usecases/auth/auth_state_usecase.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/logout_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import 'auth_database_provider.dart';

part 'auth_provider.g.dart';

/// ─────────────────────────────────────────────────────────────
/// FirebaseAuth
/// ─────────────────────────────────────────────────────────────

@riverpod
FirebaseAuth firebaseAuth(
    FirebaseAuthRef ref,
    ) {
  return FirebaseAuth.instance;
}

/// ─────────────────────────────────────────────────────────────
/// Datasource
/// ─────────────────────────────────────────────────────────────

@riverpod
AuthRemoteDatasource authRemoteDatasource(
    AuthRemoteDatasourceRef ref,
    ) {
  final auth = ref.watch(
    firebaseAuthProvider,
  );

  return AuthRemoteDatasource(auth);
}

/// ─────────────────────────────────────────────────────────────
/// Repository
/// ─────────────────────────────────────────────────────────────

@riverpod
AuthRepository authRepository(
    AuthRepositoryRef ref,
    ) {
  final datasource = ref.watch(
    authRemoteDatasourceProvider,
  );
  final localDatasource = ref.watch(
    authLocalDatasourceProvider,
  );

  return AuthRepositoryImpl(datasource, localDatasource);
}

/// ─────────────────────────────────────────────────────────────
/// Usecases
/// ─────────────────────────────────────────────────────────────

@riverpod
LoginUsecase loginUsecase(
    LoginUsecaseRef ref,
    ) {
  final repository = ref.watch(
    authRepositoryProvider,
  );

  return LoginUsecase(repository);
}

@riverpod
RegisterUsecase registerUsecase(
    RegisterUsecaseRef ref,
    ) {
  final repository = ref.watch(
    authRepositoryProvider,
  );

  return RegisterUsecase(repository);
}

@riverpod
LogoutUsecase logoutUsecase(
    LogoutUsecaseRef ref,
    ) {
  final repository = ref.watch(
    authRepositoryProvider,
  );

  return LogoutUsecase(repository);
}

@riverpod
AuthStateUsecase authStateUsecase(
    AuthStateUsecaseRef ref,
    ) {
  final repository = ref.watch(
    authRepositoryProvider,
  );

  return AuthStateUsecase(repository);
}

/// ─────────────────────────────────────────────────────────────
/// Auth State Stream
/// Firebase persiste sesión automáticamente
/// ─────────────────────────────────────────────────────────────

@riverpod
Stream<Either<Failure, TrainerModel?>> authStateChanges(
    AuthStateChangesRef ref,
    ) {
  final usecase = ref.watch(
    authStateUsecaseProvider,
  );

  return usecase();
}

@riverpod
AuthLocalDatasource authLocalDatasource(
    AuthLocalDatasourceRef ref,
    ) {
  final database = ref.watch(
    appDatabaseProvider,
  );

  return AuthLocalDatasource(database);
}