import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/cleanup_repository_impl.dart';
import '../../domain/repositories/cleanup_repository.dart';
import '../../../dashboard/data/providers/storage_provider.dart';

part 'cleanup_provider.g.dart';

@riverpod
Future<CleanupRepository> cleanupRepository(CleanupRepositoryRef ref) async {
  final storageRepo = await ref.watch(storageRepositoryProvider.future);
  final nativeScanner = ref.watch(nativeStorageScannerProvider);

  return CleanupRepositoryImpl(storageRepo, nativeScanner);
}
