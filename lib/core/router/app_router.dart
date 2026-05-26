import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/pages/favorito_pokemon_page.dart';
import '../../features/presentation/pages/login_page.dart';
import '../../features/presentation/pages/onboarding_page.dart';
import '../../features/presentation/pages/pokemon_details_page.dart';
import '../../features/presentation/pages/pokemon_list_page.dart';
import '../../features/presentation/pages/profile_page.dart';
import '../../features/presentation/pages/register_page.dart';
import '../../features/presentation/pages/splash_page.dart';
import '../../features/presentation/providers/auth/auth_notifier.dart';
import '../../features/presentation/providers/auth/auth_provider.dart';

/// Rutas de la aplicación centralizadas con go_router.
abstract class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const pokemonList = '/pokemon';
  static const pokemonDetail = '/pokemon/:name';
  static const favorites = '/favorites';
  static const profile = '/profile';
  static const login = '/login';
  static const register = '/register';
}

/// Listenable que notifica al router cuando cambia el estado de auth.
/// Así el router NO se recrea — solo re-evalúa el redirect.
class _AuthNotifierListenable
    extends ChangeNotifier {

  late final ProviderSubscription
  _subscription;

  _AuthNotifierListenable(
      ProviderContainer container,
      ) {

    _subscription =
        container.listen(
          authNotifierProvider,
              (_, __) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

/// Provider del router. Se crea UNA SOLA VEZ (keepAlive implícito en Provider).
final appRouterProvider = Provider<GoRouter>((ref) {
  final container = ref.container;
  final listenable = _AuthNotifierListenable(container);

  final router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: listenable,
    redirect: (context, state) {
      try {
        final authState = container.read(authNotifierProvider);
        final isLoggedIn = authState.isLoggedIn;
        final location = state.matchedLocation;
        final isAuthRoute = location == AppRoutes.login ||
            location == AppRoutes.register;

        // Usuario NO logueado
        if (!isLoggedIn) {
          // Puede entrar a login/register
          if (isAuthRoute) {
            return null;
          }
          // Todo lo demás → login
          return AppRoutes.login;
        }

        // Usuario logueado
        if (isAuthRoute || location == AppRoutes.splash) {
          return AppRoutes.profile;
        }

        return null;
      } catch (e) {
        // Si hay error al leer auth, permitir continuar
        debugPrint('Error en AppRouter redirect: $e');
        return null;
      }
    },
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
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.pokemonDetail,
        builder: (context, state) {
          final name = state.pathParameters['name']!;
          return PokemonDetailPage(pokemonName: name);
        },
      ),
    ],
  );

  ref.onDispose(() {
    listenable.dispose();
    router.dispose();
  });

  return router;
});
