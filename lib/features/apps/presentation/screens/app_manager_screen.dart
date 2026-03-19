import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
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
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          context.l10n.appManagerTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.appTextPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            color: context.colorScheme.primary,
            onPressed: () {
              _searchController.clear();
              controller.refresh();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.l10n.refreshingAppList),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          StoragePermissionGate(
            requiredAccess: RequiredStorageAccess.full,
            builder: (context, ref) => Column(
              children: [
                _buildSearchBar(controller),
                _buildSummaryHeader(state),
                Expanded(
                  child: state.apps.when(
                    loading: () => Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
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
                                color: context.appTextTertiary.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                state.searchQuery.isEmpty
                                    ? context.l10n.noAppsFound
                                    : context.l10n.noMatchingApps,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: context.appTextSecondary,
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
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
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
          ),
          if (state.isUninstalling)
            Container(
              color: context.appOverlay.withValues(alpha: 0.3),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.system_update,
                          color: context.colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(height: 16),
                        Text(context.l10n.openingUninstaller),
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

  void _confirmUninstall(
    BuildContext context,
    InstalledApp app,
    AppManagerController controller,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.uninstallApp),
        content: Text(
          '${context.l10n.uninstallConfirmMsg(app.name, FileUtils.formatSize(app.size))}\n\n'
          '${context.l10n.uninstallActionDesc}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _didTriggerUninstall = true;
              controller.uninstallApp(app.packageName);
            },
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.error,
            ),
            child: Text(context.l10n.uninstall),
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
          color: context.appSurface,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              size: 20,
              color: context.appTextTertiary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: controller.setSearchQuery,
                decoration: InputDecoration(
                  hintText: context.l10n.searchApps,
                  hintStyle: TextStyle(
                    color: context.appTextTertiary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(fontSize: 14, color: context.appTextPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryHeader(AppManagerState state) {
    if (!state.apps.hasValue) return const SizedBox.shrink();

    final controller = ref.read(appManagerControllerProvider.notifier);
    final filtered = state.filteredAndSortedApps;
    final total = state.totalAppCount;
    final showing = state.searchQuery.isEmpty
        ? context.l10n.appsCount(total)
        : context.l10n.appsShowingCount(filtered.length, total);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          Text(
            showing,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: context.appTextSecondary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '| ${FileUtils.formatSize(state.totalAppSize)}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.primary,
            ),
          ),
          const Spacer(),
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: context.appSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.appBorder),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AppSortOption>(
                value: state.sortOption,
                isDense: true,
                icon: const Icon(Icons.arrow_drop_down, size: 18),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: context.appTextSecondary,
                ),
                dropdownColor: context.appSurface,
                items: [
                  DropdownMenuItem(
                    value: AppSortOption.sizeDesc,
                    child: Text(context.l10n.sortLargest),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.sizeAsc,
                    child: Text(context.l10n.sortSmallest),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.dateDesc,
                    child: Text(context.l10n.sortNewest),
                  ),
                  DropdownMenuItem(
                    value: AppSortOption.nameAsc,
                    child: Text(context.l10n.sortAZ),
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
        color: context.appSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: app.iconBytes.isNotEmpty
                ? Image.memory(
                    app.iconBytes,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                    cacheWidth: 144,
                    cacheHeight: 144,
                    errorBuilder: (_, __, ___) => _fallbackIcon(context),
                  )
                : _fallbackIcon(context),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.appTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      FileUtils.formatSize(app.size),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('|', style: TextStyle(color: context.appTextTertiary)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'v${app.version}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.appTextTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onUninstall,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: context.colorScheme.error,
            ),
            tooltip: context.l10n.uninstall,
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.error.withValues(alpha: 0.1),
              foregroundColor: context.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _fallbackIcon(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.android, color: context.colorScheme.primary),
    );
  }
}
