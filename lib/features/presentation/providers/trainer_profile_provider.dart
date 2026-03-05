import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trainer_profile_provider.freezed.dart';
part 'trainer_profile_provider.g.dart';

/// Modelo de perfil del entrenador.
@freezed
class TrainerProfile with _$TrainerProfile {
  const factory TrainerProfile({
    @Default('Entrenador') String name,
    @Default('assets/images/entrenador.png') String avatarAsset,
    @Default(0) int totalCaptured,
    @Default(0) int totalFavorites,
    @Default(null) String? favoriteType,
    @Default(1) int trainerLevel,
    @Default(0) int pokemonViewed,
  }) = _TrainerProfile;
}

/// Provider del perfil del entrenador.
/// keepAlive: true → persiste durante toda la sesión.
@Riverpod(keepAlive: true)
class TrainerProfileNotifier extends _$TrainerProfileNotifier {
  @override
  TrainerProfile build() => const TrainerProfile();

  /// Actualiza el nombre del entrenador.
  void updateName(String name) {
    if (name.trim().isEmpty) return;
    state = state.copyWith(name: name.trim());
  }

  /// Actualiza el avatar del entrenador.
  void updateAvatar(String assetPath) {
    state = state.copyWith(avatarAsset: assetPath);
  }

  /// Incrementa el contador de Pokémon vistos.
  void incrementViewed() {
    state = state.copyWith(pokemonViewed: state.pokemonViewed + 1);
  }

  /// Actualiza las estadísticas de favoritos y tipo favorito.
  void syncFavorites(List<String> favoriteTypeNames, int count) {
    String? topType;
    if (favoriteTypeNames.isNotEmpty) {
      final freq = <String, int>{};
      for (final t in favoriteTypeNames) {
        freq[t] = (freq[t] ?? 0) + 1;
      }
      topType = freq.entries
          .reduce((a, b) => a.value >= b.value ? a : b)
          .key;
    }
    state = state.copyWith(
      totalFavorites: count,
      favoriteType: topType,
    );
  }

  /// Calcula el nivel del entrenador basado en pokemones vistos.
  int get computedLevel {
    final v = state.pokemonViewed;
    if (v < 10) return 1;
    if (v < 30) return 2;
    if (v < 60) return 3;
    if (v < 100) return 4;
    return 5;
  }
}

