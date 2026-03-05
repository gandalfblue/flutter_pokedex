import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokemon/core/errors/exceptions.dart';
import 'package:flutter_pokemon/core/errors/failures.dart';

void main() {
  group('Excepciones', () {
    group('ServerException', () {
      test('almacena message y statusCode', () {
        const e = ServerException(message: 'Not Found', statusCode: 404);
        expect(e.message, 'Not Found');
        expect(e.statusCode, 404);
      });

      test('statusCode es opcional (null por defecto)', () {
        const e = ServerException(message: 'error');
        expect(e.statusCode, isNull);
      });

      test('toString contiene message y statusCode', () {
        const e = ServerException(message: 'Server Error', statusCode: 500);
        expect(e.toString(), contains('Server Error'));
        expect(e.toString(), contains('500'));
      });
    });

    group('NetworkException', () {
      test('almacena el mensaje', () {
        const e = NetworkException(message: 'Sin conexión');
        expect(e.message, 'Sin conexión');
      });

      test('toString contiene el mensaje', () {
        const e = NetworkException(message: 'timeout');
        expect(e.toString(), contains('timeout'));
      });
    });

    group('CacheException', () {
      test('almacena el mensaje', () {
        const e = CacheException(message: 'Cache vacío');
        expect(e.message, 'Cache vacío');
      });
    });
  });

  group('Failures (freezed)', () {
    test('Failure.server contiene message y statusCode', () {
      const f = Failure.server(message: 'Server error', statusCode: 500);
      f.when(
        server: (msg, code) {
          expect(msg, 'Server error');
          expect(code, 500);
        },
        network: (_) => fail('No debería ser network'),
        cache: (_) => fail('No debería ser cache'),
        unknown: (_) => fail('No debería ser unknown'),
      );
    });

    test('Failure.network contiene message', () {
      const f = Failure.network(message: 'No internet');
      f.when(
        server: (_, __) => fail('No debería ser server'),
        network: (msg) => expect(msg, 'No internet'),
        cache: (_) => fail('No debería ser cache'),
        unknown: (_) => fail('No debería ser unknown'),
      );
    });

    test('Failure.cache contiene message', () {
      const f = Failure.cache(message: 'No cache');
      f.when(
        server: (_, __) => fail('No debería ser server'),
        network: (_) => fail('No debería ser network'),
        cache: (msg) => expect(msg, 'No cache'),
        unknown: (_) => fail('No debería ser unknown'),
      );
    });

    test('Failure.unknown contiene message', () {
      const f = Failure.unknown(message: 'Error desconocido');
      f.when(
        server: (_, __) => fail('No debería ser server'),
        network: (_) => fail('No debería ser network'),
        cache: (_) => fail('No debería ser cache'),
        unknown: (msg) => expect(msg, 'Error desconocido'),
      );
    });

    test('dos failures iguales son iguales (freezed equality)', () {
      const a = Failure.network(message: 'err');
      const b = Failure.network(message: 'err');
      expect(a, equals(b));
    });

    test('dos failures distintos no son iguales', () {
      const a = Failure.network(message: 'err');
      const b = Failure.server(message: 'err');
      expect(a, isNot(equals(b)));
    });
  });
}

