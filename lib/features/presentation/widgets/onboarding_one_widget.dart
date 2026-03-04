import 'package:flutter/material.dart';

class OnboardingOneWidget extends StatelessWidget {
  const OnboardingOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 280,
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/niño_explorador_onboarding.png',
                  height: 180,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.catching_pokemon,
                    size: 100,
                    color: Colors.white54,
                  ),
                ),
              ),
                Positioned(
                  right: -10,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/Profesor_onboarding.png',
                    height: 200,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.catching_pokemon,
                      size: 100,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Todos los Pokémon en un solo lugar',
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
            'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}
