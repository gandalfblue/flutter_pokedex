import 'package:flutter/material.dart';

/// Widget del avatar circular del entrenador con borde de color y nivel.
class ProfileAvatarWidget extends StatelessWidget {
  final String assetPath;
  final int level;
  final double size;
  final VoidCallback? onTap;

  const ProfileAvatarWidget({
    super.key,
    required this.assetPath,
    required this.level,
    this.size = 100,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Anillo exterior decorativo
          Container(
            width: size + 8,
            height: size + 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFCC0000), Color(0xFFFF6B6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Fondo blanco interior
          Container(
            width: size + 4,
            height: size + 4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          // Imagen del avatar
          ClipOval(
            child: Container(
              width: size,
              height: size,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(size * 0.06),
                child: Image.asset(
                  assetPath,
                  width: size,
                  height: size,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.person_rounded,
                    size: size * 0.55,
                    color: const Color(0xFFCC0000),
                  ),
                ),
              ),
            ),
          ),
          // Badge de nivel
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFCC0000),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                'Nv.$level',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

