import 'package:flutter/material.dart';

class NavItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const NavItemWidget({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF2196F3) : Colors.white30;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 10),
        ),
      ],
    );
  }
}
