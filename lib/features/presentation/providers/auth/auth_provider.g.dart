// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthHash() => r'7791bf70ce0f01bf991a53a76abc915478673c0b';

/// ─────────────────────────────────────────────────────────────
/// FirebaseAuth
/// ─────────────────────────────────────────────────────────────
///
/// Copied from [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$authRemoteDatasourceHash() =>
    r'8a63062051bee5a17d52f8eb11e34599a23545d5';

/// ─────────────────────────────────────────────────────────────
/// Datasource
/// ─────────────────────────────────────────────────────────────
///
/// Copied from [authRemoteDatasource].
@ProviderFor(authRemoteDatasource)
final authRemoteDatasourceProvider =
    AutoDisposeProvider<AuthRemoteDatasource>.internal(
  authRemoteDatasource,
  name: r'authRemoteDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRemoteDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRemoteDatasourceRef = AutoDisposeProviderRef<AuthRemoteDatasource>;
String _$authRepositoryHash() => r'3508505947692de5511eef22b2b901ae81ba8527';

/// ─────────────────────────────────────────────────────────────
/// Repository
/// ─────────────────────────────────────────────────────────────
///
/// Copied from [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$loginUsecaseHash() => r'36d1c9d37c3256034b5d9f6db158d117660d2dea';

/// ─────────────────────────────────────────────────────────────
/// Usecases
/// ─────────────────────────────────────────────────────────────
///
/// Copied from [loginUsecase].
@ProviderFor(loginUsecase)
final loginUsecaseProvider = AutoDisposeProvider<LoginUsecase>.internal(
  loginUsecase,
  name: r'loginUsecaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoginUsecaseRef = AutoDisposeProviderRef<LoginUsecase>;
String _$registerUsecaseHash() => r'21e51f165d7a2d1d288465372dcbc4eb1136ec34';

/// See also [registerUsecase].
@ProviderFor(registerUsecase)
final registerUsecaseProvider = AutoDisposeProvider<RegisterUsecase>.internal(
  registerUsecase,
  name: r'registerUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegisterUsecaseRef = AutoDisposeProviderRef<RegisterUsecase>;
String _$logoutUsecaseHash() => r'e3dc8c898b3b4d02b0de1b046091026450569ed9';

/// See also [logoutUsecase].
@ProviderFor(logoutUsecase)
final logoutUsecaseProvider = AutoDisposeProvider<LogoutUsecase>.internal(
  logoutUsecase,
  name: r'logoutUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logoutUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LogoutUsecaseRef = AutoDisposeProviderRef<LogoutUsecase>;
String _$authStateUsecaseHash() => r'5162f543ea8ad4b63eccbc91235406b525b3795a';

/// See also [authStateUsecase].
@ProviderFor(authStateUsecase)
final authStateUsecaseProvider = AutoDisposeProvider<AuthStateUsecase>.internal(
  authStateUsecase,
  name: r'authStateUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateUsecaseRef = AutoDisposeProviderRef<AuthStateUsecase>;
String _$authStateChangesHash() => r'962b28c23d77dde54ab10230cdeeae2dd504c4ed';

/// ─────────────────────────────────────────────────────────────
/// Auth State Stream
/// Firebase persiste sesión automáticamente
/// ─────────────────────────────────────────────────────────────
///
/// Copied from [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider =
    AutoDisposeStreamProvider<Either<Failure, TrainerModel?>>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef
    = AutoDisposeStreamProviderRef<Either<Failure, TrainerModel?>>;
String _$authLocalDatasourceHash() =>
    r'7e09f1dda5d9dc6db235f21f468a198236fa0ec1';

/// See also [authLocalDatasource].
@ProviderFor(authLocalDatasource)
final authLocalDatasourceProvider =
    AutoDisposeProvider<AuthLocalDatasource>.internal(
  authLocalDatasource,
  name: r'authLocalDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authLocalDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthLocalDatasourceRef = AutoDisposeProviderRef<AuthLocalDatasource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
