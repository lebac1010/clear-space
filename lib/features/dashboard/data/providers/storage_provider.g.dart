// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'25eceea0052302f519f44a896409ba30ede45562';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = FutureProviderRef<SharedPreferences>;
String _$storageRepositoryHash() => r'95b8b0f895e8b0a04748b473e2e886074485ccf3';

/// See also [storageRepository].
@ProviderFor(storageRepository)
final storageRepositoryProvider =
    AutoDisposeFutureProvider<StorageRepository>.internal(
  storageRepository,
  name: r'storageRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageRepositoryRef = AutoDisposeFutureProviderRef<StorageRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
