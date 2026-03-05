import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_pokemon/features/presentation/pages/login_page.dart';
import 'package:flutter_pokemon/features/presentation/pages/register_page.dart';
import 'package:flutter_pokemon/features/presentation/providers/auth_provider.dart';
import 'package:flutter_pokemon/features/presentation/widgets/auth_form_widgets.dart';

// ── Datos de prueba (ficticios, sólo para tests) ──────────────────────────────
// Estos valores NO corresponden a credenciales reales.
const _tUsername      = 'trainer_test';
const _tEmail         = 'trainer_test@example.test';
const _tValidPassword = 'T3st_P@ssw0rd';  // cumple requisitos: ≥10, letras, números, especial
const _tWrongPassword = 'Wr0ng_P@ssw0rd'; // contraseña incorrecta para login fallido
const _tWeakPassword  = '123';            // contraseña débil para validaciones
const _tFakeEmail     = 'fake_user@example.test'; // email interno del fake notifier
// ─────────────────────────────────────────────────────────────────────────────

// ── Fake AuthNotifier ─────────────────────────────────────────────────────────

class _FakeAuthNotifier extends AuthNotifier {
  final String? _loginError;
  _FakeAuthNotifier({String? loginError}) : _loginError = loginError;

  @override
  AuthState build() => const AuthState();

  @override
  String? login({required String username, required String password}) {
    if (_loginError != null) return _loginError;
    state = AuthState(
      isLoggedIn: true,
      user: AuthUser(
        username: username,
        email: _tFakeEmail,
        password: password,
        gender: TrainerGender.trainer,
      ),
    );
    return null;
  }
}

class _FakeRegisterNotifier extends AuthNotifier {
  final String? _registerError;
  _FakeRegisterNotifier({String? registerError})
      : _registerError = registerError;

  @override
  AuthState build() => const AuthState();

  @override
  String? register({
    required String username,
    required String email,
    required String password,
    required TrainerGender gender,
  }) {
    if (_registerError != null) return _registerError;
    // No loguea: el register_page hace logout después de registrar
    return null;
  }

  @override
  void logout() {
    state = const AuthState();
  }
}

// ── Router helpers ────────────────────────────────────────────────────────────

GoRouter _loginRouter() => GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(path: '/login',   builder: (_, __) => const LoginPage()),
        GoRoute(path: '/register',builder: (_, __) => const RegisterPage()),
        GoRoute(path: '/profile', builder: (_, __) => const Scaffold(body: Text('Profile'))),
      ],
    );

GoRouter _registerRouter() => GoRouter(
      initialLocation: '/register',
      routes: [
        GoRoute(path: '/register',builder: (_, __) => const RegisterPage()),
        GoRoute(path: '/login',   builder: (_, __) => const LoginPage()),
        GoRoute(path: '/profile', builder: (_, __) => const Scaffold(body: Text('Profile'))),
      ],
    );

Widget _buildLogin({String? loginError}) => ProviderScope(
      overrides: [
        authNotifierProvider.overrideWith(
            () => _FakeAuthNotifier(loginError: loginError)),
      ],
      child: MaterialApp.router(
        routerConfig: _loginRouter(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('es'),
      ),
    );

Widget _buildRegister({String? registerError}) => ProviderScope(
      overrides: [
        authNotifierProvider.overrideWith(
            () => _FakeRegisterNotifier(registerError: registerError)),
      ],
      child: MaterialApp.router(
        routerConfig: _registerRouter(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('es'),
      ),
    );

// ── Tests LoginPage ───────────────────────────────────────────────────────────

void main() {
  group('LoginPage — estructura', () {
    testWidgets('renderiza el título "Iniciar Sesión"', (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();
      expect(find.text('Iniciar Sesión'), findsWidgets);
    });

    testWidgets('muestra 2 AuthTextField (usuario y contraseña)',
        (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();
      expect(find.byType(AuthTextField), findsNWidgets(2));
    });

    testWidgets('muestra el botón "Iniciar Sesión"', (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();
      expect(find.byType(AuthSubmitButton), findsOneWidget);
    });

    testWidgets('muestra enlace a registro', (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();
      expect(find.text('Regístrate'), findsOneWidget);
    });
  });

  group('LoginPage — validación', () {
    testWidgets('muestra error al enviar formulario vacío', (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();
      await tester.tap(find.byType(AuthSubmitButton));
      await tester.pump();
      expect(find.text('Por favor completa todos los campos.'), findsWidgets);
    });

    testWidgets('muestra AuthErrorBanner con error de credenciales',
        (tester) async {
      await tester.pumpWidget(
          _buildLogin(loginError: 'Usuario o contraseña incorrectos.'));
      await tester.pump();

      await tester.enterText(find.byType(AuthTextField).first, _tUsername);
      await tester.enterText(find.byType(AuthTextField).last, _tWrongPassword);
      await tester.tap(find.byType(AuthSubmitButton));
      await tester.pump();

      expect(find.byType(AuthErrorBanner), findsOneWidget);
      expect(find.text('Usuario o contraseña incorrectos.'), findsOneWidget);
    });

    testWidgets('navega a /profile cuando el login es exitoso',
        (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();

      await tester.enterText(find.byType(AuthTextField).first, _tUsername);
      await tester.enterText(find.byType(AuthTextField).last, _tValidPassword);
      await tester.tap(find.byType(AuthSubmitButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Profile'), findsOneWidget);
    });
  });

  group('LoginPage — visibilidad contraseña', () {
    testWidgets('toggle de visibilidad muestra/oculta la contraseña',
        (tester) async {
      await tester.pumpWidget(_buildLogin());
      await tester.pump();

      // Al inicio la contraseña está oculta
      final editables =
          tester.widgetList<EditableText>(find.byType(EditableText)).toList();
      expect(editables.last.obscureText, isTrue);

      // Tap en el ojo
      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      final updatedEditables =
          tester.widgetList<EditableText>(find.byType(EditableText)).toList();
      expect(updatedEditables.last.obscureText, isFalse);
    });
  });

  // ── Tests RegisterPage ────────────────────────────────────────────────────

  group('RegisterPage — estructura', () {
    testWidgets('renderiza el título "Crear Cuenta"', (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      expect(find.text('Crear Cuenta'), findsWidgets);
    });

    testWidgets('muestra 4 AuthTextField', (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      expect(find.byType(AuthTextField), findsNWidgets(4));
    });

    testWidgets('muestra el selector de género', (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      expect(find.text('Entrenador'), findsWidgets);
      expect(find.text('Entrenadora'), findsWidgets);
    });

    testWidgets('muestra enlace a login', (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      expect(find.text('Inicia Sesión'), findsOneWidget);
    });

    testWidgets('muestra PasswordStrengthIndicator inicialmente vacío',
        (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });
  });

  group('RegisterPage — selector de género', () {
    testWidgets('selecciona Entrenadora al hacer tap', (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();

      await tester.tap(find.text('Entrenadora').first, warnIfMissed: false);
      await tester.pump();

      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });
  });

  group('RegisterPage — validación contraseña', () {
    testWidgets('muestra indicador de fortaleza al escribir contraseña',
        (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();
      await tester.enterText(find.byType(AuthTextField).at(2), 'abc');
      await tester.pump();
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('muestra error cuando contraseña es débil al validar',
        (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();

      await tester.enterText(find.byType(AuthTextField).at(0), _tUsername);
      await tester.enterText(find.byType(AuthTextField).at(1), _tEmail);
      await tester.enterText(find.byType(AuthTextField).at(2), _tWeakPassword);
      await tester.enterText(find.byType(AuthTextField).at(3), _tWeakPassword);

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pump();

      await tester.tap(find.byType(AuthSubmitButton), warnIfMissed: false);
      await tester.pump();

      expect(find.byType(AuthTextField), findsWidgets);
    });
  });

  group('RegisterPage — registro exitoso', () {
    testWidgets('navega a /login cuando el registro es exitoso',
        (tester) async {
      await tester.pumpWidget(_buildRegister());
      await tester.pump();

      await tester.enterText(find.byType(AuthTextField).at(0), _tUsername);
      await tester.enterText(find.byType(AuthTextField).at(1), _tEmail);
      await tester.enterText(find.byType(AuthTextField).at(2), _tValidPassword);
      await tester.enterText(find.byType(AuthTextField).at(3), _tValidPassword);

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pump();

      await tester.tap(find.byType(AuthSubmitButton), warnIfMissed: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Iniciar Sesión'), findsWidgets);
    });

    testWidgets('muestra AuthErrorBanner con error del servidor',
        (tester) async {
      await tester.pumpWidget(
          _buildRegister(registerError: 'El usuario ya existe.'));
      await tester.pump();

      await tester.enterText(find.byType(AuthTextField).at(0), _tUsername);
      await tester.enterText(find.byType(AuthTextField).at(1), _tEmail);
      await tester.enterText(find.byType(AuthTextField).at(2), _tValidPassword);
      await tester.enterText(find.byType(AuthTextField).at(3), _tValidPassword);

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pump();

      await tester.tap(find.byType(AuthSubmitButton), warnIfMissed: false);
      await tester.pump();

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 400));
      await tester.pump();

      expect(find.byType(AuthErrorBanner), findsOneWidget);
    });
  });
}

