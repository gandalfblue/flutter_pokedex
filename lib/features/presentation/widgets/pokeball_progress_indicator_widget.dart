import 'dart:math';
import 'package:flutter/material.dart';

/// A Pokeball-shaped circular progress indicator widget.
///
/// Usage:
///   PokeballProgressIndicator(value: 0.7)  // determinate (0.0 to 1.0)
///   PokeballProgressIndicator()             // indeterminate (spins forever)
class PokeballProgressIndicator extends StatefulWidget {

  /// Progress value from 0.0 to 1.0. If null, spins indefinitely.
  final double? value;

  /// Size (width & height) of the widget.
  final double size;

  /// Duration of one full rotation in indeterminate mode.
  final Duration rotationDuration;

  const PokeballProgressIndicator({
    Key? key,
    this.value,
    this.size = 80.0,
    this.rotationDuration = const Duration(milliseconds: 1200),
  }) : super(key: key);

  @override
  State<PokeballProgressIndicator> createState() =>
      _PokeballProgressIndicatorState();
}

class _PokeballProgressIndicatorState extends State<PokeballProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.rotationDuration,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    if (widget.value == null) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(PokeballProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: widget.value == null
              ? _rotationAnimation.value * 2 * pi
              : 0.0,
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _PokeballPainter(progress: widget.value ?? 1.0),
          ),
        );
      },
    );
  }
}

class _PokeballPainter extends CustomPainter {
  final double progress;

  _PokeballPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = size.width * 0.06;
    final innerBandHeight = size.height * 0.13;

    // ── 1. Top half (red) ──────────────────────────────────────────────────
    final redPaint = Paint()..color = const Color(0xFFE3000B);
    final redPath = Path()
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        pi,
        pi,
        false,
      )
      ..close();
    canvas.drawPath(redPath, redPaint);

    // ── 2. Bottom half (white) ─────────────────────────────────────────────
    final whitePaint = Paint()..color = const Color(0xFFFFFFFF);
    final whitePath = Path()
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        0,
        pi,
        false,
      )
      ..close();
    canvas.drawPath(whitePath, whitePaint);

    // ── 3. Horizontal band (black) ─────────────────────────────────────────
    final bandPaint = Paint()..color = const Color(0xFF1A1A1A);
    canvas.drawRect(
      Rect.fromCenter(
        center: center,
        width: size.width,
        height: innerBandHeight,
      ),
      bandPaint,
    );

    // ── 4. Outer black border circle ───────────────────────────────────────
    final borderPaint = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius - strokeWidth / 2, borderPaint);

    // ── 5. Center button – outer ring (black) ──────────────────────────────
    final buttonRadius = size.width * 0.175;
    final buttonBorderPaint = Paint()..color = const Color(0xFF1A1A1A);
    canvas.drawCircle(center, buttonRadius, buttonBorderPaint);

    // ── 6. Center button – inner circle (white) ────────────────────────────
    final innerButtonPaint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawCircle(center, buttonRadius * 0.65, innerButtonPaint);

    // ── 7. Progress arc overlay (semi-transparent white) ──────────────────
    if (progress < 1.0) {
      final overlayPaint = Paint()
        ..color = const Color(0xAAFFFFFF)
        ..style = PaintingStyle.fill;

      // Mask the "unfilled" portion as a sweep from progress*2π → 2π
      final sweepAngle = (1.0 - progress) * 2 * pi;
      final startAngle = -pi / 2 + progress * 2 * pi;

      final overlayPath = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..close();

      canvas.drawPath(overlayPath, overlayPaint);

      // Redraw center button on top so it stays clean
      canvas.drawCircle(center, buttonRadius, buttonBorderPaint);
      canvas.drawCircle(center, buttonRadius * 0.65, innerButtonPaint);
    }

    // ── 8. Shine highlight ─────────────────────────────────────────────────
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;
    final shinePath = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(center.dx - radius * 0.25, center.dy - radius * 0.45),
          width: radius * 0.45,
          height: radius * 0.22,
        ),
      );
    canvas.drawPath(shinePath, shinePaint);
  }

  @override
  bool shouldRepaint(_PokeballPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

// ─────────────────────────────────────────────────────────────────────────────
// Demo app – shows both indeterminate and determinate modes
// ─────────────────────────────────────────────────────────────────────────────

void main() => runApp(const PokeDemoApp());

class PokeDemoApp extends StatelessWidget {
  const PokeDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokeball Progress Indicator',
      theme: ThemeData.dark(),
      home: const PokeballDemoScreen(),
    );
  }
}

class PokeballDemoScreen extends StatefulWidget {
  const PokeballDemoScreen({Key? key}) : super(key: key);

  @override
  State<PokeballDemoScreen> createState() => _PokeballDemoScreenState();
}

class _PokeballDemoScreenState extends State<PokeballDemoScreen> {
  double _progress = 0.65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2E),
      appBar: AppBar(
        title: const Text('Pokeball Progress Indicator'),
        backgroundColor: const Color(0xFF12121F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Indeterminate (spinning) ───────────────────────────────────
            const Text(
              'Indeterminate (spinning)',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const PokeballProgressIndicator(size: 90),
            const SizedBox(height: 48),

            // ── Determinate ───────────────────────────────────────────────
            Text(
              'Determinate  ${(_progress * 100).round()}%',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            PokeballProgressIndicator(value: _progress, size: 90),
            const SizedBox(height: 24),

            // Slider to control progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFFE3000B),
                  thumbColor: const Color(0xFFE3000B),
                  inactiveTrackColor: Colors.white24,
                ),
                child: Slider(
                  value: _progress,
                  onChanged: (v) => setState(() => _progress = v),
                ),
              ),
            ),
            const SizedBox(height: 48),

            // ── Various sizes ─────────────────────────────────────────────
            const Text(
              'Various sizes',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                PokeballProgressIndicator(size: 32),
                SizedBox(width: 20),
                PokeballProgressIndicator(size: 56),
                SizedBox(width: 20),
                PokeballProgressIndicator(size: 80),
                SizedBox(width: 20),
                PokeballProgressIndicator(size: 110),
              ],
            ),
          ],
        ),
      ),
    );
  }
}