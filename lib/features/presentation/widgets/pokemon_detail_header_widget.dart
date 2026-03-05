import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/pokemon_type_utils.dart';
import '../../domain/entities/pokemon_entity.dart';

/// Header del Pokémon que se muestra en el [FlexibleSpaceBar] del SliverAppBar.
/// Contiene gradiente, imagen del Pokémon, nombre, número y chips de tipo.
class PokemonDetailHeaderWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailHeaderWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight;
        final totalWidth = constraints.maxWidth;

        return SizedBox(
          height: totalHeight,
          width: totalWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // ── Fondo con ClipPath ──────────────────────────────────
              // El SizedBox es más pequeño que el Stack para que la curva
              // que baja tenga espacio visible y no se corte en línea recta.
              ClipPath(
                clipper: _BottomArcClipper(),
                child: Container(
                  width: totalWidth,
                  height: totalHeight * 0.90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5DBE57),
                        Color(0xFF78C850),
                        Color(0xFF9DCE6A),
                      ],
                    ),
                  ),
                ),
              ),

              // ── Ícono del tipo como marca de agua ───────────────────
              Positioned(
                right: 70,
                top: 30,
                child: Opacity(
                  opacity: 0.12,
                  child: PokemonTypeUtils.typeIcon(
                    pokemon.types.first.name,
                    size: 220,
                  ),
                ),
              ),

              // ── Sprite del Pokémon ───────────────────────────────────
              Positioned(
                right: 100,
                bottom: 0,
                child: Hero(
                  tag: 'pokemon-${pokemon.id}',
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.officialArtworkUrl(pokemon.id),
                    height: 190,
                    width: 190,
                    fit: BoxFit.contain,
                    placeholder: (_, __) => SizedBox(
                      height: 190,
                      width: 190,
                      child: Icon(
                        Icons.catching_pokemon,
                        size: 80,
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    errorWidget: (_, __, ___) => SizedBox(
                      height: 190,
                      width: 190,
                      child: Icon(
                        Icons.catching_pokemon,
                        size: 120,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Los laterales arrancan desde la parte superior
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.55);   // lateral izquierdo sube hasta 55%

    // Curva cúbica tipo U: los puntos de control empujan los laterales hacia
    // arriba y dejan la punta centrada abajo, con forma hiperbólica/circular
    path.cubicTo(
      size.width * 0.20, size.height * 1.10,  // control izquierdo (debajo del clip)
      size.width * 0.80, size.height * 1.10,  // control derecho (debajo del clip)
      size.width, size.height * 0.55,          // lateral derecho sube hasta 55%
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_BottomArcClipper oldClipper) => false;
}
