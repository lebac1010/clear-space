import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/native_storage_scanner.dart';
import '../../../../core/services/storage_cache_service.dart';
import '../../domain/repositories/storage_repository.dart';
import '../repositories/storage_repository_impl.dart';

part 'storage_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('sharedPreferences must be overridden in main.dart');
}

@Riverpod(keepAlive: true)
NativeStorageScanner nativeStorageScanner(NativeStorageScannerRef ref) =>
    NativeStorageScanner();

@Riverpod(keepAlive: true)
StorageCacheService storageCacheService(StorageCacheServiceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return StorageCacheService(prefs);
}

@riverpod
Future<StorageRepository> storageRepository(StorageRepositoryRef ref) async {
  final cacheService = ref.watch(storageCacheServiceProvider);
  final nativeScanner = ref.watch(nativeStorageScannerProvider);
  return StorageRepositoryImpl(nativeScanner, cacheService);
}
