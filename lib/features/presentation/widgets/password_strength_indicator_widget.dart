import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';

/// Indicador visual de fortaleza de contraseña.
class PasswordStrengthIndicatorWidget extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicatorWidget({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();

    final isStrong = AuthNotifier.validatePassword(password);
    final hasLength = password.length >= 10;
    final hasLetter = password.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(
        RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/]'));

    final met = [hasLength, hasLetter, hasNumber, hasSpecial]
        .where((b) => b)
        .length;
    final strength = met / 4;

    Color barColor;
    if (strength <= 0.25) {
      barColor = Colors.red;
    } else if (strength <= 0.5) {
      barColor = Colors.orange;
    } else if (strength <= 0.75) {
      barColor = Colors.amber;
    } else {
      barColor = const Color(0xFF7AC74C);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: strength,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
            minHeight: 5,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            _Chip(label: '≥ 10 chars', met: hasLength),
            _Chip(label: 'Letras', met: hasLetter),
            _Chip(label: 'Números', met: hasNumber),
            _Chip(label: 'Especial (!@#...)', met: hasSpecial),
          ],
        ),
        if (isStrong)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded,
                    size: 14, color: Color(0xFF7AC74C)),
                const SizedBox(width: 4),
                Text(
                  'Contraseña segura',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool met;
  const _Chip({required this.label, required this.met});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: met
            ? const Color(0xFF7AC74C).withValues(alpha: 0.15)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: met ? const Color(0xFF7AC74C) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: met ? Colors.green.shade700 : Colors.grey.shade500,
        ),
      ),
    );
  }
}

