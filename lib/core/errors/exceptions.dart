/// Excepciones de la capa de datos.
/// Cada excepción representa un tipo de fallo específico (Single Responsibility).
class ServerException implements Exception {
  const ServerException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode)';
}

class NetworkException implements Exception {
  const NetworkException({required this.message});

  final String message;

  @override
  String toString() => 'NetworkException(message: $message)';
}

class CacheException implements Exception {
  const CacheException({required this.message});

  final String message;

  @override
  String toString() => 'CacheException(message: $message)';
}

