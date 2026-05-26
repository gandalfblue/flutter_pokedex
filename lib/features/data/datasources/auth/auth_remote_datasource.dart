import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasource {
  final FirebaseAuth auth;

  AuthRemoteDatasource(this.auth);

  // ─────────────────────────────────────────────────────────────
  // Estado de autenticación
  // ─────────────────────────────────────────────────────────────

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }

  // ─────────────────────────────────────────────────────────────
  // Login
  // ─────────────────────────────────────────────────────────────

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Registro
  // ─────────────────────────────────────────────────────────────

  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    return auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Actualizar nombre del trainer
  // ─────────────────────────────────────────────────────────────

  Future<void> updateTrainerName(
      String username,
      ) async {
    await auth.currentUser?.updateDisplayName(
      username,
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Logout
  // ─────────────────────────────────────────────────────────────

  Future<void> logout() async {
    await auth.signOut();
  }

  // ─────────────────────────────────────────────────────────────
  // Current trainer
  // ─────────────────────────────────────────────────────────────

  User? get currentTrainer => auth.currentUser;
}