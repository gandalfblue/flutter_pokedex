import 'package:flutter/material.dart';

import 'nav_item_widget.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF141428),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.08), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItemWidget(icon: Icons.catching_pokemon, label: 'Pokémon', active: true),
          NavItemWidget(icon: Icons.favorite_border, label: 'Favoritos'),
          NavItemWidget(icon: Icons.settings_outlined, label: 'Ajustes'),
          NavItemWidget(icon: Icons.person_outline, label: 'Perfil'),
        ],
      ),
    );
  }
}