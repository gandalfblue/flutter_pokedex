/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/providers/auth_provider.dart';
import '../../../helpers/fake_app_localizations.dart';

// ── Datos de prueba (ficticios, sólo para tests) ──────────────────────────────
// Estos valores NO corresponden a credenciales reales.
const _tUsername        = 'trainer_test';
const _tUsernameAlt     = 'trainer_test_2';
const _tUsernameMixed   = 'Trainer_Test';
const _tUsernameMixedUp = 'TRAINER_TEST';
const _tEmail           = 'trainer_test@example.test';
const _tEmailAlt        = 'trainer_test_2@example.test';
const _tEmailFemale     = 'trainerf_test@example.test';
const _tValidPassword   = 'T3st_P@ssw0rd';       // cumple requisitos: ≥10, letras, números, especial
const _tValidPassword2  = 'T3st_P@ssw0rd_2';     // contraseña válida alternativa (otro usuario)
const _tWrongPassword   = 'Wr0ng_P@ssw0rd';      // contraseña incorrecta para login fallido
const _tWeakPassword    = '123';                  // contraseña débil (para validación)
const _tWeakShort       = 'Ab1!';                 // < 10 caracteres
const _tWeakNoLetters   = '1234567890!';          // sin letras
const _tWeakNoNumbers   = 'Abcdefghij!';          // sin números
const _tWeakNoSpecial   = 'Abcdefg123';           // sin carácter especial
const _tStrongMin10     = 'P@ssw0rd1x';           // exactamente 10 caracteres válidos
const _tStrongLong      = 'C0mplex_P@ssw0rd_Lng'; // larga y compleja
// ─────────────────────────────────────────────────────────────────────────────

/// Instancia compartida del stub de localización para todos los tests.
final _l10n = FakeAppLocalizations();

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
      expect(AuthNotifier.validatePassword(_tWeakShort), isFalse);
    });

    test('rechaza contraseña sin letras', () {
      expect(AuthNotifier.validatePassword(_tWeakNoLetters), isFalse);
    });

    test('rechaza contraseña sin números', () {
      expect(AuthNotifier.validatePassword(_tWeakNoNumbers), isFalse);
    });

    test('rechaza contraseña sin carácter especial', () {
      expect(AuthNotifier.validatePassword(_tWeakNoSpecial), isFalse);
    });

    test('acepta contraseña fuerte: letras+números+especial ≥10 chars', () {
      expect(AuthNotifier.validatePassword(_tValidPassword), isTrue);
    });

    test('acepta contraseña exactamente de 10 caracteres válida', () {
      expect(AuthNotifier.validatePassword(_tStrongMin10), isTrue);
    });

    test('acepta contraseña larga y compleja', () {
      expect(AuthNotifier.validatePassword(_tStrongLong), isTrue);
    });
  });

  // ── register ─────────────────────────────────────────────────────────────
  group('AuthNotifier.register()', () {
    test('registra un usuario válido y loguea', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
      expect(c.read(authNotifierProvider).user?.username, _tUsername);
    });

    test('guarda el género correcto', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: _tUsernameAlt,
            email: _tEmailFemale,
            password: _tValidPassword2,
            gender: TrainerGender.trainerFemale,
            l10n: _l10n,
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
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
    });

    test('rechaza email inválido', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: 'correo-invalido',
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
    });

    test('rechaza contraseña débil', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tWeakPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
    });

    test('rechaza username duplicado', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmailAlt,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
      expect(error, equals(_l10n.authErrorUsernameTaken));
    });

    test('rechaza email duplicado', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsernameAlt,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
      expect(error, equals(_l10n.authErrorEmailTaken));
    });

    test('username es case-insensitive para duplicados', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: _tUsernameMixed,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      final error = c.read(authNotifierProvider.notifier).register(
            username: _tUsernameMixedUp,
            email: _tEmailAlt,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(error, isNotNull);
    });
  });

  // ── login ─────────────────────────────────────────────────────────────────
  group('AuthNotifier.login()', () {
    /// Helper: registra un usuario en el container
    void doRegister(ProviderContainer c) {
      c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      // Hacer logout para simular que no está logueado
      c.read(authNotifierProvider.notifier).logout();
    }

    test('loguea con credenciales correctas', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: _tUsername,
            password: _tValidPassword,
            l10n: _l10n,
          );
      expect(error, isNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
    });

    test('login es case-insensitive en username', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: _tUsernameMixedUp,
            password: _tValidPassword,
            l10n: _l10n,
          );
      expect(error, isNull);
    });

    test('rechaza password incorrecto', () {
      final c = _makeContainer();
      doRegister(c);
      final error = c.read(authNotifierProvider.notifier).login(
            username: _tUsername,
            password: _tWrongPassword,
            l10n: _l10n,
          );
      expect(error, isNotNull);
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
    });

    test('rechaza usuario inexistente', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).login(
            username: 'no_existe_test',
            password: _tValidPassword,
            l10n: _l10n,
          );
      expect(error, isNotNull);
    });

    test('rechaza campos vacíos', () {
      final c = _makeContainer();
      final error = c.read(authNotifierProvider.notifier).login(
            username: '',
            password: '',
            l10n: _l10n,
          );
      expect(error, isNotNull);
    });
  });

  // ── logout ────────────────────────────────────────────────────────────────
  group('AuthNotifier.logout()', () {
    test('cierra la sesión correctamente', () {
      final c = _makeContainer();
      c.read(authNotifierProvider.notifier).register(
            username: _tUsername,
            email: _tEmail,
            password: _tValidPassword,
            gender: TrainerGender.trainer,
            l10n: _l10n,
          );
      expect(c.read(authNotifierProvider).isLoggedIn, isTrue);
      c.read(authNotifierProvider.notifier).logout();
      expect(c.read(authNotifierProvider).isLoggedIn, isFalse);
      expect(c.read(authNotifierProvider).user, isNull);
    });
  });
}

*/
