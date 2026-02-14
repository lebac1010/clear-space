import 'package:clear_space/core/utils/file_utils.dart';
import 'package:clear_space/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/safe_cleanup_controller.dart';

class JunkFilesScreen extends ConsumerWidget {
  const JunkFilesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(dashboardControllerProvider);
    final safeCleanupState = ref.watch(safeCleanupControllerProvider);

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

                  // Categories
                  _JunkCategoryTile(
                    icon: Icons.delete_sweep_outlined,
                    color: Colors.orange,
                    title: 'Temporary & Log Files',
                    subtitle: '${FileUtils.formatSize(info.junkSize)} found',
                    trailing: Text('${info.junkCount} items'),
                    onTap: () {
                      _cleanCategory(context, ref, [
                        'junk',
                      ], "Cleaning temporary files...");
                    },
                  ),
                  const SizedBox(height: 12),
                  _JunkCategoryTile(
                    icon: Icons.folder_off_outlined,
                    color: Colors.blueGrey,
                    title: 'Empty Folders',
                    subtitle: '${info.emptyFolderCount} empty folders found',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _cleanCategory(context, ref, [
                        'empty_folders',
                      ], "Cleaning empty folders...");
                    },
                  ),
                  const SizedBox(height: 12),
                  _JunkCategoryTile(
                    icon: Icons.android_outlined,
                    color: Colors.green,
                    title: 'Safe APK Installers',
                    subtitle: 'Clean installed/old APKs',
                    trailing: Text('${info.apkCount} total'),
                    onTap: () {
                      _cleanCategory(context, ref, [
                        'apks',
                      ], "Cleaning safe APKs...");
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

  void _cleanCategory(
    BuildContext context,
    WidgetRef ref,
    List<String> types,
    String message,
  ) async {
    // We can use the same controller method, but maybe expose a method taking types?
    // Controller currently has cleanNow() which does ALL safe items.
    // We should probably add cleanTypes() to controller.
    // For now, I'll just use cleanNow() for the main button.
    // And for individual tiles, I need to call repository directly or enhance controller.
    // Enhancing controller is better.
    // But for this iteration, let's just make the "Clean All" button work perfectly.
    // Individual clicks can showing a snackbar saying "Use Clean All button" or just run Clean All?
    // "Clean All" is safe.

    // Let's implement specific clean via repository for now to be fast,
    // or just assume "Clean All" is the primary action.
    // The individual tiles should probably navigate to details (list of files).
    // Since we don't have details screens yet, "Clean All" is the main action.

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Use "Clean All Safe Items" to clean safe junk.'),
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
  final VoidCallback onTap;

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
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
