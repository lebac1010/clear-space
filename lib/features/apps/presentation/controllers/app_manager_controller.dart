import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../domain/entities/installed_app.dart';

enum AppSortOption { sizeDesc, sizeAsc, nameAsc, dateDesc }

class AppManagerState {
  final AsyncValue<List<InstalledApp>> apps;
  final AppSortOption sortOption;
  final String searchQuery;
  final bool isUninstalling;

  const AppManagerState({
    required this.apps,
    this.sortOption = AppSortOption.sizeDesc,
    this.searchQuery = '',
    this.isUninstalling = false,
  });

  AppManagerState copyWith({
    AsyncValue<List<InstalledApp>>? apps,
    AppSortOption? sortOption,
    String? searchQuery,
    bool? isUninstalling,
  }) {
    return AppManagerState(
      apps: apps ?? this.apps,
      sortOption: sortOption ?? this.sortOption,
      searchQuery: searchQuery ?? this.searchQuery,
      isUninstalling: isUninstalling ?? this.isUninstalling,
    );
  }

  /// Total count and size of the unfiltered list
  int get totalAppCount => apps.hasValue ? apps.value!.length : 0;

  /// Total size — accurate up to petabytes of aggregate apps
  int get totalAppSize =>
      apps.hasValue ? apps.value!.fold(0, (sum, app) => sum + app.size) : 0;

  /// Filtered & sorted list for display — computed once per state change
  List<InstalledApp> get filteredAndSortedApps {
    if (!apps.hasValue) return [];

    var list = apps.value!.toList();

    // Filter
    if (searchQuery.trim().isNotEmpty) {
      final q = searchQuery.toLowerCase();
      list = list
          .where(
            (app) =>
                app.name.toLowerCase().contains(q) ||
                app.packageName.toLowerCase().contains(q),
          )
          .toList();
    }

    // Sort
    list.sort((a, b) {
      switch (sortOption) {
        case AppSortOption.sizeDesc:
          return b.size.compareTo(a.size);
        case AppSortOption.sizeAsc:
          return a.size.compareTo(b.size);
        case AppSortOption.nameAsc:
          return a.name.compareTo(b.name);
        case AppSortOption.dateDesc:
          return b.installDate.compareTo(a.installDate);
      }
    });

    return list;
  }
}

class AppManagerController extends StateNotifier<AppManagerState> {
  final Ref _ref;
  Timer? _debounceTimer;
  bool _isFetching = false; // Guard against concurrent fetches

  AppManagerController(this._ref)
    : super(const AppManagerState(apps: AsyncValue.loading())) {
    _fetchApps();
  }

  Future<void> _fetchApps() async {
    // Prevent concurrent fetch calls (e.g. onResume + refresh racing)
    if (_isFetching) return;
    _isFetching = true;

    // Only show loading spinner on initial load, not on refresh/resume
    if (!state.apps.hasValue) {
      state = state.copyWith(apps: const AsyncValue.loading());
    }
    try {
      final repo = await _ref.read(storageRepositoryProvider.future);
      final rawApps = await repo.getInstalledApps();

      final apps = rawApps.map((map) => InstalledApp.fromMap(map)).toList();
      if (mounted) {
        state = state.copyWith(apps: AsyncValue.data(apps));
      }
    } catch (e, st) {
      if (mounted) {
        state = state.copyWith(apps: AsyncValue.error(e, st));
      }
    } finally {
      _isFetching = false;
    }
  }

  void setSortOption(AppSortOption option) {
    state = state.copyWith(sortOption: option);
  }

  /// Debounced search — waits 300ms after last keystroke
  void setSearchQuery(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        state = state.copyWith(searchQuery: query);
      }
    });
  }

  /// Trigger uninstall. The native side shows the system dialog and
  /// returns immediately. Re-fetch happens via `onResume()`.
  Future<void> uninstallApp(String packageName) async {
    state = state.copyWith(isUninstalling: true);
    try {
      final repo = await _ref.read(storageRepositoryProvider.future);
      await repo.uninstallApp(packageName);
    } catch (_) {
      // Swallow — the system dialog handles failure UX
    } finally {
      if (mounted) {
        state = state.copyWith(isUninstalling: false);
      }
    }
  }

  /// Called when app resumes (user returns from uninstall dialog)
  Future<void> onResume() => _fetchApps();

  /// Refresh: clear search and re-fetch
  Future<void> refresh() async {
    state = state.copyWith(searchQuery: '');
    await _fetchApps();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}

final appManagerControllerProvider =
    StateNotifierProvider<AppManagerController, AppManagerState>((ref) {
      return AppManagerController(ref);
    });
