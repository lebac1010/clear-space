import 'package:clear_space/core/utils/file_utils.dart';
import 'package:clear_space/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_constants.dart';
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
    final storageAsync = ref.watch(dashboardControllerProvider);
    final safeCleanupState = ref.watch(safeCleanupControllerProvider);

    // Only show feedback after user explicitly started a cleanup
    ref.listen(safeCleanupControllerProvider, (prev, next) {
      if (!_hasStartedCleanup) return;
      if (prev?.isLoading == true && !next.isLoading) {
        _hasStartedCleanup = false;
        if (next.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cleanup failed: ${next.error}')),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Cleanup complete!')));
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Junk Files')),
      body: storageAsync.when(
        data: (info) {
          if (info == null) {
            return const Center(child: Text('Please scan storage first'));
          }
          final hasJunk =
              info.junkSize > 0 ||
              info.emptyFolderCount > 0 ||
              info.apkCount > 0;

          if (!hasJunk) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 64,
                    color: Colors.green,
                  ),
                  SizedBox(height: 16),
                  Text('No junk files found!', style: TextStyle(fontSize: 18)),
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
                  // Summary Card
                  Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text(
                            'Total Junk Found',
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

                  // Categories — [Bug1] disabled while cleaning to prevent race conditions
                  _JunkCategoryTile(
                    icon: Icons.delete_sweep_outlined,
                    color: Colors.orange,
                    title: 'Temporary & Log Files',
                    subtitle: '${FileUtils.formatSize(info.junkSize)} found',
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
                    color: Colors.blueGrey,
                    title: 'Empty Folders',
                    subtitle: '${info.emptyFolderCount} empty folders found',
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
                    color: Colors.green,
                    title: 'Safe APK Installers',
                    subtitle: 'Clean installed/old APKs',
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

              // Bottom Button
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
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.cleaning_services),
                  label: Text(
                    isCleaning ? 'Cleaning...' : 'Clean All Safe Items',
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
        error: (err, stack) => Center(child: Text('Error: $err')),
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
    final effectiveColor = isDisabled ? color.withValues(alpha: 0.3) : color;

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
