import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  // Un solo controller con 2 fases:
  //  0.0 → 0.5  : las mitades se juntan (SlideIn)
  //  0.5 → 1.0  : la pokebola completa aparece y gira
  late AnimationController _controller;

  // Fase 1 — offset de la mitad roja (viene de arriba)
  late Animation<double> _topOffset;
  // Fase 1 — offset de la mitad blanca (viene de abajo)
  late Animation<double> _bottomOffset;
  // Fase 1 — fade de las mitades
  late Animation<double> _halvesAlpha;
  // Fase 2 — fade de la pokebola completa
  late Animation<double> _fullAlpha;
  // Fase 2 — rotación continua (varias vueltas)
  late Animation<double> _rotation;

  static const double _pokeballSize = 160;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    // ── Fase 1: 0 → 0.45  (mitades que se juntan) ────────────────────────
    const joinInterval = Interval(0.0, 0.45, curve: Curves.easeInOut);

    _topOffset = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: joinInterval),
    );
    _bottomOffset = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: joinInterval),
    );
    _halvesAlpha = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.15, curve: Curves.easeIn),
      ),
    );

    // ── Fase 2: 0.45 → 1.0  (pokebola completa + giro) ───────────────────
    _fullAlpha = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 0.55, curve: Curves.easeIn),
      ),
    );
    // 3 vueltas completas durante la fase 2
    _rotation = Tween<double>(begin: 0, end: 3 * 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    // Navegar al onboarding pasado 3.5 s
    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) context.go(AppRoutes.onboarding);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final showFull = _controller.value >= 0.45;
            return SizedBox(
              width: _pokeballSize,
              height: _pokeballSize,
              child: Stack(
                children: [
                  // ── Mitades separadas (fase 1) ──────────────────────────
                  if (!showFull) ...[
                    // Mitad roja — baja desde arriba
                    Opacity(
                      opacity: _halvesAlpha.value.clamp(0.0, 1.0),
                      child: Transform.translate(
                        offset: Offset(0, _topOffset.value),
                        child: CustomPaint(
                          size: const Size(_pokeballSize, _pokeballSize),
                          painter: _HalfPokeballPainter(isTop: true),
                        ),
                      ),
                    ),
                    // Mitad blanca — sube desde abajo
                    Opacity(
                      opacity: _halvesAlpha.value.clamp(0.0, 1.0),
                      child: Transform.translate(
                        offset: Offset(0, _bottomOffset.value),
                        child: CustomPaint(
                          size: const Size(_pokeballSize, _pokeballSize),
                          painter: _HalfPokeballPainter(isTop: false),
                        ),
                      ),
                    ),
                  ],

                  // ── Pokebola completa girando (fase 2) ─────────────────
                  if (showFull)
                    Opacity(
                      opacity: _fullAlpha.value.clamp(0.0, 1.0),
                      child: Transform.rotate(
                        angle: _rotation.value,
                        child: CustomPaint(
                          size: const Size(_pokeballSize, _pokeballSize),
                          painter: _FullPokeballPainter(),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Painter: mitad superior (roja) o inferior (blanca) ──────────────────────
class _HalfPokeballPainter extends CustomPainter {
  final bool isTop;
  const _HalfPokeballPainter({required this.isTop});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeW = size.width * 0.07;

    if (isTop) {
      // Semicírculo rojo superior
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi, math.pi, true,
        Paint()..color = const Color(0xFFE53935),
      );
      // Franja negra inferior de la mitad
      canvas.drawLine(
        Offset(0, center.dy),
        Offset(size.width, center.dy),
        Paint()
          ..color = const Color(0xFF212121)
          ..strokeWidth = strokeW
          ..style = PaintingStyle.stroke,
      );
      // Borde exterior
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - size.width * 0.025),
        math.pi, math.pi, false,
        Paint()
          ..color = const Color(0xFF212121)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.05,
      );
    } else {
      // Semicírculo blanco inferior
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0, math.pi, true,
        Paint()..color = Colors.white,
      );
      // Franja negra superior de la mitad
      canvas.drawLine(
        Offset(0, center.dy),
        Offset(size.width, center.dy),
        Paint()
          ..color = const Color(0xFF212121)
          ..strokeWidth = strokeW
          ..style = PaintingStyle.stroke,
      );
      // Borde exterior
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - size.width * 0.025),
        0, math.pi, false,
        Paint()
          ..color = const Color(0xFF212121)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.05,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _HalfPokeballPainter old) => old.isTop != isTop;
}

// ── Painter: pokebola completa ───────────────────────────────────────────────
class _FullPokeballPainter extends CustomPainter {
  const _FullPokeballPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Mitad roja
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, math.pi, true,
      Paint()..color = const Color(0xFFE53935),
    );
    // Mitad blanca
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0, math.pi, true,
      Paint()..color = Colors.white,
    );
    // Franja central
    canvas.drawLine(
      Offset(0, center.dy),
      Offset(size.width, center.dy),
      Paint()
        ..color = const Color(0xFF212121)
        ..strokeWidth = size.width * 0.07
        ..style = PaintingStyle.stroke,
    );
    // Borde exterior
    canvas.drawCircle(
      center,
      radius - size.width * 0.025,
      Paint()
        ..color = const Color(0xFF212121)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.05,
    );
    // Botón central — fondo
    canvas.drawCircle(center, size.width * 0.18, Paint()..color = Colors.white);
    // Botón central — borde
    canvas.drawCircle(
      center,
      size.width * 0.18,
      Paint()
        ..color = const Color(0xFF212121)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.05,
    );
    // Botón central — interior
    canvas.drawCircle(
      center,
      size.width * 0.10,
      Paint()..color = const Color(0xFFEEEEEE),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
