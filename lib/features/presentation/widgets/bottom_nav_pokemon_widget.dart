import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';

/// Bottom navigation bar auto-gestionado.
///
/// Detecta la ruta activa automáticamente usando [GoRouterState]
/// y navega sin necesidad de pasar [currentIndex] ni [onTap] desde
/// las pages padre.  Las pages solo hacen:
///
/// ```dart
/// BottomNavPokemonWidget()
/// ```
class BottomNavPokemonWidget extends StatelessWidget {
  const BottomNavPokemonWidget({super.key});

  // ── Definición de tabs ────────────────────────────────────────────────────
  static const _tabs = [
    _NavTab(icon: Icons.catching_pokemon, label: 'Pokédex', route: AppRoutes.pokemonList),
    _NavTab(icon: Icons.favorite,         label: 'Favoritos', route: AppRoutes.favorites),
    _NavTab(icon: Icons.person_outline,   label: 'Perfil',   route: AppRoutes.profile),
  ];

  /// Devuelve el índice activo según la ruta actual.
  int _activeIndex(String location) {
    if (location.startsWith(AppRoutes.favorites)) return 1;
    if (location.startsWith(AppRoutes.profile) ||
        location == AppRoutes.login ||
        location == AppRoutes.register) return 2;
    return 0; // pokemonList y pokemonDetail
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final active  = _activeIndex(location);

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
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
        children: List.generate(_tabs.length, (i) {
          final isActive = i == active;
          final color = isActive ? const Color(0xFF2196F3) : Colors.grey.shade400;
          return GestureDetector(
            onTap: () {
              if (i == active) return;
              context.go(_tabs[i].route);
            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_tabs[i].icon, color: color, size: 22),
                  const SizedBox(height: 4),
                  Text(
                    _tabs[i].label,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
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

/// Modelo interno de un tab de navegación.
class _NavTab {
  final IconData icon;
  final String label;
  final String route;
  const _NavTab({required this.icon, required this.label, required this.route});
}
