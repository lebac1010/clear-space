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
    r'6215c8b9b2c2780d52fece3e06862f0442d9500f';

/// See also [storageCacheService].
@ProviderFor(storageCacheService)
final storageCacheServiceProvider =
    FutureProvider<StorageCacheService>.internal(
  storageCacheService,
  name: r'storageCacheServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageCacheServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageCacheServiceRef = FutureProviderRef<StorageCacheService>;
String _$storageRepositoryHash() => r'79284e9332135ad24852ecde9f33e6d476c0b180';

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
