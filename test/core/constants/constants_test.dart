import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/constants/app_constants.dart';
import 'package:flutter_pokemon/core/constants/api_constants.dart';

void main() {
  group('AppConstants', () {
    test('officialArtworkUrl construye la URL correcta', () {
      expect(
        AppConstants.officialArtworkUrl(1),
        '${AppConstants.officialArtworkBaseUrl}/1.png',
      );
      expect(
        AppConstants.officialArtworkUrl(150),
        '${AppConstants.officialArtworkBaseUrl}/150.png',
      );
    });

    test('gridCrossAxisCount es 2', () {
      expect(AppConstants.gridCrossAxisCount, 2);
    });

    test('appName no está vacío', () {
      expect(AppConstants.appName, isNotEmpty);
    });
  });

  group('ApiConstants', () {
    test('baseUrl comienza con https', () {
      expect(ApiConstants.baseUrl, startsWith('https'));
    });

    test('endpoints no están vacíos', () {
      expect(ApiConstants.pokemon, isNotEmpty);
      expect(ApiConstants.pokemonSpecies, isNotEmpty);
      expect(ApiConstants.type, isNotEmpty);
    });

    test('pageSize es un valor positivo', () {
      expect(ApiConstants.pageSize, greaterThan(0));
    });

    test('timeouts tienen duración positiva', () {
      expect(ApiConstants.connectTimeout.inSeconds, greaterThan(0));
      expect(ApiConstants.receiveTimeout.inSeconds, greaterThan(0));
    });

    test('typeIconBaseUrl apunta a la URL correcta de sprites', () {
      expect(ApiConstants.typeIconBaseUrl, contains('PokeAPI'));
    });
  });
}

