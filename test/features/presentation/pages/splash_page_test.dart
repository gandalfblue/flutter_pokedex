import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_pokemon/features/presentation/pages/splash_page.dart';

/// Router mínimo para que GoRouter no rompa el test.
GoRouter _buildRouter() => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const SplashPage(),
        ),
        GoRoute(
          path: '/onboarding',
          builder: (_, __) => const Scaffold(body: Text('Onboarding')),
        ),
      ],
    );

Widget buildSubject() => ProviderScope(
      child: MaterialApp.router(routerConfig: _buildRouter()),
    );

/// Avanza el tiempo hasta consumir el Timer de 3500 ms del splash.
/// Debe llamarse al final de cada test para no dejar timers pendientes.
Future<void> drainTimer(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 3500));
  await tester.pumpAndSettle();
}

void main() {
  setUp(() => WidgetsFlutterBinding.ensureInitialized());

  // ── Estructura básica ─────────────────────────────────────────────────────
  group('SplashPage — estructura', () {
    testWidgets('muestra un Scaffold con fondo oscuro', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      // Buscamos el Scaffold que pertenece al SplashPage (fondo #212121)
      final scaffolds = tester.widgetList<Scaffold>(find.byType(Scaffold));
      final splash = scaffolds.firstWhere(
        (s) => s.backgroundColor == const Color(0xFF212121),
        orElse: () => throw TestFailure('No se encontró Scaffold con fondo #212121'),
      );
      expect(splash.backgroundColor, const Color(0xFF212121));

      await drainTimer(tester);
    });

    testWidgets('renderiza al menos un CustomPaint (pokebola)', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      // El router puede agregar su propio CustomPaint; verificamos ≥ 1
      expect(find.byType(CustomPaint), findsWidgets);

      await drainTimer(tester);
    });

    testWidgets('contiene un AnimatedBuilder dentro del SplashPage',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      expect(find.byType(AnimatedBuilder), findsWidgets);

      await drainTimer(tester);
    });
  });

  // ── Fase 1: mitades separadas ─────────────────────────────────────────────
  group('SplashPage — Fase 1 (mitades)', () {
    testWidgets('al inicio hay al menos 2 CustomPaint para las mitades',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      // frame 0 → controller en 0.0 → fase 1
      await tester.pump(Duration.zero);

      // El router agrega 1 CustomPaint extra → esperamos ≥ 3 en total
      final count = tester.widgetList(find.byType(CustomPaint)).length;
      expect(count, greaterThanOrEqualTo(3));

      await drainTimer(tester);
    });

    testWidgets('en la fase 1 hay al menos 2 Opacity (una por mitad)',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump(Duration.zero);

      final count = tester.widgetList(find.byType(Opacity)).length;
      expect(count, greaterThanOrEqualTo(2));

      await drainTimer(tester);
    });

    testWidgets('en la fase 1 hay al menos 2 Transform.translate',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump(Duration.zero);

      // Transform.translate crea widgets Transform con translation
      final transforms = tester.widgetList<Transform>(find.byType(Transform));
      final translations = transforms
          .where((t) => t.transform.getTranslation().y != 0)
          .toList();
      // Al inicio (controller=0) los offsets son ±200 → y ≠ 0
      expect(translations.length, greaterThanOrEqualTo(2));

      await drainTimer(tester);
    });
  });

  // ── Fase 2: pokebola completa ─────────────────────────────────────────────
  group('SplashPage — Fase 2 (pokebola completa)', () {
    testWidgets('después de la fase de unión hay menos CustomPaint que en fase 1',
        (tester) async {
      await tester.pumpWidget(buildSubject());

      // Contamos en fase 1
      await tester.pump(Duration.zero);
      final phase1Count =
          tester.widgetList(find.byType(CustomPaint)).length;

      // Avanzamos más allá del 45% (2400 × 0.45 = 1080 ms)
      await tester.pump(const Duration(milliseconds: 1200));
      final phase2Count =
          tester.widgetList(find.byType(CustomPaint)).length;

      // En fase 2 desaparecen las 2 mitades → debe haber menos CustomPaint
      expect(phase2Count, lessThan(phase1Count));

      await drainTimer(tester);
    });

    testWidgets('en fase 2 hay exactamente 1 Opacity (pokebola completa)',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump(const Duration(milliseconds: 1200));

      expect(find.byType(Opacity), findsOneWidget);

      await drainTimer(tester);
    });

    testWidgets('en fase 2 existe un Transform para la rotación', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump(const Duration(milliseconds: 1500));

      // Transform.rotate produce un widget Transform
      expect(find.byType(Transform), findsWidgets);

      await drainTimer(tester);
    });
  });

  // ── Tamaño de la pokebola ─────────────────────────────────────────────────
  group('SplashPage — tamaño', () {
    testWidgets('el SizedBox de la pokebola mide 160 × 160', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      final sized = tester
          .widgetList<SizedBox>(find.byType(SizedBox))
          .where((s) => s.width == 160 && s.height == 160)
          .toList();
      expect(sized, isNotEmpty,
          reason: 'Debe existir un SizedBox de 160×160 para la pokebola');

      await drainTimer(tester);
    });

    testWidgets('el Stack de la animación está centrado en pantalla',
        (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      expect(find.byType(Center), findsWidgets);

      await drainTimer(tester);
    });
  });

  // ── Animación completa ────────────────────────────────────────────────────
  group('SplashPage — animación completa', () {
    testWidgets('completa los 2400 ms de animación sin errores', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump(const Duration(milliseconds: 2400));
      // Consumir el timer restante
      await drainTimer(tester);
      // Si llegamos aquí sin excepción, el test pasa
    });

    testWidgets('al terminar la animación solo hay 1 Opacity', (tester) async {
      await tester.pumpWidget(buildSubject());
      // Justo al terminar la animación (antes del timer de navegación)
      await tester.pump(const Duration(milliseconds: 2400));

      expect(find.byType(Opacity), findsOneWidget);

      await drainTimer(tester);
    });
  });

  // ── Timer de navegación ───────────────────────────────────────────────────
  group('SplashPage — navegación', () {
    testWidgets('navega al onboarding después de 3500 ms', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.pump();

      // Antes del timer: el SplashPage está en pantalla
      expect(find.byType(SplashPage), findsOneWidget);

      // Avanzamos exactamente 3500 ms para disparar el Timer
      await tester.pump(const Duration(milliseconds: 3500));
      await tester.pumpAndSettle();

      // Ahora debe mostrar la pantalla de onboarding
      expect(find.text('Onboarding'), findsOneWidget);
      expect(find.byType(SplashPage), findsNothing);
    });
  });
}

