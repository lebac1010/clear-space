import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/dashboard/data/providers/storage_provider.dart';
import '../../domain/entities/junk_item.dart';

class JunkDetailState {
  final AsyncValue<List<JunkItem>> items;
  final Set<String> selectedPaths;
  final bool isDeleting;
  final String type; // junk, empty_folders, apks

  const JunkDetailState({
    required this.items,
    this.selectedPaths = const {},
    this.isDeleting = false,
    required this.type,
  });

  JunkDetailState copyWith({
    AsyncValue<List<JunkItem>>? items,
    Set<String>? selectedPaths,
    bool? isDeleting,
    String? type,
  }) {
    return JunkDetailState(
      items: items ?? this.items,
      selectedPaths: selectedPaths ?? this.selectedPaths,
      isDeleting: isDeleting ?? this.isDeleting,
      type: type ?? this.type,
    );
  }

  bool get allSelected =>
      items.hasValue &&
      items.value!.isNotEmpty &&
      selectedPaths.length == items.value!.length;

  int get selectedCount => selectedPaths.length;

  int get selectedSize {
    if (!items.hasValue) return 0;
    return items.value!
        .where((item) => selectedPaths.contains(item.path))
        .fold(0, (sum, item) => sum + item.size);
  }
}

class JunkDetailController extends StateNotifier<JunkDetailState> {
  final Ref _ref;

  JunkDetailController(this._ref, String type)
    : super(JunkDetailState(items: const AsyncValue.loading(), type: type)) {
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    try {
      final repo = await _ref.read(storageRepositoryProvider.future);
      final rawItems = await repo.getJunkData(state.type);
      final items = rawItems.map((map) => JunkItem.fromMap(map)).toList();

      // Sort: largest first for junk/apks, alphabetical for folders
      if (state.type == 'empty_folders') {
        items.sort((a, b) => a.name.compareTo(b.name));
      } else {
        items.sort((a, b) => b.size.compareTo(a.size));
      }

      if (mounted) {
        state = state.copyWith(items: AsyncValue.data(items));
      }
    } catch (e, st) {
      if (mounted) {
        state = state.copyWith(items: AsyncValue.error(e, st));
      }
    }
  }

  void toggleItem(String path) {
    final selected = Set<String>.from(state.selectedPaths);
    if (selected.contains(path)) {
      selected.remove(path);
    } else {
      selected.add(path);
    }
    state = state.copyWith(selectedPaths: selected);
  }

  void selectAll() {
    if (!state.items.hasValue) return;
    final allPaths = state.items.value!.map((e) => e.path).toSet();
    state = state.copyWith(selectedPaths: allPaths);
  }

  void deselectAll() {
    state = state.copyWith(selectedPaths: {});
  }

  Future<Map<String, dynamic>> deleteSelected() async {
    if (state.selectedPaths.isEmpty) {
      return {'deletedCount': 0, 'deletedBytes': 0};
    }

    state = state.copyWith(isDeleting: true);
    try {
      final repo = await _ref.read(storageRepositoryProvider.future);
      final result = await repo.deleteSpecificJunk(
        state.selectedPaths.toList(),
      );

      // Re-fetch from native cache to get accurate remaining items
      // (handles partial deletion failures — items that couldn't be
      // deleted will still appear in the list)
      if (mounted) {
        final rawItems = await repo.getJunkData(state.type);
        final items = rawItems.map((map) => JunkItem.fromMap(map)).toList();
        if (state.type == 'empty_folders') {
          items.sort((a, b) => a.name.compareTo(b.name));
        } else {
          items.sort((a, b) => b.size.compareTo(a.size));
        }
        state = state.copyWith(
          items: AsyncValue.data(items),
          selectedPaths: {},
          isDeleting: false,
        );
      }

      return result;
    } catch (e) {
      if (mounted) {
        state = state.copyWith(isDeleting: false);
      }
      rethrow;
    }
  }

  Future<void> refresh() => _fetchItems();
}

/// Family provider keyed by junk type
final junkDetailControllerProvider = StateNotifierProvider.autoDispose
    .family<JunkDetailController, JunkDetailState, String>((ref, type) {
      return JunkDetailController(ref, type);
    });
