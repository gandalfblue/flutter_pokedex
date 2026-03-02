import 'dart:math' as math;

import 'package:flutter/material.dart';

class PokeballWidget extends StatelessWidget {
  final double size;

  const PokeballWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _PokeballPainter());
  }
}

class _PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final redPaint = Paint()..color = const Color(0xFFE53935);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      true,
      redPaint,
    );

    final whitePaint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      math.pi,
      true,
      whitePaint,
    );

    final stripePaint =
        Paint()
          ..color = const Color(0xFF212121)
          ..strokeWidth = size.width * 0.07
          ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, center.dy),
      Offset(size.width, center.dy),
      stripePaint,
    );

    final outerCirclePaint =
        Paint()
          ..color = const Color(0xFF212121)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.05;
    canvas.drawCircle(center, radius - size.width * 0.025, outerCirclePaint);

    final btnBgPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, size.width * 0.18, btnBgPaint);

    final btnBorderPaint =
        Paint()
          ..color = const Color(0xFF212121)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.05;
    canvas.drawCircle(center, size.width * 0.18, btnBorderPaint);

    final btnInnerPaint = Paint()..color = const Color(0xFFEEEEEE);
    canvas.drawCircle(center, size.width * 0.10, btnInnerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
