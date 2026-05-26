import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Failures de dominio: representan errores en términos del negocio,
/// independientes de la implementación técnica (Dependency Inversion).
@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.cache({required String message}) = CacheFailure;

  const factory Failure.unknown({required String message}) = UnknownFailure;

  const factory Failure.firebase({required String message}) = FirebaseFailure;
}

