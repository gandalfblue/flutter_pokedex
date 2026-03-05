/// Constantes de configuración para la PokéAPI.
/// Se centralizan aquí para facilitar cambios y evitar strings dispersos (DRY).
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://pokeapi.co/api/v2';

  // Endpoints
  static const String pokemon = '/pokemon';
  static const String pokemonSpecies = '/pokemon-species';
  static const String type = '/type';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 10);

  // Paginación
  static const int pageSize = 20;

  // Sprites de tipos (generation-viii / sword-shield)
  static const String typeIconBaseUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-viii/sword-shield/en/';
}

