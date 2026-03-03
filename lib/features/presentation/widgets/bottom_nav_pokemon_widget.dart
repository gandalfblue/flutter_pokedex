import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';

class BottomNavPokemonWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomNavPokemonWidget({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  void _handleTap(BuildContext context, int index) {
    if (onTap != null) {
      onTap!(index);
      return;
    }
    switch (index) {
      case 0:
        context.go(AppRoutes.pokemonList);
        break;
      case 2:
        context.go(AppRoutes.favorites);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      {'icon': Icons.catching_pokemon, 'label': 'Pokédex'},
      {'icon': Icons.public, 'label': 'Regiones'},
      {'icon': Icons.favorite, 'label': 'Favoritos'},
      {'icon': Icons.person_outline, 'label': 'Perfil'},
    ];

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final isActive = i == currentIndex;
          final color =
          isActive ? const Color(0xFF2196F3) : Colors.grey.shade400;
          return GestureDetector(
            onTap: () => _handleTap(context, i),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(items[i]['icon'] as IconData, color: color, size: 22),
                  const SizedBox(height: 4),
                  Text(
                    items[i]['label'] as String,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: isActive
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}