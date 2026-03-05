import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingTwoWidget extends StatelessWidget {
  const OnboardingTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 180,
            height: 200,
            child: Image.asset(
              'assets/images/entrenadora.png',
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
          Text(
            l10n.onboardingTwoTitleText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.onboardingTwoBodyText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white60, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}
