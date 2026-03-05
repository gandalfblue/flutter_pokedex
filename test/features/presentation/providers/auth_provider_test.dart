import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/providers/auth_provider.dart';

ProviderContainer _makeContainer() {
  final c = ProviderContainer();
  addTearDown(c.dispose);
  return c;
}

void main() {
  // ── Estado inicial ────────────────────────────────────────────────────────
  group('AuthState — estado inicial', () {
    test('isLoggedIn es false', () {
      final c = _makeContainer();
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
    });

    test('user es null', () {
      final c = _makeContainer();
      expect(c.read(authNotifierProvider).user, isNull);
    });

    test('error es null', () {
      final c = _makeContainer();
      expect(c.read(authNotifierProvider).error, isNull);
    });
  });

  // ── validatePassword ──────────────────────────────────────────────────────
  group('AuthNotifier.validatePassword()', () {
    test('rechaza contraseña menor de 10 caracteres', () {
      expect(AuthNotifier.validatePassword('Ab1!'), isFalse);
    });

    test('rechaza contraseña sin letras', () {
      expect(AuthNotifier.validatePassword('1234567890!'), isFalse);
    });

    test('rechaza contraseña sin números', () {
      expect(AuthNotifier.validatePassword('Abcdefghij!'), isFalse);
    });

    test('rechaza contraseña sin carácter especial', () {
      expect(AuthNotifier.validatePassword('Abcdefg123'), isFalse);
    });

    test('acepta contraseña fuerte: letras+números+especial ≥10 chars', () {
      expect(AuthNotifier.validatePassword('SecurePass1!'), isTrue);
    });

    test('acepta contraseña exactamente de 10 caracteres válida', () {
      expect(AuthNotifier.validatePassword('Password1!'), isTrue);
    });

    test('acepta contraseña larga y compleja', () {
      expect(
          AuthNotifier.validatePassword('MiContraseña_Segura123!'), isTrue);
    });
  });

  // ── register ─────────────────────────────────────────────────────────────
  group('AuthNotifier.register()', () {
    test('registra un usuario válido y loguea', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
      expect(c.read(authNotifierProvider).user?.username, 'ash');
    });

    test('guarda el género correcto', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: 'misty',
            email: 'misty@pokemon.com',
            password: 'WaterGym123!',
            gender: TrainerGender.trainerFemale,
          );
      expect(
        c.read(authNotifierProvider).user?.gender,
        TrainerGender.trainerFemale,
      );
    });

    test('rechaza username vacío', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: '',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
    });

    test('rechaza email inválido', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'correo-invalido',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
    });

    test('rechaza contraseña débil', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: '123',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
    });

    test('rechaza username duplicado', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash2@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
      expect(error, contains('ya está en uso'));
    });

    test('rechaza email duplicado', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ash2',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
      expect(error, contains('registrado'));
    });

    test('username es case-insensitive para duplicados', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: 'Ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: 'ASH',
            email: 'ash2@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(error, isNotNull);
    });
  });

  // ── login ─────────────────────────────────────────────────────────────────
  group('AuthNotifier.login()', () {
    /// Helper: registra un usuario en el container
    void doRegister(ProviderContainer c) {
      c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      // Hacer logout para simular que no está logueado
      c.read(authNotifierProvider.notifier).logout();
    }

    test('loguea con credenciales correctas', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: 'ash',
            password: 'Pikachu123!',
          );
      expect(error, isNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
    });

    test('login es case-insensitive en username', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: 'ASH',
            password: 'Pikachu123!',
          );
      expect(error, isNull);
    });

    test('rechaza password incorrecto', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: 'ash',
            password: 'WrongPass99!',
          );
      expect(error, isNotNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
    });

    test('rechaza usuario inexistente', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).login(
            username: 'noexiste',
            password: 'Pikachu123!',
          );
      expect(error, isNotNull);
    });

    test('rechaza campos vacíos', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).login(
            username: '',
            password: '',
          );
      expect(error, isNotNull);
    });
  });

  // ── logout ────────────────────────────────────────────────────────────────
  group('AuthNotifier.logout()', () {
    test('cierra la sesión correctamente', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: 'ash',
            email: 'ash@pokemon.com',
            password: 'Pikachu123!',
            gender: TrainerGender.trainer,
          );
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
      c.read(authNotifierProvider.notifier).logout();
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
      expect(c.read(authNotifierProvider).user, isNull);
    });
  });
}

