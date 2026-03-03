import 'package:go_router/go_router.dart';

import '../../features/presentation/pages/favorito_pokemon_page.dart';
import '../../features/presentation/pages/onboarding_page.dart';
import '../../features/presentation/pages/pokemon_list_page.dart';
import '../../features/presentation/pages/splash_page.dart';

/// Rutas de la aplicación centralizadas con go_router.
/// Nombres de ruta constantes para evitar strings dispersos (DRY).
abstract class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const pokemonList = '/pokemon';
  static const pokemonDetail = '/pokemon/:name';
  static const favorites = '/favorites';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.pokemonList,
      builder: (context, state) => const PokemonListPage(),
    ),
    GoRoute(
      path: AppRoutes.favorites,
      builder: (context, state) => const FavoritosPage(),
    ),
    // GoRoute(
    //   path: AppRoutes.pokemonDetail,
    //   builder: (context, state) {
    //     final name = state.pathParameters['name']!;
    //     return PokemonDetailPage(pokemonName: name);
    //   },
    // ),
  ],
);

