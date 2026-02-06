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

@riverpod
Future<StorageRepository> storageRepository(StorageRepositoryRef ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final cacheService = StorageCacheService(prefs);
  final nativeScanner = NativeStorageScanner();
  return StorageRepositoryImpl(nativeScanner, cacheService);
}
