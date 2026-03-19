import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/services/cleanup_history_service.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/error_view.dart';
import '../../domain/entities/cleanup_history_record.dart';

class CleanupHistoryScreen extends ConsumerWidget {
  const CleanupHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: Text(context.l10n.cleanupHistory),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: () => _confirmClear(context, ref),
            tooltip: context.l10n.clearHistory,
          ),
        ],
      ),
      body: ref.watch(cleanupHistoryProvider).when(
        data: (history) => history.isEmpty
            ? Center(
                child: Text(
                  context.l10n.noItemsFound,
                  style: TextStyle(color: context.appTextSecondary),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final record = history[index];
                  return _HistoryCard(record: record);
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => ErrorView(message: e.toString()),
      ),
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.clearHistory),
        content: Text(context.l10n.clearHistoryConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.error,
            ),
            child: Text(context.l10n.clearAll),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(cleanupHistoryServiceProvider).clearHistory();
      ref.invalidate(cleanupHistoryProvider);
    }
  }
}

class _HistoryCard extends StatelessWidget {
  final CleanupHistoryRecord record;

  const _HistoryCard({required this.record});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy - HH:mm');
    final color = _getColorForType(context, record.cleanupType);
    final icon = _getIconForType(record.cleanupType);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatType(context, record.cleanupType),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      dateFormat.format(record.timestamp),
                      style: TextStyle(
                        color: context.appTextSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    FileUtils.formatSize(record.totalSizeInBytes),
                    style: TextStyle(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    context.l10n.itemCount(record.itemsCount),
                    style: TextStyle(
                      color: context.appTextSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (record.fileNames.isNotEmpty) ...[
            const Divider(height: 24),
            Text(
              '${context.l10n.filesTitle}: ${record.fileNames.join(", ")}${record.itemsCount > record.fileNames.length ? "..." : ""}',
              style: TextStyle(
                fontSize: 12,
                color: context.appTextSecondary,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (record.mimeTypeBreakdown.isNotEmpty) ...[
            const Gap(8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: record.mimeTypeBreakdown.entries.map((entry) {
                final label = entry.key.split('/').last.toUpperCase();
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: context.appSurfaceContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$label: ${entry.value}',
                    style: TextStyle(
                      fontSize: 10,
                      color: context.appTextSecondary,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  String _formatType(BuildContext context, String type) {
    switch (type) {
      case 'junk':
        return context.l10n.junkFiles;
      case 'screenshots':
        return context.l10n.screenshots;
      case 'downloads':
        return context.l10n.downloads;
      case 'large_files':
        return context.l10n.largeFiles;
      default:
        return type.substring(0, 1).toUpperCase() + type.substring(1);
    }
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'junk':
        return Icons.delete_outline;
      case 'screenshots':
        return Icons.screenshot_outlined;
      case 'downloads':
        return Icons.download_done_rounded;
      case 'large_files':
        return Icons.folder_zip_outlined;
      default:
        return Icons.cleaning_services;
    }
  }

  Color _getColorForType(BuildContext context, String type) {
    switch (type) {
      case 'junk':
        return Colors.brown;
      case 'screenshots':
        return Colors.amber;
      case 'downloads':
        return Colors.blue;
      case 'large_files':
        return Colors.deepPurple;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
