import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/scan_progress.dart';
import '../../data/providers/storage_provider.dart';

part 'scan_progress_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<ScanProgress> scanProgress(ScanProgressRef ref) async* {
  final repository = await ref.watch(storageRepositoryProvider.future);
  yield* repository.scanProgress;
}
