import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/utils/pokemon_type_utils.dart';

void main() {
  group('PokemonTypeUtils', () {
    // ── typeId ──────────────────────────────────────────────────────────────
    group('typeId', () {
      test('retorna IDs correctos para todos los tipos conocidos', () {
        expect(PokemonTypeUtils.typeId('normal'),   1);
        expect(PokemonTypeUtils.typeId('fighting'), 2);
        expect(PokemonTypeUtils.typeId('flying'),   3);
        expect(PokemonTypeUtils.typeId('poison'),   4);
        expect(PokemonTypeUtils.typeId('ground'),   5);
        expect(PokemonTypeUtils.typeId('rock'),     6);
        expect(PokemonTypeUtils.typeId('bug'),      7);
        expect(PokemonTypeUtils.typeId('ghost'),    8);
        expect(PokemonTypeUtils.typeId('steel'),    9);
        expect(PokemonTypeUtils.typeId('fire'),     10);
        expect(PokemonTypeUtils.typeId('water'),    11);
        expect(PokemonTypeUtils.typeId('grass'),    12);
        expect(PokemonTypeUtils.typeId('electric'), 13);
        expect(PokemonTypeUtils.typeId('psychic'),  14);
        expect(PokemonTypeUtils.typeId('ice'),      15);
        expect(PokemonTypeUtils.typeId('dragon'),   16);
        expect(PokemonTypeUtils.typeId('dark'),     17);
        expect(PokemonTypeUtils.typeId('fairy'),    18);
      });

      test('retorna 1 para tipo desconocido', () {
        expect(PokemonTypeUtils.typeId('unknown'), 1);
        expect(PokemonTypeUtils.typeId(''), 1);
      });

      test('funciona con mayúsculas', () {
        expect(PokemonTypeUtils.typeId('FIRE'), 10);
        expect(PokemonTypeUtils.typeId('Water'), 11);
      });
    });

    // ── typeColor ───────────────────────────────────────────────────────────
    group('typeColor', () {
      test('retorna colores correctos para tipos principales', () {
        expect(PokemonTypeUtils.typeColor('fire'),     const Color(0xFFEE8130));
        expect(PokemonTypeUtils.typeColor('water'),    const Color(0xFF6390F0));
        expect(PokemonTypeUtils.typeColor('grass'),    const Color(0xFF7AC74C));
        expect(PokemonTypeUtils.typeColor('electric'), const Color(0xFFF7D02C));
        expect(PokemonTypeUtils.typeColor('normal'),   const Color(0xFFA8A77A));
      });

      test('tipo desconocido retorna color de normal', () {
        expect(PokemonTypeUtils.typeColor('xyz'), const Color(0xFFA8A77A));
      });

      test('no distingue entre mayúsculas y minúsculas', () {
        expect(PokemonTypeUtils.typeColor('FIRE'), PokemonTypeUtils.typeColor('fire'));
      });
    });

    // ── typeColorBackground ─────────────────────────────────────────────────
    group('typeColorBackground', () {
      test('el color background es más claro que el color base', () {
        for (final type in ['fire', 'water', 'grass', 'electric', 'dragon']) {
          final base = PokemonTypeUtils.typeColor(type);
          final bg   = PokemonTypeUtils.typeColorBackground(type);
          // En RGB sum, un color más claro tiene suma mayor
          final baseSum = base.red + base.green + base.blue;
          final bgSum   = bg.red   + bg.green   + bg.blue;
          expect(bgSum, greaterThan(baseSum),
              reason: 'Background de $type debería ser más claro que el base');
        }
      });
    });

    // ── typeName ────────────────────────────────────────────────────────────
    group('typeName', () {
      test('capitaliza la primera letra', () {
        expect(PokemonTypeUtils.typeName('fire'),     'Fire');
        expect(PokemonTypeUtils.typeName('water'),    'Water');
        expect(PokemonTypeUtils.typeName('electric'), 'Electric');
      });

      test('retorna vacío si el tipo está vacío', () {
        expect(PokemonTypeUtils.typeName(''), '');
      });
    });

    // ── typeIconUrl ─────────────────────────────────────────────────────────
    group('typeIconUrl', () {
      test('genera URL correcta para tipo fire (id=10)', () {
        final url = PokemonTypeUtils.typeIconUrl('fire');
        expect(url, contains('10.png'));
      });

      test('genera URL correcta para tipo grass (id=12)', () {
        final url = PokemonTypeUtils.typeIconUrl('grass');
        expect(url, contains('12.png'));
      });

      test('URL comienza con https', () {
        expect(PokemonTypeUtils.typeIconUrl('water'), startsWith('https'));
      });
    });

    // ── typeTextColor ───────────────────────────────────────────────────────
    group('typeTextColor', () {
      test('tipos claros retornan texto oscuro', () {
        for (final type in ['normal', 'electric', 'ice', 'ground', 'steel', 'bug', 'rock', 'grass']) {
          expect(PokemonTypeUtils.typeTextColor(type), const Color(0xFF1D1D1D),
              reason: '$type debería tener texto oscuro');
        }
      });

      test('tipos oscuros retornan texto blanco', () {
        for (final type in ['fire', 'water', 'ghost', 'dragon', 'dark', 'psychic']) {
          expect(PokemonTypeUtils.typeTextColor(type), Colors.white,
              reason: '$type debería tener texto blanco');
        }
      });
    });
  });
}

