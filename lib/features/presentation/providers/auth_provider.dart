import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

/// Tipo de entrenador elegido en el registro.
enum TrainerGender { trainer, trainerFemale }

/// Modelo del usuario autenticado.
@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  }) = _AuthUser;
}

/// Estado de autenticación.
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    AuthUser? user,
    @Default(null) String? error,
    @Default(false) bool isLoading,
  }) = _AuthState;
}

/// Provider de autenticación. keepAlive: true → persiste sesión.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  // Base de datos en memoria de usuarios registrados.
  final List<AuthUser> _users = [];

  @override
  AuthState build() => const AuthState();

  // ── Registro ────────────────────────────────────────────────────────────

  /// Registra un nuevo usuario. Devuelve null si OK, o mensaje de error.
  String? register({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  }) {
    // Validaciones
    if (username.trim().isEmpty) return 'El nombre de usuario es requerido.';
    if (!_isValidEmail(email)) return 'Ingresa un correo electrónico válido.';
    if (!_isStrongPassword(password)) {
      return 'La contraseña debe tener mínimo 10 caracteres, '
          'letras, números y un carácter especial.';
    }
    // Duplicados
    if (_users.any((u) => u.username.toLowerCase() == username.toLowerCase())) {
      return 'El nombre de usuario ya está en uso.';
    }
    if (_users.any((u) => u.email.toLowerCase() == email.toLowerCase())) {
      return 'El correo ya está registrado.';
    }

    final user = AuthUser(
      username: username.trim(),
      email: email.trim().toLowerCase(),
      password: password,
      gender: gender,
    );
    _users.add(user);
    state = AuthState(isLoggedIn: true, user: user);
    return null; // OK
  }

  // ── Login ────────────────────────────────────────────────────────────────

  /// Inicia sesión. Devuelve null si OK, o mensaje de error.
  String? login({required String username, required String password}) {
    if (username.trim().isEmpty || password.isEmpty) {
      return 'Completa todos los campos.';
    }
    final match = _users.cast<AuthUser?>().firstWhere(
          (u) =>
              u!.username.toLowerCase() == username.trim().toLowerCase() &&
              u.password == password,
          orElse: () => null,
        );
    if (match == null) return 'Usuario o contraseña incorrectos.';
    state = AuthState(isLoggedIn: true, user: match);
    return null;
  }

  // ── Logout ───────────────────────────────────────────────────────────────

  void logout() => state = const AuthState();

  // ── Validadores ──────────────────────────────────────────────────────────

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$').hasMatch(email.trim());
  }

  static bool _isStrongPassword(String password) {
    if (password.length < 10) return false;
    if (!password.contains(RegExp(r'[a-zA-Z]'))) return false;
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/]'))) {
      return false;
    }
    return true;
  }

  /// Exposición pública para usar en el validador del formulario.
  static bool validatePassword(String password) => _isStrongPassword(password);
}

