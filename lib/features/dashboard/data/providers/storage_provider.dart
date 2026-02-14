import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/native_storage_scanner.dart';
import '../../../../core/services/storage_cache_service.dart';
import '../../domain/repositories/storage_repository.dart';
import '../repositories/storage_repository_impl.dart';

part 'storage_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) =>
    SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
NativeStorageScanner nativeStorageScanner(NativeStorageScannerRef ref) =>
    NativeStorageScanner();

@Riverpod(keepAlive: true)
Future<StorageCacheService> storageCacheService(
  StorageCacheServiceRef ref,
) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return StorageCacheService(prefs);
}

@riverpod
Future<StorageRepository> storageRepository(StorageRepositoryRef ref) async {
  final cacheService = await ref.watch(storageCacheServiceProvider.future);
  final nativeScanner = ref.watch(nativeStorageScannerProvider);
  return StorageRepositoryImpl(nativeScanner, cacheService);
}
