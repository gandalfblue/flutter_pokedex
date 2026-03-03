import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

/// Factory que construye y configura la instancia de Dio.
/// Centraliza interceptors, timeouts y configuración de seguridad (SRP).
class DioClient {
  DioClient._();

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        // Validar solo status codes 2xx
        validateStatus: (status) => status != null && status >= 200 && status < 300,
      ),
    );

    dio.interceptors.addAll([
      _LoggingInterceptor(),
      _ErrorInterceptor(),
    ]);

    return dio;
  }
}

/// Interceptor de logging para debug.
/// En producción este interceptor no debería registrar datos sensibles.
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    assert(() {
      // Solo en debug mode
      // ignore: avoid_print
      print('[DIO] ${options.method} ${options.uri}');
      return true;
    }());
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('[DIO ERROR] ${err.type}: ${err.message}');
      return true;
    }());
    handler.next(err);
  }
}

/// Interceptor para normalizar errores de Dio.
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Re-lanza el error sin modificar para que el datasource lo maneje
    handler.next(err);
  }
}

