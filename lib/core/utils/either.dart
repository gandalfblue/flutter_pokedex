/// Implementación simple de Either sin dependencias externas (KISS).
/// Evita agregar dartz solo para este tipo (DRY sin sobre-ingeniería).
sealed class Either<L, R> {
  const Either();

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return switch (this) {
      Left(value: final l) => onLeft(l),
      Right(value: final r) => onRight(r),
    };
  }

  R? getOrNull() => switch (this) {
        Left() => null,
        Right(value: final r) => r,
      };

  L? leftOrNull() => switch (this) {
        Left(value: final l) => l,
        Right() => null,
      };
}

final class Left<L, R> extends Either<L, R> {
  const Left(this.value);
  final L value;
}

final class Right<L, R> extends Either<L, R> {
  const Right(this.value);
  final R value;
}

/// Helpers de conveniencia
Either<L, R> left<L, R>(L value) => Left(value);
Either<L, R> right<L, R>(R value) => Right(value);

