import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/utils/either.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';

void main() {
  group('Either', () {
    group('Right', () {
      test('isRight es true y isLeft es false', () {
        final e = right<Failure, int>(42);
        expect(e.isRight, isTrue);
        expect(e.isLeft, isFalse);
      });

      test('fold ejecuta onRight con el valor correcto', () {
        final e = right<String, int>(10);
        final result = e.fold((_) => -1, (v) => v * 2);
        expect(result, 20);
      });

      test('getOrNull retorna el valor', () {
        final e = right<String, String>('hola');
        expect(e.getOrNull(), 'hola');
      });

      test('leftOrNull retorna null en Right', () {
        final e = right<String, int>(1);
        expect(e.leftOrNull(), isNull);
      });
    });

    group('Left', () {
      test('isLeft es true y isRight es false', () {
        final e = left<String, int>('error');
        expect(e.isLeft, isTrue);
        expect(e.isRight, isFalse);
      });

      test('fold ejecuta onLeft con el valor correcto', () {
        final e = left<String, int>('fallo');
        final result = e.fold((l) => l.toUpperCase(), (_) => '');
        expect(result, 'FALLO');
      });

      test('getOrNull retorna null en Left', () {
        final e = left<String, int>('err');
        expect(e.getOrNull(), isNull);
      });

      test('leftOrNull retorna el valor en Left', () {
        final e = left<String, int>('detalle');
        expect(e.leftOrNull(), 'detalle');
      });
    });
  });
}

