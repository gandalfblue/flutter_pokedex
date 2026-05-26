import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/trainer_model.dart';
import 'auth_provider.dart';

part 'auth_notifier.g.dart';
part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    TrainerModel? trainer,
    String? error,
    @Default(false) bool isLoading,
  }) = _AuthState;
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final firebaseTrainer = firebaseAuth.currentUser;

      // Firebase ya tenía sesión guardada
      if (firebaseTrainer != null) {
        return AuthState(
          isLoggedIn: true,
          trainer: TrainerModel.fromFirebase(firebaseTrainer),
        );
      }
    } catch (e) {
      // Firebase no está inicializado o hay un error
      debugPrint('Error en AuthNotifier.build(): $e');
    }

    // No hay sesión o error
    return const AuthState();
  }

  // ─────────────────────────────────────────────────────────────
  // Login
  // ─────────────────────────────────────────────────────────────

  Future<String?> login({
    required String email,
    required String password,
    required AppLocalizations l10n,
  }) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    final usecase = ref.read(
      loginUsecaseProvider,
    );

    final result = await usecase(
      email: email,
      password: password,
    );

    return result.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: false,
        error: failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
          firebase: (msg) => msg,
        ),
      );

      return failure.message;
    }, (trainer) {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        trainer: trainer,
        error: null,
      );

      return null;
    });
  }

  // ─────────────────────────────────────────────────────────────
  // Register
  // ─────────────────────────────────────────────────────────────

  Future<String?> register({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
    required AppLocalizations l10n,
  }) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    final usecase = ref.read(
      registerUsecaseProvider,
    );

    final result = await usecase(
      username: username,
      email: email,
      password: password,
      gender: gender,
    );

    return result.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: false,
        error: failure.when(
          server: (msg, _) => msg,
          network: (msg) => msg,
          cache: (msg) => msg,
          unknown: (msg) => msg,
          firebase: (msg) => msg,
        ),
      );

      return failure.message;
    }, (trainer) {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        trainer: trainer,
        error: null,
      );

      return null;
    });
  }

  // ─────────────────────────────────────────────────────────────
  // Logout
  // ─────────────────────────────────────────────────────────────

  Future<void> logout() async {
    state = state.copyWith(
      isLoading: true,
    );

    final usecase = ref.read(
      logoutUsecaseProvider,
    );

    await usecase();

    state = const AuthState();
  }
}
