import 'package:flutter/material.dart';

class GhostPokemonWidget extends StatelessWidget {
  const GhostPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.04),
                  blurRadius: 40,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
          Image.asset('assets/images/Magikarp_Jump_Pattern.png',
            fit: BoxFit.contain,
            color: Colors.white.withOpacity(0.15),
            colorBlendMode: BlendMode.srcATop,
            errorBuilder: (_, __, ___) => CustomPaint(
              size: const Size(160, 160),
              painter: _GhostPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _GhostPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;
    final cy = size.height / 2;

    final path = Path();
    path.addOval(Rect.fromCenter(
      center: Offset(cx, cy - 10),
      width: 90,
      height: 100,
    ));
    canvas.drawPath(path, paint);

    final eyePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx - 15, cy - 15), 8, eyePaint);
    canvas.drawCircle(Offset(cx + 15, cy - 15), 8, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
