import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/installed_app.dart';
import '../controllers/app_manager_controller.dart';

class AppManagerScreen extends ConsumerStatefulWidget {
  const AppManagerScreen({super.key});

  @override
  ConsumerState<AppManagerScreen> createState() => _AppManagerScreenState();
}

class _AppManagerScreenState extends ConsumerState<AppManagerScreen>
    with WidgetsBindingObserver {
  final _searchController = TextEditingController();
  bool _didTriggerUninstall = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchController.dispose();
    super.dispose();
  }

  /// When user returns from system uninstall dialog, re-fetch apps
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _didTriggerUninstall) {
      _didTriggerUninstall = false;
      ref.read(appManagerControllerProvider.notifier).onResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appManagerControllerProvider);
    final controller = ref.read(appManagerControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        // Consistent with DuplicateListScreen, LargeFileListScreen, MediaExplorerScreen
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'App Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            color: AppColors.primary,
            onPressed: () {
              _searchController.clear();
              controller.refresh();
              ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Refreshing app list...'),
                    duration: Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              _buildSearchBar(controller),
              _buildSummaryHeader(state),
              Expanded(
                child: state.apps.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  // Use shared ErrorView widget — consistent with rest of the app
                  error: (err, _) => ErrorView(
                    message: err.toString(),
                    onRetry: () => controller.refresh(),
                  ),
                  data: (_) {
                    final appsList = state.filteredAndSortedApps;

                    if (appsList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apps_rounded,
                              size: 64,
                              color: AppColors.textTertiary.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.searchQuery.isEmpty
                                  ? 'No apps found'
                                  : 'No matching apps',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        itemCount: appsList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final app = appsList[index];
                          return _AppItemCard(
                            app: app,
                            onUninstall: () =>
                                _confirmUninstall(context, app, controller),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Loading overlay during uninstall
          if (state.isUninstalling)
            Container(
              color: Colors.black26,
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: AppColors.primary),
                        SizedBox(height: 16),
                        Text('Opening uninstaller...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Confirmation dialog — consistent with cleanup screens
  void _confirmUninstall(
    BuildContext context,
    InstalledApp app,
    AppManagerController controller,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Uninstall App'),
        content: Text(
          'Are you sure you want to uninstall "${app.name}" (${FileUtils.formatSize(app.size)})?\n\n'
          'This will remove the app and all its data.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _didTriggerUninstall = true;
              controller.uninstallApp(app.packageName);
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Uninstall'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(AppManagerController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              size: 20,
              color: AppColors.textTertiary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: controller.setSearchQuery,
                decoration: const InputDecoration(
                  hintText: 'Search apps...',
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Summary bar showing total apps, total size, and sort dropdown
  Widget _buildSummaryHeader(AppManagerState state) {
    if (!state.apps.hasValue) return const SizedBox.shrink();

    final controller = ref.read(appManagerControllerProvider.notifier);
    final filtered = state.filteredAndSortedApps;
    final total = state.totalAppCount;
    final showing = state.searchQuery.isEmpty
        ? '$total apps'
        : '${filtered.length} / $total apps';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          Text(
            showing,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '•  ${FileUtils.formatSize(state.totalAppSize)}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const Spacer(),
          // Sort dropdown — compact, inline
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AppSortOption>(
                value: state.sortOption,
                isDense: true,
                icon: const Icon(Icons.arrow_drop_down, size: 18),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
                items: const [
                  DropdownMenuItem(
                    value: AppSortOption.sizeDesc,
                    child: Text('Largest'),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.sizeAsc,
                    child: Text('Smallest'),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.dateDesc,
                    child: Text('Newest'),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.nameAsc,
                    child: Text('A-Z'),
                  ),
                ],
                onChanged: (opt) {
                  if (opt != null) controller.setSortOption(opt);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppItemCard extends StatelessWidget {
  final InstalledApp app;
  final VoidCallback onUninstall;

  const _AppItemCard({required this.app, required this.onUninstall});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Icon — iconBytes is cached Uint8List, no decode needed
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: app.iconBytes.isNotEmpty
                ? Image.memory(
                    app.iconBytes,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                    // Decode to exact display size for memory efficiency
                    cacheWidth: 144,
                    cacheHeight: 144,
                    errorBuilder: (_, __, ___) => _fallbackIcon(),
                  )
                : _fallbackIcon(),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      FileUtils.formatSize(app.size),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '•',
                      style: TextStyle(color: AppColors.textTertiary),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'v${app.version}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Uninstall Button
          IconButton(
            onPressed: onUninstall,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: AppColors.error,
            ),
            tooltip: 'Uninstall',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fallbackIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.android, color: AppColors.primary),
    );
  }
}
