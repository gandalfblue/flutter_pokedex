/// Constantes generales de la aplicación.
class AppConstants {
  AppConstants._();

  static const String appName = 'Pokédex';

  // Sprites: URL base de imágenes de alta calidad (artwork oficial)
  static const String officialArtworkBaseUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';

  static String officialArtworkUrl(int id) => '$officialArtworkBaseUrl/$id.png';

  // Número de columnas del grid
  static const int gridCrossAxisCount = 2;
}

