import 'package:flutter/material.dart';

class OnboardingTwoWidget extends StatelessWidget {
  const OnboardingTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            height: 200,
            child: Image.asset(
              'assets/images/entrenadora_onborading.png',
              fit: BoxFit.contain,
              errorBuilder:
                  (_, __, ___) => const Icon(
                    Icons.electric_bolt,
                    size: 100,
                    color: Colors.yellow,
                  ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Mantén tu Pokédex actualizada',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Registra y gestiona todos tus Pokémon. Revisa tus colecciones y muchas más en la aplicación.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}
