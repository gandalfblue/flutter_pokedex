// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainerProfileNotifierHash() =>
    r'd03cf3c17fe3bf8ac4a1c8c9bd930fa56dcd1468';

/// Provider del perfil del entrenador.
/// keepAlive: true → persiste durante toda la sesión.
///
/// Copied from [TrainerProfileNotifier].
@ProviderFor(TrainerProfileNotifier)
final trainerProfileNotifierProvider =
    NotifierProvider<TrainerProfileNotifier, TrainerProfile>.internal(
  TrainerProfileNotifier.new,
  name: r'trainerProfileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trainerProfileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TrainerProfileNotifier = Notifier<TrainerProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
