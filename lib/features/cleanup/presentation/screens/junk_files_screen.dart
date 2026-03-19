import 'package:clear_space/core/extensions/build_context_x.dart';
import 'package:clear_space/core/utils/file_utils.dart';
import 'package:clear_space/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_constants.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../dashboard/domain/entities/storage_permission_state.dart';
import '../../../dashboard/presentation/widgets/storage_permission_gate.dart';
import '../controllers/safe_cleanup_controller.dart';

class JunkFilesScreen extends ConsumerStatefulWidget {
  const JunkFilesScreen({super.key});

  @override
  ConsumerState<JunkFilesScreen> createState() => _JunkFilesScreenState();
}

class _JunkFilesScreenState extends ConsumerState<JunkFilesScreen> {
  bool _hasStartedCleanup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.junkFiles)),
      body: StoragePermissionGate(
        requiredAccess: RequiredStorageAccess.full,
        builder: (context, ref) {
          final storageAsync = ref.watch(dashboardControllerProvider);
          final safeCleanupState = ref.watch(safeCleanupControllerProvider);

          ref.listen(safeCleanupControllerProvider, (prev, next) {
            if (!_hasStartedCleanup) return;
            if (prev?.isLoading == true && !next.isLoading) {
              _hasStartedCleanup = false;
              if (!mounted) return;
              if (next.hasError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.l10n.cleanupFailed(next.error.toString()),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.cleanupComplete)),
                );
              }
            }
          });

          return storageAsync.when(
            data: (info) {
              if (info == null) {
                return Center(child: Text(context.l10n.pleaseScanStorageFirst));
              }

              final hasJunk =
                  info.junkSize > 0 ||
                  info.emptyFolderCount > 0 ||
                  info.apkCount > 0;
              if (!hasJunk) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 64,
                        color: context.customColors.success,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.l10n.noJunkFilesFound,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              }

              final totalJunkSize = info.junkSize + info.apkSize;
              final isCleaning = safeCleanupState.isLoading;

              return Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 100,
                    ),
                    children: [
                      Card(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Text(
                                context.l10n.junkFilesFound,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                FileUtils.formatSize(totalJunkSize),
                                style: Theme.of(context).textTheme.displayMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _JunkCategoryTile(
                        icon: Icons.delete_sweep_outlined,
                        color: context.customColors.orange,
                        title: context.l10n.tempAndLogFiles,
                        subtitle: context.l10n.sizeFound(
                          FileUtils.formatSize(info.junkSize),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: isCleaning
                            ? null
                            : () {
                                context.push(
                                  '${RouteConstants.junkDetail}?type=junk',
                                );
                              },
                      ),
                      const SizedBox(height: 12),
                      _JunkCategoryTile(
                        icon: Icons.folder_off_outlined,
                        color: context.colorScheme.tertiary,
                        title: context.l10n.emptyFolders,
                        subtitle: context.l10n.emptyFoldersFound(
                          info.emptyFolderCount,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: isCleaning
                            ? null
                            : () {
                                context.push(
                                  '${RouteConstants.junkDetail}?type=empty_folders',
                                );
                              },
                      ),
                      const SizedBox(height: 12),
                      _JunkCategoryTile(
                        icon: Icons.android_outlined,
                        color: context.customColors.success,
                        title: context.l10n.safeApkInstallers,
                        subtitle: context.l10n.cleanOldApks,
                        trailing: const Icon(Icons.chevron_right),
                        onTap: isCleaning
                            ? null
                            : () {
                                context.push(
                                  '${RouteConstants.junkDetail}?type=apks',
                                );
                              },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: FilledButton.icon(
                      onPressed: isCleaning
                          ? null
                          : () {
                              setState(() => _hasStartedCleanup = true);
                              ref
                                  .read(safeCleanupControllerProvider.notifier)
                                  .cleanNow();
                            },
                      icon: isCleaning
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: context.colorScheme.onPrimary,
                              ),
                            )
                          : const Icon(Icons.cleaning_services),
                      label: Text(
                        isCleaning
                            ? context.l10n.cleaning
                            : context.l10n.cleanAllSafeItems,
                      ),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => ErrorView(message: err.toString()),
          );
        },
      ),
    );
  }
}

class _JunkCategoryTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  const _JunkCategoryTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    final effectiveColor =
        isDisabled ? Theme.of(context).disabledColor : color;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: effectiveColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: effectiveColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDisabled ? Theme.of(context).disabledColor : null,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
