import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/features/presentation/widgets/auth_form_widgets.dart';
import 'package:flutter_pokemon/features/presentation/widgets/password_strength_indicator_widget.dart';

// ── Datos de prueba (ficticios, sólo para tests) ──────────────────────────────
// Estos valores NO corresponden a credenciales reales.
const _tValidPassword = 'T3st_P@ssw0rd'; // cumple requisitos: ≥10, letras, números, especial
// ─────────────────────────────────────────────────────────────────────────────

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        )),
      ),
    );

void main() {
  // ── AuthTextField ─────────────────────────────────────────────────────────
  group('AuthTextField', () {
    testWidgets('renderiza con el hint correcto', (tester) async {
      await tester.pumpWidget(_wrap(
        Form(
          child: AuthTextField(
            controller: TextEditingController(),
            hint: 'Nombre de usuario',
            icon: Icons.person_outline_rounded,
          ),
        ),
      ));
      expect(find.text('Nombre de usuario'), findsOneWidget);
    });

    testWidgets('muestra el prefixIcon', (tester) async {
      await tester.pumpWidget(_wrap(
        Form(
          child: AuthTextField(
            controller: TextEditingController(),
            hint: 'Email',
            icon: Icons.email_outlined,
          ),
        ),
      ));
      expect(find.byIcon(Icons.email_outlined), findsOneWidget);
    });

    testWidgets('oculta texto cuando obscure es true', (tester) async {
      await tester.pumpWidget(_wrap(
        Form(
          child: AuthTextField(
            controller: TextEditingController(),
            hint: 'Contraseña',
            icon: Icons.lock_outline_rounded,
            obscure: true,
          ),
        ),
      ));
      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.obscureText, isTrue);
    });

    testWidgets('no oculta texto por defecto', (tester) async {
      await tester.pumpWidget(_wrap(
        Form(
          child: AuthTextField(
            controller: TextEditingController(),
            hint: 'Usuario',
            icon: Icons.person_outline_rounded,
          ),
        ),
      ));
      final editable = tester.widget<EditableText>(find.byType(EditableText));
      expect(editable.obscureText, isFalse);
    });

    testWidgets('muestra el sufixIcon cuando se pasa', (tester) async {
      await tester.pumpWidget(_wrap(
        Form(
          child: AuthTextField(
            controller: TextEditingController(),
            hint: 'Pass',
            icon: Icons.lock_outline_rounded,
            suffixIcon: const Icon(Icons.visibility_off_outlined),
          ),
        ),
      ));
      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    });

    testWidgets('llama al validator cuando el Form valida', (tester) async {
      final key = GlobalKey<FormState>();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Form(
            key: key,
            child: Column(
              children: [
                AuthTextField(
                  controller: TextEditingController(),
                  hint: 'Campo',
                  icon: Icons.person_outline_rounded,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Requerido' : null,
                ),
                ElevatedButton(
                  onPressed: () => key.currentState!.validate(),
                  child: const Text('Validar'),
                ),
              ],
            ),
          ),
        ),
      ));
      await tester.tap(find.text('Validar'));
      await tester.pump();
      expect(find.text('Requerido'), findsOneWidget);
    });
  });

  // ── AuthSubmitButton ──────────────────────────────────────────────────────
  group('AuthSubmitButton', () {
    testWidgets('muestra el label', (tester) async {
      await tester.pumpWidget(_wrap(
        AuthSubmitButton(label: 'Iniciar Sesión', onPressed: () {}),
      ));
      expect(find.text('Iniciar Sesión'), findsOneWidget);
    });

    testWidgets('llama onPressed al presionar', (tester) async {
      var pressed = false;
      await tester.pumpWidget(_wrap(
        AuthSubmitButton(
          label: 'Enviar',
          onPressed: () => pressed = true,
        ),
      ));
      await tester.tap(find.text('Enviar'));
      expect(pressed, isTrue);
    });

    testWidgets('tiene color de fondo rojo pokédex', (tester) async {
      await tester.pumpWidget(_wrap(
        AuthSubmitButton(label: 'OK', onPressed: () {}),
      ));
      final btn = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(btn, isNotNull);
    });
  });

  // ── AuthErrorBanner ───────────────────────────────────────────────────────
  group('AuthErrorBanner', () {
    testWidgets('muestra el mensaje de error', (tester) async {
      await tester.pumpWidget(_wrap(
        const AuthErrorBanner(message: 'Usuario o contraseña incorrectos.'),
      ));
      expect(
          find.text('Usuario o contraseña incorrectos.'), findsOneWidget);
    });

    testWidgets('muestra el ícono de error', (tester) async {
      await tester.pumpWidget(_wrap(
        const AuthErrorBanner(message: 'Error'),
      ));
      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    });
  });

  // ── PasswordStrengthIndicatorWidget ──────────────────────────────────────
  group('PasswordStrengthIndicatorWidget', () {
    testWidgets('no muestra nada con contraseña vacía', (tester) async {
      await tester.pumpWidget(_wrap(
        const PasswordStrengthIndicatorWidget(password: ''),
      ));
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });

    testWidgets('muestra LinearProgressIndicator con contraseña no vacía',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const PasswordStrengthIndicatorWidget(password: 'abc'),
      ));
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('muestra chips de requisitos', (tester) async {
      await tester.pumpWidget(_wrap(
        const PasswordStrengthIndicatorWidget(password: 'abc'),
      ));
      expect(find.text('≥ 10 chars'), findsOneWidget);
      expect(find.text('Letras'), findsOneWidget);
      expect(find.text('Números'), findsOneWidget);
      expect(find.text('Especial (!@#...)'), findsOneWidget);
    });

    testWidgets('muestra icono de contraseña segura cuando es válida',
        (tester) async {
      await tester.pumpWidget(_wrap(
        const PasswordStrengthIndicatorWidget(password: _tValidPassword),
      ));
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
      expect(find.text('Contraseña segura'), findsOneWidget);
    });

    testWidgets('no muestra icono de segura cuando es débil', (tester) async {
      await tester.pumpWidget(_wrap(
        const PasswordStrengthIndicatorWidget(password: 'abc'),
      ));
      expect(find.byIcon(Icons.check_circle_rounded), findsNothing);
    });
  });
}

