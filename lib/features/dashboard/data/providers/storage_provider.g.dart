// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'2eb1800d04a893bba4c2f55aea48cd000c3d38b4';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$nativeStorageScannerHash() =>
    r'e9e47bebb45aa5cc734bc952e7294a54717b8043';

/// See also [nativeStorageScanner].
@ProviderFor(nativeStorageScanner)
final nativeStorageScannerProvider = Provider<NativeStorageScanner>.internal(
  nativeStorageScanner,
  name: r'nativeStorageScannerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nativeStorageScannerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NativeStorageScannerRef = ProviderRef<NativeStorageScanner>;
String _$storageCacheServiceHash() =>
    r'cee251c7ebf47f56d56a73011df73037862fb50e';

/// See also [storageCacheService].
@ProviderFor(storageCacheService)
final storageCacheServiceProvider = Provider<StorageCacheService>.internal(
  storageCacheService,
  name: r'storageCacheServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageCacheServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageCacheServiceRef = ProviderRef<StorageCacheService>;
String _$storageRepositoryHash() => r'cd781ffe14b64b37fb435f835ba9cba0af45f431';

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
